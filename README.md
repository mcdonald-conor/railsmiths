# Railsmiths

A Ruby on Rails application built with modern technologies including Hotwire (Turbo and Stimulus) and Tailwind CSS.

## Prerequisites

- Ruby 3.x
- PostgreSQL
- Node.js (for Tailwind CSS)
- Yarn or npm

## Ruby Version

This application uses Ruby 3.x. We recommend using a Ruby version manager like `rbenv` or `rvm`.

```bash
# Using rbenv
rbenv install 3.x.x
rbenv local 3.x.x
```

## System Dependencies

The application relies on the following main dependencies:

- Rails 7.2.2
- PostgreSQL (as the database)
- Devise (for authentication)
- Hotwire (Turbo and Stimulus)
- Tailwind CSS
- DaisyUI
- Resend (for email delivery)

## Configuration

1. Clone the repository:
```bash
git clone https://github.com/your-username/railsmiths.git
cd railsmiths
```

2. Install dependencies:
```bash
bundle install
yarn install # or npm install
```

3. Set up environment variables:
```bash
# Copy the example environment file
cp .env.example .env

# Open .env and configure your environment variables:
# - DATABASE_URL
# - RESEND_API_KEY
# - RAILS_MASTER_KEY
```

## Database Setup

1. Create the database:
```bash
rails db:create
```

2. Run migrations:
```bash
rails db:migrate
```

3. (Optional) Seed the database:
```bash
rails db:seed
```

## Running the Application Locally

1. Start the Rails server:
```bash
bin/dev
```

2. Visit `http://localhost:3000` in your browser

## Running Tests

The application uses the default Rails testing framework. To run the tests:

```bash
# Run all tests
rails test

# Run system tests
rails test:system
```

## Services

The application uses the following services:

- Resend for email delivery
- PostgreSQL for database
- Redis for Action Cable (if implemented)

## Deployment to Heroku

1. Create a new Heroku application:
```bash
heroku create railsmiths
```

2. Add PostgreSQL addon:
```bash
heroku addons:create heroku-postgresql:mini
```

3. Configure environment variables:
```bash
heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
heroku config:set RESEND_API_KEY=your_resend_api_key
```

4. Connect GitHub repository to Heroku:
   - Go to your Heroku dashboard
   - Select your app
   - Go to the Deploy tab
   - Connect to GitHub
   - Enable automatic deploys from main/master branch

5. Deploy your application:
```bash
git push heroku main
```

6. Run database migrations:
```bash
heroku run rails db:migrate
```

## Development Workflow

1. Create a new branch for your feature:
```bash
git checkout -b feature/your-feature-name
```

2. Make your changes and commit them:
```bash
git add .
git commit -m "Description of your changes"
```

3. Push your branch and create a pull request:
```bash
git push origin feature/your-feature-name
```

4. After review and approval, merge your pull request
   - The changes will be automatically deployed if you've set up automatic deploys on Heroku

## Additional Information

- The application uses Tailwind CSS for styling with DaisyUI components
- Hotwire (Turbo and Stimulus) is used for dynamic, SPA-like interactions
- Authentication is handled by Devise
- Emails are sent using Resend

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License.
