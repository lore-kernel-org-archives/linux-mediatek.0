Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4498BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz88Syoy+G8j4J0n1mFi4xfGKZ7lBu4ZQMbzCmNOGoU=; b=TU+Olna53Ogh+nfYsCIa99GjrX
	ZoEMJGDF4gc07kLRxUDgQcTXPubThoa1gn5m0aibDjCDPvrvOg2GaKZ0KxzVAncPrno87ZgfkW/BG
	+bm1FgtLUacKxGEL/+FBVUMyfp2rKZnh6szCaalCUYrwKqdHIzq158IvXydTktQVE1L6sooh/Lme1
	wC8+KmuXGyrLNI5ts/Dv60sxlVz3/2b54dYK/5xlfT1Jf+lJRyvglZi8jTUr1KWWCt8PA+n/KCqY8
	MF3io2jKGmXIWUHzwClj7CfqqjhB1pSqKhN/0KAkkLW3lk4YetyLq1+eQN6yP+tStLJRvcoOnUFtW
	Gzt7yWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqKq-002GbU-52; Thu, 29 Sep 2022 10:00:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqKm-002GZJ-QA; Thu, 29 Sep 2022 10:00:02 +0000
X-UUID: 2ef21d9feead441bb40eaec25cd204a7-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hz88Syoy+G8j4J0n1mFi4xfGKZ7lBu4ZQMbzCmNOGoU=;
	b=KfdI6P4a/DL+YtSpEOvgFVZHPamnZmgPiQWIFmekl4g6g4Nj/BNANrXVOVXDeXc1G7z6/DlNfUTkU9PcglkQZ2dH5vrGpluF/Ct+qZNzE4RO8Ash/074fdoUR5HlbWZiYVuegCR8o/ul2tR9QMskeNZ524T6Eo3IylvTY8IlPxA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:11dbb8a1-a601-4c5b-b9d1-5036fc6593f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:a537a5e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2ef21d9feead441bb40eaec25cd204a7-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 797528979; Thu, 29 Sep 2022 02:59:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Sep 2022 17:08:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 17:08:20 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, irui wang
	<irui.wang@mediatek.com>
Subject: [V17,02/15] mtk-jpegenc: export jpeg encoder functions
Date: Thu, 29 Sep 2022 17:08:04 +0800
Message-ID: <20220929090817.24272-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929090817.24272-1-irui.wang@mediatek.com>
References: <20220929090817.24272-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_030000_887006_21D8962D 
X-CRM114-Status: GOOD (  11.27  )
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

mtk jpeg encoder is built as a module, export some functions to make them
visible by other modules.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 1cf037bf72dd..368f512ea86e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -36,12 +36,14 @@ void mtk_jpeg_enc_reset(void __iomem *base)
 	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
 	writel(0, base + JPEG_ENC_CODEC_SEL);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
 
 u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
 {
 	return readl(base + JPEG_ENC_DMA_ADDR0) -
 	       readl(base + JPEG_ENC_DST_ADDR0);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
 
 void mtk_jpeg_enc_start(void __iomem *base)
 {
@@ -51,6 +53,7 @@ void mtk_jpeg_enc_start(void __iomem *base)
 	value |= JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
 	writel(value, base + JPEG_ENC_CTRL);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_enc_start);
 
 void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
 			  struct vb2_buffer *src_buf)
@@ -67,6 +70,7 @@ void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
 			writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
 
 void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
 			  struct vb2_buffer *dst_buf)
@@ -86,6 +90,7 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
 	writel(dma_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
 	writel((dma_addr + size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_dst);
 
 void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 {
@@ -152,3 +157,4 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_params);
-- 
2.18.0


