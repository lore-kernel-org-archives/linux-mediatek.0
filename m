Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4btVhoGSSatDQT9X044cqvhU4ZPlliQ+WRQd64/gPk=; b=nZbybfFGOS0Spt
	SIf0x73P1SRE/MrH+Y6YU2upy6bQiz/NLaPl/qAxgkZ52l3UB+/+y8voMNnjc6EDmmmUIp9+NK9zD
	dETMcqIEq7f2TTgjXL68b32IaZAlyHZXtuZKaPuP323laZeIqA8X8swOj0bugzpk4974I2KFLuUF1
	yH5/9P+IKaUYIE7n/bDwDmOpOzQK2ZhryyafqTo4CeR9PqvfvcKZQRpQ2oDt72QJt6SBPF7rQCJUF
	ptA8ZDMVUP042+zgsjdw0juGemuvLrQiR1Zqk37tDQeJCLwgHOyDwnNpAiilanUxjor9nvdfBOdSO
	2nJvngBRJkbWozQEDqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6Vq-00DZM2-Ll; Thu, 26 May 2022 05:58:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6Ve-00DZIo-Qb; Thu, 26 May 2022 05:58:13 +0000
X-UUID: 2791b781dc6b44e584b066c53e656350-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7cd2306b-a13c-4712-b38c-cd7d2ecdb093,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a6c08947-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 2791b781dc6b44e584b066c53e656350-20220525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 648547922; Wed, 25 May 2022 22:57:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 22:57:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 26 May 2022 13:57:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 13:57:55 +0800
Message-ID: <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
Subject: Re: [SPAM]Re: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider
	<vschneid@redhat.com>, <tglx@linutronix.de>, <wsd_upstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <Jonathan.JMChen@mediatek.com>,
	"chris.redpath@arm.com" <chris.redpath@arm.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Vincent Donnefort <vdonnefort@gmail.com>, "Ingo
 Molnar" <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Christian
 Brauner" <brauner@kernel.org>
Date: Thu, 26 May 2022 13:57:55 +0800
In-Reply-To: <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
	 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
	 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_225810_918698_14B8B3D5 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Peter


> > How easy can you reproduce; does the below hack make it better?
> 
> 
> The issue can be reproduced in about 48 hours when hotplug up/down
> frequently.
> 
> Thanks for your suggestion.
> I think the hack patch could stay the rq->balance_callback when rq-
> > callback = &balance_push_callback.
> 
> We can add hack patch to the stability test.

Use the patch of previous mail, we pass the stability test at previous
48 hours and still testing.

I think the patch could make the issue better.
Do you suggest to upstream this patch to mainline?

Thank you.

> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 95bac3b094b3..f18ee22b29bc 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -4763,20 +4763,30 @@ struct callback_head balance_push_callback
> > =
> > {
> >  	.func = (void (*)(struct callback_head *))balance_push,
> >  };
> >  
> > -static inline struct callback_head
> > *splice_balance_callbacks(struct
> > rq *rq)
> > +static inline struct callback_head *
> > +__splice_balance_callbacks(struct rq *rq, bool foo)
> >  {
> >  	struct callback_head *head = rq->balance_callback;
> >  
> >  	lockdep_assert_rq_held(rq);
> > -	if (head)
> > -		rq->balance_callback = NULL;
> > +	if (head) {
> > +		if (foo && head == &balance_push_callback)
> > +			head = NULL;
> > +		else
> > +			rq->balance_callback = NULL;
> > +	}
> >  
> >  	return head;
> >  }
> >  
> > +static inline struct callback_head
> > *splice_balance_callbacks(struct
> > rq *rq)
> > +{
> > +	return __splice_balance_callbacks(rq, true);
> > +}
> > +
> >  static void __balance_callbacks(struct rq *rq)
> >  {
> > -	do_balance_callbacks(rq, splice_balance_callbacks(rq));
> > +	do_balance_callbacks(rq, __splice_balance_callbacks(rq,
> > false));
> >  }
> >  
> >  static inline void balance_callbacks(struct rq *rq, struct
> > callback_head *head)
> > 
> 

Best Regards,
Jing-Ting Wu




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
