# Sinatra To-Do App Toolkit

## Overview of the Chosen Tech
**Sinatra** is a lightweight Ruby web framework. Unlike **Rails**, which comes with many built-in tools, Sinatra focuses on simplicity and minimalism. It’s ideal for small applications, APIs, and learning web fundamentals.  

In this project, Sinatra was used to build a simple **To-Do web app**, where users can view, add, and manage tasks.  

---

## Set Up Instructions
### 1. Install Ruby  
```bash
sudo apt install ruby-full
ruby -v
```

### 2. Install Bundler (optional but useful)  
```bash
gem install bundler
```

### 3. Install Sinatra  
```bash
sudo gem install sinatra
sudo gem install rackup puma   # required for running the app
```

---

## Minimal Working Example
**todo.rb**:
```ruby
require 'sinatra'

tasks = []

get '/' do
  erb :index, locals: { tasks: tasks }
end

post '/add' do
  task = params[:task]
  tasks << task unless task.empty?
  redirect '/'
end
```

**Run the app**:
```bash
ruby todo.rb
```
Visit → [http://localhost:4567]

---

## AI Prompts Used & Learning Reflections
### Prompts I Used:
- *“I would like to learn more on Ruby and its frameworks such as Rails and Sinantra. What are their key differences and usability”*  
- *“I have come up with a simple to-do list app:[code snippet].” Improve its readability and determine any bugs that may come up during runtime.*  
- *“Document any edge cases and limitations to the code”*  
- *“Draft me a README draft with similar style and documentation.”*  
- *“I'm meeting an error I am yet to decipher: [error message] Kindly share why its occuring and how to go about it.”*

### Reflections:
- Sinatra taught me the **basics of web frameworks** without being overwhelming.  
- Compared to Rails, it was easier to understand **routing** and **views**.  
- Debugging errors (like gem installation and syntax issues) helped me understand **dependencies** and **setup processes** in Ruby such as puma and rackup.  
- AI guidance allowed me to move quickly from setup to  running app, which I would have struggled with alone.  

---

## Common Errors & Fixes I Found
1. **Permission error when installing gems**  
   ```
   You don't have write permissions for the /var/lib/gems/... directory
   ```
   - Fix: Use `sudo gem install <gemname>` OR configure a local gem path:
     ```bash
     echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
     echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
     source ~/.bashrc
     ```

2. **`Sinatra could not start, the required gems weren't found!`**  
   - Fix: Install missing gems like `rackup` and `puma`:
     ```bash
     gem install rackup puma
     ```

3. **`unterminated string meets end of file` (SyntaxError)**  
   - Cause: Missing closing quote in Ruby code.  
   - Fix: Ensure all strings and blocks are properly closed.

---

## Reference Resources
- [Sinatra Official Documentation](http://sinatrarb.com/documentation.html)  
- [Ruby Language Official Docs](https://www.ruby-lang.org/en/documentation/)  
