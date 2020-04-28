# Microsoft Teams Webhook Notifications

This actions sends a message to your Microsoft Teams channel using an Incoming Webhook connector. An Incoming Webhook connector must be setup on your Microsoft Teams channel before this action can be used successfully.

[Get started with Microsoft Teams Connectors Incoming Webhook](https://medium.com/@ankush.kumar133/get-started-with-microsoft-team-connectors-incoming-webhook-a330657993e7)

## Inmstallation

In the repository that is to send notifications, a workflow with one action must be set up. For this we use the entry "simple workflow".

To do this, select the "Action" menu in your repository. If you don't have a workflow yet, you can already select the entry "simple workflow" here. If you have already activated a workflow, you have to select the button "New Workflow" first.

Now select "Set up your workflow" in the "Simple Workflow" tile. The file `blank.yaml` below the path <repo>/.github/workflows/ will be set up. You can choose any filename you like, but we recommend a name similar to 'notification.yaml'.

The content is predefined by the tile selection, but must now be adjusted to the following content:

```
name: Notification
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Send message to ms teams
      uses: rfuehrer/actions.webhook-to-ms-teams@1.0
      with:
        webhook: '${{ secrets.WEBHOOK_SECRET_1 }}'  
        message: 'Repo <b><a href=${{github.event.repository.html_url}}>${{github.repository}}</a></b> was updated by <b><a href=https://github.com/${{github.event.head_commit.author.username}}>${{github.event.head_commit.author.name}}</a></b>. Please find the details <b><a href="${{ github.event.compare }}">here</a></b>. Commit message:<br><br>${{github.event.head_commit.message}}'
```

Note: The file above is a complete YAML. You can also insert the lower block starting with `- name ...` into an existing YAML.

Furthermore, the example uses a secret named `WEBHOOK_SECRET_1`, whose content corresponds to the Webhook URL.

## Inputs

### `uses`

This specification can be used to control which action is called to send the message. Specify the complete repository name that is used to make the action available.

### Recommendation

It is recommended to host the action specified here by yourself to reduce the risk of misuse of the transmitted information. Both the URL of the incoming webhook in MS Teams and the message itself will be transmitted to this action. Both information can be classified as sensitive information. We therefore recommend that you fork the action and use it under your own account. In this case, the path to the action should be entered here.  

### `webhook`

**Required** The webhook url for your Incoming Webhook connector. 

### Recommendation

It is recommended that this URL is not publicly embedded in the repository used. It is recommended that you use a secret variable that makes this URL accessible only to the repository owners. We also point out that only the use of your own repositories ensures that this URL is not made known to third parties. There is a potential risk if sensitive information is sent via the Webhook or spam messages are sent to the channel.

### `message`

**Required** The message you want to send to your Microsoft Teams channel.

## Example usage

```
- name: Send message to ms teams
  uses: rfuehrer/actions-to-ms-teams@head
  with:
    webhook: '${{ secrets.<SECRET_VAR_NAME> }}'
    message: 'Webhook messages is working!'
```
Hint: `<SECRET_VAR_NAME>` is a secret variable in your repository. Define a secret variable with the webhook URL als value and set it here as reference.

### Tip

The following content as a message gives a brief overview of the last commit, with helpful information and links to the changes:

```
Repositrory <b><a href=${{github.event.repository.html_url}}>${{github.repository}}</a></b> was updated by <b><a href=https://github.com/${{github.event.head_commit.author.username}}>${{github.event.head_commit.author.name}}</a></b>. Please find the details <b><a href="${{ github.event.compare }}">here</a></b>. Commit message:<br><br>${{github.event.head_commit.message}}
```

## License

MIT License, see [LICENSE](LICENSE) file.