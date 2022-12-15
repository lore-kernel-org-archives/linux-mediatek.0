Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0944CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iUpXfVshjq64D/vPuflrKozWJV+i90PR4zI/zWYnb50=; b=2Dms3vGUxwwtcBxE/7rMMZh90u
	uh/CvKp+SUd0SYY26DfnfNfi3JV+i34/ZhzdAoP/puPH3UrEn+ts9Zh2m2/H3uH1iaZ9E7riR1GIJ
	A7FargTpOmv1OT5yiBjo1p1nlz+yTtaBPlBuBMpAPTrTcO+NpIhKd1G+u8S3zw+XqWKS+cNsqypDP
	GxYrcjilLH7ZqPUBWdpRsqP+ERvz/JAvm1z2d9duLEuYZSChFKaJRqJPqKPEC6nigeZp7Y/9IT9Bi
	YI5IOBCb7GV6mhxkB7DjMhZO/a1iecPqU064LLu07kLgcDiyG+KNrAm2ytogTjGiP5wwghA1G9+pd
	dG1+waow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kjL-008Q3t-Ck; Thu, 15 Dec 2022 09:40:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kjI-008Q0M-Je; Thu, 15 Dec 2022 09:40:42 +0000
X-UUID: b0a96a7270224f6f870ba8e13aa7a099-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iUpXfVshjq64D/vPuflrKozWJV+i90PR4zI/zWYnb50=;
	b=jyqgkHECrFtZvDyXc2sL0d9YgXcv2zMYyDqajCW/7BFuK7HPqvfdlf4MmlP1G29Jpa0QnJch8Aex+4octvRsK9FI0W/UTMBo9p3+FmUJS/IBI9UK0hUrozNGqPDZ2iYKJ/OLcv+8rRNzLqig8ow1dKw4U1jz1RS53F+xIZ75GK8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:798097ca-74c6-43f6-ba3b-4100a3eda32a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:e0cfadb4-d2e2-434d-b6d3-aeae88dfcc78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b0a96a7270224f6f870ba8e13aa7a099-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 773214972; Thu, 15 Dec 2022 02:40:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 17:30:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Dec 2022 17:30:28 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH] media: jpeg: refactor multi-hw judgement
Date: Thu, 15 Dec 2022 17:30:26 +0800
Message-ID: <20221215093026.12322-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_014040_669371_237504EF 
X-CRM114-Status: GOOD (  14.68  )
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

some chips have multi-hw, but others have only one,
modify the condition of multi-hw judgement

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c |  5 +++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 4a5c6415ad08..37db8b81a935 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1695,8 +1695,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		return -EINVAL;
  	}
 
-
-	if (list_empty(&pdev->dev.devres_head)) {
+	if (!jpeg->variant->hw_arch) {
 		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
 				  mtk_jpeg_job_timeout_work);
 
@@ -1890,6 +1889,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1901,6 +1901,7 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
 };
 
 #if defined(CONFIG_OF)
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index b9126476be8f..ec04a8ce73cf 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -46,6 +46,16 @@ enum mtk_jpeg_ctx_state {
 	MTK_JPEG_SOURCE_CHANGE,
 };
 
+/**
+ * enum mtk_jpeg_hw_arch - arch of the jpeg hw
+ * @MTK_JPEG_HW_SINGLE_CORE:	jpeg hw is single core
+ * @MTK_JPEG_HW_MULTI_CORE:		jpeg hw is mluti-core
+ */
+enum mtk_jpeg_hw_arch {
+	MTK_JPEG_HW_SINGLE_CORE = 0,
+	MTK_JPEG_HW_MULTI_CORE = 1,
+};
+
 /**
  * struct mtk_jpeg_variant - mtk jpeg driver variant
  * @clks:			clock names
@@ -60,6 +70,7 @@ enum mtk_jpeg_ctx_state {
  * @ioctl_ops:			the callback of jpeg v4l2_ioctl_ops
  * @out_q_default_fourcc:	output queue default fourcc
  * @cap_q_default_fourcc:	capture queue default fourcc
+ * @hw_arch:            mark jpeg hw arch
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -74,6 +85,7 @@ struct mtk_jpeg_variant {
 	const struct v4l2_ioctl_ops *ioctl_ops;
 	u32 out_q_default_fourcc;
 	u32 cap_q_default_fourcc;
+	enum mtk_jpeg_hw_arch hw_arch;
 };
 
 struct mtk_jpeg_src_buf {
-- 
2.18.0


