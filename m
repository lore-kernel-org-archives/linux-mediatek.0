Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E698C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 02:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn2kibkOu2BpBaNvPK5fRP0sBK77AQfIg4Roa4SkH2Q=; b=JAoGfwVJnfLh7EokvURQpj7AqT
	q5ELNdigfPD92+fjEo8OKtTy+feEcwrR2JaltjF81dm+3nLc8chaQQhwMwhpKHNdlEdaiHdLPePIx
	MCZpYBIVzgWqhXrVCr0eeCTD+wJ5AY0bMqTSnL5R3Og4lGfJ0h/1ARWoAviUDaBK5msH+Rb1zDNUD
	XregzcpgUOhd6cIx68dsB/Yffnw0WrtwKlSrugbwnWpfro9dl7U0R6Um/nZoGJ0qYqzX+wuXjEWn0
	8WkTWqchvTGrRkBDzbo8py0xFrQD/vGomEwwfCeGMejkDmy/Xitdfi9yJdovjgzk2svN/ISOyZogb
	gwGE4IEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSbM-00CjBA-Mc; Fri, 10 Mar 2023 02:35:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSbI-00Cj86-MN; Fri, 10 Mar 2023 02:35:22 +0000
X-UUID: 2f0b0eeabeec11eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Gn2kibkOu2BpBaNvPK5fRP0sBK77AQfIg4Roa4SkH2Q=;
	b=raurEclSv+Ye/jKWsVHLEaz6mzgfxr4rRaaeC4F+UMUQVQ10wUegyvwD6T33c8DHvTJqXdM4+LDoLlkldGxZF0tOZ1aOl4IqT4MhKfANjOeuZAH+5xE3VsMpR/lSjJy44rSmMj5kEtzv2IKjievmEnpNhpd58RnlRnj27zWczlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:fad55e2c-09f1-4a3d-a2e3-5cbdc9bb59c8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:22f7cab2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 2f0b0eeabeec11eda799af78a38f2b8e-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2067332723; Thu, 09 Mar 2023 19:35:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 10:35:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 10:35:10 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [V2,6/7] media: mtk-jpeg: refactor some variables
Date: Fri, 10 Mar 2023 10:35:00 +0800
Message-ID: <1678415701-1691-7-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
References: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_183520_765780_F8AF2F15 
X-CRM114-Status: GOOD (  17.60  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Refactor some variables to reduce redundancy
and optimize the initialization process.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 31 ++++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 18 ++++-------
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 16 +++-------
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 16 +++-------
 4 files changed, 37 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e89195f1989c..ab06c1ee80d4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1004,8 +1004,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 retry_select:
 	hw_id = mtk_jpegenc_get_hw(ctx);
 	if (hw_id < 0) {
-		ret = wait_event_interruptible(jpeg->enc_hw_wq,
-					       atomic_read(&jpeg->enchw_rdy) > 0);
+		ret = wait_event_interruptible(jpeg->hw_wq,
+					       atomic_read(&jpeg->hw_rdy) > 0);
 		if (ret != 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
 			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
 				__func__, __LINE__);
@@ -1016,7 +1016,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto retry_select;
 	}
 
-	atomic_dec(&jpeg->enchw_rdy);
+	atomic_dec(&jpeg->hw_rdy);
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	if (!src_buf)
 		goto getbuf_fail;
@@ -1073,7 +1073,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 getbuf_fail:
-	atomic_inc(&jpeg->enchw_rdy);
+	atomic_inc(&jpeg->hw_rdy);
 	mtk_jpegenc_put_hw(jpeg, hw_id);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
@@ -1198,8 +1198,8 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 retry_select:
 	hw_id = mtk_jpegdec_get_hw(ctx);
 	if (hw_id < 0) {
-		ret = wait_event_interruptible_timeout(jpeg->dec_hw_wq,
-						       atomic_read(&jpeg->dechw_rdy) > 0,
+		ret = wait_event_interruptible_timeout(jpeg->hw_wq,
+						       atomic_read(&jpeg->hw_rdy) > 0,
 						       MTK_JPEG_HW_TIMEOUT_MSEC);
 		if (ret != 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
 			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
@@ -1211,7 +1211,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto retry_select;
 	}
 
-	atomic_dec(&jpeg->dechw_rdy);
+	atomic_dec(&jpeg->hw_rdy);
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	if (!src_buf)
 		goto getbuf_fail;
@@ -1290,7 +1290,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 getbuf_fail:
-	atomic_inc(&jpeg->dechw_rdy);
+	atomic_inc(&jpeg->hw_rdy);
 	mtk_jpegdec_put_hw(jpeg, hw_id);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
@@ -1710,6 +1710,8 @@ static int mtk_jpeg_single_core_init(struct platform_device *pdev,
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
+	struct device_node *child;
+	int num_child = 0;
 	int ret;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
@@ -1733,6 +1735,19 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 			v4l2_err(&jpeg->v4l2_dev, "mtk_jpeg_single_core_init failed.");
 			return -EINVAL;
 		}
+	} else {
+		init_waitqueue_head(&jpeg->hw_wq);
+
+		for_each_child_of_node(pdev->dev.of_node, child)
+			num_child++;
+
+		atomic_set(&jpeg->hw_rdy, num_child);
+
+		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+							  WQ_MEM_RECLAIM
+							  | WQ_FREEZABLE);
+		if (!jpeg->workqueue)
+			return -EINVAL;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 83cf35a12b7a..89242e407dc9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -203,14 +203,11 @@ struct mtk_jpegdec_comp_dev {
  * @job_timeout_work:	IRQ timeout structure
  * @variant:		driver variant to be used
  * @reg_encbase:	jpg encode register base addr
- * @enc_hw_dev:		jpg encode hardware device
- * @enc_hw_wq:		jpg encode wait queue
- * @enchw_rdy:		jpg encode hw ready flag
+ * @enc_hw_dev:	jpg encode hardware device
+ * @hw_wq:		jpg wait queue
+ * @hw_rdy:		jpg hw ready flag
  * @reg_decbase:	jpg decode register base addr
- * @dec_hw_dev:		jpg decode hardware device
- * @dec_hw_wq:		jpg decode wait queue
- * @dec_workqueue:	jpg decode work queue
- * @dechw_rdy:		jpg decode hw ready flag
+ * @dec_hw_dev:	jpg decode hardware device
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -227,14 +224,11 @@ struct mtk_jpeg_dev {
 
 	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
 	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
-	wait_queue_head_t enc_hw_wq;
-	atomic_t enchw_rdy;
+	wait_queue_head_t hw_wq;
+	atomic_t hw_rdy;
 
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
-	wait_queue_head_t dec_hw_wq;
-	struct workqueue_struct	*dec_workqueue;
-	atomic_t dechw_rdy;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 5b47bd83c5ce..b7c2de2489b0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -503,8 +503,8 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
-	atomic_inc(&master_jpeg->dechw_rdy);
-	wake_up(&master_jpeg->dec_hw_wq);
+	atomic_inc(&master_jpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
 }
@@ -551,8 +551,8 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
-	wake_up(&master_jpeg->dec_hw_wq);
-	atomic_inc(&master_jpeg->dechw_rdy);
+	wake_up(&master_jpeg->hw_wq);
+	atomic_inc(&master_jpeg->hw_rdy);
 
 	return IRQ_HANDLED;
 }
@@ -608,20 +608,12 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	dev->dev = &pdev->dev;
 
-	init_waitqueue_head(&master_dev->dec_hw_wq);
-	master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-							WQ_MEM_RECLAIM
-							| WQ_FREEZABLE);
-	if (!master_dev->workqueue)
-		return -EINVAL;
-
 	ret = devm_add_action_or_reset(&pdev->dev,
 				       mtk_jpegdec_destroy_workqueue,
 				       master_dev->workqueue);
 	if (ret)
 		return ret;
 
-	atomic_set(&master_dev->dechw_rdy, MTK_JPEGDEC_HW_MAX);
 	spin_lock_init(&dev->hw_lock);
 	dev->hw_state = MTK_JPEG_HW_IDLE;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index c2bc0b531b32..e35ee1bdce3d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -248,8 +248,8 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
-	atomic_inc(&master_jpeg->enchw_rdy);
-	wake_up(&master_jpeg->enc_hw_wq);
+	atomic_inc(&master_jpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
 }
@@ -288,8 +288,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
-	wake_up(&master_jpeg->enc_hw_wq);
-	atomic_inc(&master_jpeg->enchw_rdy);
+	wake_up(&master_jpeg->hw_wq);
+	atomic_inc(&master_jpeg->hw_rdy);
 
 	return IRQ_HANDLED;
 }
@@ -340,14 +340,6 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	dev->dev = &pdev->dev;
 
-	init_waitqueue_head(&master_dev->enc_hw_wq);
-	master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-							WQ_MEM_RECLAIM
-							| WQ_FREEZABLE);
-	if (!master_dev->workqueue)
-		return -EINVAL;
-
-	atomic_set(&master_dev->enchw_rdy, MTK_JPEGENC_HW_MAX);
 	spin_lock_init(&dev->hw_lock);
 	dev->hw_state = MTK_JPEG_HW_IDLE;
 
-- 
2.18.0


