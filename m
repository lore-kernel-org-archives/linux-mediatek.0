Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F16BC3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2ch6CN6/2ILQFX9s+8Go6wgcVOVLzjEhdIrftGsDFs=; b=QUlwHtJc+V2RNepxkxEh+ZpRE2
	oyk8/WyldvvHQOf9NCnAUgOsOcG0mulxV6Iby8tnPZanQSgzjAH94NWMcYZmOKPQsP6iNFIB/V9T7
	r/EX5/z74x4LM95XIA10oxZk0K/VkiJerQaYvwYVKBdjo4DwF+WqEGU7O0YEezSNhLJ/JAiyiVMt9
	CMlKaOpPtpkxcv3V63DeLujva24VnnL075CMF5/d87Vlns70+X9ejBKrpjfJt3EKPtsrVueb7SSMa
	vB5oBNjo9B5csAACKj+L6C/s5K8efCtcdvgQVHO9dlfq9ctwKFcKsNPU0vgO0RjNXVP58NBvt7zMR
	cERhUYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdo3-0000000FCyL-3IM3;
	Fri, 05 Jul 2024 07:56:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdo1-0000000FCx0-3IHZ;
	Fri, 05 Jul 2024 07:56:35 +0000
X-UUID: 1516d14c3aa411ef9daba96ee3f3cc8c-20240705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e2ch6CN6/2ILQFX9s+8Go6wgcVOVLzjEhdIrftGsDFs=;
	b=PZCxoNrgopqO0OEo+W6tMrAnRZ+AuqpbidZmuFsKTnMg/5EKUjDPW6oP59+3EIE0Lz9A3oXgCAcZIwJJfT50ZEsjko3q/E230dh6/SzMlQzWHeGWGgxoLfrqTB276eyWg1Y/+w3fvIpDVHtkZ/AvvY3M6t3fqBT5p0Kv+FkYj54=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:f5d17d95-63f1-4259-b6ee-ab2c8d2fab5f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:76061a0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1516d14c3aa411ef9daba96ee3f3cc8c-20240705
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 445394176; Fri, 05 Jul 2024 00:56:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jul 2024 15:55:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jul 2024 15:55:51 +0800
From: boy.wu <boy.wu@mediatek.com>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe
	<axboe@kernel.dk>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Boris Burkov <boris@bur.io>,
	<cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <iverlin.wang@mediatek.com>, Boy Wu
	<boy.wu@mediatek.com>
Subject: [PATCH] blk-cgroup: add spin_lock for u64_stats_update
Date: Fri, 5 Jul 2024 15:55:44 +0800
Message-ID: <20240705075544.11315-1-boy.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_005633_830578_77E24751 
X-CRM114-Status: GOOD (  10.25  )
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

In 32bit SMP systems, if the system is stressed on the sys node
by processes, it may cause blkcg_fill_root_iostats to have a concurrent
problem on the seqlock in u64_stats_update, which will cause a deadlock 
on u64_stats_fetch_begin in blkcg_print_one_stat.

To prevent this problem, add spin_locks.

Fixes: ef45fe470e1e ("blk-cgroup: show global disk stats in root cgroup io.stat")
Signed-off-by: Boy Wu <boy.wu@mediatek.com>
---
 block/blk-cgroup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 37e6cc91d576..a633b7431e91 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1134,9 +1134,15 @@ static void blkcg_fill_root_iostats(void)
 				cpu_dkstats->sectors[STAT_DISCARD] << 9;
 		}
 
+#if BITS_PER_LONG == 32
+		spin_lock_irq(&blkg->q->queue_lock);
+#endif
 		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
 		blkg_iostat_set(&blkg->iostat.cur, &tmp);
 		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
+#if BITS_PER_LONG == 32
+		spin_unlock_irq(&blkg->q->queue_lock);
+#endif
 	}
 }
 
-- 
2.18.0


