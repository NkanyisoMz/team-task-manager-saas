# Team Task Manager SaaS

A multi-tenant project management application inspired by tools like Trello and Asana.  
Built with Ruby on Rails to practice scalable backend architecture, collaboration workflows, and SaaS development concepts.

---

## Features

### Authentication & Authorization
- User authentication with Devise
- Role-based authorization (Admin / Member)
- Protected routes and team access control

### Multi-Tenancy
- Teams/workspaces
- Team memberships
- Scoped projects and tasks per team

### Project Management
- Create and manage projects
- Create and manage tasks
- Task status tracking
- Due dates
- Nested resources

### Collaboration
- Task comments
- Team invitations
- Invitation acceptance flow
- Email notifications for invitations

### Background Processing
- Redis integration
- Sidekiq background jobs
- Async email delivery with ActiveJob

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

### Development Tools
- Git & GitHub
- Letter Opener (development emails)

---

## Architecture Concepts Practiced

- MVC architecture
- Multi-tenant SaaS design
- Nested RESTful routing
- Background job processing
- Async workflows
- Role-based authorization
- Database associations
- Email delivery pipelines

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

## Current Workflow

1. Users sign up and log in
2. Admins create teams
3. Teams contain projects
4. Projects contain tasks
5. Tasks contain comments
6. Admins invite users via email
7. Invitations are processed asynchronously using Sidekiq

---

## Setup

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

---

## Future Improvements

- Docker setup
- Real-time notifications with ActionCable
- Task assignments
- Activity feed
- File uploads
- Search functionality
- API support
- Deployment pipeline
- CI/CD integration

---

## Screenshots

Coming soon.

---

## Author

Nkanyiso Mzobe

GitHub: [NkanyisoMz GitHub](https://github.com/NkanyisoMz)