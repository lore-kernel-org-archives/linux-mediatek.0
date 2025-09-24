Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF4CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JuWd/2s5XFtvX08/EO6boRjoZdxCUuQxZXV1IRduo/Y=; b=jr/BwCNFNpVtFmIcrccY/uVR75
	vVnvmVnMRjo/065jmTO05eT4KMd8Lndg6kdqYPViJu04Jhew+eX0JXWUqE2QTN+5XF+rUnDumSuHi
	xYLFTfhNxGct09r2aa9inNanTOc9gzdLO/xRsDr1Jvyk+p4OWQ8mwG4lUdAze9jirUQS9dwr3hH0W
	As6XRrxsKs+mg49rTxSfqxqRq/45cgeK2GFUmcaj6nvk2CiILsZFEeTXCNcn8PZX2AsuJ1bYOHW4t
	qLIeq+3bXWUOZ33MLZwUudxYqL9WsfztRmB/nY5ukublK7SatnOZoN8ajfKpy+y3s4zYzu0suqH0V
	OFCnwLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Lce-0000000G14r-1wUd;
	Wed, 24 Sep 2025 09:17:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Lcb-0000000G14W-3KEs
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:17:10 +0000
X-UUID: 3d1e90ac992711f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JuWd/2s5XFtvX08/EO6boRjoZdxCUuQxZXV1IRduo/Y=;
	b=WKJpWPSbL7MD9016DUmPU+wfrwb7Wo06i/7wLq4tz8L9QnvLiN/FDjj6ZNZr8iA5das6QT8oShY59youICpy54eWI8WQEI3vOBCHZ0J6KZ0JkFRGjh1aslODc1llj8a4ibihIJtpyCaQojbza/TKh+85AMsJjFubs3Uy9IkCwQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1d3b7a57-09f8-45c3-9cf4-c99bb671cf8c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:07f3e46c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3d1e90ac992711f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 945305091; Wed, 24 Sep 2025 02:17:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:17:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:17:02 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2] ufs: core: Change MCQ interrupt enable flow
Date: Wed, 24 Sep 2025 17:16:19 +0800
Message-ID: <20250924091701.2982410-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_021709_838554_B005BAE4 
X-CRM114-Status: GOOD (  15.59  )
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

Move the MCQ interrupt enable process to
ufshcd_mcq_make_queues_operational to ensure that interrupts
are set correctly when making queues operational, similar to
ufshcd_make_hba_operational. This change addresses the issue
where ufshcd_mcq_make_queues_operational was not fully
operational due to missing interrupt enablement.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 11 +++++++++++
 drivers/ufs/core/ufshcd.c  | 12 +-----------
 include/ufs/ufshcd.h       |  1 +
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index cc88aaa106da..c9bdd4140fd0 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -29,6 +29,10 @@
 #define MCQ_ENTRY_SIZE_IN_DWORD	8
 #define CQE_UCD_BA GENMASK_ULL(63, 7)
 
+#define UFSHCD_ENABLE_MCQ_INTRS	(UTP_TASK_REQ_COMPL |\
+				 UFSHCD_ERROR_MASK |\
+				 MCQ_CQ_EVENT_STATUS)
+
 /* Max mcq register polling time in microseconds */
 #define MCQ_POLL_US 500000
 
@@ -355,9 +359,16 @@ EXPORT_SYMBOL_GPL(ufshcd_mcq_poll_cqe_lock);
 void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 {
 	struct ufs_hw_queue *hwq;
+	u32 intrs;
 	u16 qsize;
 	int i;
 
+	/* Enable required interrupts */
+	intrs = UFSHCD_ENABLE_MCQ_INTRS;
+	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR)
+		intrs &= ~MCQ_CQ_EVENT_STATUS;
+	ufshcd_enable_intr(hba, intrs);
+
 	for (i = 0; i < hba->nr_hw_queues; i++) {
 		hwq = &hba->uhq[i];
 		hwq->id = i;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0735bd5df1cc..d1c2008d53c0 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -45,11 +45,6 @@
 				 UTP_TASK_REQ_COMPL |\
 				 UFSHCD_ERROR_MASK)
 
-#define UFSHCD_ENABLE_MCQ_INTRS	(UTP_TASK_REQ_COMPL |\
-				 UFSHCD_ERROR_MASK |\
-				 MCQ_CQ_EVENT_STATUS)
-
-
 /* UIC command timeout, unit: ms */
 enum {
 	UIC_CMD_TIMEOUT_DEFAULT	= 500,
@@ -369,7 +364,7 @@ EXPORT_SYMBOL_GPL(ufshcd_disable_irq);
  * @hba: per adapter instance
  * @intrs: interrupt bits
  */
-static void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
+void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
 {
 	u32 old_val = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
 	u32 new_val = old_val | intrs;
@@ -8927,16 +8922,11 @@ static int ufshcd_alloc_mcq(struct ufs_hba *hba)
 static void ufshcd_config_mcq(struct ufs_hba *hba)
 {
 	int ret;
-	u32 intrs;
 
 	ret = ufshcd_mcq_vops_config_esi(hba);
 	hba->mcq_esi_enabled = !ret;
 	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");
 
-	intrs = UFSHCD_ENABLE_MCQ_INTRS;
-	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR)
-		intrs &= ~MCQ_CQ_EVENT_STATUS;
-	ufshcd_enable_intr(hba, intrs);
 	ufshcd_mcq_make_queues_operational(hba);
 	ufshcd_mcq_config_mac(hba, hba->nutrs);
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index ea0021f067c9..d8e06de0afbb 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1292,6 +1292,7 @@ static inline void ufshcd_rmwl(struct ufs_hba *hba, u32 mask, u32 val, u32 reg)
 
 void ufshcd_enable_irq(struct ufs_hba *hba);
 void ufshcd_disable_irq(struct ufs_hba *hba);
+void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs);
 int ufshcd_alloc_host(struct device *, struct ufs_hba **);
 int ufshcd_hba_enable(struct ufs_hba *hba);
 int ufshcd_init(struct ufs_hba *, void __iomem *, unsigned int);
-- 
2.45.2


