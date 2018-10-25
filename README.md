# iOSFlutterDemo
在iOS工程中集成Flutter工程的Demo

#### 准备工作

1. flutter环境等安装好
2. 设置FLUTTER_ROOT环境变量，将其指向flutter的工具目录




​	

#### 如何使用

1. 进入工程目录后，执行install.sh脚本:

   ```shell
   ./install.sh
   ```

2. 打开工程，即可编译运行



​	

#### 自己的工程配置步骤

1. 进入原有工程目录（其它外部目录也ok），创建flutter工作目录：

   ```shell
   flutter create -t module flutter_module
   ```

2. iOS主工程设置，关掉bitcode （不关的话，模拟器里跑不影响，但真机不行）

3. iOS主工程，添加Debug.xcconfig，指向flutter工作目录下面的编译配置文件：

   ```shell
   #include "../fluter_module/.ios/Config/Debug.xcconfig"
   ```

4. iOS主工程，Configurations中指定好上一步的Debug.xcconfig

5. 工程配置，添加RunScript，里面包含了编译，以及将相关iOS工程所需的库拷贝到目标目录（目标目录自己指定）

   ```shell
   "$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build
   
   cp -r ./fluter_module/.ios/Flutter/App.framework ./iOSFlutterDemo/Flutter/
   cp -r ./fluter_module/.ios/Flutter/engine/Flutter.framework ./iOSFlutterDemo/Flutter/
   cp -r ./fluter_module/.ios/Flutter/flutter_assets ./iOSFlutterDemo/Flutter/
   ```

6. 编译iOS主工程，此时将会生成目标framework，并拷贝至相应目录

7. 将目标目录的framework添加至主工程（引用的方式来添加）

8. 主工程设置中的Embeded binaries，添加上App.framework和Flutter.framework (不添加的话，可能会无法启动)

9. 编译运行，剩余的就是代码的配置。



​	

#### 参考资料

[Flutter与已有iOS工程混合开发与脚本配置](https://juejin.im/post/5b7a1bfbe51d4538a93d2339) 
