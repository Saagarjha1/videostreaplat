// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VideoStorage {
    struct Video {
        string videoId;
        string title;
        string ipfsHash; // IPFS hash of the video content
        address owner;
        uint256 timestamp;
    }

    mapping(string => Video) private videos;

    event VideoUploaded(string videoId, string title, string ipfsHash, address owner);

    // Upload a new video
    function uploadVideo(string memory _videoId, string memory _title, string memory _ipfsHash) public {
        require(bytes(_videoId).length > 0, "Invalid video ID");
        require(bytes(_title).length > 0, "Invalid title");
        require(bytes(_ipfsHash).length > 0, "Invalid IPFS hash");
        require(videos[_videoId].owner == address(0), "Video with the same ID already exists");

        Video memory newVideo = Video({
            videoId: _videoId,
            title: _title,
            ipfsHash: _ipfsHash,
            owner: msg.sender,
            timestamp: block.timestamp
        });

        videos[_videoId] = newVideo;

        emit VideoUploaded(_videoId, _title, _ipfsHash, msg.sender);
    }

    // Get video metadata by video ID
    function getVideo(string memory _videoId) public view returns (string memory, string memory, string memory, address, uint256) {
        require(bytes(_videoId).length > 0, "Invalid video ID");
        Video memory video = videos[_videoId];
        require(bytes(video.videoId).length > 0, "Video not found");

        return (video.videoId, video.title, video.ipfsHash, video.owner, video.timestamp);
    }
}
