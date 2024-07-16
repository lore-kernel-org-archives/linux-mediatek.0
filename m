Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF6C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKn59Eo61gPgXwLDdueCeuGeu9W7m6IyUvCxQVSnSK8=; b=V9gCnqQdWCg4N94LB9zX0GUrU2
	t5mYo739e/u09rksCqhTewEXp61awWkmto7xGZkUeX0nswrJ8niQYBFyRELO/dCuSIlsxpZ/YFEUC
	uQ8orIndHoORVwosdz0oMtBVGzpt1QE7tVgmAOqdQJxxoMCKyqn7IRQxIRgYNdRBx9AQPgMghtLSq
	lBWM9fhGRwlRj+uff7jZwQej80Ovjf/cXigRqooVlXQfRaEOqb0qdDiff7WGRdtb60hAqu9ozAr22
	bEQSRCsmPU8IMYUxS8Hr2KLcH7bwfl6svXHgZ5mRLLJe2gyevrgRGDyRmEorfUGhihlf+wiRUo63t
	yx9zOprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTczT-00000009ezy-1E0B;
	Tue, 16 Jul 2024 07:52:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTczQ-00000009ezR-1Wao;
	Tue, 16 Jul 2024 07:52:49 +0000
X-UUID: 619e1c9e434811efa6c87f6b4542ff6b-20240716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LKn59Eo61gPgXwLDdueCeuGeu9W7m6IyUvCxQVSnSK8=;
	b=hnYVYX+7p9MVV3BhZXLLs4/LQEanl4cv9/V4/kLJdaOpXZuIgk/2VWNXiL2g2dy1T85TANUZ9rSP+Oajlof3BGcT0uoVJOhmSgF1xm2EtCVwhG7XpPTiFM9fWjwhrQa5PL4eebcOaaUg6X2M40QsCV72neROypEw+m3AaxJxXPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:9fc65058-1b5a-4991-bab6-62c6f5af1e41,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:263e830d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 619e1c9e434811efa6c87f6b4542ff6b-20240716
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1226788925; Tue, 16 Jul 2024 00:52:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jul 2024 15:52:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jul 2024 15:52:39 +0800
From: boy.wu <boy.wu@mediatek.com>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe
	<axboe@kernel.dk>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Boris Burkov <boris@bur.io>,
	<cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <iverlin.wang@mediatek.com>, Boy Wu
	<boy.wu@mediatek.com>
Subject: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat update
Date: Tue, 16 Jul 2024 15:52:06 +0800
Message-ID: <20240716075206.23121-1-boy.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.866300-8.000000
X-TMASE-MatchedRID: aeJu7N9qZHyZtBi01n3C9xafLXbshfogcx5k3wffojOHwGEm+CpYGTEG
	FjeZwyRUzbrWhbT2b8cTMOv2lZG8w2zFfXEzaNt8wCZxkTHxccn64i5lgawyBFSOymiJfTYXZmL
	HoWzm2fSMZBHIGOaSwOKOmN63egZIkKjL2IOi2LBbuDP8ZuCmXgApx/9nOtgkVo+424uIBNJYTM
	99NlfBm1EXNKIgpuQj+9p3HcFJM3mVhIWL9FEuNwwfhKwa9GwDgGa+oYp5i6qgWMz+iaWIIaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrUiBZ6mmQX3xiIMgDE0zxa/IQ+RZPevUbELozoV1kXEbSPck
	h7/tXqI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.866300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9AF1EA2C7774CC56D1B87B197E4E94559A0CE677E0D6E0E611350B3A934B048A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_005248_421398_D03BA6DF 
X-CRM114-Status: GOOD (  21.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Boy Wu <boy.wu@mediatek.com>

In 32bit SMP systems, if multiple CPUs call blkcg_print_stat,
it may cause blkcg_fill_root_iostats to have a concurrent problem
on the seqlock in u64_stats_update, which will cause a deadlock
on u64_stats_fetch_begin in blkcg_print_one_stat.

Thus, replace u64 sync with spinlock to protect iostat update.

Fixes: ef45fe470e1e ("blk-cgroup: show global disk stats in root cgroup io.stat")
Signed-off-by: Boy Wu <boy.wu@mediatek.com>
---
Change in v2:
 - update commit message
 - Remove u64_sync
 - Replace spin_lock_irq with guard statement
 - Replace blkg->q->queue_lock with blkg_stat_lock
Change in v3:
 - update commit message
 - Add spinlock in blkg_iostat_set structure
 - Replace all u64_sync with spinlock for iostat
 - Replace blkg_stat_lock with iostat.spinlock
---
 block/blk-cgroup.c | 62 +++++++++++++++++++---------------------------
 block/blk-cgroup.h |  1 +
 2 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 37e6cc91d576..4b66f37c45a0 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -329,7 +329,7 @@ static struct blkcg_gq *blkg_alloc(struct blkcg *blkcg, struct gendisk *disk,
 	INIT_WORK(&blkg->async_bio_work, blkg_async_bio_workfn);
 #endif
 
-	u64_stats_init(&blkg->iostat.sync);
+	spin_lock_init(&blkg->iostat.spinlock);
 	for_each_possible_cpu(cpu) {
 		u64_stats_init(&per_cpu_ptr(blkg->iostat_cpu, cpu)->sync);
 		per_cpu_ptr(blkg->iostat_cpu, cpu)->blkg = blkg;
@@ -995,15 +995,13 @@ static void blkcg_iostat_update(struct blkcg_gq *blkg, struct blkg_iostat *cur,
 				struct blkg_iostat *last)
 {
 	struct blkg_iostat delta;
-	unsigned long flags;
 
 	/* propagate percpu delta to global */
-	flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
+	guard(spinlock_irqsave)(&blkg->iostat.spinlock);
 	blkg_iostat_set(&delta, cur);
 	blkg_iostat_sub(&delta, last);
 	blkg_iostat_add(&blkg->iostat.cur, &delta);
 	blkg_iostat_add(last, &delta);
-	u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
 }
 
 static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
@@ -1034,7 +1032,6 @@ static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
 		struct blkcg_gq *blkg = bisc->blkg;
 		struct blkcg_gq *parent = blkg->parent;
 		struct blkg_iostat cur;
-		unsigned int seq;
 
 		/*
 		 * Order assignment of `next_bisc` from `bisc->lnode.next` in
@@ -1051,10 +1048,8 @@ static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
 			goto propagate_up; /* propagate up to parent only */
 
 		/* fetch the current per-cpu values */
-		do {
-			seq = u64_stats_fetch_begin(&bisc->sync);
+		scoped_guard(spinlock_irqsave, &bisc->spinlock)
 			blkg_iostat_set(&cur, &bisc->cur);
-		} while (u64_stats_fetch_retry(&bisc->sync, seq));
 
 		blkcg_iostat_update(blkg, &cur, &bisc->last);
 
@@ -1112,7 +1107,6 @@ static void blkcg_fill_root_iostats(void)
 		struct blkcg_gq *blkg = bdev->bd_disk->queue->root_blkg;
 		struct blkg_iostat tmp;
 		int cpu;
-		unsigned long flags;
 
 		memset(&tmp, 0, sizeof(tmp));
 		for_each_possible_cpu(cpu) {
@@ -1134,9 +1128,8 @@ static void blkcg_fill_root_iostats(void)
 				cpu_dkstats->sectors[STAT_DISCARD] << 9;
 		}
 
-		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
+		guard(spinlock_irqsave)(&blkg->iostat.spinlock);
 		blkg_iostat_set(&blkg->iostat.cur, &tmp);
-		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
 	}
 }
 
@@ -1145,7 +1138,6 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
 	struct blkg_iostat_set *bis = &blkg->iostat;
 	u64 rbytes, wbytes, rios, wios, dbytes, dios;
 	const char *dname;
-	unsigned seq;
 	int i;
 
 	if (!blkg->online)
@@ -1157,16 +1149,14 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
 
 	seq_printf(s, "%s ", dname);
 
-	do {
-		seq = u64_stats_fetch_begin(&bis->sync);
-
+	scoped_guard(spinlock_irqsave, &bis->spinlock) {
 		rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
 		wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
 		dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
 		rios = bis->cur.ios[BLKG_IOSTAT_READ];
 		wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
 		dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
-	} while (u64_stats_fetch_retry(&bis->sync, seq));
+	}
 
 	if (rbytes || wbytes || rios || wios) {
 		seq_printf(s, "rbytes=%llu wbytes=%llu rios=%llu wios=%llu dbytes=%llu dios=%llu",
@@ -2141,7 +2131,6 @@ void blk_cgroup_bio_start(struct bio *bio)
 	struct blkcg *blkcg = bio->bi_blkg->blkcg;
 	int rwd = blk_cgroup_io_type(bio), cpu;
 	struct blkg_iostat_set *bis;
-	unsigned long flags;
 
 	if (!cgroup_subsys_on_dfl(io_cgrp_subsys))
 		return;
@@ -2152,30 +2141,29 @@ void blk_cgroup_bio_start(struct bio *bio)
 
 	cpu = get_cpu();
 	bis = per_cpu_ptr(bio->bi_blkg->iostat_cpu, cpu);
-	flags = u64_stats_update_begin_irqsave(&bis->sync);
-
-	/*
-	 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
-	 * bio and we would have already accounted for the size of the bio.
-	 */
-	if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
-		bio_set_flag(bio, BIO_CGROUP_ACCT);
-		bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
-	}
-	bis->cur.ios[rwd]++;
+	scoped_guard(spinlock_irqsave, &bis->spinlock) {
+		/*
+		 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
+		 * bio and we would have already accounted for the size of the bio.
+		 */
+		if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
+			bio_set_flag(bio, BIO_CGROUP_ACCT);
+			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
+		}
+		bis->cur.ios[rwd]++;
 
-	/*
-	 * If the iostat_cpu isn't in a lockless list, put it into the
-	 * list to indicate that a stat update is pending.
-	 */
-	if (!READ_ONCE(bis->lqueued)) {
-		struct llist_head *lhead = this_cpu_ptr(blkcg->lhead);
+		/*
+		 * If the iostat_cpu isn't in a lockless list, put it into the
+		 * list to indicate that a stat update is pending.
+		 */
+		if (!READ_ONCE(bis->lqueued)) {
+			struct llist_head *lhead = this_cpu_ptr(blkcg->lhead);
 
-		llist_add(&bis->lnode, lhead);
-		WRITE_ONCE(bis->lqueued, true);
+			llist_add(&bis->lnode, lhead);
+			WRITE_ONCE(bis->lqueued, true);
+		}
 	}
 
-	u64_stats_update_end_irqrestore(&bis->sync, flags);
 	cgroup_rstat_updated(blkcg->css.cgroup, cpu);
 	put_cpu();
 }
diff --git a/block/blk-cgroup.h b/block/blk-cgroup.h
index bd472a30bc61..b9544969a131 100644
--- a/block/blk-cgroup.h
+++ b/block/blk-cgroup.h
@@ -44,6 +44,7 @@ struct blkg_iostat {
 };
 
 struct blkg_iostat_set {
+	spinlock_t			spinlock;
 	struct u64_stats_sync		sync;
 	struct blkcg_gq		       *blkg;
 	struct llist_node		lnode;
-- 
2.18.0


