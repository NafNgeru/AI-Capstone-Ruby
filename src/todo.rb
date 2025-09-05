require 'sinatra'

tasks = []

get '/' do
  <<~HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>My To-Do List</title>
      <style>
        body {
          font-family: Arial, sans-serif;
          background: linear-gradient(135deg, #74ebd5, #ACB6E5);
          margin: 0;
          padding: 0;
          color: #333;
          text-align: center;
        }
        h1 {
          background: #4CAF50;
          color: white;
          padding: 20px;
          margin: 0;
          box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        ul {
          list-style: none;
          padding: 0;
          margin: 20px auto;
          max-width: 400px;
          text-align: left;
        }
        li {
          background: white;
          margin: 10px 0;
          padding: 12px 15px;
          border-radius: 8px;
          box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        form {
          margin: 30px auto;
          max-width: 400px;
        }
        input[type="text"] {
          padding: 10px;
          width: 70%;
          border: 2px solid #4CAF50;
          border-radius: 6px;
          font-size: 14px;
        }
        button {
          padding: 10px 15px;
          border: none;
          background: #4CAF50;
          color: white;
          font-weight: bold;
          border-radius: 6px;
          cursor: pointer;
          transition: background 0.3s ease;
        }
        button:hover {
          background: #45a049;
        }
      </style>
    </head>
    <body>
      <h1>My To-Do List</h1>
      <ul>
        #{tasks.map { |t| "<li>#{t}</li>" }.join}
      </ul>
      <form method="post" action="/add">
        <input type="text" name="task" placeholder="Enter new task" required>
        <button type="submit">Add Task</button>
      </form>
    </body>
    </html>
  HTML
end

post '/add' do
  tasks << params[:task]
  redirect '/'
end

set :port, 4567
set :bind, '0.0.0.0'


# To run the app, execute: ruby todo.rb
# Then visit http://localhost:4567 in your browser
# Make sure you have Sinatra installed: gem install sinatra
