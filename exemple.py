# Call the function and pass the video ID
# Here is the ID of the video for the Shakira and Bizarrap song 'pa tipos como tu'.
video_id = "CocEMWdc7Ck"
comments = scrape_video_comments(video_id)


if comments is not None:
    for comment in comments:
        print(comment)
else:
    print("No comments found.")



len(comments)


# Create DataFrame from list
import pandas as pd

df = pd.DataFrame(comments, columns=['comment', 'author', 'date'])

# Print the DataFrame
#print(df)

# To transform the DF into a .csv
df.to_csv('shakira.csv', index=False)
