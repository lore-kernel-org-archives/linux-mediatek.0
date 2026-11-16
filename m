Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364F606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vRmveI//;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=SQEVYaFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Why6qDYmMlX4/ZRyAcMHiLUZgq9b+TZ7OL9nCqnt2qo=; b=vRmveI//MFLr/hgWcJhRq+lDDQ
	AT0ofCBJmIx8dux5xE/zRcLj/IjI4Ngo9ohRdQSQO2dteCQtv9rkOY5+7oVemF2Iiug6V+0fWU905
	t2EwYhCUW9PvoJ7JVn+w3fRAR4dshGrAGUue4laSqzIMLVzJKXwBrsgGO9/Buut6xFtwSupMahhxF
	Rk2hVbmzaTYbiL7SepOj3KX5HHLtfa2na7XBH1L3siX19GhppAuQji2T930lubU9enigkpSw+GPyh
	fnKY/4P74fejqHbp3q864yCceC5xs4u7ifNSLz/DWUK6tPj9ti+Ijnm2K4iSjcm1w1/88FVROK0kC
	yeKdjweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlcZ-00000000sfD-2gbP;
	Mon, 16 Nov 2026 01:34:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlc6-00000000sEW-2fcE;
	Mon, 16 Nov 2026 01:34:31 +0000
X-UUID: dba61aaee15d11f1afed4741b24580c9-20261115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Why6qDYmMlX4/ZRyAcMHiLUZgq9b+TZ7OL9nCqnt2qo=;
	b=SQEVYaFBS6MIPMV2FsQaMChq1UZI+6EPfK/gyHcqcI7AqrNdF5GPhiiQOHe+ftFNXX2owkx+/Btefi6FMuBtAdhpQfFWnnlkDvnSNXj9O1p6wVpBSUSw6kRMVw5HMVkAC5Gc2nFiKvtHQsHED1KbXfWBKQt37TYEX8A7aqYOJZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9abba085-a256-4ea2-bb70-d6ceebedb01b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:c8dc5666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dba61aaee15d11f1afed4741b24580c9-20261115
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340326373; Sun, 15 Nov 2026 18:34:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:24 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:23 +0800
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
Subject: [PATCH v19 13/13] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Mon, 16 Nov 2026 09:33:38 +0800
Message-ID: <20261116013402.1273016-14-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_173430_695694_1454C20B 
X-CRM114-Status: GOOD (  18.74  )
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
index b38feef2d..26c54ec63 100644
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
@@ -1602,6 +1603,22 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
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
@@ -1666,6 +1683,11 @@ retry_select:
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
@@ -1782,6 +1804,11 @@ retry_select:
 
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
@@ -1975,6 +2002,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
 	.support_34bit = true,
+	.support_smmu = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -2002,6 +2030,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
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


