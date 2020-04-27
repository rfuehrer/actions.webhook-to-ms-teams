# Microsoft Teams Webhook Notifications

This actions sends a message to your Microsoft Teams channel using an Incoming Webhook connector. An Incoming Webhook connector must be setup on your Microsoft Teams channel before this action can be used successfully.

[Get started with Microsoft Teams Connectors Incoming Webhook](https://medium.com/@ankush.kumar133/get-started-with-microsoft-team-connectors-incoming-webhook-a330657993e7)

## Inputs

### `webhook`

**Required** The webhook url for your Incoming Webhook connector.

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
<SECRET_VAR_NAME> is a secret variable in your repository. Define a secret variable with the webhook URL als value and set it here as reference.
