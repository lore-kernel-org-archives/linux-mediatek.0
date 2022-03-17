Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C6FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae4lDMeXIC+4fhbnkQ5JpLVKbaCR5Z8I1UsUzFfzMNg=; b=zknlNwOnl862lQ
	tBHrDqs4/cir5ajizBRVI3M7wXzZgw71TN049em1LG/kFRxEl+sMHCheQBpVygV4HupJoRniDsf2j
	b2/6H4JhBwlArTQQUSdSrPw3B2EIkZayDWEWENG0z/JgrxET3rfb4IMJT/U4NV5C9D+T+rJqULKca
	MzL+YmfhYZqcfPfuy9Dqiz1HI/mquRC9lIkVN5NNovgpNSjatomZHIHZQjDrMa6E/8imJMZYZez0w
	BiuDA3gaPoNOurl6z8De3Gc3FidsQSkmqXCOT4wcFBGL/T8073DB11EPssgChJJbEp0c+DsCF+UoL
	hdi2ZCJo2/1eeauURFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUlPs-00FIlv-Bx; Thu, 17 Mar 2022 08:23:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUlPi-00FIgD-7E; Thu, 17 Mar 2022 08:23:19 +0000
X-UUID: a9d7b79c06be43b2b095b52ddfde0d03-20220317
X-UUID: a9d7b79c06be43b2b095b52ddfde0d03-20220317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 635571992; Thu, 17 Mar 2022 01:23:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 01:23:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 16:22:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 16:22:57 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,
 01/10] media: mtk-vcodec: Use core type to indicate h264 and vp8 enc
Date: Thu, 17 Mar 2022 16:22:21 +0800
Message-ID: <20220317082230.23622-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317082230.23622-1-irui.wang@mediatek.com>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_012318_283586_C0E48BBA 
X-CRM114-Status: GOOD (  15.31  )
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

use core type variables to indicate h264 and vp8 encoder

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 +--
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 30 ++++++++++---------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index ea58f11e7659..3affb2d4a4ec 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -416,7 +416,7 @@ struct mtk_vcodec_dec_pdata {
  * @num_capture_formats: number of entries in capture_formats
  * @output_formats: array of supported output formats
  * @num_output_formats: number of entries in output_formats
- * @core_id: stand for h264 or vp8 encode index
+ * @core_type: stand for h264 or vp8 encode
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -426,7 +426,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_capture_formats;
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
-	int core_id;
+	int core_type;
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 95e8c29ccc65..f12f887e4bdc 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -94,11 +94,13 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 	ctx = dev->curr_ctx;
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 
-	mtk_v4l2_debug(1, "id=%d coreid:%d", ctx->id, dev->venc_pdata->core_id);
-	addr = dev->reg_base[dev->venc_pdata->core_id] +
+	mtk_v4l2_debug(1, "id: %d core type: %d",
+		       ctx->id, dev->venc_pdata->core_type);
+
+	addr = dev->reg_base[dev->venc_pdata->core_type] +
 				MTK_VENC_IRQ_ACK_OFFSET;
 
-	ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_id] +
+	ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_type] +
 				(MTK_VENC_IRQ_STATUS_OFFSET));
 
 	clean_irq_status(ctx->irq_status, addr);
@@ -265,10 +267,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	dev->reg_base[dev->venc_pdata->core_id] =
+	dev->reg_base[dev->venc_pdata->core_type] =
 		devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
-		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
+	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_type])) {
+		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_type]);
 		goto err_res;
 	}
 
@@ -286,8 +288,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			       0, pdev->name, dev);
 	if (ret) {
 		dev_err(&pdev->dev,
-			"Failed to install dev->enc_irq %d (%d) core_id (%d)",
-			dev->enc_irq, ret, dev->venc_pdata->core_id);
+			"Failed to install dev->enc_irq %d (%d) core_type (%d)",
+			dev->enc_irq, ret, dev->venc_pdata->core_type);
 		ret = -EINVAL;
 		goto err_res;
 	}
@@ -356,7 +358,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
-		       dev->venc_pdata->core_id, vfd_enc->num);
+		       dev->venc_pdata->core_type, vfd_enc->num);
 
 	return 0;
 
@@ -382,7 +384,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 60000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
@@ -392,7 +394,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 9000000,
-	.core_id = VENC_LT_SYS,
+	.core_type = VENC_LT_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
@@ -403,7 +405,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
@@ -414,7 +416,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
@@ -425,7 +427,7 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
