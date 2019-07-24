学习 Fortran

# 字符操作
- [开始新的一行](./src/string/new_line_string.f90)
- [字符大小写转换](./src/string/string_upper_lower_case.f90)
- [将integer, real, logical 转化为字符](./src/string/convert_to_string.f90)
- [确定字符的数据类型(integer, real, logical)](./src/string/determine_string_type.f90)
- [将字符转化为其它数据类型 (integer, real, logical)](./src/string/convert_string_to_other_type.f90)
- [将一个字符串数组粘在一起](./src/string/join_string.f90)
- [确定字符串在整个字符串中的位置](./src/string/string_index.f90)
- [确定一个字符串中子字符串的个数](./src/string/determine_num_substring.f90)
- [替换字符串中的某个子字符串](./src/string/replace_substring.f90)
- [将字符串拆分为子字符串](./src/string/split_string.f90)
- [路径字符串操作（文件路径，名称，后缀等）](./src/string/path_string.f90)
- [将文件中的所有内容读取到一个字符串中](./src/string/read_file_to_string.f90)
- [读取文件中的一行](./src/string/read_file_line_to_string.f90)

- [特殊字符 <回车> char(13)](./src/string/special_char13_enter.f90)
- [特殊字符 <换行> char(10)](./src/string/special_char10_newline.f90)
- [特殊字符-终端颜色显示](./src/string/special_char_terminal_color.f90)

# 数组操作
- [动态数组自动重新分配](./src/array/allocatebel_array.f90)
- [数组的各种构造函数](./src/array/construct_array.f90)

# 异常处理
- [使用‘error stop’](./src/exception/error_stop.f90)
- [确定错误所在的文件以及行号](./src/exception/error_file_line.f90)

# 时间
- [得到当前的日期和时间](./src/time/get_date_time.f90)
- [统计钟表时间](./src/time/get_wall_time.f90)
- [统计CPU时间](./src/time/get_cpu_time.f90)

# 命令行参数
- [确定是否存在某个选项](./src/option/determine_if_have_option.f90)
- [获取某个选项的值](./src/option/get_option_value.f90)
- [在命令行执行某个命令](./src/option/fortran_execute_command_line.f90)
- [获得当前程序运行的所有命令行参数](./src/option/get_all_command.f90)
- [获取环境变量的值](./src/option/get_envrionment_variable_value.f90)

# 函数
- [递归函数](./src/function/recursive_function.f90)
- [逐元函数](./src/function/elemental_function.f90)
- [纯函数](./src/function/pure_function.f90)

# 内部模块
- [iso_fortran_env](./src/intrinsic_module/iso_fortran_env_module.f90)
- [iso_c_binding](./src/intrinsic_module/iso_c_binding_module.f90)

# 结构
- [block 结构](./src/structure/block_structure.f90)
- [associate 结构](./src/structure/associate_structure.f90)

# 混编
- [和C语言混编](./src/c_interoperablility/c_sleep_function.f90)
- [利用f2py和python语言混编](./src/python_interoperablility/legendre.f90)
