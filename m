Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB8C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sRKxysxjSb6vd9BmQFjxPB5FjK5M6ELWtYx2iGXCQkE=; b=xu6YmTYI1aEZLANhN8P80gjaA4
	IO66KzpJZ6g4XDZUHZ9rf42yTneQgnJgeRCcJpi6xaEsJmUhMBlaWYfwMkaTU3KfDuR0bgJOc6Ucv
	M8baQ+3Ci1E42MH2OMKYohPNDlV1QcVO5n6gd+6z3flveyAPLkD7aqpxCeJdo/VEDfailPCOZvkll
	z+wL2yfbPqEJSdKpj+1L0r0ZiqKtnjIkIU9YOJUEuOJUDUrrVl5EecirZxH6vFUST4H3/wd8ZRs25
	KVEArvtfEaEekcGHr9Moiw3z6MITlCvT8aMOfzr+hDQMzkNqHs0bYiOEBveFiMl4E2trU2MzS7I7g
	ofed7qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQu0-002nJj-Mr; Wed, 28 Dec 2022 07:31:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQts-002nFN-4B; Wed, 28 Dec 2022 07:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=sRKxysxjSb6vd9BmQFjxPB5FjK5M6ELWtYx2iGXCQkE=; b=HYhgPNc5p6og73FpzKH89le3Ez
	Ke5jBn9Ytezw26E8hrZSyzutxhtsroP79hiDutSFYE+QfehvEsB6LS4NokS77dV4X4KCRxhs2TKXO
	rcMYZ0bwPCFTWEF/q5dZzlShP6St7EOZ8WToqYU0mvjF3SlF259grfMJrGT+xjmXiBpZNA6BPrafw
	YO08a/Vj77asaheyJvjuyO4jF7DqPukXQeA2sRE4RVDuOl7R8xvNGjeu2E44Ijkvem+F6diZiSlyV
	ZQN0L/WglXt4JrFiyUy2qavdsdoJOAUlFpSLNFxrgaZE2pxbfGLr0o0nQ2Kog6gHaBWSNiJVdGGIm
	vZKOVAeg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAQtl-00FvKK-06;
	Wed, 28 Dec 2022 07:30:51 +0000
X-UUID: 9852d4bf971f4c96b32494f2e87a5bbf-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sRKxysxjSb6vd9BmQFjxPB5FjK5M6ELWtYx2iGXCQkE=;
	b=hGH8fkgwPPfxK+Sxd0zDPBBoyI9kcRzFzXl+Aiv8rjnYcXLJ+Z3G0S5H4D31pwj4cfmid3AecRyRWYff4ZeWCm2h2/tEp/4+LqdVBr7Ku6ASSik9KCpa4n9WSBLlsT5jWEYd9a+WdOOSDykDSD2icwlbZSfysIwxwApn8G96hOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:70d773d3-e905-42d4-a845-6fc0e36f4b75,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:54510253-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9852d4bf971f4c96b32494f2e87a5bbf-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1912225227; Wed, 28 Dec 2022 00:30:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 15:00:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Dec 2022 15:00:08 +0800
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
Subject: [V3] media: jpeg: Fixes multi-hw judgement
Date: Wed, 28 Dec 2022 15:00:06 +0800
Message-ID: <20221228070006.11111-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_073049_783282_8C3E81F7 
X-CRM114-Status: GOOD (  15.60  )
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

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  4 +++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..9278fc356532 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1692,7 +1692,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (list_empty(&pdev->dev.devres_head)) {
+	if (!jpeg->variant->hw_arch) {
 		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
 				  mtk_jpeg_job_timeout_work);
 
@@ -1885,6 +1885,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1896,6 +1897,7 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
 };
 
 #if defined(CONFIG_OF)
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index b9126476be8f..ec04a8ce73cf 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
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


