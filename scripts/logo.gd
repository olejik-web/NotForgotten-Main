extends AnimatedSprite

var i = 0
var sz = scale.x
var mx
var thr
func _ready():
	mx = Mutex.new()
	thr = Thread.new()
	thr.start(self,"_thread_function",i)
func _thread_function(i):
	print(i)
	scale.x = sz*cos(deg2rad(i))
	#mx.lock()
	i=(i+5)%360
	#mx.unlock()

func _exit_tree():
	thr.wait_to_finish()
	#print(i)
