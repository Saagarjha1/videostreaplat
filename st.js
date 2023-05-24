window.addEventListener('DOMContentLoaded', (event) => {
    const videoContainer = document.getElementById('video-container');
  
    // Simulated data from the Theta blockchain
    const videos = [
      {
        id: 1,
        thumbnail: 'video1-thumbnail.jpg',
        title: 'Video 1',
        description: 'This is the description of Video 1.',
        views: 100,
        likes: 50,
        comments: 10
      },
      {
        id: 2,
        thumbnail: 'video2-thumbnail.jpg',
        title: 'Video 2',
        description: 'This is the description of Video 2.',
        views: 200,
        likes: 100,
        comments: 20
      }
    ];
  
    // Render videos
    videos.forEach((video) => {
      const videoElement = createVideoElement(video);
      videoContainer.appendChild(videoElement);
    });
  
    function createVideoElement(video) {
      const videoElement = document.createElement('div');
      videoElement.classList.add('video-thumbnail');
  
      // Set the video thumbnail
      videoElement.style.backgroundImage = `url(${video.thumbnail})`;
  
      // Set the video information
      const titleElement = document.createElement('div');
      titleElement.classList.add('video-title');
      titleElement.textContent = video.title;
  
      const infoElement = document.createElement('div');
      infoElement.classList.add('video-info');
      infoElement.textContent = `Views: ${video.views} | Likes: ${video.likes} | Comments: ${video.comments}`;
  
      const descriptionElement = document.createElement('div');
      descriptionElement.classList.add('video-description');
      descriptionElement.textContent = video.description;
  
      const likesElement = document.createElement('div');
      likesElement.classList.add('video-likes');
      likesElement.textContent = 'Like';
      likesElement.addEventListener('click', () => {
        // Call the smart contract function to handle video likes
        // Example: contract.likeVideo(video.id);
      });
  
      const commentsElement = document.createElement('div');
      commentsElement.classList.add('video-comments');
      commentsElement.textContent = 'Comments';
      commentsElement.addEventListener('click', () => {
        // Call the function to show the comments section for the video
        // Example: showComments(video.id);
      });
  
      videoElement.appendChild(titleElement);
      videoElement.appendChild(infoElement);
      videoElement.appendChild(descriptionElement);
      videoElement.appendChild(likesElement);
      videoElement.appendChild(commentsElement);
  
      return videoElement;
      window.addEventListener('DOMContentLoaded', (event) => {
        const videoPlayer = document.getElementById('video-player');
      
        // Add event listeners to handle video playback events
        videoPlayer.addEventListener('play', () => {
          // Perform actions when the video starts playing
          // Example: Update video view count
        });
      
        videoPlayer.addEventListener('pause', () => {
          // Perform actions when the video is paused
        });
      
        videoPlayer.addEventListener('ended', () => {
          // Perform actions when the video playback is completed
          // Example: Show related videos
        });
      });
      
    }
  });
  