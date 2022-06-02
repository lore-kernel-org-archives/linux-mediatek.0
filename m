Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA917C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Xn1x505FAUBTXlQwQvVErZhcXLo5YAEEv9lQZJn0Qs=; b=bwR55Z+724DvWk
	huki+LJ8k62viLMuKbHjMdAV80apUKWJf7E1HZ4Gu5Yca5nb/ss0oEzjIw64vSXq10b/wQV7GysLx
	ZCa8Dl2+ew5wrMzyzxFSKJL2KDOhpG/yOJPHzItDtYm8zewy3AD6oGqQoxLN+Uvqghfj1oP7S5jGz
	JG2ad3TabibGMw9FZJ3rLz2oq6wJqDeWOPUeX9Gb1BdF4EHsRliaGpQwFCBjhzDJHqGre5odVK+qp
	xsuhRfXvnkc4Uf+q/FwZSG/lmYgeqRIbN2WmFzBhO1r3bUQhryMEtfO1qHmzL/AxnnJ5AyzKOt7gw
	ppJnSSyWJ/WSWLBZgrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnUc-003kau-AJ; Thu, 02 Jun 2022 16:16:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnUP-003kYF-8P; Thu, 02 Jun 2022 16:16:04 +0000
X-UUID: 488a63971dde49f6bf9b69f617b4d7e4-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6480fa9d-50e9-428b-8c2e-c9ae329623f7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:553bb76e-b02c-4af4-b838-5c14aaa063c7,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 488a63971dde49f6bf9b69f617b4d7e4-20220602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 505628082; Thu, 02 Jun 2022 09:15:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 09:15:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 3 Jun 2022 00:15:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jun 2022 00:15:51 +0800
Message-ID: <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
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
Date: Fri, 3 Jun 2022 00:15:51 +0800
In-Reply-To: <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
	 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
	 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
	 <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_091601_346476_2801F769 
X-CRM114-Status: GOOD (  17.25  )
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


> > > How easy can you reproduce; does the below hack make it better?

The patch is helpful to the syndrome, passed stability test over 10
days so far. (as-is: < 48 hours failed)

Could you help to upstream this patch to linux kernel mainline?
Thank you.

> 
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index 95bac3b094b3..f18ee22b29bc 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -4763,20 +4763,30 @@ struct callback_head
> > > balance_push_callback
> > > =
> > > {
> > >  	.func = (void (*)(struct callback_head *))balance_push,
> > >  };
> > >  
> > > -static inline struct callback_head
> > > *splice_balance_callbacks(struct
> > > rq *rq)
> > > +static inline struct callback_head *
> > > +__splice_balance_callbacks(struct rq *rq, bool foo)
> > >  {
> > >  	struct callback_head *head = rq->balance_callback;
> > >  
> > >  	lockdep_assert_rq_held(rq);
> > > -	if (head)
> > > -		rq->balance_callback = NULL;
> > > +	if (head) {
> > > +		if (foo && head == &balance_push_callback)
> > > +			head = NULL;
> > > +		else
> > > +			rq->balance_callback = NULL;
> > > +	}
> > >  
> > >  	return head;
> > >  }
> > >  
> > > +static inline struct callback_head
> > > *splice_balance_callbacks(struct
> > > rq *rq)
> > > +{
> > > +	return __splice_balance_callbacks(rq, true);
> > > +}
> > > +
> > >  static void __balance_callbacks(struct rq *rq)
> > >  {
> > > -	do_balance_callbacks(rq, splice_balance_callbacks(rq));
> > > +	do_balance_callbacks(rq, __splice_balance_callbacks(rq,
> > > false));
> > >  }
> > >  
> > >  static inline void balance_callbacks(struct rq *rq, struct
> > > callback_head *head)
> > > 


Best Regards,
Jing-Ting Wu
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
