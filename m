Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA78C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 10:34:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA2622A99
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 10:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA2622A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h1uuxn/GSC5Cr8+3DuyOqZ8CktoBzLGiSXSDJJ5MjZg=; b=SBUZxXK6K1a/0kohj4BMpR07N
	QnOQA2Bbi4IZabir3UtVzNKw3KxdRc0CYkbjCY60kvOiv76hFKBuGOrEjiXmpTv2SSkHj51sXH0N3
	lCsqEHoBowcW4pqa7+QfN8EGGHZz5R7Hhv/uz8og+fMTNdNha4+nqdskmqpOtNp+fzexWG/+GlDj4
	qH7qtE9652VUQkGL2wV4EiXCwCxCLizgIvOUZhVMV++dyMSYCGrFBRj1p5keFtZ/hmEOmPa55kZY8
	V0ADM0/wJk2mBMHmdV08xsGjl/UXuG4g0rQfg1IrTTYnZ9MrRyVylb+Rh/GQnQmXFPyR1lAfRQZIi
	8FaVvrzsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxp69-0001JN-5y; Fri, 08 Jan 2021 10:34:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxp66-0001Hy-NN
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 10:34:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id l11so21901718lfg.0
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 02:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZWVWmavS5vu3wrnPQC6HYziJesZ5SIUr4PRWObvSaE=;
 b=ICZ75o4UlaXpLcSreKbU3FhhgoS5hGHK7ZPwqT8FjjIuN9r95dgpHKqQNp+t2sgHfg
 4KR3k6JRhDrNRYn7epeVo5vDh0fNsFCcGCPKjiuvaaH0RQ3MxaQmysjCftI8hNXJ8GMy
 LF1ny3RN5jddLBQduCs94Ys7zNRErA6+o7ZBcF/ZMcW2EZeinwvTNM6TUJ9JY8nlolAI
 9z3KHAMyy5DdraYmmCgmk4eQHcFSOrgPmU9GjEmKoToFNx1lXV72Q7XQb7m/fd0d8M8u
 +DjY/jJkd8EeQfZz64lr6Lj/3SKuD3YMCRG49NXfMuNGh3FCG/fycTNmT3JiqZgLA3Wq
 Kniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZWVWmavS5vu3wrnPQC6HYziJesZ5SIUr4PRWObvSaE=;
 b=AtH60Kk9pfc0xe5tZFH3i73NLzN8r5zbie/xDLUtHbjkvs0ANL1CYwCoblqQwG8qtY
 fdc+/D1ZVnUyelr0f1Ol3L1sbk0o1njic49Xo0FDfc2Sq5GkcSidrieOmNM/uzV2rQRL
 4NOJuGJGGGawwQ7XOITZ6C8ugNkyJvN3mNUH157ieVqdcFlcdRExPBoQatC/8sku5Ef/
 kHbuDX734fIMffXLRrafv70CtqifasTggJFbLAAyZKSDfiEASW4hzXoGhRFGpMozr8IR
 a1n80RRz/0N//QKSrvmG7Dci/XKy8x0Sq3tBN09QFD+121isLfH2RGtNrpxyks7Py/DG
 eQiA==
X-Gm-Message-State: AOAM530OakFw37shNCoSPUuEGBm6Avn8sHsNXjHzdA0pI2kOLbtm+Re5
 uNEccZhZnigPJzcLh08A2LUfpkx/EJw9z3/lGJf2Tw==
X-Google-Smtp-Source: ABdhPJy5njqJ4BguHmU6umicpmDwsk9IsKGaQuXvlpuYhSCXL2l5IU5elog+nZaWUkhnP8Omqd53r3Uqph9rOvlgPHM=
X-Received: by 2002:a05:651c:2005:: with SMTP id
 s5mr1199939ljo.152.1610102060299; 
 Fri, 08 Jan 2021 02:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20201221162249.3119-1-lecopzer.chen@mediatek.com>
In-Reply-To: <20201221162249.3119-1-lecopzer.chen@mediatek.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 8 Jan 2021 16:04:09 +0530
Message-ID: <CAFA6WYNepUP=SeHWnDDbxx=ggwPq2jDd5JmrcXD5GoMC5dYH2g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: perf: Fix access percpu variables in
 preemptible context
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_053422_881240_C2416374 
X-CRM114-Status: GOOD (  25.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, jolsa@redhat.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 yj.chiang@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, acme@kernel.org,
 alexander.shishkin@linux.intel.com, mingo@redhat.com,
 linux-mediatek@lists.infradead.org, namhyung@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, oliver.sang@intel.com,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 21 Dec 2020 at 21:53, Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
>
> commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
> reinitilizes lockup detector after arm64 PMU is initialized and open
> a window for accessing smp_processor_id() in preemptible context.
> Since hardlockup_detector_perf_init() always called in init stage
> with a single cpu, but we initialize lockup detector after the init task
> is migratable.
>
> Fix this by utilizing lockup detector reconfiguration which calls
> softlockup_start_all() on each cpu and calls watatchdog_nmi_enable() later.
> Because softlockup_start_all() use IPI call function to make sure
> watatchdog_nmi_enable() will bind on each cpu and fix this issue.

IMO, this just creates unnecessary dependency for hardlockup detector
init via softlockup detector (see the alternative definition of
lockup_detector_reconfigure()).

>
>     BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1

How about just the below fix in order to make CONFIG_DEBUG_PREEMPT happy?

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..db06ee28f48e 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -165,7 +165,7 @@ static void watchdog_overflow_callback(struct
perf_event *event,

 static int hardlockup_detector_event_create(void)
 {
-       unsigned int cpu = smp_processor_id();
+       unsigned int cpu = raw_smp_processor_id();
        struct perf_event_attr *wd_attr;
        struct perf_event *evt;

-Sumit

>     caller is debug_smp_processor_id+0x20/0x2c
>     CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.10.0+ #276
>     Hardware name: linux,dummy-virt (DT)
>     Call trace:
>       dump_backtrace+0x0/0x3c0
>       show_stack+0x20/0x6c
>       dump_stack+0x2f0/0x42c
>       check_preemption_disabled+0x1cc/0x1dc
>       debug_smp_processor_id+0x20/0x2c
>       hardlockup_detector_event_create+0x34/0x18c
>       hardlockup_detector_perf_init+0x2c/0x134
>       watchdog_nmi_probe+0x18/0x24
>       lockup_detector_init+0x44/0xa8
>       armv8_pmu_driver_init+0x54/0x78
>       do_one_initcall+0x184/0x43c
>       kernel_init_freeable+0x368/0x380
>       kernel_init+0x1c/0x1cc
>       ret_from_fork+0x10/0x30
>
>
> Fixes: 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changelog v1 -> v2:
> * https://lore.kernel.org/lkml/20201217130617.32202-1-lecopzer.chen@mediatek.com/
> * Move solution from kernel/watchdog_hld.c to arm64 perf_event
>     * avoid preemptive kmalloc in preempt_disable().
>
>
>
>  arch/arm64/kernel/perf_event.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> index 38bb07eff872..c03e21210bbb 100644
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -1345,4 +1345,20 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
>
>         return (u64)max_cpu_freq * watchdog_thresh;
>  }
> +
> +/*
> + * hardlockup_detector_perf_init() always call in init stage with a single
> + * cpu. In arm64 case, we re-initialize lockup detector after pmu driver
> + * initialized. Lockup detector initial function use lots of percpu variables
> + * and this makes CONFIG_DEBUG_PREEMPT unhappy because we are now in
> + * preemptive context.
> + * Return 0 if the nmi is ready and register nmi hardlockup detector by
> + * lockup detector reconfiguration.
> + */
> +int __init watchdog_nmi_probe(void)
> +{
> +       if (arm_pmu_irq_is_nmi())
> +               return 0;
> +       return -ENODEV;
> +}
>  #endif
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
