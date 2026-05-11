import os
from django.contrib.auth import get_user_model
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = "Crée un superuser si aucun n'existe (utilise les variables ADMIN_USERNAME, ADMIN_EMAIL, ADMIN_PASSWORD)"

    def handle(self, *args, **kwargs):
        User = get_user_model()
        if User.objects.filter(is_superuser=True).exists():
            self.stdout.write("Superuser déjà existant, rien à faire.")
            return

        username = os.environ.get("ADMIN_USERNAME", "admin")
        email = os.environ.get("ADMIN_EMAIL", "admin@greniercommun.com")
        password = os.environ.get("ADMIN_PASSWORD")

        if not password:
            self.stderr.write("ADMIN_PASSWORD non défini — superuser non créé.")
            return

        User.objects.create_superuser(username=username, email=email, password=password)
        self.stdout.write(f"Superuser '{username}' créé avec succès.")
