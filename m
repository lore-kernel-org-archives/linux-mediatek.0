Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1485FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 06:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz+gQ3wy5VhtQcCI1zBMlkmZKRg9aqacREpuaN9DmlI=; b=gcdDToF9Hk+AQu
	R4wGrjK3jZoAFw4C4vrjkQvvM1ChqoP3umzUb+Jlq5PzfjxgCx15Irtbd59fs1zybluYjBTMzpRoE
	QI2q5ChOVH1hAQwK16i5Pg8rhdqNkE5tuBxi5r8oc4Mx9XcgzCMBBtOE2g9ZdZ/fiHt30bo/e343z
	LFsAckATfZT6OcWyiGI5w3KsVig7WJrrB63WkkKANQa0baZ5Xi+Ldz+WKaETiMm76w7KfirrQH1P5
	A89oq3gs2VKaHQbahLxFSSe2Y3QNt6Sjmn37kVAbJ/CA9jqgctkjCdhl2Yi0DOu2ngWuHii3U5L+O
	Uau1L3Hq6jpnw/FvJaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndnRE-006uXG-A2; Mon, 11 Apr 2022 06:22:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndnR9-006uUv-QZ; Mon, 11 Apr 2022 06:22:10 +0000
X-UUID: 3de3b0c2772c4bdcaceb3e13d7044182-20220410
X-UUID: 3de3b0c2772c4bdcaceb3e13d7044182-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1319985531; Sun, 10 Apr 2022 23:21:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 23:17:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 14:17:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 14:17:08 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, kuyo chang <kuyo.chang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate method
Date: Mon, 11 Apr 2022 14:16:56 +0800
Message-ID: <20220411061702.22978-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_232207_894198_0EB686DC 
X-CRM114-Status: GOOD (  13.45  )
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

From: kuyo chang <kuyo.chang@mediatek.com>

I meet the warning message at cfs_rq_is_decayed at below code.

SCHED_WARN_ON(cfs_rq->avg.load_avg ||
		    cfs_rq->avg.util_avg ||
		    cfs_rq->avg.runnable_avg)

Following is the calltrace.

Call trace:
__update_blocked_fair
update_blocked_averages
newidle_balance
pick_next_task_fair
__schedule
schedule
pipe_read
vfs_read
ksys_read

After code analyzing and some debug messages, I found it exits a corner
case at attach_entity_load_avg which will cause load_sum is zero and
load_avg is not.
Consider se_weight is 88761 according by sched_prio_to_weight table.
And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
By the calculating for se->avg.load_sum as following will become zero
as following.
se->avg.load_sum =
	div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
se->avg.load_sum = 1*47742/88761 = 0.

After enqueue_load_avg code as below.
cfs_rq->avg.load_avg += se->avg.load_avg;
cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;

Then the load_sum for cfs_rq will be 1 while the load_sum for cfs_rq is 0.
So it will hit the warning message.

After all, I refer the following commit patch to do the similar thing at
enqueue_load_avg.
sched/pelt: Relax the sync of load_sum with load_avg

After long time testing, the kernel warning was gone and the system runs
as well as before.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/fair.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4bd299d67ab..30d8b6dba249 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3074,8 +3074,10 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static inline void
 enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	cfs_rq->avg.load_avg += se->avg.load_avg;
-	cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
+	add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
+	add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
+	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
+					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
 }
 
 static inline void
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
