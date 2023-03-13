######### execute a notebook from some other script. with parameters

# define some locations 
notebook_template = os.path.join(relative_folder,'predict/c3/output.ipynb')
notebook_out = os.path.join(jd.location,'output.ipynb')
html_out = os.path.join(jd.location,'output.html')

# run the notebook displaying the report
pm.execute_notebook(
   notebook_template
   , notebook_out
   , parameters=dict(job_details = jd, user_details = ud)
   , log_output = False
)

# read source notebook
with open(notebook_out) as f:
    nb = nbformat.read(f, as_version=4)
# export to html
html_exporter = HTMLExporter()
html_exporter.exclude_input = True
html_data, resources = html_exporter.from_notebook_node(nb)
# write to output file
with open(html_out, "w") as f:
    f.write(html_data)
