Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3192C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 12:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUNzgkYUdlg97Xg1DWlY6DkYG/MLU3DTrxW8HL5kN9o=; b=kV9jsKD9IjiV+d
	QJL9JaBQGhtLbwbMyfx82jTiz6CYWW3kCBQVPICUr6peip4mwzvLzgwe1aUy4uYoHvXvIE0lBDBA8
	OwP0fe7yx+zfKlXvTGPH57k7bWkV3kqOIu6zj54HmpfPhb60va1a1jvi8sKPCYgWlklNYkZ0xrNvx
	ixCbSekmH7SSmW4Qu2DMZohnAPWkP58kxTd5yZ1FXvunrY5OZomTWi7KLcGc2ntNtkIeVCQhpw5bO
	akTTyGYuCef/7J2mN6G3/ynq+ucMC+19vD4jOIF1mELtcfJ2+6Aiz5mGGsn4Zdc2Vk5FZWCFWxqny
	HSEAW58ZKuypW+4tBJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15UP-009QgA-Gl; Tue, 14 Jun 2022 12:17:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15TY-009QEk-RG; Tue, 14 Jun 2022 12:16:54 +0000
X-UUID: e0adc41fe2e54228afa2691673f0ccb6-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0f7ac514-32d5-4bbf-b5fa-ac9e348681f2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:87116ac5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e0adc41fe2e54228afa2691673f0ccb6-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1911688004; Tue, 14 Jun 2022 05:16:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 05:10:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 20:10:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 20:10:28 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [RESEND V9,2/7] mtk-jpegenc: export jpeg encoder functions
Date: Tue, 14 Jun 2022 20:10:19 +0800
Message-ID: <20220614121024.31667-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614121024.31667-1-irui.wang@mediatek.com>
References: <20220614121024.31667-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_051652_907921_8B105BBA 
X-CRM114-Status: GOOD (  10.73  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

mtk jpeg encoder is built as a module, export some functions to make them
visible by other modules.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 1cf037bf72dd..a2b6e1f85c2d 100644
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
@@ -152,3 +157,5 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_params);
+
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
