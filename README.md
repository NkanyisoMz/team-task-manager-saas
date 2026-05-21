# Team Task Manager SaaS

A multi-tenant project management application inspired by tools like Trello and Asana.

Built with Ruby on Rails to practice scalable backend architecture, team collaboration workflows, background job processing, and SaaS application design.

---

## Live Demo

Deployed on Render:

https://your-render-url.onrender.com

---

## Features

### Authentication & Authorization
- User authentication with Devise
- Role-based authorization (Admin / Member)
- Protected team and project access

### Multi-Tenancy
- Teams/workspaces
- Team memberships
- Scoped projects and tasks per organization

### Project Management
- Create and manage projects
- Create and manage tasks
- Task status tracking
- Task assignments
- Due dates
- Pagination and filtering

### Collaboration
- Task comments
- Team invitations
- Invitation acceptance workflow
- Email notifications

### Background Processing
- Redis integration
- Sidekiq background jobs
- Async email delivery with ActiveJob

### DevOps & Deployment
- Dockerized application
- Docker Compose setup
- CI/CD with GitHub Actions
- Production deployment on Render

---

## Tech Stack

### Backend
- Ruby 3.4.8
- Rails 7.1.6
- PostgreSQL

### Authentication
- Devise

### Background Jobs
- Sidekiq
- Redis

### Frontend
- ERB
- Tailwind CSS

### DevOps
- Docker
- Docker Compose
- GitHub Actions
- Render

### Testing
- RSpec
- FactoryBot

---

## Architecture Concepts Practiced

- MVC architecture
- Multi-tenant SaaS design
- Nested RESTful routing
- Background job processing
- Async workflows
- Role-based authorization
- Database associations
- CI/CD workflows
- Containerized deployment

---

## Main Models

- User
- Team
- Membership
- Project
- Task
- Comment
- Invitation

---

## Application Workflow

1. Users sign up and log in
2. Admins create teams
3. Teams manage projects
4. Projects contain tasks
5. Team members collaborate through comments
6. Admins invite users via email
7. Invitation emails are processed asynchronously with Sidekiq

---

## Local Development Setup

### Clone Repository

```bash
git clone https://github.com/NkanyisoMz/team-task-manager-saas.git
cd team-task-manager-saas
```

### Install Dependencies

```bash
bundle install
```

### Database Setup

```bash
rails db:create
rails db:migrate
```

### Start Redis

```bash
memurai
```

### Start Sidekiq

```bash
bundle exec sidekiq
```

### Start Rails Server

```bash
rails server
```

### Docker Setup
```bash
docker compose up
```

### Running Tests
```bash
bundle exec rspec
```

---

## Future Improvements

- Real-time notifications with ActionCable
- File uploads
- Mobile API support
- Activity tracking
- Advanced analytical dashboard
- CI/CD integration

---

## Screenshots

Coming soon.

---

## Author

Nkanyiso Mzobe

GitHub: [NkanyisoMz GitHub](https://github.com/NkanyisoMz)