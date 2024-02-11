import { AmplifyProjectInfo, AmplifyS3ResourceTemplate } from '@aws-amplify/cli-extensibility-helper';

export function override(resources: AmplifyS3ResourceTemplate, amplifyProjectInfo: AmplifyProjectInfo) {
  resources.s3GuestPublicPolicy.policyDocument.Statement = [
    ...resources.s3AuthPublicPolicy.policyDocument.Statement,
    {
      Effect: 'Allow',
      Action: ['s3:GetObject'],
      Resource: 'arn:aws:s3:::recipesimages2024135706-prod/public/*'
    }
  ]
  resources.s3AuthPublicPolicy.policyDocument.Statement = [
    ...resources.s3AuthPublicPolicy.policyDocument.Statement,
    {
      Effect: 'Allow',
      Action: ['s3:GetObject'],
      Resource: 'arn:aws:s3:::recipesimages2024135706-prod/public/*'
    }
  ]
}
