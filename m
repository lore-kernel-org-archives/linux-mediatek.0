Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC54AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G94qCVPMPx6wMqOa/z6PfQIAVqh9WOuC6NjzLeWsrVk=; b=oVS+fDIQ4ny7Vf
	vNcsDH+9LQEYgLe1BVcKUP3HF/RbQZ40yqNF/S0cN5tQhuIQa1k7+EVg3mFRQzv/PHsuc01gOkPit
	U6PmgnFkgmuisq2iaAlnU/C8k6ORG15CMs9LDKhK5xPrykqpVP8RWGXUcwRUH40cii7oZreq/clFE
	xuAx4yqoHkwXObngN06cYny3XWKiNM1vob8kxtoLvOsv3JSswg3Je16m9Gc3o3CGV0PMt+S7bd9Xk
	aTuvITRFdJ83ALCQv3aHiQgmsVpMrJ3QicRiu9vFthEFw1CJR1VpXCjrZp7Ix6v2STubLVW4qfNhq
	KluosXpgVwVcF6JxXVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncV7O-00D77D-Ts; Thu, 07 Apr 2022 16:36:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncUtQ-00D1fU-1U; Thu, 07 Apr 2022 16:21:58 +0000
X-UUID: 943b3be657344dfabb2a1d776aa769ef-20220407
X-UUID: 943b3be657344dfabb2a1d776aa769ef-20220407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 58162697; Thu, 07 Apr 2022 09:21:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 09:21:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 00:21:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 00:21:43 +0800
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
Subject: Re: [PATCH v3 4/5] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Date: Fri, 8 Apr 2022 00:21:43 +0800
Message-ID: <20220407162143.1127-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YkxeAM+SwYHAnJE1@alley>
References: <YkxeAM+SwYHAnJE1@alley>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_092156_155117_7B2FAFC5 
X-CRM114-Status: GOOD (  52.03  )
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

> On Tue 2022-04-05 21:35:03, Lecopzer Chen wrote:
> > > On Thu 2022-03-24 22:14:04, Lecopzer Chen wrote:
> > > > When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
> > > > yet. E.g. on arm64, PMU is not ready until
> > > > device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
> > > > with the driver model and cpuhp. Hence it is hard to push this
> > > > initialization before smp_init().
> > > > 
> > > > But it is easy to take an opposite approach and try to initialize
> > > > the watchdog once again later.
> > > > The delayed probe is called using workqueues. It need to allocate
> > > > memory and must be proceed in a normal context.
> > > > The delayed probe is queued only when the early one returns -EBUSY.
> > > > It is the return code returned when PMU is not ready yet.
> > > > 
> > > > Provide an API - retry_lockup_detector_init() for anyone who needs
> > > > to delayed init lockup detector.
> > > > 
> > > > The original assumption is: nobody should use delayed probe after
> > > > lockup_detector_check() which has __init attribute.
> > > > That is, anyone uses this API must call between lockup_detector_init()
> > > > and lockup_detector_check(), and the caller must have __init attribute
> > > > 
> > > > --- a/kernel/watchdog.c
> > > > +++ b/kernel/watchdog.c
> > > > +}
> > > > +
> > > > +/*
> > > > + * retry_lockup_detector_init - retry init lockup detector if possible.
> > > > + *
> > > > + * Only take effect when allow_lockup_detector_init_retry is true, which
> > > > + * means it must call between lockup_detector_init() and lockup_detector_check().
> > > > + * Be aware that caller must have __init attribute, relative functions
> > > > + * will be freed after kernel initialization.
> > > > + */
> > > > +void __init retry_lockup_detector_init(void)
> > > > +{
> > > > +	if (!allow_lockup_detector_init_retry)
> > > > +		return;
> > > > +
> > > > +	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> > > > +}
> > > > +
> > > > +/* Ensure the check is called after the initialization of driver */
> > > > +static int __init lockup_detector_check(void)
> > > > +{
> > > > +	/* Make sure no work is pending. */
> > > > +	flush_work(&detector_work);
> > > 
> > > This is racy. We should first disable
> > > "allow_lockup_detector_init_retry" to make sure
> > > that retry_lockup_detector_init() will not queue
> > > the work any longer.
> > 
> > But disable before flush_work will make the 
> >     lockup_detector_delay_init() ->
> >     watchdog_nmi_probe ->
> >     +	if (!allow_lockup_detector_init_retry)
> >     +		return -EBUSY;
> 
> I see. It is exactly the reason why I suggest to remove the
> optimization and keep the code simple.
> 
> > how about:
> > ...
> > static bool __init delayed_init_allowed = true;
> > ...
> > /*
> >  * retry_lockup_detector_init - retry init lockup detector if possible.
> >  *
> >  * Only take effect when allow_lockup_detector_init_retry is true, which
> >  * means it must call between lockup_detector_init() and lockup_detector_check().
> >  * Be aware that caller must have __init attribute, relative functions
> >  * will be freed after kernel initialization.
> >  */
> > void __init retry_lockup_detector_init(void)
> > {
> > 	if (!allow_lockup_detector_init_retry || !delayed_init_allowed)
> > 		return;
> > 
> > 	/* 
> > 	 * we shouldn't queue any delayed init work twice to avoid
> > 	 * any unwanted racy.
> > 	 */
> > 	delayed_init_allowed = false;
> 
> Grrr, this is so complicated and confusing. It might be because of
> badly selected variable names or comments. But I think that it is
> simply a bad approach.
> 
> OK, you suggest two variables. If I get it correctly:
> 
>     + The variable "delayed_init_allowed"
>      tries to prevent the race in lockup_detector_check().
> 
>      It will make sure that the work could not be queued after
>      flush_work() finishes.
> 
>      Is this obvious from the comment?
>      Is this obvious from the variable name?
> 
>      I am sorry. But it is not obvious to me. I understand it only
>      because I see it together in this mail. It will be pretty
>      hard to get it from the code when I see it one year later.
> 
> 
>    + The variable "allow_lockup_detector_init_retry" has an unclear
>      meaning. It might mean:
> 
> 	+ watchdog_nmi_probe() ended with -EBUSY in
> 	  lockup_detector_init() and we can try the delayed init.
> 
> 	+ but it also means that watchdog_nmi_probe() succeeded in
> 	  lockup_detector_delay_init() and there is no need to
> 	  try the delayed init any longer.
> 
>        Is this obvious from the variable name?
>        Is it explained anywhere?
>        Is it easy to understand?
> 
>        No, from my POV. It is really bad idea to have a single
>        variable with so many meanings.
> 
> 
> And this is my problem with this approach. There was one variable with
> unclear meanting. And you are trying to fix it by two variables
> with unclear meaning.
> 

I really apreciate for your reply, many thanks for it.

For my point of view, the naming for "delayed_init_allowed" is the
whole system state now is able to(allowed) do delayed init.
The "allow_lockup_detector_init_retry" is that delayed init is ready
to retry register NMI watchdog.

Thus the meaning of delayed_init_"allowed" is, we are allowed to
do delayed init including
    1. initialization of delayed init
    2. the retry of delayed init

I'm sorry for that I didn't express the meaning clearly.
I'll have definition in detail in the later version patch not only
a brief comment and I hope you can review much easier.
This only explain the thought how I made decision for the naming.

So let me back to the discussion below.



> > 	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> > }
> > 
> > 
> > /*
> >  * Ensure the check is called after the initialization of driver
> >  * and before removing init code.
> >  */
> > static int __init lockup_detector_check(void)
> > {
> > 	delayed_init_allowed = false;
> > 	flush_work(&detector_work);
> > 	allow_lockup_detector_init_retry = false;
> > 
> > 	return 0;
> > }
> 
> No, please keep it simple. Just have one variable that will say
> whether we are allowed to queue the work:
> 
>   + It will be allowed when watchdog_nmi_probe() ended
>     with -EBUSY in lockup_detector_init()
> 
>   + It will not longer be allowed when watchdog_nmi_probe()
>     succeeded or when lockup_detector_check() flushes
>     the pending works.
> 

Okay, let me think about it. I'll try to find a better solution that
only uses one variable.
And it's strongly about how users use it in 5th patch, I'll give further
reply in 5th patch


thanks
BRs,
Lecopzer





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
