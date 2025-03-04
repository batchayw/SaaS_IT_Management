# Documentation du projet "Infrastructure Open Source type *SaaS IT Management*"
## Objectif: 

Ce projet vise à mettre en place une infrastructure complète de gestion IT open source sous forme de service SaaS. Il intègre l'authentification centralisée, la gestion des mises à jour et du provisioning, la virtualisation, l'orchestration des conteneurs, la gestion des logs et du monitoring, le tout automatisé avec CI/CD.

## Déroulement du projet :

- Déploiement de ***FreeIPA*** pour l'authentification centralisée
- Installation de ***Katello/TheForeman*** pour gérer les packages, configurations et provisionner les machines
- Création d'une infrastructure de virtualisation avec ***OpenStack TripleO*** et ***Ovirt***
- Déploiement d'***OKD/OpenShift*** pour gérer les applications cloud-native
- Mise en place d'un stack de monitoring et logs avec ***Prometheus***, ***Fluentd***, ***Elasticsearch*** et ***Grafana***
- Pipeline ***GitHub Actions***/***GitLab*** pour automatiser la mise en production et la surveillance de l'infra

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants :

- **Serveurs physiques ou machines virtuelles:** Vous aurez besoin de plusieurs machines pour déployer les différents composants (FreeIPA, Foreman, OpenStack, etc.).
- **Système d'exploitation:** Utilisez une distribution Linux compatible (par exemple, CentOS 7/8 ou Rocky Linux).
- **Accès root ou utilisateur avec privilèges sudo.**
- **Ansible:** Installé sur la machine à partir de laquelle vous allez exécuter les playbooks.
- **Terraform:** Installé si vous utilisez des modules Terraform pour le déploiement.
- **Git:** Pour cloner le projet et gérer les fichiers.


##  Déploiement

1. Cloner le projet

    Clonez le dépôt Git contenant les fichiers du projet:
    ```bash
    git clone https://github.com/votre-repo/Infra-SaaS-IT-Management.git
    cd Infra-SaaS-IT-Management
    ```

2. Configurer l'inventaire Ansible

    Modifiez le fichier `ansible/inventory/hosts.ini` pour refléter les adresses IP (`@ip`) ou les noms d'hôte de vos serveurs (`@host`). Car ce qui là est juste utilisé comme exemple en fonction de mon environnement de test.

3. Exécuter les playbooks Ansible

    Exécutez les playbooks Ansible dans l'ordre suivant pour déployer chaque composant:
    - Déployer FreeIPA
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_freeipa.yml
    ```
    - Déployer Foreman/Katello
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_foreman.yml
    ```
    - Déployer OpenStack TripleO
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_openstack.yml
    ```
    - Déployer oVirt
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_ovirt.yml
    ```    
    - Déployer OKD/OpenShift
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_okd.yml
    ```
    - Déployer le monitoring (Prometheus, Grafana)
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_monitoring.yml
    ```
    - Déployer la centralisation des logs (Elasticsearch, Fluentd, Kibana)
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_logging.yml
    ```
    - Configurer la sécurité
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/setup_security.yml
    ```    
    - Vérifier le déploiement
    ```bash
    ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/post_deploy_checks.yml
    ```

4. Utiliser Terraform (optionnel)

    Si vous utilisez Terraform pour déployer des ressources cloud (par exemple, OpenStack), suivez ces étapes:
    - Configurer les variables Terraform
        Modifiez le fichier `terraform/terraform.tfvars` pour définir les variables nécessaires:
        ```hcl
        openstack_username = "admin"
        openstack_tenant   = "admin"
        openstack_password = "password"
        openstack_auth_url = "http://192.168.1.30:5000/v3"
        ```
    -  Initialiser Terraform
        ```bash
        cd terraform
        terraform init
        ```
    - Appliquer la configuration Terraform
        ```bash
        terraform apply
        ```

5. Automatisation CI/CD avec GitHub Actions

    Si vous avez configuré des workflows GitHub Actions, ils seront déclenchés automatiquement lorsque vous pousserez des modifications(`@domain`, `@realm`, `@ds-password`, `@admin-password`, `@provider`, `@resource`, `@network`, `@notification`, `@email`, `@url` etc.) vers le dépôt. Sinon, vous pouvez exécuter les workflows manuellement depuis l'interface GitHub.

6. Sauvegarder, restaurer, erreurs et rollback

    - Sauvegarder et restaurer
        
        Utilisez les scripts de sauvegarde et de restauration pour protéger votre infrastructure :
        - Sauvegarde:
            ```bash
            ./scripts/backup.sh
            ```
        - Restauration:
            ```bash
            ./scripts/restore.sh
            ```

    - Gestion des erreurs et rollback
        Si un composant ne fonctionne pas correctement, utilisez les scripts de rollback pour revenir à un état stable. Par exemple :
        ```bash
        ./ci-cd/rollback/rollback_freeipa.sh
        ```

## Documentation et maintenance (Astuce)

- Documentez chaque étape de modifications que vous effectuer, ceci pour faciliter la maintenance.
- Mettez à jour régulièrement les composants pour corriger les vulnérabilités et améliorer les performances.

    **Exemple:**
    - ***FreeIPA:***
        ```bash
        ssh freeipa_server
        kinit admin
        ```
    - ***Foreman:***
        Accédez à l'interface web de Foreman via `http://foreman_server`.
    - ***OpenStack:***
        Utilisez la CLI OpenStack pour créer une instance:
        ```bash
        openstack server create --flavor m1.small --image cirros --nic net-id=NETWORK_ID test-instance
        ```
    - ***OKD/OpenShift:***
        Accédez à la console OpenShift via `https://okd_master:8443`.
    - ***Prometheus/Grafana:***
        Accédez à Grafana via `http://grafana_server:3000`.
    - ***Kibana:***
        Accédez à Kibana via `http://kibana_server:5601`.


## Note: (Automatisation finale)

Une fois que tout fonctionne correctement, vous pouvez automatiser l'ensemble du processus en utilisant un pipeline CI/CD pour déployer et tester l'infrastructure à chaque modification du code.
***Il faut bien s'assurez que vous éffectuer toutes les modifications selon votre environemment avant de tester votre infrastructure.***


## Appel aux contributeurs.
Je cherche des contributeurs passionnés: DevOps, ingénieurs systèmes, développeurs backend, experts en monitoring et logging… 
Si tu veux collaborer sur cette idéé de solution innovante et impactante, rejoins-moi en clonant le projet et à push des modifications !

📩 Faisons avancer la tech ensemble ! 🚀 
