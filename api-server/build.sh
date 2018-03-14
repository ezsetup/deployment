source ../.env
cp -r ../../api/ ./app
rm -r app/.cache
rm -r app/.idea
rm -r app/.mypy_cache
rm -r app/.nvim
rm -r app/.venv
rm -r app/.pytest_cache
rm -r app/.vscode

docker build -t registry.gitlab.com/promises/deployment/api-server:${API_SERVER_VERSION} .
docker push registry.gitlab.com/promises/deployment/api-server:${API_SERVER_VERSION}
