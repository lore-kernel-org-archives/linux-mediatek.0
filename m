Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHztwGL8dhmaeXsQMu7Gp86QoRRv5Q9aBw90cBUHSnQ=; b=Ynix8Z1/GVkerF
	aSyxAfTOucpdKS0F+ZD0W8lDMaktGEbqvUsmg1/lqUUgk6GXU1S/0cDs4xexnmYTzEr0oxKvvRQsw
	c6ODGedBoD9TeAZ3x14SGkkO58qtcEsQ7NYkKDzmA7HusA8q8AgKEgxrZPVG3OeeAt540pDvV/Rgv
	V4xVliGenqrQ7upvDFbl8sYs2ZCduECv6+H034eo3RxSuUA9yDEK0L2cr+8ycmJ7WoQWiKgyPgi9J
	jsVGbNVnBDSkKT2r0UuDKiLJ/oYOpXXMuB8Boj+blSCKQAFFG5YnBFYg3xU+T+aYfamHCsN21wRHN
	FCA8y34bvUD1JpNljeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyweM-00DhR5-3Y; Wed, 08 Jun 2022 14:27:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywe9-00DhPS-2U; Wed, 08 Jun 2022 14:26:59 +0000
X-UUID: ce6623a02c654da5b9e44362f1c392d3-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:42049a23-225c-4068-aa65-ea5aa360e206,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:5b301fe5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: ce6623a02c654da5b9e44362f1c392d3-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 591739474; Wed, 08 Jun 2022 07:26:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 07:16:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 22:16:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 22:16:43 +0800
Message-ID: <7e49e2b73aae471514f277d89bc925da269c89d6.camel@mediatek.com>
Subject: Re: [PATCH] sched: Fix balance_push() vs __sched_setscheduler()
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
Date: Wed, 8 Jun 2022 22:16:43 +0800
In-Reply-To: <Yp/Frp7BMp9E5dSp@hirez.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
	 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
	 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
	 <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
	 <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
	 <Yp+3xFMrypvHcLua@hirez.programming.kicks-ass.net>
	 <Yp/Frp7BMp9E5dSp@hirez.programming.kicks-ass.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_072657_175247_8BD047CB 
X-CRM114-Status: GOOD (  21.22  )
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


On Tue, 2022-06-07 at 23:39 +0200, Peter Zijlstra wrote:
> On Tue, Jun 07, 2022 at 10:40:36PM +0200, Peter Zijlstra wrote:
> > On Fri, Jun 03, 2022 at 12:15:51AM +0800, Jing-Ting Wu wrote:
> > > The patch is helpful to the syndrome, passed stability test over
> > > 10
> > > days so far. (as-is: < 48 hours failed)
> > 
> > Excellent, let me go write a Changelog for it, or something.
> 
> How's this then?

I think the description is fine.
Thanks for your help.

[...]
>  
> -static inline struct callback_head *splice_balance_callbacks(struct
> rq *rq)
> +static inline struct callback_head *
> +__splice_balance_callbacks(struct rq *rq, bool split)
>  {
>  	struct callback_head *head = rq->balance_callback;
>  
> +	if (likely(!head))
> +		return NULL;
> +
>  	lockdep_assert_rq_held(rq);
> -	if (head)
> +	/*
> +	 * Must not take balance_push_callback off the list when
> +	 * splace_balance_callbac() and balance_callbacks() are not


Should we change splace_balance_callbac() to splice_balance_callbacks()
at here?


> +	 * in the same rq->lock section.
> +	 *
> +	 * In that case it would be possible for __schedule() to
> interleave
> +	 * and observe the list empty.
> +	 */
> +	if (split && head == &balance_push_callback)
> +		head = NULL;
> +	else
>  		rq->balance_callback = NULL;
>  
>  	return head;
>  }
>  
[...]


Best Regards,
Jing-Ting Wu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
