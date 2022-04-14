Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dJj2JOu2SQPDV5OIYVOd7nYZeCEXS8eaRwNyDFp7kZY=; b=ZhmvUeAasl8ic/
	iIBu//R+cAqTFU1LlV3k5IYb8mIOlu9YLycDAvqyogxKz54yGHMuc1nTcXkF3zMhisRZsXLkxZe+x
	/QZEbKfgT4U+Pk/TX7HhTJQ2lupXIOEQm1PwYpfQM2ZrEleYCGgS7+qnsgg1uvJmdqFJ5B5vMV5IY
	uXA854Dvl/WftFr1KYvSQfgPaXmdCDnzwRCdUAv1ZU8T9Vy0s72hbxihFhAZyGTpmhOX98uyEfICr
	NeFIDjJ19FYQINHcAmr1XfJa1eLNzcg3leVtMjOXfzckb8oHfqsFSGKScNfBr+iVgGPJF4t+S0Xta
	z6DC1gTTM9lM9nsqzUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevX4-004o4k-Dk; Thu, 14 Apr 2022 09:12:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevWt-004nxf-Qg; Thu, 14 Apr 2022 09:12:47 +0000
X-UUID: 138cfb52afe0451c8ece174d06f8d1c3-20220414
X-UUID: 138cfb52afe0451c8ece174d06f8d1c3-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1970520035; Thu, 14 Apr 2022 02:12:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 02:02:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 17:02:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 17:02:30 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, kuyo chang <kuyo.chang@mediatek.com>, "Ingo
 Molnar" <mingo@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] [PATCH v3]sched/pelt: Fix the attach_entity_load_avg
 calculate method
Date: Thu, 14 Apr 2022 17:02:20 +0800
Message-ID: <20220414090229.342-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_021243_912047_6757B084 
X-CRM114-Status: GOOD (  14.21  )
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
case at attach_entity_load_avg which will cause load_sum is null but
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

In order to fix the corner case, make sure the se->load_avg|sum is correct
before enqueue_load_avg.

After long time testing, the kernel warning was gone and the system runs
as well as before.

Fixes: f207934fb79d ("sched/fair: Align PELT windows between cfs_rq and its se")
Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---

 v1->v2:
 (1)Thanks for suggestion from Peter Zijlstra & Vincent Guittot.
 (2)By suggestion from Vincent Guittot,
 rework the se->load_sum calculation method for fix the corner case,
 make sure the se->load_avg|sum is correct before enqueue_load_avg.
 (3)Rework changlog.

 v2->v3:
 (1)Rename Subject. 
 (1)Add fix tag.


 kernel/sched/fair.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4bd299d67ab..159274482c4e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3829,10 +3829,12 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	se->avg.runnable_sum = se->avg.runnable_avg * divider;
 
-	se->avg.load_sum = divider;
-	if (se_weight(se)) {
+	se->avg.load_sum = se->avg.load_avg * divider;
+	if (se_weight(se) < se->avg.load_sum) {
 		se->avg.load_sum =
-			div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
+			div_u64(se->avg.load_sum, se_weight(se));
+	} else {
+		se->avg.load_sum = 1;
 	}
 
 	enqueue_load_avg(cfs_rq, se);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
