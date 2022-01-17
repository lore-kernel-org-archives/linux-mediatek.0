Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D094DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvYwpL0Fa1nghlFTDMaf2ssNrm1hikMViDOzXSQbKCc=; b=Bs6m/VoxOkax+t
	v9ZSPlupgF+WA9JMbB48f3y75I6nA7FtKjm7pFQXO0gpHonjDlLqbvUSi8m1FnGXyr1wYF+9/UEex
	tw0j0b3h0NlCCbT0jKi2wN0inVApwYCNm8MZDyL/vr399dik5MbYMDneJa8NANTCkIeCnQg1Cmm1f
	1y7skWlDEfQpjwjxvtdxtnkD843tH3rzMn/f0BQUV+/zTyEXZ1LBcB8Lm5vAq9VwTTDz/TC8bIZhT
	gaKDA9DYdTH+0qLGPKb+o65v2lP/AIWdBJKWz1/lnh4u5/J0mYLXtEn/lg82jUAXGIXEDnh4p/cNj
	kA8A1wkIaTfokn5jgm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Qr3-00EoSx-Un; Mon, 17 Jan 2022 12:11:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Qr0-00EoR8-N4; Mon, 17 Jan 2022 12:11:20 +0000
X-UUID: 939ac5945662418786dad685ed9be9a0-20220117
X-UUID: 939ac5945662418786dad685ed9be9a0-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 524940368; Mon, 17 Jan 2022 05:11:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 04:06:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 20:06:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 20:06:25 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,
 01/10] media: mtk-vcodec: Use core type to indicate h264 and vp8 enc
Date: Mon, 17 Jan 2022 20:06:06 +0800
Message-ID: <20220117120615.21687-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117120615.21687-1-irui.wang@mediatek.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_041118_766465_89B409BC 
X-CRM114-Status: GOOD (  15.90  )
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
index cd2939b47790..f78463ff4551 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -419,7 +419,7 @@ struct mtk_vcodec_dec_pdata {
  * @num_capture_formats: number of entries in capture_formats
  * @output_formats: array of supported output formats
  * @num_output_formats: number of entries in output_formats
- * @core_id: stand for h264 or vp8 encode index
+ * @core_type: stand for h264 or vp8 encode
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -429,7 +429,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_capture_formats;
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
-	int core_id;
+	int core_type;
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 3ac6969c54c0..1f950310a3fb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -95,11 +95,13 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
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
@@ -266,10 +268,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
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
 
@@ -287,8 +289,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
@@ -357,7 +359,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
-		       dev->venc_pdata->core_id, vfd_enc->num);
+		       dev->venc_pdata->core_type, vfd_enc->num);
 
 	return 0;
 
@@ -384,7 +386,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 60000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
@@ -394,7 +396,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 9000000,
-	.core_id = VENC_LT_SYS,
+	.core_type = VENC_LT_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
@@ -405,7 +407,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
@@ -416,7 +418,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
-	.core_id = VENC_SYS,
+	.core_type = VENC_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
@@ -427,7 +429,7 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
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
