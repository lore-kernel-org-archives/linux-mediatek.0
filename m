Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168FAC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANMKC6ZkFGtwmZlRf0rejmnqaZVDZSrENWv39ZoGVFk=; b=hei5IX+4pwqr30VNkhWd6iV9w5
	MeB9AoVKom6ULqjw0/IsSVjeSarfWBSuRlb8io6yg7AJrkNw1B3Onf5IEoENSMVPLsZotNp9gYZ5s
	vva+NWxvBNTLgStZdVEyuaoL9OT/2XVxw5ApfeikriZS6nws9u3MaVjG7+MwkAR33MzTB0nw0FpZl
	unFH6BFscq1tIvBwOe+s54Z9eieEcfTFelJyIsTcC4yzc1LMjjf67fqhw4eB40dBNLzTxeTNd0Vjz
	JBrxzWrpovVVoIu3Q3Azx9vL5Jp43aMdU940ad7CoA+Zg4pxVBsT0VD6Cqapkq2Tv54/Jd51ws8JY
	EKkjvZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockNO-003cGO-1Z; Mon, 26 Sep 2022 09:26:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockN3-003c7I-Ls; Mon, 26 Sep 2022 09:25:51 +0000
X-UUID: b2996b7f8d584c76aebff006e69ca9e1-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ANMKC6ZkFGtwmZlRf0rejmnqaZVDZSrENWv39ZoGVFk=;
	b=fSOnAcX2s0bC9OKwvqsjnYoukxEIunNGXI/hR7lSCNg//W8cMxqoRlUWsUBcgnsCIrmt1H8hxygsL2+5PIxEUslH5mfKelEU6qSLvKG+mci+NwhsLnAGqmxIJTPZunEKnCRGUYlajYNb+emZfr/DpCKEVH7ZStjXCp9gwdG+5ao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a419def7-9d38-4908-9082-2890a432d3ed,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:faf015a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b2996b7f8d584c76aebff006e69ca9e1-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 150211167; Mon, 26 Sep 2022 02:25:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 17:14:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 17:14:41 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tzung-Bi
 Shih <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, irui wang
	<irui.wang@mediatek.com>
Subject: [V15,04/15] mtk-jpegenc: add jpegenc timeout func interface
Date: Mon, 26 Sep 2022 17:14:22 +0800
Message-ID: <20220926091433.18633-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926091433.18633-1-irui.wang@mediatek.com>
References: <20220926091433.18633-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_022549_752344_10E9D33A 
X-CRM114-Status: GOOD (  13.93  )
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

Generalizes jpegenc timeout func interfaces to handle HW timeout.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 10 ++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 1e0ba466303b..98de83c9ea4c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+struct mtk_jpeg_hw_param {
+	struct vb2_v4l2_buffer *src_buffer;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct mtk_jpeg_ctx *curr_ctx;
+};
+
 enum mtk_jpegenc_hw_id {
 	MTK_JPEGENC_HW0,
 	MTK_JPEGENC_HW1,
@@ -99,6 +105,8 @@ struct mtk_jpegenc_clk {
  * @master_dev:		mtk_jpeg_dev device
  * @venc_clk:		jpeg encode clock
  * @jpegenc_irq:	jpeg encode irq num
+ * @job_timeout_work:	encode timeout workqueue
+ * @hw_param:		jpeg encode hw parameters
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -107,6 +115,8 @@ struct mtk_jpegenc_comp_dev {
 	struct mtk_jpeg_dev *master_dev;
 	struct mtk_jpegenc_clk venc_clk;
 	int jpegenc_irq;
+	struct delayed_work job_timeout_work;
+	struct mtk_jpeg_hw_param hw_param;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 3dcf83d6d95e..95812f60ab9f 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -185,6 +185,26 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_params);
 
+static void mtk_jpegenc_timeout_work(struct work_struct *work)
+{
+	struct delayed_work *dly_work = to_delayed_work(work);
+	struct mtk_jpegenc_comp_dev *cjpeg =
+		container_of(dly_work,
+			     struct mtk_jpegenc_comp_dev,
+			     job_timeout_work);
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	src_buf = cjpeg->hw_param.src_buffer;
+	dst_buf = cjpeg->hw_param.dst_buffer;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+
+	mtk_jpeg_enc_reset(cjpeg->reg_base);
+	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
+	pm_runtime_put(cjpeg->dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+}
+
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 {
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -196,6 +216,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegenc_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
 	if (irq_status)
@@ -276,6 +298,9 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 			master_dev->enc_hw_dev[i] = NULL;
 	}
 
+	INIT_DELAYED_WORK(&dev->job_timeout_work,
+			  mtk_jpegenc_timeout_work);
+
 	jpegenc_clk = &dev->venc_clk;
 
 	jpegenc_clk->clk_num = devm_clk_bulk_get_all(&pdev->dev,
-- 
2.18.0


