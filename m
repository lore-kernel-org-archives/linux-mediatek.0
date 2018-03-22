From: Ji.Zhang <ji.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: avoid race condition issue in dump_backtrace
Date: Thu, 22 Mar 2018 13:33:08 +0800
Message-ID: <1521696788.26617.5.camel@mtksdccf07>
References: <1521687960-3744-1-git-send-email-ji.zhang@mediatek.com>
 <20180322045710.vmmjr2wcankea45o@sapphire.tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180322045710.vmmjr2wcankea45o-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Xie XiuQi <xiexiuqi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shadanji-9Onoh4P/yGk@public.gmane.org, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Weiser <michael.weiser-Mmb7MZpHnFY@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Dear Baruch,

Thank you for your kind and careful examination.
That is my stupid fault due to I use different environments to do
verification and submit patch which I do the merge manually.
Anyway, thanks so much for the reminder, I will send another patch.

BRs,
Ji 

On Thu, 2018-03-22 at 06:57 +0200, Baruch Siach wrote:
> Hi Ji Zhang,
> 
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
> > To avoid this case, do not dump the backtrace of the tasks which are
> > running on other cores.
> > This patch cannot solve the issue completely but can shrink the window of
> > race condition.
> > 
> > Signed-off-by: Ji Zhang <ji.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm64/kernel/traps.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index eb2d151..95749364 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -113,6 +113,9 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
> >  	if (tsk == current) {
> >  		frame.fp = (unsigned long)__builtin_frame_address(0);
> >  		frame.pc = (unsigned long)dump_backtrace;
> > +	else if (tsk->state == TASK_RUNNING) {
> 
> Missing closing brace. Does this build?
> 
> > +		pr_notice("Do not dump other running tasks\n");
> > +		return;
> >  	} else {
> >  		/*
> >  		 * task blocked in __switch_to
> 
> baruch
> 
