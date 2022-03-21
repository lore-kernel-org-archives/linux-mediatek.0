Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85621C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMxKW4LxPrysG2/jk8GZpyVVpK4yYXiYwz/BwSnPdn8=; b=HH/lxWGS3hn8an
	Jtc+kTh2hVCzx1yT32BCTnV6desT4UNKQ/tO8Q/W5nI+OLudH/xjWK5+UfwK51zCdc6THYwJ/HTm1
	tgIb9xKvNdEYR6uHdOBWROXINEnEPKvVcZsYwFBHZNRZh4+Sb3t4IEgAUwnnLzUAfZVrHFPm0/1la
	6elInsB4cqsUpwFWGI47uhbfTcyMB1cUwIAFfwAsbfviAkzNh3XvBcQwThGF1A+hRSv/EDAxANTeF
	eAEAmxdb5jwgE558f5yMe954OGnci08qeguPj1mwTX18BpH8lUqyJK4lvzu2meSP26Z6bDu2TFcny
	lGiG5R+bKSeShkjkfIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWLyO-008drG-5h; Mon, 21 Mar 2022 17:37:40 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWLyA-008dm5-JQ; Mon, 21 Mar 2022 17:37:28 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E785E210E7;
 Mon, 21 Mar 2022 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1647884244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5bsCI6QgpU1VEHlgKqhByuX519NRY+S3vfucuw6r5WI=;
 b=rvoRfv0Dxeauz5xUbd+g1vOv5ElwpIjlBni3X7ekWLRANUxcVc800tvZUdOSRPv8nrkkfD
 STArH1oh9ZzKhGd6New+zXvK7pMuLK00UZIIvVAwEwfjn236WTFDTtcUQPNAIMVoICl2Ew
 /4i+2QYbxDB8140eOx3IZud0NCrevKk=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 013F5A3B81;
 Mon, 21 Mar 2022 17:37:23 +0000 (UTC)
Date: Mon, 21 Mar 2022 18:37:21 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: acme@kernel.org, akpm@linux-foundation.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 davem@davemloft.net, jolsa@redhat.com, jthierry@redhat.com,
 keescook@chromium.org, kernelfans@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
 masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
 mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
 nixiaoming@huawei.com, peterz@infradead.org,
 sparclinux@vger.kernel.org, sumit.garg@linaro.org,
 wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v2 4/5] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Message-ID: <Yji30cmiPzoINrd6@alley>
References: <YjRhnxg3L3cHUU/l@alley>
 <20220319081822.16537-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319081822.16537-1-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_103726_836769_B0420115 
X-CRM114-Status: GOOD (  44.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat 2022-03-19 16:18:22, Lecopzer Chen wrote:
> > On Mon 2022-03-07 23:47:28, Lecopzer Chen wrote:
> > > When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
> > > yet. E.g. on arm64, PMU is not ready until
> > > device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
> > > with the driver model and cpuhp. Hence it is hard to push this
> > > initialization before smp_init().
> > 
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -839,16 +843,70 @@ static void __init watchdog_sysctl_init(void)
> > >  #define watchdog_sysctl_init() do { } while (0)
> > >  #endif /* CONFIG_SYSCTL */
> > >  
> > > +static void lockup_detector_delay_init(struct work_struct *work);
> > > +bool lockup_detector_pending_init __initdata;
> > > +
> > > +struct wait_queue_head hld_detector_wait __initdata =
> > > +		__WAIT_QUEUE_HEAD_INITIALIZER(hld_detector_wait);
> > > +
> > > +static struct work_struct detector_work __initdata =
> > > +		__WORK_INITIALIZER(detector_work, lockup_detector_delay_init);
> > > +
> > > +static void __init lockup_detector_delay_init(struct work_struct *work)
> > > +{
> > > +	int ret;
> > > +
> > > +	wait_event(hld_detector_wait,
> > > +			lockup_detector_pending_init == false);
> > > +
> > > +	/*
> > > +	 * Here, we know the PMU should be ready, so set pending to true to
> > > +	 * inform watchdog_nmi_probe() that it shouldn't return -EBUSY again.
> > > +	 */
> > > +	lockup_detector_pending_init = true;
> > 
> > This does not make sense to me. We are here only when:
> > 
> >    1. lockup_detector_init() queued this work.
> > 
> >    2. Someone cleared @lockup_detector_pending_init and woke the
> >       worker via wait_queue. IT might be either PMU init code
> >       or the late lockup_detector_check().
> > 
> > watchdog_nmi_probe() might still return -EBUSY when PMU init failed.
> > 
> > If you wanted to try the delayed probe once again (3rd attempt) from
> > lockup_detector_check(), you would need to queue the work once again.
> > But you need to be sure that lockup_detector_check() was not called
> > yet. Otherwise, the 2nd work might wait forewer.
> > 
> > IMHO, it is not worth the complexity.
> 
> The original assumption is: nobody should use delayed probe after
> lockup_detector_check() (which has __init attribute).

Good point. It makes perfect sense.

But it was not mentioned anywhere. And the code did not work this way.

> 
> That is, everything including PMU and delayed probe of lock detector must
> finsh before do_initcalls() which means delayed probe can't support with
> external PMU module init.
> 
> Also,
>   1. lockup_detector_check is registered with late_initcall_sync(), so it'd
>      be called in the last order of do_initcalls()).
> 
>   2. watchdog_nmi_probe() and all the delayed relative functions and variables
>      have __init attribute, no one should ever use it after __init section
>      is released.
> 
> The only case is PMU probe function is also late_initcall_sync().

This is the case for PMU. The API for delayed init is generic a should
be safe even for other users.


> How about this one:
>   1. Wrap the wake_up code to reduce the complexity for user side.
> 
>   2. Remove wait queue.
>      Instead queue work when lockup_detector_init(), queue the delayed
>      probe work when arch PMU code finish probe.
> 
> and the flow turns to
> 
>   1. lockup_detector_init() get -EBUSY, set lockup_detector_pending_init=true
> 
>   2. PMU arch code init done, call lockup_detector_queue_work().
> 
>   3. lockup_detector_queue_work() queue the work only when
>      lockup_detector_pending_init=true which means nobody should call
>      this before lockup_detector_init().
> 
>   4. the work lockup_detector_delay_init() is doing without wait event.
>      if probe success, set lockup_detector_pending_init=false.
> 
>   5. at late_initcall_sync(), lockup_detector_check() call flush_work() first
>      to avoid previous lockup_detector_queue_work() is not scheduled.
>      And then test whether lockup_detector_pending_init is false, if it's
>      true, means we have pending init un-finished, than forcely queue work
>      again and flush_work to make sure the __init section won't be freed
>      before the work done.

Nice, I like it.

> This remove the complexity of wait event which we were disscussed.
> The draft of the diff code(diff with this series) shows below.
> 
> 
> diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> index 77eaefee13ea..c776618fbfa8 100644
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -1388,9 +1388,7 @@ static int __init armv8_pmu_driver_init(void)
>  	else
>  		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
>  
> -	/* Inform watchdog core we are ready to probe hld by delayed init. */
> -	lockup_detector_pending_init = false;
> -	wake_up(&hld_detector_wait);
> +	lockup_detector_queue_work();

The name is strange. The fact that it uses workqueues is an
implementation detail. I would call it
retry_lockup_detector_init() so that it is more obvious what it does.

>  	return ret;
>  }
>  device_initcall(armv8_pmu_driver_init)
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -876,15 +865,27 @@ static void __init lockup_detector_delay_init(struct work_struct *work)
>  	lockup_detector_pending_init = false;
>  }
>  
> +/* Must call after lockup_detector_init() that we do need delayed probe */
> +void __init lockup_detector_queue_work(void)
> +{
> +	if (!lockup_detector_pending_init)
> +		return;
> +
> +	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> +}
> +
>  /* Ensure the check is called after the initialization of PMU driver */
>  static int __init lockup_detector_check(void)
>  {
> +	/* Make sure no work is pending. */
> +	flush_work(&detector_work);
> +
>  	if (!lockup_detector_pending_init)
>  		return 0;
>  
>  	pr_info("Delayed init checking failed, retry for once.\n");
> -	lockup_detector_pending_init = false;
> -	wake_up(&hld_detector_wait);
> +	lockup_detector_queue_work();

I would do here

	lockup_detector_pending_init = false;

to make sure that lockup_detector_queue_work() will not longer
queue the work after the final flush.

Maybe, we could rename the variable to allow_lockup_detector_init_retry.

> +	flush_work(&detector_work);
>
>	return 0;
>  }
>  late_initcall_sync(lockup_detector_check);

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
