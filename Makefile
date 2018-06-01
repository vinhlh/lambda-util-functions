add-sentry-batch-job:
	cat functions/submit_aws_batch_job/events/sentry.json | apex invoke submit_aws_batch_job
