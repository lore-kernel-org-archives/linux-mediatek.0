Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A6CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWE8zIT7mXvuGnbDOhqDAdVvhp2q2wKzs2BrIGkf5qg=; b=Hub16UyLU+amsB
	Uhxa4BIPl6w1Wt29RcyN8s2fPAuCkfApwdNaSq5iG/89TvMYLwFoezY0hAwJ26lwRECOCWN0z34JC
	bzBepNkslOQ9bY+xNmxzo/O4UuFf2Nt7nLM0cbPUQzPLnGU5X9QbpaljIyrtQkUEvD5kGMozYQXy1
	BVAFgqSF6HrzIBnnQ7wlwf1vvpZei+OgW7/JR9kH45dwoxBvCGPBamA+DkxILVg+xkbiFRAZAEkgq
	jI5dflkyi/qiFvbIOxaQc80kmHDnWGPBHiep8zkPGebiB3LyuT2lMahqrLGcHYbeLcCH6Jjk+teK0
	SAGs6msoLjoWsUHnNFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbigb-001154-O0; Tue, 05 Apr 2022 12:53:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbigP-0010zj-3n; Tue, 05 Apr 2022 12:53:20 +0000
X-UUID: 16dbf81b6b854f1e916f67db3b4806d3-20220405
X-UUID: 16dbf81b6b854f1e916f67db3b4806d3-20220405
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1830762161; Tue, 05 Apr 2022 05:53:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 05:53:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 20:53:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Apr 2022 20:53:04 +0800
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
Subject: Re: [PATCH v3 5/5] arm64: Enable perf events based hard lockup
 detector
Date: Tue, 5 Apr 2022 20:53:04 +0800
Message-ID: <20220405125304.3762-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220404141709.GA26840@pathway.suse.cz>
References: <20220404141709.GA26840@pathway.suse.cz>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_055317_199451_60A521C0 
X-CRM114-Status: GOOD (  37.35  )
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

 
> On Thu 2022-03-24 22:14:05, Lecopzer Chen wrote:
> > With the recent feature added to enable perf events to use pseudo NMIs
> > as interrupts on platforms which support GICv3 or later, its now been
> > possible to enable hard lockup detector (or NMI watchdog) on arm64
> > platforms. So enable corresponding support.
> > 
> > One thing to note here is that normally lockup detector is initialized
> > just after the early initcalls but PMU on arm64 comes up much later as
> > device_initcall(). To cope with that, overriding watchdog_nmi_probe() to
> > let the watchdog framework know PMU not ready, and inform the framework
> > to re-initialize lockup detection once PMU has been initialized.
> > 
> > [1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org
> > 
> > --- /dev/null
> > +++ b/arch/arm64/kernel/watchdog_hld.c
> > @@ -0,0 +1,37 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <linux/nmi.h>
> > +#include <linux/cpufreq.h>
> > +#include <linux/perf/arm_pmu.h>
> > +
> > +/*
> > + * Safe maximum CPU frequency in case a particular platform doesn't implement
> > + * cpufreq driver. Although, architecture doesn't put any restrictions on
> > + * maximum frequency but 5 GHz seems to be safe maximum given the available
> > + * Arm CPUs in the market which are clocked much less than 5 GHz. On the other
> > + * hand, we can't make it much higher as it would lead to a large hard-lockup
> > + * detection timeout on parts which are running slower (eg. 1GHz on
> > + * Developerbox) and doesn't possess a cpufreq driver.
> > + */
> > +#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
> > +u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > +{
> > +	unsigned int cpu = smp_processor_id();
> > +	unsigned long max_cpu_freq;
> > +
> > +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> > +	if (!max_cpu_freq)
> > +		max_cpu_freq = SAFE_MAX_CPU_FREQ;
> > +
> > +	return (u64)max_cpu_freq * watchdog_thresh;
> > +}
> 
> This change is not mentioned in the commit message.
> Please, put it into a separate patch.


Actully, This cames from
[1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org
And I didn't touch the commit message from the origin patch.
But of course, I could imporve it with proper description if
anyone thinks it's not good enough.

Would you mean put this function hw_nmi_get_sample_period() in patch 6th?
In the view of "arm64 uses delayed init with all the functionality it need to set up",
IMO, this make sense for me to put into a single patch.

But if you still think this should put into a separate patch, I'll do it:)


> 
> > +int __init watchdog_nmi_probe(void)
> > +{
> > +	if (!allow_lockup_detector_init_retry)
> > +		return -EBUSY;
> 
> How do you know that you should return -EBUSY
> when retry in not enabled?
> 
> I guess that it is an optimization to make it fast
> during the first call. But the logic is far from
> obvious.
> 

Yes, you can see this as an optimization, because arm64 PMU is not ready
during lockup_detector_init(), so the watchdog_nmi_probe() must fail.

Thus we only want to do watchdog_nmi_probe() in delayed init,
so if not in the state (allow_lockup_detector_init_retry=true), just tell

if it's unclear, maybe a brief comment can be add like this:

+	/* arm64 is only able to initialize lockup detecor during delayed init */
+	if (!allow_lockup_detector_init_retry)
+		return -EBUSY;




> > +
> > +	if (!arm_pmu_irq_is_nmi())
> > +		return -ENODEV;
> > +
> > +	return hardlockup_detector_perf_init();
> > +}
> 
> Is this just an optimization or is it really needed?
> Why this was not needed in v2 patchset?
> 
> If it is just an optimization then I would remove it.
> IMHO, it just adds confusion and it is not worth it.
> 

It was a mistake when I rebased v2, This should be included in v2
but I missed it.

For arm_pmu_irq_is_nmi() checking, we do need it, becasue arm64 needs
explictly turns on Pseudo-NMI to support base function for NMI.

hardlockup_detector_perf_init() will success even if we haven't had
Pseudo-NMI turns on, however, the pmu interrupts will act like a
normal interrupt instead of NMI and the hardlockup detector would be broken.


thanks for all the comment

BRs,
Lecopzer







_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
