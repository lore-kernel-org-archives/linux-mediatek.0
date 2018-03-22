From: Ji.Zhang <ji.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: avoid race condition issue in dump_backtrace
Date: Thu, 22 Mar 2018 17:35:29 +0800
Message-ID: <1521711329.26617.31.camel@mtksdccf07>
References: <1521687960-3744-1-git-send-email-ji.zhang@mediatek.com>
 <20180322055929.z25brvwlmdighz66@salmiak>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180322055929.z25brvwlmdighz66@salmiak>
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

On Thu, 2018-03-22 at 05:59 +0000, Mark Rutland wrote:
> On Thu, Mar 22, 2018 at 11:06:00AM +0800, Ji Zhang wrote:
> > When we dump the backtrace of some specific task, there is a potential race
> > condition due to the task may be running on other cores if SMP enabled.
> > That is because for current implementation, if the task is not the current
> > task, we will get the registers used for unwind from cpu_context saved in
> > thread_info, which is the snapshot before context switch, but if the task
> > is running on other cores, the registers and the content of stack are
> > changed.
> > This may cause that we get the wrong backtrace or incomplete backtrace or
> > even crash the kernel.
> 
> When do we call dump_backtrace() on a running task that is not current?
> 
> AFAICT, we don't do that in the arm64-specific callers of dump_backtrace(), and
> this would have to be some caller of show_stack() in generic code.
Yes, show_stack() can make caller specify a task and dump its backtrace.
For example, SysRq-T (echo t > /proc/sysrq-trigger) will use this to
dump the backtrace of specific tasks.
> 
> We pin the task's stack via try_get_task_stack(), so this cannot be unmapped
> while we walk it. In unwind_frame() we check that the frame record falls
> entirely within the task's stack. So AFAICT, we cannot crash the kernel here,
> though the backtrace may be misleading (and we could potentially get stuck in
> an infinite loop).
You are right, I have checked the code and it seems that the check for
fp in unwind_frame() is strong enough to handle the case which stack
being changed due to task running. And as you mentioned, if
unfortunately fp is point to the address of itself, the unwind will be
an infinite loop, but it is a very small probability event, so we can
ignore this, is that right?
> 
> > To avoid this case, do not dump the backtrace of the tasks which are
> > running on other cores.
> > This patch cannot solve the issue completely but can shrink the window of
> > race condition.
> 
> > @@ -113,6 +113,9 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
> >  	if (tsk == current) {
> >  		frame.fp = (unsigned long)__builtin_frame_address(0);
> >  		frame.pc = (unsigned long)dump_backtrace;
> > +	else if (tsk->state == TASK_RUNNING) {
> > +		pr_notice("Do not dump other running tasks\n");
> > +		return;
> 
> As you note, if we can race with the task being scheduled, this doesn't help.
> 
> Can we rule this out at a higher level?
> Thanks,
> Mark.
Actually, according to my previous understanding, the low level function
should be transparent to callers and should provide the right result and
handle some unexpected cases, which means that if the result may be
misleading, we should drop it. That is why I bypass all TASK_RUNNING
tasks. I am not sure if this understanding is reasonable for this case.

And as you mentioned that rule this out at a higher level, is there any
suggestions, handle this in the caller of show_stack()?

PS, the dump_backtrace in arm64 is strong enough while arm has a weak
one, which strongly depend on the content of stack(in c_backtrace), and
it indeed can crash the kernel due to stack changed, I have submit a
similar patch for arm (arm: avoid race condition issue in
dump_backtrace)
If we can find a way to handle this at a higher way, should it be
suitable for both arm and arm64?

Thanks for your kindly support.

Best Regards,
Ji
