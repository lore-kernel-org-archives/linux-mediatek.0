Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 03:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpfKISV4vE6O03aFMTcBqHQOHJx5CclclzUfXMeOTho=; b=JhVT6Z7178cZNJ
	rR8Mlxm73VJ/qYIFDIJnLw4/ax5n9vHBrVPQI7jbw80wr2hQAK9o1wsFUYeDS4Cld6iNnk/AL1Meg
	zClBIK9P+Qa2mhXM4KKO6+i/eyQTDBYvkTwAO/AMox9mxLHYwY7sZveAFjtmYsr40K6f/TlRQ9yOU
	+7P3lu7BjC5aPdu3KfZr7OKo2Gp0Qj6SCVgZA6aITTnxZAGVA2m3dIiaXkd8SXS0NbiaDR1xbSWfx
	AEJ3PXUiqdCVpIuuBo/vIOIpCi7oRSdTUbb9HbALX432wYSoSAEcKxCq5Xh4HS9TjxWpe+jpWClWf
	pKT17vb327l5ewYqIHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfD4e-008Iii-DX; Fri, 15 Apr 2022 03:56:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfD4b-008Igj-Gx; Fri, 15 Apr 2022 03:56:43 +0000
X-UUID: 949fecfb80f24622b40628c5e528547e-20220414
X-UUID: 949fecfb80f24622b40628c5e528547e-20220414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1169131056; Thu, 14 Apr 2022 20:56:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 20:56:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 11:56:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 11:56:27 +0800
Message-ID: <231503cb93caabb5fc0e1027423e971560493075.camel@mediatek.com>
Subject: Re: [PATCH 1/1] [PATCH v3]sched/pelt: Fix the
 attach_entity_load_avg calculate method
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Daniel Bristot
 de Oliveira" <bristot@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <wsd_upstream@mediatek.com>, Ingo Molnar <mingo@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 15 Apr 2022 11:56:27 +0800
In-Reply-To: <YlgzTS+laNNvMukT@hirez.programming.kicks-ass.net>
References: <20220414090229.342-1-kuyo.chang@mediatek.com>
 <YlgzTS+laNNvMukT@hirez.programming.kicks-ass.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_205641_593449_A176C340 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, 2022-04-14 at 16:44 +0200, Peter Zijlstra wrote:
> I've taken the liberty of carrying over the tags from v2 and reworked
> the Changelog a little.

Thank you for all your assistance.

> ---
> Subject: sched/pelt: Fix attach_entity_load_avg() corner case
> From: kuyo chang <kuyo.chang@mediatek.com>
> Date: Thu, 14 Apr 2022 17:02:20 +0800
> 
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> The warning in cfs_rq_is_decayed() triggered:
> 
>     SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> 		  cfs_rq->avg.util_avg ||
> 		  cfs_rq->avg.runnable_avg)
> 
> There exists a corner case in attach_entity_load_avg() which will
> cause load_sum to be zero while load_avg will not be.
> 
> Consider se_weight is 88761 as per the sched_prio_to_weight[] table.
> Further assume the get_pelt_divider() is 47742, this gives:
> se->avg.load_avg is 1.
> 
> However, calculating load_sum results in 0:
> 
>   se->avg.load_sum = div_u64(se->avg.load_avg * se->avg.load_sum,
> se_weight(se));
>   se->avg.load_sum = 1*47742/88761 = 0.
> 
> Then enqueue_load_avg() adds this to the cfs_rq totals:
> 
>   cfs_rq->avg.load_avg += se->avg.load_avg;
>   cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> 
> Resulting in load_avg being 1 with load_sum is 0, which will trigger
> the WARN.
> 
> Fixes: f207934fb79d ("sched/fair: Align PELT windows between cfs_rq
> and its se")
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> [peterz: massage changelog]
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Link: 
> https://urldefense.com/v3/__https://lkml.kernel.org/r/20220414090229.342-1-kuyo.chang@mediatek.com__;!!CTRNKA9wMg0ARbw!35Im02xxIuUZdLYpPng37Yk7oVNJVJ1tfbu4XRzlq-6VhH3K29Por0gJCFlslT_CMgA$
>  
> ---
>  kernel/sched/fair.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3829,11 +3829,11 @@ static void attach_entity_load_avg(struc
>  
>  	se->avg.runnable_sum = se->avg.runnable_avg * divider;
>  
> -	se->avg.load_sum = divider;
> -	if (se_weight(se)) {
> -		se->avg.load_sum =
> -			div_u64(se->avg.load_avg * se->avg.load_sum,
> se_weight(se));
> -	}
> +	se->avg.load_sum = se->avg.load_avg * divider;
> +	if (se_weight(se) < se->avg.load_sum)
> +		se->avg.load_sum = div_u64(se->avg.load_sum,
> se_weight(se));
> +	else
> +		se->avg.load_sum = 1;
>  
>  	enqueue_load_avg(cfs_rq, se);
>  	cfs_rq->avg.util_avg += se->avg.util_avg;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
