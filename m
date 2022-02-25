Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3gf3tRshkjbg+BWv294ig0zTo4Vcgz1sSVkqsaRZeA=; b=ZlrgKCAx0kYdUA
	0/Pelg5176C9BH1TcQBTWkdZF7HBR2A5ZX5y0k8K3vAXhq5bpc5ST2fYr5ZrkafLq4eRATVqcjkpK
	BRcMewze8+lty3wNoNa9Uk3G2ZTi7q61ZtXNiMkVIC5R38Js3uxejEwORzH5D7pZFUwWQTapj1JwD
	suLqwGQsomIeDRzYazbwTiSPFb8cxcXBc1oMlMgwg6p+QrfjUgE3+N2o6E5qIJ6ENc5dl5MzyBgls
	Zipe8+B3AwBKhvrV4vqDPPoKCARCwVbAjWc4sob3+MqmOchrloGy8wvabfHtWD13rdkhvbsIUXs6H
	8hBCU/eOa/t1/2NRCryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNcOX-005a3Q-DY; Fri, 25 Feb 2022 15:20:33 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNcOK-005ZzE-NU; Fri, 25 Feb 2022 15:20:22 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 20E541F380;
 Fri, 25 Feb 2022 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1645802416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=76D+b8ZUFKHayJqezaXTrIOKH/+w6Mr9BDaG1qJPaqM=;
 b=uiwU9753hHXtDfEByGOp/4k3/mpSpC2iPS5R74LN2olK1KIV4kIuD6y8ARyLKPI+57XebW
 laXnAzMwXNXHJgSFsi5gA5ifwF1cCKT2ypgNk9DHv/UzKegXnyQUGwO9FQLe7NALffYOqs
 LFAeojvzfBLhLsnUVHoCuDy01kc+AaU=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 81174A3B83;
 Fri, 25 Feb 2022 15:20:15 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:20:15 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 davem@davemloft.net, Matthias Brugger <matthias.bgg@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wang Qing <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Xiaoming Ni <nixiaoming@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-mediatek@lists.infradead.org, sumit.garg@linaro.org,
 kernelfans@gmail.com, yj.chiang@mediatek.com
Subject: Re: [PATCH 4/5] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Message-ID: <Yhjzr8geK7dTXXd2@alley>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
 <20220212104349.14266-5-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212104349.14266-5-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_072020_969614_7514086C 
X-CRM114-Status: GOOD (  32.49  )
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

On Sat 2022-02-12 18:43:48, Lecopzer Chen wrote:
> From: Pingfan Liu <kernelfans@gmail.com>
> 
> from: Pingfan Liu <kernelfans@gmail.com>
> 
> When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
> yet. E.g. on arm64, PMU is not ready until
> device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
> with the driver model and cpuhp. Hence it is hard to push this
> initialization before smp_init().
> 
> But it is easy to take an opposite approach by enabling watchdog_hld to
> get the capability of PMU async.
> 
> The async model is achieved by expanding watchdog_nmi_probe() with
> -EBUSY, and a re-initializing work_struct which waits on a wait_queue_head.
> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  kernel/watchdog.c | 56 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index b71d434cf648..fa8490cfeef8 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -839,16 +843,64 @@ static void __init watchdog_sysctl_init(void)
>  #define watchdog_sysctl_init() do { } while (0)
>  #endif /* CONFIG_SYSCTL */
>  
> +static void lockup_detector_delay_init(struct work_struct *work);
> +enum hld_detector_state detector_delay_init_state __initdata;

I would call this "lockup_detector_init_state" to use the same
naming scheme everywhere.

> +
> +struct wait_queue_head hld_detector_wait __initdata =
> +		__WAIT_QUEUE_HEAD_INITIALIZER(hld_detector_wait);
> +
> +static struct work_struct detector_work __initdata =

I would call this "lockup_detector_work" to use the same naming scheme
everywhere.

> +		__WORK_INITIALIZER(detector_work, lockup_detector_delay_init);
> +
> +static void __init lockup_detector_delay_init(struct work_struct *work)
> +{
> +	int ret;
> +
> +	wait_event(hld_detector_wait,
> +			detector_delay_init_state == DELAY_INIT_READY);

DELAY_INIT_READY is defined in the 5th patch.

There are many other build errors because this patch uses something
that is defined in the 5th patch.

> +	ret = watchdog_nmi_probe();
> +	if (!ret) {
> +		nmi_watchdog_available = true;
> +		lockup_detector_setup();
> +	} else {
> +		WARN_ON(ret == -EBUSY);

Why WARN_ON(), please?

Note that it might cause panic() when "panic_on_warn" command line
parameter is used.

Also the backtrace will not help much. The context is well known.
This code is called from a workqueue worker.


> +		pr_info("Perf NMI watchdog permanently disabled\n");
> +	}
> +}
> +
> +/* Ensure the check is called after the initialization of PMU driver */
> +static int __init lockup_detector_check(void)
> +{
> +	if (detector_delay_init_state < DELAY_INIT_WAIT)
> +		return 0;
> +
> +	if (WARN_ON(detector_delay_init_state == DELAY_INIT_WAIT)) {

Again. Is WARN_ON() needed?

Also the condition looks wrong. IMHO, this is the expected state.

> +		detector_delay_init_state = DELAY_INIT_READY;
> +		wake_up(&hld_detector_wait);
> +	}
> +	flush_work(&detector_work);
> +	return 0;
> +}
> +late_initcall_sync(lockup_detector_check);

Otherwise, it make sense.

Best Regards,
Petr

PS: I am not going to review the last patch because I am no familiar
    with arm. I reviewed just the changes in the generic watchdog
    code.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
