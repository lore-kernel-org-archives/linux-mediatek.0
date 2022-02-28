Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B45C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGoxDVElyIIYPMafj4gYEf7fA5WVbioeETO9hwY9RrU=; b=GYTe3NSo9nAEH4
	5Aq4GIStnDSaNwaFVlm/eY4mbtgW6wUvhY1HrAFKnQgn9GYVB2g44dM4DQWTJqYemtQQvq2sVtnXt
	+/Rg+Rz06bk3TM5xDDphWEGmOxaVpcJ0zBsgLWjsL/BbgTqGblNqDLCp7xrfyh9WvfPodOYK1Pdkn
	sOjEYkBRs/m6ec4bxhP9Niz8LsTvrJ+fZMpDpGeF+uI66dObBpDavLMiTuX2eyOlODWbzJquDDGmi
	cNlFLQDjYwqDhOeNtQgUd9pRq8aYGIzmjC0dU1/GKknT4Rzt3Boh/O7++AAaNQLkXclizB5yotxqU
	UmV1X7YSqnImdEmZsTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOixv-00DLgh-U4; Mon, 28 Feb 2022 16:33:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOixd-00DLYY-27; Mon, 28 Feb 2022 16:33:24 +0000
X-UUID: 38b42f029bef42a0bc60e746e630149d-20220228
X-UUID: 38b42f029bef42a0bc60e746e630149d-20220228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1094402571; Mon, 28 Feb 2022 09:33:12 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 08:33:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 00:32:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 00:32:56 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <pmladek@suse.com>
CC: <acme@kernel.org>, <akpm@linux-foundation.org>,
 <alexander.shishkin@linux.intel.com>, <catalin.marinas@arm.com>,
 <davem@davemloft.net>, <jolsa@redhat.com>, <jthierry@redhat.com>,
 <keescook@chromium.org>, <kernelfans@gmail.com>,
 <lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
 <masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
 <mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
 <nixiaoming@huawei.com>, <peterz@infradead.org>,
 <sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH 4/5] kernel/watchdog: Adapt the watchdog_hld interface for
 async model
Date: Tue, 1 Mar 2022 00:32:57 +0800
Message-ID: <20220228163257.2411-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YhygkafOHc6eeP9f@alley>
References: <YhygkafOHc6eeP9f@alley>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_083321_118587_85311D24 
X-CRM114-Status: GOOD (  36.65  )
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

Yes, there is no race now, the condition is much like a verbose checking for
the state. I'll remove it.


> > I think it make sense to remove WARN now becasue it looks verbosely...
> > However, I would rather change the following printk to
> > "Delayed init for lockup detector failed."
> 
> I would print both messages. The above message says what failed.
> 
> 
> > > > +		pr_info("Perf NMI watchdog permanently disabled\n");
> 
> And this message explains what is the result of the above failure.
> It is not obvious.

Yes, make sense, let's print both.


> 
> > > > +	}
> > > > +}
> > > > +
> > > > +/* Ensure the check is called after the initialization of PMU driver */
> > > > +static int __init lockup_detector_check(void)
> > > > +{
> > > > +	if (detector_delay_init_state < DELAY_INIT_WAIT)
> > > > +		return 0;
> > > > +
> > > > +	if (WARN_ON(detector_delay_init_state == DELAY_INIT_WAIT)) {
> > > 
> > > Again. Is WARN_ON() needed?
> > > 
> > > Also the condition looks wrong. IMHO, this is the expected state.
> > > 
> > 
> > This does expected DELAY_INIT_READY here, which means,
> > every one who comes here to be checked should be READY and WARN if you're
> > still in WAIT state, and which means the previous lockup_detector_delay_init()
> > failed.
> 
> No, DELAY_INIT_READY is set below. DELAY_INIT_WAIT is valid value here.
> It means that lockup_detector_delay_init() work is queued.
> 

Sorry, I didn't describe clearly,

For the call flow:

kernel_init_freeable()
-> lockup_detector_init()
--> queue work(lockup_detector_delay_init) with state registering
    to DELAY_INIT_WAIT.
---> lockup_detector_delay_init wait DELAY_INIT_READY that set
     by armv8_pmu_driver_init().
----> device_initcall(armv8_pmu_driver_init),
      set state to READY and wake_up the work. (in 5th patch)
-----> lockup_detector_delay_init recieves READY and calls
       watchdog_nmi_probe() again.
------> late_initcall_sync(lockup_detector_check);
        check if the state is READY? In other words, did the arch driver
        finish probing watchdog between "queue work" and "late_initcall_sync()"?
        If not, we forcely set state to READY and wake_up again.


> 
> > IMO, either keeping or removing WARN is fine with me.
> > 
> > I think I'll remove WARN and add
> > pr_info("Delayed init checking for lockup detector failed, retry for once.");
> > inside the `if (detector_delay_init_state == DELAY_INIT_WAIT)`
> > 
> > Or would you have any other suggestion? thanks.
> > 
> > > > +		detector_delay_init_state = DELAY_INIT_READY;
> > > > +		wake_up(&hld_detector_wait);
> 
> I see another problem now. We should always call the wake up here
> when the work was queued. Otherwise, the worker will stay blocked
> forewer.
> 
> The worker will also get blocked when the late_initcall is called
> before the work is proceed by a worker.

lockup_detector_check() is used to solve the blocking state.
As the description above, if state is WAIT when lockup_detector_check(),
we would forcely set state to READY can wake up the work for once.
After lockup_detector_check(), nobody cares about the state and the worker
also finishes its work.

> 
> > > > +	}
> > > > +	flush_work(&detector_work);
> > > > +	return 0;
> > > > +}
> > > > +late_initcall_sync(lockup_detector_check);
> 
> 
> OK, I think that the three states are too complicated. I suggest to
> use only a single bool. Something like:
> 
> static bool lockup_detector_pending_init __initdata;
> 
> struct wait_queue_head lockup_detector_wait __initdata =
> 		__WAIT_QUEUE_HEAD_INITIALIZER(lockup_detector_wait);
> 
> static struct work_struct detector_work __initdata =
> 		__WORK_INITIALIZER(lockup_detector_work,
> 				   lockup_detector_delay_init);
> 
> static void __init lockup_detector_delay_init(struct work_struct *work)
> {
> 	int ret;
> 
> 	wait_event(lockup_detector_wait, lockup_detector_pending_init == false);
> 
> 	ret = watchdog_nmi_probe();
> 	if (ret) {
> 		pr_info("Delayed init of the lockup detector failed: %\n);
> 		pr_info("Perf NMI watchdog permanently disabled\n");
> 		return;
> 	}
> 
> 	nmi_watchdog_available = true;
> 	lockup_detector_setup();
> }
> 
> /* Trigger delayedEnsure the check is called after the initialization of PMU driver */
> static int __init lockup_detector_check(void)
> {
> 	if (!lockup_detector_pending_init)
> 		return;
> 
> 	lockup_detector_pending_init = false;
> 	wake_up(&lockup_detector_wait);
> 	return 0;
> }
> late_initcall_sync(lockup_detector_check);
> 
> void __init lockup_detector_init(void)
> {
> 	int ret;
> 
> 	if (tick_nohz_full_enabled())
> 		pr_info("Disabling watchdog on nohz_full cores by default\n");
> 
> 	cpumask_copy(&watchdog_cpumask,
> 		     housekeeping_cpumask(HK_FLAG_TIMER));
> 
> 	ret = watchdog_nmi_probe();
> 	if (!ret)
> 		nmi_watchdog_available = true;
> 	else if (ret == -EBUSY) {
> 		detector_delay_pending_init = true;
> 		/* Init must be done in a process context on a bound CPU. */
> 		queue_work_on(smp_processor_id(), system_wq, 
> 				  &lockup_detector_work);
> 	}
> 
> 	lockup_detector_setup();
> 	watchdog_sysctl_init();
> }
> 
> The result is that lockup_detector_work() will never stay blocked
> forever. There are two possibilities:
> 
> 1.  lockup_detector_work() called before lockup_detector_check().
>     In this case, wait_event() will wait until lockup_detector_check()
>     clears detector_delay_pending_init and calls wake_up().
> 
> 2. lockup_detector_check() called before lockup_detector_work().
>    In this case, wait_even() will immediately continue because
>    it will see cleared detector_delay_pending_init.
> 

Thanks, I think this logic is much simpler than three states for our use case now,
It also fits the call flow described above, I will revise it base on this
code.


Thanks a lot for your code and review!

BRs,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
