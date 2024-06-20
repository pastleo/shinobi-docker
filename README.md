from https://gitlab.com/Shinobi-Systems/ShinobiDocker

# Install Shinobi with Docker

```bash
git clone https://github.com/pastleo/shinobi-docker.git shinobi
cd shinobi
cp compose.example.yml compose.yml
vim compose.yml
cp .env.example .env
vim .env

mkdir Shinobi
cp super.sample.json Shinobi/super.json
vim Shinobi/super.json # pass: md5sum

mkdir allowed
echo 'user1@example.com' >> allowed/emails
echo 'user2@example.com' >> allowed/emails

docker-compose up -d && docker-compose logs -f --tail=300
```

> generate pass: `openssl rand -hex 12`
> generate md5: `echo -n 'xxx' | md5sum`

### `docker-compose.yml` : `shinobi-sql` Service Environment Variables

| Variable             | Description                                          | Default Value    |
|----------------------|------------------------------------------------------|------------------|
| MYSQL_ROOT_PASSWORD  | The password for the MySQL root user.                | `rootpassword`   |
| MYSQL_DATABASE       | The name of the database to create.                  | `ccio`           |
| MYSQL_USER           | The username for the database.                       | `majesticflame`  |
| MYSQL_PASSWORD       | The password for the database user.                  | `1234`           |

### `docker-compose.yml` : `shinobi` Service Build Arguments and Environment Variables

#### Build Arguments

| Argument          | Description                                               | Default Value |
|-------------------|-----------------------------------------------------------|---------------|
| SHINOBI_BRANCH    | The branch of the Shinobi git repository to clone during the build process. | `dev`         |

#### Environment Variables

| Variable          | Description                                          | Default Value |
|-------------------|------------------------------------------------------|---------------|
| HOME              | The home directory path within the container.        | `/home/Shinobi` |
| DB_HOST           | Hostname of the MySQL database server.               | `shinobi-sql`   |
| DB_USER           | Username to connect to the MySQL database.           | `majesticflame` |
| DB_PASSWORD       | Password to connect to the MySQL database.           | `1234`          |
| DB_DATABASE       | Name of the MySQL database to use.                   | `ccio`          |
| SHINOBI_UPDATE    | Whether to pull updates from git when the container starts. | `false`      |


**Script Failing? Run this.**

```
apt install dos2unix -y && dos2unix entrypoint.sh && chmod +x entrypoint.sh && dos2unix setup_and_run.sh && chmod +x setup_and_run.sh && bash setup_and_run.sh
```
