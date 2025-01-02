Adds [Tailscale](https://tailscale.com/) to [Google's official image](https://us-docker.pkg.dev/colab-images/public/runtime) for [Colab](https://colab.research.google.com/), allowing it to be used as a "local runtime" even when running on a cloud computing provider.

See the Dockerfile definition or fork your own version on [Github](https://github.com/evan-lloyd/mechinterp-dev/tree/main/runpod-colab).

To use this image, set up Tailscale and create an API key. For free users at the time of writing, this is under "Settings->Personal Settings->Keys". Make sure that the run configuration on your compute host
1) Exposes port 9000 and SSH
2) Defines the environment variables
   * TAILSCALE_HOST_NAME -- eg, "colab". Controls the host name set by the container when it joins your Tailnet.
   * TAILSCALE_API_KEY -- the API key you created above. I recommend using your provider's secret management system to store this. Do not publish this value anywhere, as it would allow anyone to connect to your Tailnet.

Once the container has launched, on the machine from which you want to work with Colab notebooks, launch an SSH tunnel with
`ssh colab -L 9000:localhost:8888`, replacing "colab" with the TAILSCALE_HOST_NAME defined above if you named it differently, and optionally "8888" with a different port that is free on your local machine. Finally, in your Colab notebook, select the dropdown next to "Connect" and go to "Connect to local runtime". Search the container logs for a line that looks like
```
Or copy and paste one of these URLs: (type=jupyter)
http://127.0.0.1:9000/?token=foo (type=jupyter)
```
and copy+paste into the text box for "Backend URL", replacing the port with the one you mapped in the SSH tunnel (8888 if following the above).
