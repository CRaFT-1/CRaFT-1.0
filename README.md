## `CRaFT: Conditional Random Field Toolbox`

<p align="center">
  <img src="https://github.com/user-attachments/assets/ddafc91e-e1f1-4ac1-a246-fe57a332498a" width="45%" />
  <img src="https://github.com/user-attachments/assets/4e410bbb-3002-4a41-a439-ff5e00d68502" width="45%" />
</p>

`CRaFT` (Conditional Random Field Toolbox) is a Matlab-based package for efficient simulation of conditional random fields (CRFs).
It is designed for engineering applications where spatial variability must be modeled while ensuring exact consistency with measured data.

CRaFT integrates advanced numerical methods into a single, modular framework, making CRF simulation scalable, accurate, and user-friendly.

### `Key Features`

Exact reproduction of measured data
Ensures realizations of CRFs strictly pass through prescribed measurement locations.

High computational efficiency
Requires only Nyström-based covariance interpolation and a single conditional covariance decomposition.

Accurate spatial variability modeling
Karhunen–Loève expansion (KLE) captures dominant modes of variability while preserving correlation structures.

Versatile and dimension-independent
Supports 1D, 2D, and 3D domains with customizable covariance kernels, correlation lengths, and field statistics.

Modular and extensible
Built in Matlab with clear structure, allowing easy adaptation and integration into uncertainty quantification workflows.

### `Methodology`

CRaFT integrates three core components in a streamlined pipeline:

Kriging interpolation
Estimates the mean field of CRFs from observed data, ensuring consistency at measurement locations.

Nyström approximation
Efficiently constructs interpolated covariance matrices, combined with unconditional covariance matrices to yield conditional covariance matrices.

Karhunen–Loève expansion (KLE)
Generates random realizations directly from conditional covariance matrices, producing CRFs that both honor measured data and capture spatial variability.

### `Function Listing`

    CRaFT_main.m   – mian function.
    utils/Cov_uncon_Mat.m   – unconditional covariance matrix. 
    utils/check_positive_def.m   – check positive definiteness of conditional covariance matrix.
    utils/read_data_CRF.m   – read input data.
    utils/Visualization.m   – Visualize random sample realizations.

### `Inputs`

`Nodes` – node coordinates (dim × n_node)

`Element` – element connectivity ((dim+1) × n_element)

`Measurement_data` – measured data (2 × n_Set)

row 1: indices of measured points

row 2: observed values

### `Outputs`

Conditional random field realizations consistent with input data

Visualization of random samples
