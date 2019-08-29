From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Subject: [PATCH 1/1] sched/rt: avoid contend with CFS task
Date: Thu, 29 Aug 2019 11:15:02 +0800
Message-ID: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jing-Ting Wu <jing-ting.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

At original linux design, RT & CFS scheduler are independent.
Current RT task placement policy will select the first cpu in
lowest_mask, even if the first CPU is running a CFS task.
This may put RT task to a running cpu and let CFS task runnable.

So we select idle cpu in lowest_mask first to avoid preempting
CFS task.

Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
---
 kernel/sched/rt.c |   42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index a532558..626ca27 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1388,7 +1388,6 @@ static void yield_task_rt(struct rq *rq)
 static int
 select_task_rq_rt(struct task_struct *p, int cpu, int sd_flag, int flags)
 {
-	struct task_struct *curr;
 	struct rq *rq;
 
 	/* For anything but wake ups, just return the task_cpu */
@@ -1398,33 +1397,15 @@ static void yield_task_rt(struct rq *rq)
 	rq = cpu_rq(cpu);
 
 	rcu_read_lock();
-	curr = READ_ONCE(rq->curr); /* unlocked access */
 
 	/*
-	 * If the current task on @p's runqueue is an RT task, then
-	 * try to see if we can wake this RT task up on another
-	 * runqueue. Otherwise simply start this RT task
-	 * on its current runqueue.
-	 *
-	 * We want to avoid overloading runqueues. If the woken
-	 * task is a higher priority, then it will stay on this CPU
-	 * and the lower prio task should be moved to another CPU.
-	 * Even though this will probably make the lower prio task
-	 * lose its cache, we do not want to bounce a higher task
-	 * around just because it gave up its CPU, perhaps for a
-	 * lock?
-	 *
-	 * For equal prio tasks, we just let the scheduler sort it out.
-	 *
-	 * Otherwise, just let it ride on the affined RQ and the
-	 * post-schedule router will push the preempted task away
-	 *
-	 * This test is optimistic, if we get it wrong the load-balancer
-	 * will have to sort it out.
+	 * If the task p is allowed to put more than one CPU or
+	 * it is not allowed to put on this CPU.
+	 * Let p use find_lowest_rq to choose other idle CPU first,
+	 * instead of choose this cpu and preempt curr cfs task.
 	 */
-	if (curr && unlikely(rt_task(curr)) &&
-	    (curr->nr_cpus_allowed < 2 ||
-	     curr->prio <= p->prio)) {
+	if ((p->nr_cpus_allowed > 1) ||
+	    (!cpumask_test_cpu(cpu, p->cpus_ptr))) {
 		int target = find_lowest_rq(p);
 
 		/*
@@ -1648,6 +1629,7 @@ static int find_lowest_rq(struct task_struct *task)
 	struct cpumask *lowest_mask = this_cpu_cpumask_var_ptr(local_cpu_mask);
 	int this_cpu = smp_processor_id();
 	int cpu      = task_cpu(task);
+	int i;
 
 	/* Make sure the mask is initialized first */
 	if (unlikely(!lowest_mask))
@@ -1659,6 +1641,16 @@ static int find_lowest_rq(struct task_struct *task)
 	if (!cpupri_find(&task_rq(task)->rd->cpupri, task, lowest_mask))
 		return -1; /* No targets found */
 
+	/* Choose previous cpu if it is idle and it fits lowest_mask */
+	if (cpumask_test_cpu(cpu, lowest_mask) && idle_cpu(cpu))
+		return cpu;
+
+	/* Choose idle_cpu among lowest_mask */
+	for_each_cpu(i, lowest_mask) {
+		if (idle_cpu(i))
+			return i;
+	}
+
 	/*
 	 * At this point we have built a mask of CPUs representing the
 	 * lowest priority tasks in the system.  Now we want to elect
-- 
1.7.9.5
