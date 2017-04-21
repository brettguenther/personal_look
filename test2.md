# Test2

Put your documentation here! Your text is rendered with [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown).

Click the "Edit Source" button above to make changes.

## Dashboard Syncher

### General Usage

```bash

$ bin/sync configuration_filename

```

This script makes use of routes that are not yet documented nor are available for use via the standard ruby SDK.
In particular, the routes used to create/update/delete dashboard_elements, dashboard_layouts,
dashboard_layout_components, and dashboard filters. These routes may chance a little in the coming months, but
are not quite ready for use by a non-saavy user.

### Configuration file

 the configuration file is a json file that includes information about the source and destination instances,
 the type of job to perform and the information about the source dashboards and destination dashboards/spaces.


### Copy Mode

Copy mode should be used to copy a set of dashboards from the source instance to the destination instance.

#### Example copy config file:
copy_config.example.json:
```json
{
  "destination_client_id": "Q6JwTp3jkysvxJtTTGrD",
  "destination_secret": "7Rbr5CfddvnYkVYPF4dTYbKF",
  "destination_endpoint": "https://self-signed1.looker.com:19999",
  "destination_client_options": {
    "connection_options": {"ssl": {"verify": false}}
  },

  "source_client_id": "Q6JwTp3jkysvxJtTTGrD",
  "source_secret": "7Rbr5CfddvnYkVYPF4dTYbKF",
  "source_endpoint": "https://self-signed2.looker.com:19999",
  "source_client_options": {
    "connection_options": {"ssl": {"verify": false}}
  },

  // used to copy dashboards from one instance to another.
  "job_type": "copy",
  // these dont necessarily need to be in the same space... but if there are conflicts
  // (dashboard name / look names) there is no conflict resolution built in
  "source_dashboard_ids": [1, 2, 3, 4, 5],
  // destination space in which to place copied dashboards
  "destination_space_id": 11
}
```

#### Copy mode pitfalls

There is very little (if any) error checking that is currently happening. The easiest problem to run into has to do
with Looks. Because Look titles are unique, if the script attempts to copy a look into a space that contains a look with
the same title, the script will fail (probably leaving some half formed dashboards/looks). The best way to avoid this is
to ensure that all dashboards that are copied into a particular destination space come from the same source space and
the destination space is empty beforehand.

Similarly, dashboard titles are unique within a space, so be sure not to copy two dashboards with the same name into the
into the same destination space.

It is not possible to create a dashboard element without a look. However, it is possible to get into that state by
deleting a look that is referenced by a dashboard. The script will fail to copy the dashboard in this case.
Ensure that the dashboard has no errors before attempting to copy it.

### Update Mode

Update mode will update a set of destination dashboards to match their corresponding source dashboards.

#### Example update config file
```json
{
  "destination_client_id": "Q6JwTp3jkysvxJtTTGrD",
  "destination_secret": "7Rbr5CfddvnYkVYPF4dTYbKF",
  "destination_endpoint": "https://self-signed.looker.com:19999",
  "destination_client_options": {
    "connection_options": {"ssl": {"verify": false}}
  },

  "source_client_id": "Q6JwTp3jkysvxJtTTGrD",
  "source_secret": "7Rbr5CfddvnYkVYPF4dTYbKF",
  "source_endpoint": "https://self-signed.looker.com:19999",
  "source_client_options": {
    "connection_options": {"ssl": {"verify": false}}
  },

  // used to update a dashboard on the destination instance to match the src instance dashboard
  "job_type": "update",

  // mapping from source dashboard_id to destination dashboard_id
  "dashboard_mapping": {
    "113": 118,
    "117": 119
  }
}
```

The dashboard_mapping parameter is a mapping from source dashboard_ids to destination dashboard_ids. In the above
example, when the script is run the destination dashboard with id 118 will be updated to match the source dashboard
with id 113.

If a copied destination dashboard has been moved, running the script in update mode will not move the dashboard, but
instead will update the dashboard in place.

#### Update mode pitfalls

Looks again are the issue here. There is no error checking that happens before attempting to perform an action.
The main thing to be careful about is syncing a dashboard may attempt to create looks. If a dashboard is updated adding
a look (title) that already exists in the destination space the script will fail. The only exception here is that if
the look will be created twice in the same execution of the script (two dashboards share the same look) the script
will successfully only create one look.
