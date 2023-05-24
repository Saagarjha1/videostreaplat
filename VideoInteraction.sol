pragma solidity ^0.8.0;

contract VideoInteraction {
    struct Video {
        uint256 likes;
        mapping(address => bool) likedBy;
        mapping(uint256 => Comment) comments;
        uint256 commentCount;
    }

    struct Comment {
        address commenter;
        string content;
    }

    mapping(uint256 => Video) private videos;

    event VideoLiked(uint256 videoId, address indexed user);
    event CommentAdded(uint256 videoId, address indexed commenter, uint256 commentId);

    function likeVideo(uint256 _videoId) public {
        Video storage video = videos[_videoId];
        require(!video.likedBy[msg.sender], "User has already liked the video");

        video.likes++;
        video.likedBy[msg.sender] = true;

        emit VideoLiked(_videoId, msg.sender);
    }

    function addComment(uint256 _videoId, string memory _content) public {
        Video storage video = videos[_videoId];
        uint256 commentId = video.commentCount;

        Comment storage comment = video.comments[commentId];
        comment.commenter = msg.sender;
        comment.content = _content;

        video.commentCount++;

        emit CommentAdded(_videoId, msg.sender, commentId);
    }

    function getVideoLikes(uint256 _videoId) public view returns (uint256) {
        return videos[_videoId].likes;
    }

    function getVideoComment(uint256 _videoId, uint256 _commentId) public view returns (address, string memory) {
        Comment storage comment = videos[_videoId].comments[_commentId];
        return (comment.commenter, comment.content);
    }
}
