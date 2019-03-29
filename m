From: Chang-An Chen <chang-an.chen@mediatek.com>
Subject: Re: [PATCH 1/1] sched/clock: Prevent generic sched_clock wrap
 caused by tick_freeze()
Date: Fri, 29 Mar 2019 10:30:09 +0800
Message-ID: <1553826609.8188.0.camel@mtkswgap22>
References: <1553497460-24166-1-git-send-email-chang-an.chen@mediatek.com>
         <alpine.DEB.2.21.1903251449580.1656@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1903251449580.1656@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Corey Minyard <cminyard@mvista.com>, Kees Cook <keescook@chromium.org>, "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>, Frederic Weisbecker <fweisbec@gmail.com>, Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?= <stanley.chu@mediatek.com>, Ingo Molnar <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-03-25 at 21:54 +0800, Thomas Gleixner wrote:
> On Mon, 25 Mar 2019, Chang-An Chen wrote:
> > --- a/include/linux/sched_clock.h
> > +++ b/include/linux/sched_clock.h
> > @@ -13,6 +13,10 @@
> >  
> >  extern void sched_clock_register(u64 (*read)(void), int bits,
> >  				 unsigned long rate);
> > +
> > +extern int sched_clock_suspend(void);
> > +
> > +extern void sched_clock_resume(void);
> >  #else
> >  static inline void generic_sched_clock_init(void) { }
> >  
> > @@ -20,6 +24,10 @@ static inline void sched_clock_register(u64 (*read)(void), int bits,
> >  					unsigned long rate)
> >  {
> >  }
> > +
> > +static int sched_clock_suspend(void) { }
> 
> static inline ...
> 
> > +
> > +static void sched_clock_resume(void) { }
> 
> Ditto
> 
> >  #endif
> 
> Please do not expose this in the global header. All of this is local to
> kernel/time/. So adding this to kernel/time/timekeeping.h is sufficient.
Thanks so much for review and the suggestion, I'll fix it in next
version.

Thanks,
Chang-An
> 
> Thanks,
> 
> 	tglx
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
