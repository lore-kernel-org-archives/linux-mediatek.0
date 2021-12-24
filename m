Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 01:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ewh9j2DT+krdEX/l0CiIbFPOLOauRzOmlEiz6p6MVUw=; b=ew2281aWwI7Ti9
	Q3bIw/Ru2XkNLlV1tNToBzf6GhUXuJJ8krbQeNq4c462kEncJ7eO3hI3oLMMdCdSsrZze2Kx92Xdh
	Kf6+ZBoSw9JA/3k1Uy/z0hB0dg3AsPc8FSIisvMPAitZERCJJizQw37x5BVTo7gCInIRBWImwq0pc
	wvjBPu5dNkIJVGJUX4A0/P1AnE3tRBnK1JGo0442tagC+as620vrEIKmJ+7DzEIn6NY5mL1QblAVM
	KdZDxqHHHv95NJ8jSVG+z2++tzcUmhZySj11qlKYHF0gFBNIwC1BW9McFKJb8Mp2IXfdZWLcgjXrX
	gTEaidFVPc41M880cg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0ZIM-00DbhE-Aj; Fri, 24 Dec 2021 01:22:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0ZIH-00DbgA-Ts; Fri, 24 Dec 2021 01:22:52 +0000
X-UUID: ae096fa17d5540c7920414d82cac5342-20211223
X-UUID: ae096fa17d5540c7920414d82cac5342-20211223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yt.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1611184259; Thu, 23 Dec 2021 18:22:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Dec 2021 17:22:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 24 Dec 2021 09:22:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Dec 2021 09:22:40 +0800
From: YT Chang <yt.chang@mediatek.com>
To: YT Chang <yt.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Daniel Bristot de
 Oliveira" <bristot@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Subject: [PATCH 1/1] sched: Add update_rq_clock() in sched_rt_rq_enqueue()
Date: Fri, 24 Dec 2021 09:22:39 +0800
Message-ID: <20211224012239.4694-1-yt.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_172250_002899_838321E5 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

Add update_rq_clock() in sched_rt_rq_enqueue() to
prevent the warning "rq->clock_update_flags < RQCF_ACT_SKIP"
when call rq_clock() in cpufreq_update_util().

sched_rt_rq_enqueue ->
   enqueue_top_rt_rq ->
      cpufreq_update_util ->
         rq_clock ->
            assert_clock_updated

Signed-off-by: YT Chang <yt.chang@mediatek.com>
Change-Id: I4fba5a561b7064aafa991d7f1a34431607779cb4
---
 kernel/sched/rt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index b48baaba2fc2..faf1a68c0723 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -539,6 +539,7 @@ static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 
 	int cpu = cpu_of(rq);
 
+	update_rq_clock(rq);
 	rt_se = rt_rq->tg->rt_se[cpu];
 
 	if (rt_rq->rt_nr_running) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
