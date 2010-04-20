export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export M2_HOME=/usr/local/apache-maven/apache-maven-2.2.1
export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,suspend=n,server=y -Xms256m -Xmx512m -XX:MaxPermSize=128m"
export M2=$M2_HOME/bin
export PATH="$M2:$JAVA_HOME/bin:/opt/subversion/bin:/opt/local/bin:/sw/bin:$PATH"
export CDPATH=.:~:~/projects/training:~/projects/toobla:~/projects/personal:~/projects/freelance:~/projects/katas:~/projects/opensource:~/projects/pillar
export LSCOLORS=gxfxcxdxbxegedabagacad