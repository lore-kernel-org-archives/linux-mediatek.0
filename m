From: Kobe-CP Wu <Kobe-CP.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] locking/lockdep: Save and display stack trace of held
 locks
Date: Fri, 28 Jun 2019 17:42:40 +0800
Message-ID: <1561714960.19339.12.camel@mtkswgap22>
References: <1561363259-14705-1-git-send-email-kobe-cp.wu@mediatek.com>
 <20190624110852.GV3419@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190624110852.GV3419-Nxj+rRp3nVydTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eason Lin <eason-yh.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-06-24 at 13:08 +0200, Peter Zijlstra wrote:
> On Mon, Jun 24, 2019 at 04:00:59PM +0800, Kobe Wu wrote:
> > Save the stack trace of held locks when lock_acquire() is invoked
> > and display the stack trace when lockdep_print_held_locks() is
> > invoked. The runtime stack trace of held locks are helpful in
> > analyzing code flow and lockdep's warning.
> > 
> > Save stack trace of each held lock will increase runtime overhead
> > and memory consumption. The operation will be activated under
> > CONFIG_LOCKDEP_TRACE_HELD_LOCK. So the impact will only occur
> > when CONFIG_LOCKDEP_TRACE_HELD_LOCK=y.
> 
> Yeah, I don't see the point of this. If you cannot find where the lock
> got taken you've bigger problems.

There are some examples which can explain why stack trace are helpful.

<#1>

It provides more information for debug_show_all_locks().
debug_show_all_locks() is called by other debug functions and helpful in
analyzing problems and understanding system status.

If a task goes into sleeping with holding several locks for a long time,
it may result in problems. It would be easy to know how the task goes
into sleeping and as a beginning to analyze why the task keep sleeping
from the stack trace. Because the task goes into sleeping after the
stack trace. We can research what happened after the code flow.

For the following example, (&f->f_pos_lock) is the lock we cannot
acquire for a long time. We want to know what happened on
logd.klogd/344. Why logd.klogd/344 keep sleeping? Only final function
entry and task name is hard to understand the code flow and condition.

Showing all locks held in the system:
1 lock held by logd.klogd/344:
 #0:  (&f->f_pos_lock){+.+.+.}, at: [<ffffff8182a8ae04>] __fdget_pos
+0x44/0x58
...

<#2>

Provide more information for "BUG: task/pid still has locks held!".

The original warning is as following. It not easy to know where the lock
is held. Because the lock could be used in many functions and could be
packed by other functions.

=====================================
[ BUG: vpud/657 still has locks held! ]
4.9.117+ #2 Tainted: G S      W  O   
-------------------------------------
1 lock held by vpud/657 on CPU#6:
 #0:  (&dev->enc_mutex){+.+.+.}, at: [<ffffff8c5ca3ca74>] venc_lock
+0xec/0x108
Call trace:
[<ffffff8c5be8d190>] dump_backtrace+0x0/0x2bc
[<ffffff8c5be8d188>] show_stack+0x18/0x20
[<ffffff8c5c268274>] dump_stack+0xa8/0xf8
[<ffffff8c5bf4c1e4>] debug_check_no_locks_held+0x174/0x17c
[<ffffff8c5bf9e1dc>] futex_wait_queue_me+0xf4/0x16c
[<ffffff8c5bf9bc44>] futex_wait+0x14c/0x334
[<ffffff8c5bf9a534>] do_futex+0x10c/0x16d0
[<ffffff8c5bf9f688>] compat_SyS_futex+0x100/0x158
[<ffffff8c5be83e00>] el0_svc_naked+0x34/0x38

If there is a stack trace for reference, it will be easy to understand
and resolve this problem.

1 lock held by vpud/657/[0] on CPU#6:
 #0:  (&dev->enc_mutex){+.+.+.}, at: [<ffffff8c5ca3ca74>] venc_lock
+0xec/0x108
       lock_acquire+0x224/0x25c
       __mutex_lock_common+0x88/0x728
       mutex_lock_nested+0x50/0x60
       venc_lock+0xec/0x108
       venc_encode_prepare+0x20/0x68
       vcu_unlocked_ioctl+0x91c/0x1108
       vcu_unlocked_compat_ioctl+0x110/0x238
       compat_SyS_ioctl+0x128/0x244
       el0_svc_naked+0x34/0x38

For the same reason, it is helpful in analyzing "BUG: held lock freed!" 
and "INFO: possible recursive locking detected".
