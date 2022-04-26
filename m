Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D92C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPWZbivu6AxuTe+oJAg86zRbppz3/IIrG2US/EqRvdg=; b=f7qT+CJlBXXk7G
	U4t3syYzSvL+/N7OlqMUwN67iaEbJgZ0gM00H/8aJ/TyFkxawWIyLG1V1XspqJ6CGcKqfq3NNT900
	LMc8uFEY+cWWT5FKwYq0RTNn8+9IP5CsrDYYrf6TpbxxjyMxwsmxAH6A/Vh5eM7hymIfvdhbsJvld
	U2/7DL0l8JnYgAL+sUPSzMnLXErNECYFQ93f+swpc3rVHQMCipodzfR7dae8vsIcGcf//p0uQIYCe
	upxS6+x/ulth2m/aOyWdxEnH49awJefW2hOzqc21a8QsLoBbc8j8iLLqEaO4XORPd80+dUaRv2+is
	GZdfnEJUKgpTcIWA4jMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njODO-00FMni-B2; Tue, 26 Apr 2022 16:39:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njODD-00FMkn-NE; Tue, 26 Apr 2022 16:38:53 +0000
X-UUID: 6c525288e8e649268247f117a22aa55d-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c2d0ad45-3517-4cf7-b53c-583f708ceaba, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c5be8ec6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 6c525288e8e649268247f117a22aa55d-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902471827; Tue, 26 Apr 2022 09:38:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 09:38:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 00:38:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 00:38:40 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <lecopzer.chen@mediatek.com>, <pmladek@suse.com>
CC: <acme@kernel.org>, <akpm@linux-foundation.org>,
 <alexander.shishkin@linux.intel.com>, <catalin.marinas@arm.com>,
 <davem@davemloft.net>, <jolsa@redhat.com>, <jthierry@redhat.com>,
 <keescook@chromium.org>, <kernelfans@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
 <mark.rutland@arm.com>, <masahiroy@kernel.org>, <matthias.bgg@gmail.com>,
 <maz@kernel.org>, <mcgrof@kernel.org>, <mingo@redhat.com>,
 <namhyung@kernel.org>, <nixiaoming@huawei.com>, <peterz@infradead.org>,
 <sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 5/5] arm64: Enable perf events based hard lockup
 detector
Date: Wed, 27 Apr 2022 00:38:40 +0800
Message-ID: <20220426163840.18871-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220421163035.26402-1-lecopzer.chen@mediatek.com>
References: <20220421163035.26402-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_093851_799494_1B0F4042 
X-CRM114-Status: GOOD (  37.92  )
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

> > The call path for hardlockup_detector_perf_init() is really complicated,
> > 
> > I have some approach about this:
> >   1. abstract second variable with Kconfig.
> >     a. Add a ARCH_SUPPORTS_HARDLOCKUP_DETECTOR_DLAYED_INIT
> >        (the naming is a little bit long, may have better naming)
> >        in "lib/Kconfig.debug" if ARCH knew they do need delayed init for
> >        lockup detector.
> > 
> >        + select ARCH_SUPPORTS_HARDLOCKUP_DETECTOR_DLAYED_INIT if HAVE_HARDLOCKUP_DETECTOR_PERF
> > 
> >     b. and the watchdog_nmi_probe would look like.
> > 
> >     +int __init watchdog_nmi_probe(void)
> >     +{
> >     +	int ret;
> >     +
> >     + /* comment here... */
> >     +	if (!arm_pmu_irq_is_nmi())
> >     +		return -ENODEV;
> >     +
> >     +	ret = hardlockup_detector_perf_init();
> >     +	if (ret &&
> >     +		  IS_ENABLED(ARCH_SUPPORTS_HARDLOCKUP_DETECTOR_DLAYED_INIT))
> >     +		return -EBUSY;
> >     +
> >     + return ret;
> >     +}
> > 
> >     and than we can have only one variable (allow_lockup_detector_init_retry)
> >     in 4th patch.
> > 
> >  
> >   2. base on ARCH_SUPPORTS_HARDLOCKUP_DETECTOR_DLAYED_INIT, change
> >      inside hardlockup_detector_perf_init().
> > 
> > int __init hardlockup_detector_perf_init(void)
> > {
> > 	int ret = hardlockup_detector_event_create();
> > 
> > 	if (ret) {
> > 		pr_info("Perf NMI watchdog permanently disabled\n");
> > +
> > +		/* comment here... */
> > +		if (IS_ENABLED(ARCH_SUPPORTS_HARDLOCKUP_DETECTOR_DLAYED_INIT))
> > +			ret = -EBUSY;
> > 	} else {
> > 		perf_event_release_kernel(this_cpu_read(watchdog_ev));
> > 		this_cpu_write(watchdog_ev, NULL);
> > 	}
> > 	return ret;
> > }
> > 
> >   3. Don't add any other config, try to find a proper location
> >      to return -EBUSY in hardlockup_detector_event_create().
> >      IMHO, this may involve the PMU subsys and should be
> >      the hardest approach.
> 
> Honestly, everything looks a bit ugly and complicated to me.
> 
> OKAY, is the return value actually important?
> 
> What about just introducing the API that will allow to try to
> initialize the hardlockup detector later:
> 
> /*
>  * Retry hardlockup detector init. It is useful when it requires some
>  * functionality that has to be initialized later on a particular
>  * platform.
>  */
> void __init retry_lockup_detector_init(void)
> {
> 	/* Must be called before late init calls. */
> 	if (!allow_lockup_detector_init_retry)
> 		return 0;
> 
> 	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> }
> 
> /*
>  * Ensure that optional delayed hardlockup init is proceed before
>  * the init code and memory is freed.
>  */
> static int __init lockup_detector_check(void)
> {
> 	/* Prevent any later retry. */
> 	allow_lockup_detector_init_retry = false;
> 
> 	/* Make sure no work is pending. */
> 	flush_work(&detector_work);
> }
> late_initcall_sync(lockup_detector_check);
> 
> You could leave lockup_detector_init() as it is. It does not really
> matter what was the exact error value returned by watchdog_nmi_probe().
> 
> Then you could call retry_lockup_detector_init() in
> armv8_pmu_driver_init() and be done with it.
> 
> It will be universal API that might be used on any architecture
> for any reason. If nobody calls retry_lockup_detector_init()
> then nohing will happen and the code will work as before.
> 
> It might make sense to provide the API only on architectures that
> really need it. We could hide it under
> 
>    ARCH_NEED_DELAYED_HARDLOCKUP_DETECTOR_INIT
> 
> , similar to ARCH_NEEDS_CPU_IDLE_COUPLE.
> 

During implementation, if I add ARCH_NEED_DELAYED_..., there will contain
many enclosed ifdef-endif and is a little bit ugly.
Also, I didn't find a must-have reason to this Kconfig after I rebase from
your suggestion.

The one calls retry_lockup_detector_init() must fail at lockup_detector_init,
so I think anyone who has aleady failed at lockup_detector_init() has right
to retry no matter HW, SW or Arch reason.
Thus I might not introduce a new Kconfig in v4, and I would be glad to see
if any further commet on this.







_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
