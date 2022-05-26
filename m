Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2237C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wH3lE+gYplLADACrnYW6SFCQDq28ZFQwP6U06Y3y9t4=; b=mLB9WMT5O4+n/l
	v4wlbVjbOzhe3kn+6lNgaCyr+8nnXewapcB87lxRjZB3BjzDi7KmzNdsuTAVraqGytL/NQpszXD0Q
	B6nl9WCjfbUMnpIzhVjuQVceSBSFt9+UflxdY88WKAIum87PDLqjEgWcaYCtEjAMjZI5aJPQ25X7V
	rAHnoDr3BrYnpG4e/3Lnubfk14uJ4aMI2RLMs9NYt8RXl92ybTYcl9iE3bPHeETbOhn5DLBD905Oy
	z2m322uwQ7+st0CrsfTXIoS5ALrCEf9RIPW7RWse914PoeZsdvTUE7r29+kmQgJgTwdy4mO9n65Ml
	FRwSoeDiBMG9Rl4ETq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuA2b-00EF8a-8x; Thu, 26 May 2022 09:44:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuA2Q-00EF5o-5s; Thu, 26 May 2022 09:44:15 +0000
X-UUID: 903fcb19c83840de9d8e08221da43522-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d39f1b46-990e-42a7-a3b0-265814400fa3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:0d2757b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:0,BEC:nil
X-UUID: 903fcb19c83840de9d8e08221da43522-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 776148550; Thu, 26 May 2022 02:44:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 02:39:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 17:39:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 17:39:54 +0800
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
Subject: Re: [PATCH v4 4/6] kernel/watchdog: Adapt the watchdog_hld interface for async model
Date: Thu, 26 May 2022 17:39:54 +0800
Message-ID: <20220526093954.19319-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YodhoxG0xmfrNYoN@alley>
References: <YodhoxG0xmfrNYoN@alley>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_024414_264828_B4F3C69D 
X-CRM114-Status: GOOD (  25.64  )
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

> On Thu 2022-04-28 00:13:38, Lecopzer Chen wrote:
> > When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
> > yet. E.g. on arm64, PMU is not ready until
> > device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
> > with the driver model and cpuhp. Hence it is hard to push this
> > initialization before smp_init().
> > 
> > But it is easy to take an opposite approach and try to initialize
> > the watchdog once again later.
> > The delayed probe is called using workqueues. It need to allocate
> > memory and must be proceed in a normal context.
> > The delayed probe is able to use if watchdog_nmi_probe() returns
> > non-zero which means the return code returned when PMU is not ready yet.
> > 
> > Provide an API - retry_lockup_detector_init() for anyone who needs
> > to delayed init lockup detector if they had ever failed at
> > lockup_detector_init().
> > 
> > The original assumption is: nobody should use delayed probe after
> > lockup_detector_check() which has __init attribute.
> > That is, anyone uses this API must call between lockup_detector_init()
> > and lockup_detector_check(), and the caller must have __init attribute
> > 
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > +/*
> > + * retry_lockup_detector_init - retry init lockup detector if possible.
> > + *
> > + * Retry hardlockup detector init. It is useful when it requires some
> > + * functionality that has to be initialized later on a particular
> > + * platform.
> > + */
> > +void __init retry_lockup_detector_init(void)
> > +{
> > +	/* Must be called before late init calls */
> > +	if (!allow_lockup_detector_init_retry)
> > +		return;
> > +
> > +	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> 
> Just a small nit. This can be simplified by calling:
> 
> 	schedule_work(&detector_work);
> 
> It uses "system_wq" that uses CPU-bound workers. It prefers
> the current CPU. But the exact CPU is not important. Any CPU-bound
> worker is enough.

Thanks!! I'll tweak this on -rc1
> 
> > +}
> > +
> 
> With the above change, feel free to use:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Really appreciate your review and idea, thank you ver much.


BRs,
Lecopzer




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
