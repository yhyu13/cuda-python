# 1

Install conda deps and latest pip cuda-python, as conda's cuda python might not be updated

```
conda install -c nvidia cuda-python
pip install cuda-python --force -U
```

Or, run `./docker_build_whl.sh` and build local whl, check out Dockerfile for its CUDA version and py version

e.g.

```
./docker_build_whl.sh
pip uninstall cuda_python --yes && pip install result/cuda_python-0+unknown-cp310-cp310-linux_x86_64.whl 
```

# 2

If you install the whl instead of building locally, you need to rename `cuda/__init__.py` (e.g. `mv cuda/__init__.py cuda/__init__.py.bk`) so it will not interfer with the cuda-python package

Finall, local run `python -m pytest` and make sure all test passed!