import React, { useState } from 'react';
import { createDeployment } from '../api';

const DeploymentForm = () => {
  const [deployment, setDeployment] = useState({
    user_id: '',
    application_id: '',
    environment_id: '',
    status: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setDeployment({ ...deployment, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    createDeployment(deployment).then(data => {
      console.log('Deployment created:', data);
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input type="text" name="user_id" placeholder="User ID" onChange={handleChange} />
      <input type="text" name="application_id" placeholder="Application ID" onChange={handleChange} />
      <input type="text" name="environment_id" placeholder="Environment ID" onChange={handleChange} />
      <input type="text" name="status" placeholder="Status" onChange={handleChange} />
      <button type="submit">Create Deployment</button>
    </form>
  );
};

export default DeploymentForm;
