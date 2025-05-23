import boto3
from datetime import datetime

# Create an RDS client
rds = boto3.client('rds')

def lambda_handler(event, context):
    """
    AWS Lambda function to create manual snapshots
    of specified RDS instances each time it runs.
    """
    # List your RDS instance identifiers here
    db_instances = ["db-primary", "sql-alwayson"]
    
    for db in db_instances:
        # Generate a timestamped snapshot ID
        snapshot_id = f"{db}-backup-{datetime.utcnow().strftime('%Y%m%d%H%M')}"
        
        # Call the RDS API to create a snapshot
        rds.create_db_snapshot(
            DBSnapshotIdentifier=snapshot_id,
            DBInstanceIdentifier=db
        )
        print(f"Created snapshot {snapshot_id} for {db}")
    
    return {
        "status": "snapshots created",
        "instances": db_instances
    }

