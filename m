From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 1/1] sched/rt: avoid contend with CFS task
Date: Thu, 3 Oct 2019 18:25:30 +0200
Message-ID: <7bd9506b-9930-0bf8-a024-8c7d7d8bf86e@arm.com>
References: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

[+ Steven Rostedt <rostedt@goodmis.org>]

On 29/08/2019 05:15, Jing-Ting Wu wrote:
> At original linux design, RT & CFS scheduler are independent.
> Current RT task placement policy will select the first cpu in
> lowest_mask, even if the first CPU is running a CFS task.
> This may put RT task to a running cpu and let CFS task runnable.
> 
> So we select idle cpu in lowest_mask first to avoid preempting
> CFS task.
> 
> Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> ---
>  kernel/sched/rt.c |   42 +++++++++++++++++-------------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index a532558..626ca27 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1388,7 +1388,6 @@ static void yield_task_rt(struct rq *rq)
>  static int
>  select_task_rq_rt(struct task_struct *p, int cpu, int sd_flag, int flags)
>  {
> -	struct task_struct *curr;
>  	struct rq *rq;
>  
>  	/* For anything but wake ups, just return the task_cpu */
> @@ -1398,33 +1397,15 @@ static void yield_task_rt(struct rq *rq)
>  	rq = cpu_rq(cpu);
>  
>  	rcu_read_lock();
> -	curr = READ_ONCE(rq->curr); /* unlocked access */
>  
>  	/*
> -	 * If the current task on @p's runqueue is an RT task, then
> -	 * try to see if we can wake this RT task up on another
> -	 * runqueue. Otherwise simply start this RT task
> -	 * on its current runqueue.
> -	 *
> -	 * We want to avoid overloading runqueues. If the woken
> -	 * task is a higher priority, then it will stay on this CPU
> -	 * and the lower prio task should be moved to another CPU.
> -	 * Even though this will probably make the lower prio task
> -	 * lose its cache, we do not want to bounce a higher task
> -	 * around just because it gave up its CPU, perhaps for a
> -	 * lock?
> -	 *
> -	 * For equal prio tasks, we just let the scheduler sort it out.
> -	 *
> -	 * Otherwise, just let it ride on the affined RQ and the
> -	 * post-schedule router will push the preempted task away
> -	 *
> -	 * This test is optimistic, if we get it wrong the load-balancer
> -	 * will have to sort it out.
> +	 * If the task p is allowed to put more than one CPU or
> +	 * it is not allowed to put on this CPU.
> +	 * Let p use find_lowest_rq to choose other idle CPU first,
> +	 * instead of choose this cpu and preempt curr cfs task.
>  	 */
> -	if (curr && unlikely(rt_task(curr)) &&
> -	    (curr->nr_cpus_allowed < 2 ||
> -	     curr->prio <= p->prio)) {
> +	if ((p->nr_cpus_allowed > 1) ||
> +	    (!cpumask_test_cpu(cpu, p->cpus_ptr))) {
>  		int target = find_lowest_rq(p);

I'm sure RT folks don't like the idea to change this condition.

I remember a similar approach and Steven Rostedt NAKed the idea back:

https://lore.kernel.org/r/1415099585-31174-2-git-send-email-pang.xunlei@linaro.org

Back then, Xunlei Pang even tried to create a lower mask of idle CPUs,
for find_lower_mask() to return:

https://lore.kernel.org/r/1415099585-31174-1-git-send-email-pang.xunlei@linaro.org

[...]
