user_api_key = 'GLMC7MG01E5DVBH5';
channel_id = '542836';
channel_data_url = strcat('https://api.thingspeak.com/channels/',channel_id,'.json?api_key=',user_api_key);
channel_data = webread(channel_data_url);
github_link = getfield(channel_data, 'github_url');
commits_url = strrep(github_link,'github.com','api.github.com/repos');
commits_url = strcat(commits_url ,'/commits');
commits = webread(commits_url);
latest_commit_sha = commits(1).sha;
commit_files = webread(strcat(commits_url,'/',latest_commit_sha));
file_name = commit_files.files.filename;
file_url = strcat(github_link, '/master/',file_name);
file_url = strrep(file_url,'github.com','raw.githubusercontent.com');
local_file = websave(file_name, file_url);
sample(4)



