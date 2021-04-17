# DoubleInvertedPendulum_Control

final project of Mechatronics 1, Prof. Lei Yong and Prof. Liu Tao

System analysis and design of double inverted pendulum



**Contirbutor: LeoDuhz, xh38, Kai Tang**

| **课程名称：** | 机械电子控制工程（甲）Ⅰ          |
| -------------- | -------------------------------- |
| **课程时间：** | 2020-2021学年秋冬学期周三第678节 |
| **成员：**     | LeoDuhz                          |
|                | xh38                             |
|                | Kai Tang                         |
| **题目：**     | 二级倒立摆系统分析与设计         |
| **指导教师：** | 雷勇                             |
| **所在学院：** | 控制科学与工程学院，机械工程学院 |
| **完成时间：** | 2021年01月28日                   |

 

## Contents:

- Two Parts: Continuous System and Discrete System
- Modelling and Linearization

- System Analysis
  - Controllability, Observability, Stability

- State Feedback and Pole Assignment
- State Observer Design
- PID Controller
- Optimal Control



	code&model文件夹下各文件使用说明：
	
	***Simulink仿真.slx文件由于Simulink本身兼容性缘故，最好在Matlab R2020a或者Matlab R2020b版本软件上运行，如有打开问题，请联系hzdu@zju.edu.cn
	
	systemAnalysis.m
		功能：连续系统能控性、能观性、稳定性分析
		直接运行，利用现代控制理论的能控性、能观性、稳定性判据，会直接输出系统是否能控、能观、稳定
	
	PIDcontrol.slx:
		功能：基于PID控制器的反馈控制系统Simulink模型
		PID参数已经整定完成，可以直接点击Run运行，通过三个Scope或者Simulink的Data Inspector查看被控变量的变化过程
		点击PID控制器可以查看选择的PID参数
		点击子系统可以进入二级倒立摆系统，查看状态空间模型
		systemAnalysisDigital.m:
		功能：将连续系统转化为离散系统，分析离散系统的能控、能观和稳定性
		直接运行就会输出二级倒立摆离散系统是否能控、能观、稳定
	
	PIDcontrol_Digital.slx：
		功能：基于数字PID控制器的离散反馈控制系统Simulink模型
		数字PID参数已经整定完成，采样周期为0.01s，可以直接点击Run运行，通过Scope可以查看被控变量的变化过程
	
	mcode_poleplacement.m
		连续系统极点配置
	mcode_poleplacement.m
		离散系统极点配置
	mcode_lqr.m
		连续系统LQR控制
	mcode_dlqr.m
		离散系统LQR控制
	
	sim_poleplacement.slx
		连续系统极点配置仿真
	sim_dpoleplacement.slx
		离散系统极点配置仿真
	sim_lqr.slx
		连续系统LQR控制仿真
	sim_dlqr.slx
		离散系统LQR控制仿真
	
	observer_design.m
		用于连续全维观测器极点配置，得到合适的反馈矩阵
	
	observer.slx
		加入连续全维观测器的模型，使用了极点配置的方法控制
		有两个subsystem，一个是模型model，另一个是观测器observer
		有三个示波器分别比较了 x theta1 theta2
	
	reduced_dim_observer_design.m
		用于连续降维观测器的对应F G H L矩阵的求取
	
	red_dim_observer.slx
		加入连续降维观测器的模型
		使用三个示波器分别比较了 dx dtheta1 dtheta2	
	
	discrete_observer_design.m
		离散系统的全维观测器设计
		计算得到了反馈矩阵
	
	discrete_observer.slx
		离散系统的全维观测器模型
		基本和连续相同，可以在仿真数据查看器和示波器中查看数据对比
	
	discrete_reduced_dim_observer_design.m
		离散系统的降维观测器所需要的F G H L矩阵的计算
	
	discrete_red_dim_observer.slx
		离散系统的降维观测器模型
		基本与连续相同，可以在仿真数据查看器和示波器中查看数据对比

