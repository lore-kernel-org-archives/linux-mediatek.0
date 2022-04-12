Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woH57ATew0o2hnavDfc3ZXXymYn+XsdFmIZM85O6alQ=; b=qLLGmQOOeoIJIQ
	oxL18bReiIPhX23bQ04ZmZEzBSTQRa2WVNefZ3PCJHodvn9o5Ll5rcmhaIuJl4XtcWOG5IPDYItd5
	tF7EsYTjLqwgrJK3KlNzsPqlM9SFR49LoBp2EKhSbiaOGm8laYtS9cenR4A9lBmPviIInXDjMzCfg
	JUsf6PX/fZf71JSMq/xJzsxiYb+D8S8LEC13efatwoGGJOI3WIAZk9kXt8nFqmDIc4u9elz8U9A3k
	6pxxn2LHUQ2GSZRBq+CEpku0rUL2F9q37KDlABP/HUi5gQ+wfaS5HDMJbqgJ0rnXi+m6klVlq65/O
	dtFQlDLryAT6ZRStSnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6fV-00BLpY-6o; Tue, 12 Apr 2022 02:54:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6em-00BLUQ-Rj; Tue, 12 Apr 2022 02:53:30 +0000
X-UUID: 9c1f5693010040b6b6e5a63709ca0a10-20220411
X-UUID: 9c1f5693010040b6b6e5a63709ca0a10-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1842209354; Mon, 11 Apr 2022 19:53:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 19:51:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 10:51:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 10:51:23 +0800
Message-ID: <5a90b20570ecacf457f68da7a106d3b2f8c2269e.camel@mediatek.com>
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Daniel Bristot
 de Oliveira" <bristot@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <wsd_upstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 12 Apr 2022 10:51:23 +0800
In-Reply-To: <CAKfTPtAyhc-tAWXmXcHstmiBSMjj5GENizX__KRDab28NRum1A@mail.gmail.com>
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
 <CAKfTPtAyhc-tAWXmXcHstmiBSMjj5GENizX__KRDab28NRum1A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195328_969627_DEDE2A01 
X-CRM114-Status: GOOD (  32.78  )
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

On Mon, 2022-04-11 at 10:39 +0200, Vincent Guittot wrote:
> On Mon, 11 Apr 2022 at 08:17, Kuyo Chang <kuyo.chang@mediatek.com>
> wrote:
> > 
> > From: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > I meet the warning message at cfs_rq_is_decayed at below code.
> > 
> > SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> >                     cfs_rq->avg.util_avg ||
> >                     cfs_rq->avg.runnable_avg)
> > 
> > Following is the calltrace.
> > 
> > Call trace:
> > __update_blocked_fair
> > update_blocked_averages
> > newidle_balance
> > pick_next_task_fair
> > __schedule
> > schedule
> > pipe_read
> > vfs_read
> > ksys_read
> > 
> > After code analyzing and some debug messages, I found it exits a
> > corner
> > case at attach_entity_load_avg which will cause load_sum is zero
> > and
> > load_avg is not.
> > Consider se_weight is 88761 according by sched_prio_to_weight
> > table.
> > And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
> > By the calculating for se->avg.load_sum as following will become
> > zero
> > as following.
> > se->avg.load_sum =
> >         div_u64(se->avg.load_avg * se->avg.load_sum,
> > se_weight(se));
> > se->avg.load_sum = 1*47742/88761 = 0.
> 
> The root problem is there, se->avg.load_sum must not be null if
> se->avg.load_avg is not null because the correct relation between
> _avg
> and _sum is:
> 
> load_avg = weight * load_sum / divider.
> 
> so the fix should be attach_entity_load_avg() and probably the below
> is enough
> 
> se->avg.load_sum = div_u64(se->avg.load_avg * se->avg.load_sum,
> se_weight(se)) + 1;

Thanks for your kindly suggestion.
+1 would make the calcuation for load_sum may be overestimate?
How about the below code make sense for fix the corner case?

--- 
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3832,7 +3832,8 @@ static void attach_entity_load_avg(struct cfs_rq
*cfs_rq, struct sched_entity *s
 	se->avg.load_sum = divider;
 	if (se_weight(se)) {
 		se->avg.load_sum =
-			div_u64(se->avg.load_avg * se->avg.load_sum,
se_weight(se));
+			(se->avg.load_avg * se->avg.load_sum >
se_weight(se)) ?
+			div_u64(se->avg.load_avg * se->avg.load_sum,
se_weight(se)) : 1;
 	}
 
 	enqueue_load_avg(cfs_rq, se);
-- 
2.18.0


> > 
> > After enqueue_load_avg code as below.
> > cfs_rq->avg.load_avg += se->avg.load_avg;
> > cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> > 
> > Then the load_sum for cfs_rq will be 1 while the load_sum for
> > cfs_rq is 0.
> > So it will hit the warning message.
> > 
> > After all, I refer the following commit patch to do the similar
> > thing at
> > enqueue_load_avg.
> > sched/pelt: Relax the sync of load_sum with load_avg
> > 
> > After long time testing, the kernel warning was gone and the system
> > runs
> > as well as before.
> > 
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > ---
> >  kernel/sched/fair.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4bd299d67ab..30d8b6dba249 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -3074,8 +3074,10 @@ account_entity_dequeue(struct cfs_rq
> > *cfs_rq, struct sched_entity *se)
> >  static inline void
> >  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> > -       cfs_rq->avg.load_avg += se->avg.load_avg;
> > -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> > +       add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> > +       add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se-
> > >avg.load_sum);
> > +       cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> > +                                         cfs_rq->avg.load_avg *
> > PELT_MIN_DIVIDER);
> >  }
> > 
> >  static inline void
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
