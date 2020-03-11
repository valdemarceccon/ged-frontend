<script>
  let file;
  const backend = "http://localhost:8080"
  $: disabled = !(file && file[0])

  async function uploadFile() {
	const formData = new FormData();

	formData.append('file', file[0]);
	const response = await fetch(`${backend}/upload`,
	{
		mode: "no-cors",
		method: 'POST',
		body: formData
	});
	try {
		const data = await response;
	} catch (error) {
		console.log(error);
	}
	
	file = null;
  }

</script>

<main>
<form action="http://localhost:8080/upload" on:submit|preventDefault="{uploadFile}">
	<input bind:files={file} type="file">	
	<button {disabled} >upload</button>
</form>
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>