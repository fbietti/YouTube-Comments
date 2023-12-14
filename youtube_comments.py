#pip install google-api-python-client
#pip install oauth2client

from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from oauth2client.tools import argparser



# Set up API credentials
DEVELOPER_KEY = "YOUR_DEVELOPER_KEY"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

# Set up YouTube API client
youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=DEVELOPER_KEY)

def scrape_video_comments(video_id):
    try:
        # Retrieve video comments
        comments = []
        next_page_token = None

        while True:
            # Make API request to retrieve comments
            response = youtube.commentThreads().list(
                part="snippet",
                videoId=video_id,
                textFormat="plainText",
                pageToken=next_page_token,
                maxResults=100
            ).execute()

            for item in response['items']:
                comment = item['snippet']['topLevelComment']['snippet']
                comments.append({
                    'comment': comment['textDisplay'],
                    'author': comment['authorDisplayName'],
                    'date': comment['updatedAt']
            })
           
            # Extract comments from API response
            #for item in response["items"]:
            #    comment = item["snippet"]["topLevelComment"]["snippet"]["textDisplay"]
            #    comments.append(comment)

            # Check if there are more comments
            if "nextPageToken" in response:
                next_page_token = response["nextPageToken"]
            else:
                break

        return comments

    except HttpError as e:
        print(f"An HTTP error {e.resp.status} occurred: {e.content}")

