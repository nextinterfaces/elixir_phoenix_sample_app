
# Sample Phoenix App with SQLite3

This is a sample application built using Elixir Phoenix Framework with SQLite3 as the database.

## Prerequisites

Ensure the following tools are installed:

- **Elixir**: [Install Elixir](https://elixir-lang.org/install.html)
- **Phoenix Framework**: Install with:
  ```bash
  mix archive.install hex phx_new
  ```
- **SQLite3**: Install via your system's package manager (e.g., `brew install sqlite3` on macOS).

## Getting Started

Follow these steps to set up and run the application.

### 1. Create a New Phoenix Project

Generate a new Phoenix app with SQLite3 as the database:
```bash
mix phx.new sample_app --database sqlite3
```

### 2. Navigate to the Project Directory

```bash
cd sample_app
```

### 3. Install Dependencies

Install all the required dependencies:
```bash
mix deps.get
```

### 4. Configure SQLite3

Verify that the SQLite3 database configuration is set up in the following files:

- **`config/dev.exs`**:
  ```elixir
  config :sample_app, SampleApp.Repo,
    database: "priv/repo/sample_app_dev.sqlite3",
    pool_size: 10
  ```

- **`config/test.exs`**:
  ```elixir
  config :sample_app, SampleApp.Repo,
    database: "priv/repo/sample_app_test.sqlite3",
    pool: Ecto.Adapters.SQL.Sandbox
  ```

### 5. Generate a Resource

Create a "Post" resource for demonstration:
```bash
mix phx.gen.html Posts Post posts title:string content:text
```

### 6. Run Migrations

Set up the database schema:
```bash
mix ecto.migrate
```

### 7. Add Routes for Posts

Edit the `lib/sample_app_web/router.ex` file to include the `resources` route for `PostController`:

```elixir
scope "/", SampleAppWeb do
  pipe_through :browser

  get "/", PageController, :home
  resources "/posts", PostController
end
```

### 8. Start the Phoenix Server

Run the development server:
```bash
mix phx.server
```

The application will be available at [http://localhost:4000](http://localhost:4000).

### 9. Verify Routes

Run the following to verify all routes are correctly set up:
```bash
mix phx.routes
```

You should see routes like these for the `PostController`:
```
GET     /posts          PostController :index
GET     /posts/new      PostController :new
POST    /posts          PostController :create
GET     /posts/:id      PostController :show
GET     /posts/:id/edit PostController :edit
PATCH   /posts/:id      PostController :update
PUT     /posts/:id      PostController :update
DELETE  /posts/:id      PostController :delete
```

### 10. Access the Application

Visit [http://localhost:4000/posts](http://localhost:4000/posts) to view the posts index page.

---

## Troubleshooting

### No Route Found for `/posts`

Ensure the `resources "/posts", PostController` line is added to `router.ex` and restart the server:
```bash
mix phx.server
```

### SQLite3 Database Issues

If you encounter issues with SQLite3, verify that `sqlite3` is installed and available on your system.

---

## Additional Notes

This project is a basic example to demonstrate Phoenix with SQLite3. You can expand it by adding more resources, customizing the UI, or integrating additional features.
