"""
Implements Trigonometry functions for arrays.
"""
# ===----------------------------------------------------------------------=== #
# Trigonometric functions
# ===----------------------------------------------------------------------=== #

import math

from numojo.routines.math.misc import sqrt
from numojo.routines.math.arithmetic import fma
import numojo.core._math_funcs as _mf
from numojo.core.ndarray import NDArray

# TODO: add  dtype in backends and pass it here.

# ===------------------------------------------------------------------------===#
# Inverse Trig
# ===------------------------------------------------------------------------===#


fn acos[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply acos also known as inverse cosine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array.

    Returns:
        The elementwise acos of `array` in radians.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.acos](array)


fn asin[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply asin also known as inverse sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array.

    Returns:
        The elementwise asin of `array` in radians.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.asin](array)


fn atan[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply atan also known as inverse tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array.

    Returns:
        The elementwise atan of `array` in radians.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.atan](array)


fn atan2[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array1: NDArray[dtype], array2: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply atan2 also known as inverse tangent.
    [atan2 wikipedia](https://en.wikipedia.org/wiki/Atan2).

    Constraints:
        Both arrays must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array1: An Array.
        array2: An Array.

    Returns:
        The elementwise atan2 of `array1` and`array2` in radians.
    """
    return backend().math_func_2_array_in_one_array_out[dtype, math.atan2](
        array1, array2
    )


# ===------------------------------------------------------------------------===#
# Trig
# ===------------------------------------------------------------------------===#


fn cos[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply cos also known as cosine.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array assumed to be in radian.

    Returns:
        The elementwise cos of `array`.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.cos](array)


fn sin[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply sin also known as sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array assumed to be in radian.

    Returns:
        The elementwise sin of `array`.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.sin](array)


fn tan[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply tan also known as tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array: An Array assumed to be in radian.

    Returns:
        The elementwise tan of `array`.
    """
    return backend().math_func_1_array_in_one_array_out[dtype, math.tan](array)


fn hypot[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array1: NDArray[dtype], array2: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply hypot also known as hypotenuse which finds the longest section of a right triangle
    given the other two sides.

    Constraints:
        Both arrays must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array1: An Array.
        array2: An Array.

    Returns:
        The elementwise hypotenuse of `array1` and`array2`.
    """
    return backend().math_func_2_array_in_one_array_out[dtype, math.hypot](
        array1, array2
    )


fn hypot_fma[
    dtype: DType, backend: _mf.Backend = _mf.Vectorized
](array1: NDArray[dtype], array2: NDArray[dtype]) raises -> NDArray[dtype]:
    """
    Apply hypot also known as hypotenuse which finds the longest section of a right triangle
    given the other two sides.

    Constraints:
        Both arrays must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        array1: An Array.
        array2: An Array.

    Returns:
        The elementwise hypotenuse of `array1` and`array2`.
    """

    var array2_squared = fma[dtype, backend=backend](
        array2, array2, SIMD[dtype, 1](0)
    )
    return sqrt[dtype, backend=backend](
        fma[dtype, backend=backend](array1, array1, array2_squared)
    )
