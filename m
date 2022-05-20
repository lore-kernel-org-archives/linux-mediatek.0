Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TF/F82dl37Jcmotd1ncmqAiCbTIudgYFyWLqeGK1d4=; b=zqnZ2o3VlFP+zk
	4vx4xcBKWyWiT/Z0bnhvDWidflrkBZ6ETDBw5luOAQtX5y+g8a5q4X521zL1OikgQP37rvEysxRBf
	KveernaWiIBtj8kUJOwCFit9F75iavgF+BSNQ9hElGZ3XszQbQ7xGCqd6p2f7I2I3vkMEPzH/khU+
	flhyiaGz36UaZXdTgsyXjdIjrtBaCWgSNkwrz3OGoGjwjIep+9FMRPM/Qz8igMr8z7fzhJu/zKziE
	vJvIzC5SUQONgSukobSPMvEvYWEjOFjcT1Zqq+vEbkOoBd3v8fmzkyIYHYXVB9wcPk2tKoUNAzQkI
	GCimcLZzbzw0z6YhIzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0PD-00BxnB-L4; Fri, 20 May 2022 11:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzJX-00Bi6D-Gx; Fri, 20 May 2022 09:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Vwa8jgE6ubsEKfUz+gYRve0wuQBCRznCtklt59zTV6Q=; b=qiXxHEJNEJhblLh6R18cLD5osH
 jhqLlroJK6Hn/K46xKgti4icpFbtRmog7XLiX+/smiTNXz9dWIYxa1KkjYKW3BNCI4WmSRswEFFyv
 dq1/p+p+PM4UhnSO6QVlWlSaVPaWWeJ8lEU29H1JflIQMCEji5O2vIzpLhPMmNgRUrIxhqSFGiZXj
 QJujupm97u++YwF6hKPaH+etsqNJVO+/J8NSIdViFENaW84A7FCwVJYQ7HinEZ6KPpTIyG1vX/Tfh
 2xWeKWbItRPxCSrf/0pccXRe1KaISadgu2FmO3vJncAdHrCzx6DN4Ailq96jP4dbIGkrlVC1VjcGU
 VlLBPxTw==;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrz60-002I3z-5y; Fri, 20 May 2022 09:39:00 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C26CB1F9EE;
 Fri, 20 May 2022 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653039524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vwa8jgE6ubsEKfUz+gYRve0wuQBCRznCtklt59zTV6Q=;
 b=n4FUsnYY/xBnyS3SXETnotHd5Ec72kh2zh+Dai5f7buZTjDHEcxmvFl76tcNcSiGnbmu5U
 COCabwTrl3uU15SJXqrrKAF+acixaXA+4I53JuXXoiexiw5MqutnBzZx+zmDOKwi0qKMRt
 enjPGTMixqFSFTH0zMOo/VadTvKZals=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 27E2F2C142;
 Fri, 20 May 2022 09:38:44 +0000 (UTC)
Date: Fri, 20 May 2022 11:38:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, acme@kernel.org,
 akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
 catalin.marinas@arm.com, davem@davemloft.net, jolsa@redhat.com,
 jthierry@redhat.com, keescook@chromium.org, kernelfans@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
 masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
 mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
 nixiaoming@huawei.com, peterz@infradead.org,
 sparclinux@vger.kernel.org, sumit.garg@linaro.org,
 wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v4 4/6] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Message-ID: <YodhoxG0xmfrNYoN@alley>
References: <20220427161340.8518-1-lecopzer.chen@mediatek.com>
 <20220427161340.8518-5-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427161340.8518-5-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_103856_864073_8006F78A 
X-CRM114-Status: GOOD (  22.26  )
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

On Thu 2022-04-28 00:13:38, Lecopzer Chen wrote:
> When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
> yet. E.g. on arm64, PMU is not ready until
> device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
> with the driver model and cpuhp. Hence it is hard to push this
> initialization before smp_init().
> 
> But it is easy to take an opposite approach and try to initialize
> the watchdog once again later.
> The delayed probe is called using workqueues. It need to allocate
> memory and must be proceed in a normal context.
> The delayed probe is able to use if watchdog_nmi_probe() returns
> non-zero which means the return code returned when PMU is not ready yet.
> 
> Provide an API - retry_lockup_detector_init() for anyone who needs
> to delayed init lockup detector if they had ever failed at
> lockup_detector_init().
> 
> The original assumption is: nobody should use delayed probe after
> lockup_detector_check() which has __init attribute.
> That is, anyone uses this API must call between lockup_detector_init()
> and lockup_detector_check(), and the caller must have __init attribute
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> +/*
> + * retry_lockup_detector_init - retry init lockup detector if possible.
> + *
> + * Retry hardlockup detector init. It is useful when it requires some
> + * functionality that has to be initialized later on a particular
> + * platform.
> + */
> +void __init retry_lockup_detector_init(void)
> +{
> +	/* Must be called before late init calls */
> +	if (!allow_lockup_detector_init_retry)
> +		return;
> +
> +	queue_work_on(__smp_processor_id(), system_wq, &detector_work);

Just a small nit. This can be simplified by calling:

	schedule_work(&detector_work);

It uses "system_wq" that uses CPU-bound workers. It prefers
the current CPU. But the exact CPU is not important. Any CPU-bound
worker is enough.

> +}
> +

With the above change, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am sorry for the late review. I had busy weeks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
