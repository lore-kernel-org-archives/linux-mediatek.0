Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB64C11F68
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:35:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389FD61D01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389FD61D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPFkx61usvNVnxJlYAXdcdrB0GmS30ck7HqF/jdKNUo=; b=XytLfZEcVl2DYX
	30XbQVb4xSfIJM/agJfaG3006tBBCyqp3amZkSzymzTS/3P2VuLcpBqOWenXEoujUasc1U/fL/Xx5
	jRr1XV4zqZspVWGm+AWMBQ44pdiYmCQORBY3yZpbklqM66KDLgBF2qJeEr29wSNuyWAvakuzx2o67
	DirA65sbOnOBCyJ8loknYEQsHWuefyyr2Ab3cSKx3c7i5zBrl9qtLBWHFksJMFbsR2qDKMgboqmVV
	8d0Hn4TbOlW/LhovT/27a2rplt13xN9PIJLDZKrjNC3EBYyqrCQhVCz8S3yrJrsZ8Ozl92T4VeGQY
	y5tVQfOhUQgJ2IPwdM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUkV-00D6EQ-90; Wed, 30 Jun 2021 07:35:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUht-00D4xP-P5; Wed, 30 Jun 2021 07:32:27 +0000
X-UUID: bba198cfac0647d098ee7fb188cc5c49-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SIbgN7GmtKCTtm3mefhLSWTOwkQvXNdFdtqSR/57TO8=; 
 b=QOD3M/S0sPkLoGrxK2kfv1+mN95M0/1oIxU/hm2B+MPMoB3Fp+cLIujdDsW6T2o/0LburSG6n1DryLVGoqhuEcX5fWiP3a0KsBblOSSLebRU7sVukqk/IKPna9x9+Bq267sCiOwkT+0BYvZDYHJF2EYNvZMu0AnizTcKlV5B73s=;
X-UUID: bba198cfac0647d098ee7fb188cc5c49-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1500508680; Wed, 30 Jun 2021 00:32:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:07 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2,2/9] media: mtk-jpegenc: Add MT8195 JPEG venc driver
Date: Wed, 30 Jun 2021 15:27:52 +0800
Message-ID: <1625038079-25815-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003225_871527_CDDBE7FA 
X-CRM114-Status: GOOD (  13.98  )
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

Add MT8195 JPEG venc driver's compatible and device private data.
compatible = "mediatek,mt8195-jpgenc": this node would only register
jpgenc device node;
compatible = "mediatek,mt8195-jpgenc0": HW0 node, this node would not
register jpgenc device node, but register irq, init clk and power,
remmap register base and do other resource options;
compatible = "mediatek,mt8195-jpgenc1": HW1 node, just like HW0 node;

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 11 +++++------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  1 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bc..908aa1f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1524,13 +1524,13 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
-static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
+static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
+	.is_encoder	= true,
 	.clks = mtk_jpeg_clocks,
 	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
 	.formats = mtk_jpeg_enc_formats,
 	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
 	.qops = &mtk_jpeg_enc_qops,
-	.irq_handler = mtk_jpeg_enc_irq,
 	.hw_reset = mtk_jpeg_enc_reset,
 	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
 	.dev_name = "mtk-jpeg-enc",
@@ -1540,6 +1540,9 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
+	{	.compatible = "mediatek,mt8195-jpgenc",
+		.data = &mtk_jpegenc_drvdata,
+	},
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
@@ -1548,10 +1551,6 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt2701-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
 	},
-	{
-		.compatible = "mediatek,mtk-jpgenc",
-		.data = &mtk_jpeg_drvdata,
-	},
 	{},
 };
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 595f7f1..bdbd768 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -60,6 +60,7 @@ enum mtk_jpeg_ctx_state {
  * @cap_q_default_fourcc:	capture queue default fourcc
  */
 struct mtk_jpeg_variant {
+	bool is_encoder;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct mtk_jpeg_fmt *formats;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 1cf037b..3da1011 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -152,3 +152,15 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
+
+#if defined(CONFIG_OF)
+static const struct of_device_id mtk_jpegenc_hw_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgenc0",
+	},
+	{	.compatible = "mediatek,mt8195-jpgenc1",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
+#endif
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
