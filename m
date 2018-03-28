From: Ji.Zhang <ji.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: avoid race condition issue in dump_backtrace
Date: Wed, 28 Mar 2018 17:33:32 +0800
Message-ID: <1522229612.26617.47.camel@mtksdccf07>
References: <1521687960-3744-1-git-send-email-ji.zhang@mediatek.com>
 <20180322055929.z25brvwlmdighz66@salmiak>
 <1521711329.26617.31.camel@mtksdccf07>
 <20180326113932.2i6qp3776jtmcqk4@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180326113932.2i6qp3776jtmcqk4-agMKViyK24J5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Xie XiuQi <xiexiuqi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shadanji-9Onoh4P/yGk@public.gmane.org, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Weiser <michael.weiser-Mmb7MZpHnFY@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2018-03-26 at 12:39 +0100, Mark Rutland wrote:
> On Thu, Mar 22, 2018 at 05:35:29PM +0800, Ji.Zhang wrote:
> > On Thu, 2018-03-22 at 05:59 +0000, Mark Rutland wrote:
> > > On Thu, Mar 22, 2018 at 11:06:00AM +0800, Ji Zhang wrote:
> > > > When we dump the backtrace of some specific task, there is a potential race
> > > > condition due to the task may be running on other cores if SMP enabled.
> > > > That is because for current implementation, if the task is not the current
> > > > task, we will get the registers used for unwind from cpu_context saved in
> > > > thread_info, which is the snapshot before context switch, but if the task
> > > > is running on other cores, the registers and the content of stack are
> > > > changed.
> > > > This may cause that we get the wrong backtrace or incomplete backtrace or
> > > > even crash the kernel.
> > > 
> > > When do we call dump_backtrace() on a running task that is not current?
> > > 
> > > AFAICT, we don't do that in the arm64-specific callers of dump_backtrace(), and
> > > this would have to be some caller of show_stack() in generic code.
> > Yes, show_stack() can make caller specify a task and dump its backtrace.
> > For example, SysRq-T (echo t > /proc/sysrq-trigger) will use this to
> > dump the backtrace of specific tasks.
> 
> Ok. I see that this eventually calls show_state_filter(0), where we call
> sched_show_task() for every task.
> 
> > > We pin the task's stack via try_get_task_stack(), so this cannot be unmapped
> > > while we walk it. In unwind_frame() we check that the frame record falls
> > > entirely within the task's stack. So AFAICT, we cannot crash the kernel here,
> > > though the backtrace may be misleading (and we could potentially get stuck in
> > > an infinite loop).
> > You are right, I have checked the code and it seems that the check for
> > fp in unwind_frame() is strong enough to handle the case which stack
> > being changed due to task running. And as you mentioned, if
> > unfortunately fp is point to the address of itself, the unwind will be
> > an infinite loop, but it is a very small probability event, so we can
> > ignore this, is that right?
> 
> I think that it would be preferable to try to avoid the inifinite loop
> case. We could hit that by accident if we're tracing a live task.
> 
> It's a little tricky to ensure that we don't loop, since we can have
> traces that span several stacks, e.g. overflow -> irq -> task, so we
> need to know where the last frame was, and we need to defnie a strict
> order for stack nesting.
Can we consider this through an easier way? According to AArch64 PCS,
stack should be full-descending, which means we can add validation on fp
by comparing the fp and previous fp, if they are equal means there is an
exactly loop, while if current fp is smaller than previous means the
uwnind is rollback, which is also unexpected. The only concern is how to
handle the unwind from one stack span to another (eg. overflow->irq, or
irq->task, etc)
Below diff is a proposal that we check if stack spans, and if yes, a
tricky is used to bypass the fp check.

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index eb2d151..760ea59 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -101,6 +101,7 @@ void dump_backtrace(struct pt_regs *regs, struct
task_struct *tsk)
 {
        struct stackframe frame;
        int skip;
+       unsigned long fp = 0x0;

        pr_debug("%s(regs = %p tsk = %p)\n", __func__, regs, tsk);

@@ -127,6 +128,20 @@ void dump_backtrace(struct pt_regs *regs, struct
task_struct *tsk)
        skip = !!regs;
        printk("Call trace:\n");
        do {
+               unsigned long stack;
+               if (fp) {
+                       if (in_entry_text(frame.pc)) {
+                               stack = frame.fp - offsetof(struct
pt_regs, stackframe);
+
+                               if (on_accessible_stack(tsk, stack))
+                                       fp = frame.fp + 0x8; //tricky to
bypass the fp check
+                       }
+                       if (fp <= frame->fp) {
+                               pr_notice("fp invalid, stop unwind\n");
+                               break;
+                       }
+               }
+               fp = frame.fp;
                /* skip until specified stack frame */
                if (!skip) {
                        dump_backtrace_entry(frame.pc);
> > > > To avoid this case, do not dump the backtrace of the tasks which are
> > > > running on other cores.
> > > > This patch cannot solve the issue completely but can shrink the window of
> > > > race condition.
> > > 
> > > > @@ -113,6 +113,9 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
> > > >  	if (tsk == current) {
> > > >  		frame.fp = (unsigned long)__builtin_frame_address(0);
> > > >  		frame.pc = (unsigned long)dump_backtrace;
> > > > +	else if (tsk->state == TASK_RUNNING) {
> > > > +		pr_notice("Do not dump other running tasks\n");
> > > > +		return;
> > > 
> > > As you note, if we can race with the task being scheduled, this doesn't help.
> > > 
> > > Can we rule this out at a higher level?
> > > Thanks,
> > > Mark.
> > Actually, according to my previous understanding, the low level function
> > should be transparent to callers and should provide the right result and
> > handle some unexpected cases, which means that if the result may be
> > misleading, we should drop it. That is why I bypass all TASK_RUNNING
> > tasks. I am not sure if this understanding is reasonable for this case.
> 
> Given that this can change under our feet, I think this only provides a
> false sense of security and complicates the code.
> 
Agreed
> > And as you mentioned that rule this out at a higher level, is there any
> > suggestions, handle this in the caller of show_stack()?
> 
> Unfortunately, it doesn't look like we can do this in general given
> cases like sysrq-t.
> 
> Thanks,
> Mark.
Best Regards,
Ji
