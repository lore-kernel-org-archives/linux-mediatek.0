Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E464C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKa9i+84DiQO2zYqhQZfsl8pyCMJB3d1DXnjm3fW+Jc=; b=wswu+FG3wLKgy1
	efgZkxU7E7Fu89P3k1XAX9PiHgDanvcOD9c+wBC5+uBJv8/IwIAqRVEITBJM/lyffQrLHlsnKIZg/
	TTxF2TvxogzeIqJNnxoZur1E2ysonvH4NtfA+Rfjj3+L+xtJN47BzbJX/suQACWdAYrD6JhU9tvCn
	8g+p29Mkw/6ISI4lWVS0cis/cKXajJyoUE0dF8uXtcDnpq1/+S/yVQS5JhAWV2Ra3qDeDG6zDxi/e
	TWe5q+r8mHX67y/TgwtZjILMmGrSKJCxcpFI6mVAoLERMBwQqHfCIzhZQgKBRMfDNYv1J+XRHrTix
	AVWrKsbvWja6bOXXDR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt2r5-002Bqq-TX; Mon, 23 May 2022 07:51:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2n5-002AAA-Dd; Mon, 23 May 2022 07:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=TSTLXpol0sTUFJszU4DFEy150yKHPxfSj3u4uAWDmyc=; b=Y/Ui6aaNi0TqzU7EzSdAiXbyoR
 XTRsHTrMQLc0UC6liKMCDZBUknOljXBCdkMPqDg4rGNUu2xSd5RrY3zic8xnvbi6N+2Mm4JtvKfle
 TaV3ccV0kQRWu7qotrwKL4BGawxOdo0EVFfN5ZgYcxnZpMg75yO6vrcny112xeDJ79lJTPJLSwdO8
 VexzyhLkL+4RH31/+V+hUJPT15P+rg12TuXBSGIJIzwa0I00w0SBrn9aoauDRt1bcxamZaQHEu67T
 ZLJ/2aWw79jpi9gABg7vuaDQx/sFZmGGdWcG2yXNVASnMQAUw3JV0qPe3aQMTmJkqLxK1ux2EMkAi
 CklhcBkA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2G5-000vfY-QN; Mon, 23 May 2022 07:13:44 +0000
X-UUID: e6e3ac5fca8f4a5aaeb207ef56c16611-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:19ec6f98-fa68-4453-bb0b-dc5e23b16897, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:2699417a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: e6e3ac5fca8f4a5aaeb207ef56c16611-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jing-ting.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 878125043; Mon, 23 May 2022 00:12:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 00:12:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 15:12:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 15:12:54 +0800
Message-ID: <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
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
Date: Mon, 23 May 2022 15:12:54 +0800
In-Reply-To: <20220519134706.GH2578@worktop.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_081342_567461_9731B373 
X-CRM114-Status: GOOD (  22.12  )
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

On Thu, 2022-05-19 at 15:47 +0200, Peter Zijlstra wrote:
> On Thu, May 19, 2022 at 08:53:15PM +0800, Jing-Ting Wu wrote:
> > Hi all
> > 
> > 
> > There is a race condition between CPU hotplug off flow and
> > __sched_setscheduler(), which will cause hang-up in CPU hotplug off
> > flow.
> 
> How easy can you reproduce; does the below hack make it better?


The issue can be reproduced in about 48 hours when hotplug up/down
frequently.

Thanks for your suggestion.
I think the hack patch could stay the rq->balance_callback when rq-
>callback = &balance_push_callback.
We can add hack patch to the stability test.


> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 95bac3b094b3..f18ee22b29bc 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4763,20 +4763,30 @@ struct callback_head balance_push_callback =
> {
>  	.func = (void (*)(struct callback_head *))balance_push,
>  };
>  
> -static inline struct callback_head *splice_balance_callbacks(struct
> rq *rq)
> +static inline struct callback_head *
> +__splice_balance_callbacks(struct rq *rq, bool foo)
>  {
>  	struct callback_head *head = rq->balance_callback;
>  
>  	lockdep_assert_rq_held(rq);
> -	if (head)
> -		rq->balance_callback = NULL;
> +	if (head) {
> +		if (foo && head == &balance_push_callback)
> +			head = NULL;
> +		else
> +			rq->balance_callback = NULL;
> +	}
>  
>  	return head;
>  }
>  
> +static inline struct callback_head *splice_balance_callbacks(struct
> rq *rq)
> +{
> +	return __splice_balance_callbacks(rq, true);
> +}
> +
>  static void __balance_callbacks(struct rq *rq)
>  {
> -	do_balance_callbacks(rq, splice_balance_callbacks(rq));
> +	do_balance_callbacks(rq, __splice_balance_callbacks(rq,
> false));
>  }
>  
>  static inline void balance_callbacks(struct rq *rq, struct
> callback_head *head)
> 






_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
