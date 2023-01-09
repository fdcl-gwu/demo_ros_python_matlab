"""
http://wiki.ros.org/ROS/Tutorials/WritingServiceClient%28python%29
"""
import numpy as np
import rospy
import time

from demo_package.srv import DemoSrv

if __name__ == '__main__':
    rospy.wait_for_service('/matrix_vec_mul', timeout=5)
    demo_mul = rospy.ServiceProxy('/matrix_vec_mul', DemoSrv)

    A, B = 3, 3
    st = time.time()
    sum = np.zeros(3)
    for i in range(100):
        R = np.random.rand(A, B).reshape((A*B,))
        X = np.random.rand(B,)
        response = demo_mul(A=A, B=B, R=R, X=X)
        sum = sum + response.Y
    print('The sum is', sum)
    print('and the time taken is', time.time() - st)