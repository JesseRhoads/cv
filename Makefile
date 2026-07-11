.PHONY: render ship

render:
	rendercv render Jesse_Rhoads_CV.yaml && open rendercv_output/Jesse_Rhoads_CV.pdf
ship:
	scp rendercv_output/Jesse_Rhoads_CV.html dh:jesse/resume.html && scp rendercv_output/Jesse_Rhoads_CV.pdf dh:jesse/resume.pdf

