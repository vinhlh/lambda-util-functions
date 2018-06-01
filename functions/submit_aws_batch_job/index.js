const λ = require('apex.js');
const aws = require('aws-sdk');

exports.handle = λ(async event => {
  const { jobName, jobQueue, jobDefinition } = event
  return new AWS.Batch()
    .submitJob({
      jobName,
      jobQueue,
      jobDefinition
    })
    .promise()
    .then(console.warn, console.error);
});
