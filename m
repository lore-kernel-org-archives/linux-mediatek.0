Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RipW8eBcV534fpv2U3W77GvESSV9HwpO9R5QoKkYVJA=; b=jzh7iPlFtzdPU5
	jxrcyU/B8hGWV9NL0ffG+a4ZEDWxZ+6mKl040353IkR5Jzke4IpYj/RxAROd2m2/GBr8YDOc1uLof
	RsZjfS+RYzR4Vi5YLbfrvf63z/w6bMCpkB+gc7M5JxKJXAFDRg3pOghHFNU3JSIyuVMOIXr/I4vSJ
	6c3HL+PznfS97kruSa9KD8Ftjr7CnoN3pnjyYrW+3MnNF/rP1BBaTIRqRN6ZKQPNOs/tiyTDapemy
	UIWnEEDkICC+k0GJgFvHpQ8pK3Q85zcNp0lFhg/xanJKdo0hDXnpc6re5MJ6R9A/3SnnLffJ8gmi6
	fs1S/yYGiJhmaV2J76/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbNWL-00FIgj-DA; Mon, 04 Apr 2022 14:17:29 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbNWA-00FIb2-2E; Mon, 04 Apr 2022 14:17:19 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CE90D210E5;
 Mon,  4 Apr 2022 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649081830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rze0Jhi/DK5kWoGoABbHFZ2g0bO59w1puNqIyew0fbQ=;
 b=NuRhmVsuuISJsd8BJFS2w0AHxAChlUR+Zs2Tk2CD2BmcBSysouRnrwBdtqDhwT9tV/yFRj
 20+uWtwlHvQG33Dsa4yw9cZL/CaMGO65jV2JdiPcjTxITG45cXnXxWZTOcbkamzJ/CR1L7
 VutDnw+unMqssuQ2wjCE1x4SPcCENTo=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 38BECA3B82;
 Mon,  4 Apr 2022 14:17:09 +0000 (UTC)
Date: Mon, 4 Apr 2022 16:17:09 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: Enable perf events based hard lockup
 detector
Message-ID: <20220404141709.GA26840@pathway.suse.cz>
References: <20220324141405.10835-1-lecopzer.chen@mediatek.com>
 <20220324141405.10835-6-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324141405.10835-6-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_071718_255797_6A9275A0 
X-CRM114-Status: GOOD (  25.42  )
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

On Thu 2022-03-24 22:14:05, Lecopzer Chen wrote:
> With the recent feature added to enable perf events to use pseudo NMIs
> as interrupts on platforms which support GICv3 or later, its now been
> possible to enable hard lockup detector (or NMI watchdog) on arm64
> platforms. So enable corresponding support.
> 
> One thing to note here is that normally lockup detector is initialized
> just after the early initcalls but PMU on arm64 comes up much later as
> device_initcall(). To cope with that, overriding watchdog_nmi_probe() to
> let the watchdog framework know PMU not ready, and inform the framework
> to re-initialize lockup detection once PMU has been initialized.
> 
> [1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org
> 
> --- /dev/null
> +++ b/arch/arm64/kernel/watchdog_hld.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/nmi.h>
> +#include <linux/cpufreq.h>
> +#include <linux/perf/arm_pmu.h>
> +
> +/*
> + * Safe maximum CPU frequency in case a particular platform doesn't implement
> + * cpufreq driver. Although, architecture doesn't put any restrictions on
> + * maximum frequency but 5 GHz seems to be safe maximum given the available
> + * Arm CPUs in the market which are clocked much less than 5 GHz. On the other
> + * hand, we can't make it much higher as it would lead to a large hard-lockup
> + * detection timeout on parts which are running slower (eg. 1GHz on
> + * Developerbox) and doesn't possess a cpufreq driver.
> + */
> +#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
> +u64 hw_nmi_get_sample_period(int watchdog_thresh)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	unsigned long max_cpu_freq;
> +
> +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +	if (!max_cpu_freq)
> +		max_cpu_freq = SAFE_MAX_CPU_FREQ;
> +
> +	return (u64)max_cpu_freq * watchdog_thresh;
> +}

This change is not mentioned in the commit message.
Please, put it into a separate patch.

> +int __init watchdog_nmi_probe(void)
> +{
> +	if (!allow_lockup_detector_init_retry)
> +		return -EBUSY;

How do you know that you should return -EBUSY
when retry in not enabled?

I guess that it is an optimization to make it fast
during the first call. But the logic is far from
obvious.

> +
> +	if (!arm_pmu_irq_is_nmi())
> +		return -ENODEV;
> +
> +	return hardlockup_detector_perf_init();
> +}

Is this just an optimization or is it really needed?
Why this was not needed in v2 patchset?

If it is just an optimization then I would remove it.
IMHO, it just adds confusion and it is not worth it.

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
