From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/1] sched/clock: Prevent generic sched_clock wrap caused
 by tick_freeze()
Date: Mon, 25 Mar 2019 14:54:05 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903251449580.1656@nanos.tec.linutronix.de>
References: <1553497460-24166-1-git-send-email-chang-an.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553497460-24166-1-git-send-email-chang-an.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chang-An Chen <chang-an.chen@mediatek.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, John Stultz <john.stultz@linaro.org>, Kees Cook <keescook@chromium.org>, Corey Minyard <cminyard@mvista.com>, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>, kuohong.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, 25 Mar 2019, Chang-An Chen wrote:
> --- a/include/linux/sched_clock.h
> +++ b/include/linux/sched_clock.h
> @@ -13,6 +13,10 @@
>  
>  extern void sched_clock_register(u64 (*read)(void), int bits,
>  				 unsigned long rate);
> +
> +extern int sched_clock_suspend(void);
> +
> +extern void sched_clock_resume(void);
>  #else
>  static inline void generic_sched_clock_init(void) { }
>  
> @@ -20,6 +24,10 @@ static inline void sched_clock_register(u64 (*read)(void), int bits,
>  					unsigned long rate)
>  {
>  }
> +
> +static int sched_clock_suspend(void) { }

static inline ...

> +
> +static void sched_clock_resume(void) { }

Ditto

>  #endif

Please do not expose this in the global header. All of this is local to
kernel/time/. So adding this to kernel/time/timekeeping.h is sufficient.

Thanks,

	tglx
