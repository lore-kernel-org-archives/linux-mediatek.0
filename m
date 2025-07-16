Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D9C83F37
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMdcIbgS/Kfn/0jRu7ctJoX6wTuNanPSAdJZ/yPuPq0=; b=TSDrAYSs63Eyq5EMhAMgL5V2Ct
	LCgKnuStFgjGfEwBVmtViQ+f+3Nu3wVbqXd0ABwf5xtOycVa8P47XrdAnq/8kZ3xYey8H+ksj8kV1
	uuuy6Isj1emahuZHJTzVd4oLp/FeQkAi2gWsnNgUIzWP3vNkHIVFkSn92KJnOPHEHW3fHTsNGHlUV
	UBngASzIrY/TdQm+EpwXyYWGkGWAdz5L1VG8A5acVCNnH1lAJnL9KjHPbDPuJ3cUQh7x01TygnuDi
	RSvtoXQgIA/LH7iUUVBBaVPgyyPQ0TkvDwIYF227ksfN/jtKCGKUcwGDmcJ0VtAp3sHZJBMnGu/Yn
	XOXVobZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvvb-00000006vAy-14nU;
	Wed, 16 Jul 2025 06:47:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvdE-00000006tHP-0BQb
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 06:28:45 +0000
X-UUID: 1bc2946c620e11f09eb0dd999d3936bf-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eMdcIbgS/Kfn/0jRu7ctJoX6wTuNanPSAdJZ/yPuPq0=;
	b=P8TKktwNIc/Faf49TikOcUOYUfMXtW9l9BZ1b73FZGtwg2t0GR4kf5RPOi3h77PRzBH7bs05y8UvYcmU7VXJs8rGhJiE1zFRqP9Rmgnd9MXoM+4nbHDDA7cg1kqF6AXK40pSflMtkoSUqJ/oBOboXsEFr6MhTytGI4WPFM2wDgU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f1e971e1-c15a-44f1-829c-4a1301a49b20,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7c7e41d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1bc2946c620e11f09eb0dd999d3936bf-20250715
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 120375918; Tue, 15 Jul 2025 23:28:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 14:28:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 14:28:32 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 06/10] ufs: host: mediatek: Set IRQ affinity policy for MCQ mode
Date: Wed, 16 Jul 2025 14:25:31 +0800
Message-ID: <20250716062830.3712487-7-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716062830.3712487-1-peter.wang@mediatek.com>
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232844_106894_F1D1261F 
X-CRM114-Status: GOOD (  13.28  )
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

From: Peter Wang <peter.wang@mediatek.com>

This patch sets the IRQ affinity for MCQ mode to improve
performance. Specifically, it migrates the IRQ from CPU0 to
CPU3 to enhance IRQ handling efficiency.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 87c58f482f6e..fb3b93f8fed0 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -804,6 +804,46 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 	return ret;
 }
 
+static u32 ufs_mtk_mcq_get_irq(struct ufs_hba *hba, unsigned int cpu)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct blk_mq_tag_set *tag_set = &hba->host->tag_set;
+	struct blk_mq_queue_map	*map = &tag_set->map[HCTX_TYPE_DEFAULT];
+	unsigned int nr = map->nr_queues;
+	unsigned int q_index;
+
+	q_index = map->mq_map[cpu];
+	if (q_index > nr) {
+		dev_err(hba->dev, "hwq index %d exceed %d\n",
+			q_index, nr);
+		return MTK_MCQ_INVALID_IRQ;
+	}
+
+	return host->mcq_intr_info[q_index].irq;
+}
+
+static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
+{
+	unsigned int irq, _cpu;
+	int ret;
+
+	irq = ufs_mtk_mcq_get_irq(hba, cpu);
+	if (irq == MTK_MCQ_INVALID_IRQ) {
+		dev_err(hba->dev, "invalid irq. unable to bind irq to cpu%d", cpu);
+		return;
+	}
+
+	/* force migrate irq of cpu0 to cpu3 */
+	_cpu = (cpu == 0) ? 3 : cpu;
+	ret = irq_set_affinity(irq, cpumask_of(_cpu));
+	if (ret) {
+		dev_err(hba->dev, "set irq %d affinity to CPU %d failed\n",
+			irq, _cpu);
+		return;
+	}
+	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq, _cpu);
+}
+
 static void ufs_mtk_get_controller_version(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1533,6 +1573,13 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 {
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 	u16 mid = dev_info->wmanufacturerid;
+	unsigned int cpu;
+
+	if (hba->mcq_enabled) {
+		/* Iterate all cpus to set affinity for mcq irqs */
+		for (cpu = 0; cpu < nr_cpu_ids; cpu++)
+			ufs_mtk_mcq_set_irq_affinity(hba, cpu);
+	}
 
 	if (mid == UFS_VENDOR_SAMSUNG) {
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
-- 
2.45.2


