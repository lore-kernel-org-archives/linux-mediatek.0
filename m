Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B37606A33F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K01noY3d;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=SQzrzX0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7SJhw7B5t++PSBvuJHvqSoJ7Oym3XNhYCd6XlJOAubg=; b=K01noY3dfSCeMpEeDYXLpUS0II
	qJ9qNoiX73IM8fBPjPrI/2PQNNv9pvxy3EAbCZ5/einldS2Z57HNP55QV6nwjk8jxh/oM7Uhr2iTj
	h/ltGPfVIBO2mQIS8kdctD+HoZMewKsfzk6RfsNeobsxuU5vRtBovtCkSdweVESzNpPxt1hQCv5wD
	zlivvX45vLNnENkVtUf9lUXM2AjNzI/KzU+Yajquz/jsNsOrLTw0IvOa5Zw8tbAHToG1Xt2FJS+ru
	UT7Ex7GwUW7U9vC/Q/Fl78VALigx+aAQNcNHweMe27isK/dxeuXoUnrkpvfSXGkgnYy7Ie0Dim1xe
	KP2Wt+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6L4-00000008c6O-2V9H;
	Wed, 25 Nov 2026 06:18:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6J9-00000008YrG-3gbi;
	Wed, 25 Nov 2026 06:16:53 +0000
X-UUID: c5f0495ae89711f1afed4741b24580c9-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7SJhw7B5t++PSBvuJHvqSoJ7Oym3XNhYCd6XlJOAubg=;
	b=SQzrzX0Uik9rbZNLXQAL5V3p3lR6UNKCpU044IbfNz8VCEC1aBQo5aFaIesj0zUAV+l+tmf8K7TDzTmysXhW8/XAvlbA+3tx/a4O29/ihAUH7yLBZJzqxbVHLVWZE4XgHAwmOEQ2lfkx5IrXTTEzKOhpnsjHr+3yHn9y5QQxmDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7cccbfb4-23af-4e86-9d97-4d700acb22d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a2937e4e-207c-4400-a70f-7c2d09e2f912,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5f0495ae89711f1afed4741b24580c9-20261124
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1491695478; Tue, 24 Nov 2026 23:16:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:35 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:35 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v20 15/15] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Wed, 25 Nov 2026 14:16:18 +0800
Message-ID: <20261125061618.2544386-16-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221644_022898_9E765D12 
X-CRM114-Status: GOOD (  19.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Configure the JPEG decoder and encoder SMMU stream IDs through the
dedicated MT8196 JPEG SMMU configuration syscon.

Complete failure-prone SMMU initialization before reserving hw_index
and publishing child pointers and register bases. Failed or deferred
probes then leave parent bookkeeping unchanged.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 15 ++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 26 ++++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 26 ++++++++++++++++-
 4 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 31a0fbc07..5d3242a1c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -15,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <media/v4l2-event.h>
@@ -1610,6 +1611,22 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	return IRQ_HANDLED;
 }
 
+static void mtk_jpeg_set_smmu_sid(struct regmap *smmu_regmap, unsigned int sid)
+{
+	if (sid == JPG_REG_GUSER_ID_DEC_SID)
+		regmap_update_bits(smmu_regmap, JPEG_DEC_SMMU_SID,
+				   JPG_REG_GUSER_ID_MASK <<
+				   JPG_REG_DEC_GUSER_ID_SHIFT,
+				   JPG_REG_GUSER_ID_DEC_SID <<
+				   JPG_REG_DEC_GUSER_ID_SHIFT);
+	else
+		regmap_update_bits(smmu_regmap, JPEG_ENC_SMMU_SID,
+				   JPG_REG_GUSER_ID_MASK <<
+				   JPG_REG_ENC_GUSER_ID_SHIFT,
+				   JPG_REG_GUSER_ID_ENC_SID <<
+				   JPG_REG_ENC_GUSER_ID_SHIFT);
+}
+
 static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
@@ -1674,6 +1691,11 @@ retry_select:
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu && comp_jpeg[hw_id]->smmu_regmap)
+		mtk_jpeg_set_smmu_sid(comp_jpeg[hw_id]->smmu_regmap,
+				      JPG_REG_GUSER_ID_ENC_SID);
+
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1790,6 +1812,11 @@ retry_select:
 
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu && comp_jpeg[hw_id]->smmu_regmap)
+		mtk_jpeg_set_smmu_sid(comp_jpeg[hw_id]->smmu_regmap,
+				      JPG_REG_GUSER_ID_DEC_SID);
+
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
@@ -1983,6 +2010,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
 	.support_34bit = true,
+	.support_smmu = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -2010,6 +2038,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
 	.support_34bit = true,
+	.support_smmu = true,
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 148fd4175..186cd1862 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
@@ -34,6 +35,14 @@
 
 #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
 
+#define JPEG_DEC_SMMU_SID				0
+#define JPEG_ENC_SMMU_SID				0
+#define JPG_REG_GUSER_ID_MASK			0x7
+#define JPG_REG_GUSER_ID_DEC_SID		0x4
+#define JPG_REG_GUSER_ID_ENC_SID		0x5
+#define JPG_REG_DEC_GUSER_ID_SHIFT		8
+#define JPG_REG_ENC_GUSER_ID_SHIFT		4
+
 #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
 
 /**
@@ -65,6 +74,7 @@ enum mtk_jpeg_ctx_state {
  * @multi_core:		mark jpeg hw is multi_core or not
  * @jpeg_worker:		jpeg dec or enc worker
  * @support_34bit:	flag to check support for 34-bit DMA address
+ * @support_smmu:	flag to check if support smmu
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -82,6 +92,7 @@ struct mtk_jpeg_variant {
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
+	bool support_smmu;
 };
 
 struct mtk_jpeg_src_buf {
@@ -150,6 +161,7 @@ struct mtk_jpegdec_clk {
  * @hw_param:		jpeg encode hw parameters
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
+ * @smmu_regmap:	SMMU registers mapping
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -163,6 +175,7 @@ struct mtk_jpegenc_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
@@ -177,6 +190,7 @@ struct mtk_jpegenc_comp_dev {
  * @hw_param:			jpeg decode hw parameters
  * @hw_state:			record hw state
  * @hw_lock:			spinlock protecting hw
+ * @smmu_regmap:		SMMU registers mapping
  */
 struct mtk_jpegdec_comp_dev {
 	struct device *dev;
@@ -190,6 +204,7 @@ struct mtk_jpegdec_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 6b636ec63..508ed4ff5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -613,6 +613,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%pe)\n",
+				     dev->smmu_regmap);
+	}
+
+	return 0;
+}
+
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -660,10 +679,15 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to register JPEGDEC irq handler.\n");
 
+	dev->master_dev = master_dev;
+
+	ret = mtk_jpegdec_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	i = atomic_add_return(1, &master_dev->hw_index) - 1;
 	master_dev->dec_hw_dev[i] = dev;
 	master_dev->reg_decbase[i] = dev->reg_base;
-	dev->master_dev = master_dev;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index c2de272d7..8830480a4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -338,6 +338,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%pe)\n",
+				     dev->smmu_regmap);
+	}
+
+	return 0;
+}
+
 static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegenc_clk *jpegenc_clk;
@@ -383,10 +402,15 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev->master_dev = master_dev;
+
+	ret = mtk_jpegenc_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	i = atomic_add_return(1, &master_dev->hw_index) - 1;
 	master_dev->enc_hw_dev[i] = dev;
 	master_dev->reg_encbase[i] = dev->reg_base;
-	dev->master_dev = master_dev;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.51.0.windows.2


