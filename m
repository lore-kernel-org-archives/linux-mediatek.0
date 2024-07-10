Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458BC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d95Fo6b+G68P3kj0InKe88LIEg8qwPI54rMQxA2Bxok=; b=RHwwA33m5aeLp/BzH9z3aazq5p
	TQrLEJAciMcDXWBatRUTf9u9EbmW/2/aBA+/2z7TucOxPZ9MX3OR6HWUn7Z1Z+RMwObD7cFfGZ8ez
	Pl2NRVr8NykZ/EFxJ/AAf18P4LmXsvPCKny3mKvx3QyChVHMSZNx+YE1K0/Dr5N5Rlre1kNytQhDk
	hzJ4TL02w+KcahiLCmCuJJAPdCzkyuUydKuDRnBWEtZrynDiFndYaSIYZ54ss4HSwdB8GCg1qwDlM
	xi8CTd0s4ZvVdEuaHZMEoSmyeFOZN2OJcu3GU/myo4pqz4i1URa2WsdDrZSY1TL3SBqklag3x7Sv6
	c/Y5du+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRQaw-00000009ZaR-3P9M;
	Wed, 10 Jul 2024 06:14:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRQat-00000009ZZx-31pm;
	Wed, 10 Jul 2024 06:14:25 +0000
X-UUID: a1a2f4783e8311ef955bff358274dad2-20240709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d95Fo6b+G68P3kj0InKe88LIEg8qwPI54rMQxA2Bxok=;
	b=uwSiQuKzKKvip5XYmGbNlBFO1yvk3YW4x3ca1a1uu2voFf31r17fou63yWYqLWMnsohWZanjztaoPW/EAjP6c0pLTonXrwMBpBZNNoy1H6R0VEQnkb8PSB+IrcjL8nFturTG3k97ke+rYjaPYkHmigWq4qUaHPzZwNqPtAAO5Nw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:5d4ce15f-4aff-44d9-857b-8e95a5b9ac40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:f5291f45-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a1a2f4783e8311ef955bff358274dad2-20240709
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1884671394; Tue, 09 Jul 2024 23:14:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 14:13:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 14:13:36 +0800
From: boy.wu <boy.wu@mediatek.com>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe
	<axboe@kernel.dk>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Boris Burkov <boris@bur.io>,
	<cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <iverlin.wang@mediatek.com>, Boy Wu
	<boy.wu@mediatek.com>
Subject: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for stats update
Date: Wed, 10 Jul 2024 14:13:34 +0800
Message-ID: <20240710061334.1888-1-boy.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.944900-8.000000
X-TMASE-MatchedRID: qLbn38WZ3sSZtBi01n3C9xafLXbshfogcx5k3wffojOHwGEm+CpYGTEG
	FjeZwyRUzogSaVJZzAL+luKvsi8YwoAemPpsxJ+FwCZxkTHxccn64i5lgawyBFSOymiJfTYXpR4
	7IzBwt4ZOFu8ssjxG84NY9+fuummTlzyv7BXwQ5GeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jHUU
	+U0ACZwMVeAuLeAGwuBp7q3lDk3HqIXtzfrt5hBCumh16iMSocnqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.944900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6E5764C31209FE9AC971FCE68D722875165DEF69209A65E7F099ADB9A84DB4E32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_231423_793402_A5DDC3D6 
X-CRM114-Status: GOOD (  11.63  )
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
which may cause blkcg_fill_root_iostats to have a concurrent problem
on the seqlock in u64_stats_update, which will cause a deadlock
on u64_stats_fetch_begin in blkcg_print_one_stat.

Thus use blkg_stat_lock to replace u64_sync.

Fixes: ef45fe470e1e ("blk-cgroup: show global disk stats in root cgroup io.stat")
Signed-off-by: Boy Wu <boy.wu@mediatek.com>
---
Change in v2:
 - update commit message
 - Remove u64_sync
 - Replace spin_lock_irq with guard statement
 - Replace blkg->q->queue_lock with blkg_stat_lock
---
 block/blk-cgroup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 85b3b9051455..18b47ee1a640 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -952,7 +952,6 @@ static void blkcg_fill_root_iostats(void)
 		struct blkcg_gq *blkg = bdev->bd_disk->queue->root_blkg;
 		struct blkg_iostat tmp;
 		int cpu;
-		unsigned long flags;
 
 		memset(&tmp, 0, sizeof(tmp));
 		for_each_possible_cpu(cpu) {
@@ -974,9 +973,10 @@ static void blkcg_fill_root_iostats(void)
 				cpu_dkstats->sectors[STAT_DISCARD] << 9;
 		}
 
-		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
+#if BITS_PER_LONG == 32
+		guard(raw_spinlock_irqsave)(&blkg_stat_lock);
+#endif
 		blkg_iostat_set(&blkg->iostat.cur, &tmp);
-		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
 	}
 }
 
-- 
2.18.0


