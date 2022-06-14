Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0275FC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl9qfbAWDTQYZ8mjozrV3ZECuChnOxt0xkU4vuwNBDA=; b=4+xypHJLyKGPLu
	gQt9CwDWgXwbRfplLstdU0oCRsOnoYxmy1AZpxzM58u/M6rtMViBeZW8TXnrwdohxnWeoTdyCGIDM
	q7WP3vX8HdiHL6f78oCd+dOVk2pnDPDxIAXIwcUfwqbCEJgv/oxN7FXx+7kHX5XU5eBaGJhonBzb4
	e2wj6PWdYZY8uS/yhKT6ndKE8BsjejiEUvsWCeiKyFW8ZaNQ87Y8WhgnXNJzH9bVrlYZb/8C0yqDe
	tnNafBaGLQV+Rxye2tfSnaX10ytlYS8DSJ6kiQccbddRJttbwKNjB5ayfLCAF42ZRbrvdtIMTFQvj
	w7ZxyWCgziL2pdDytxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15c1-009V4z-Ft; Tue, 14 Jun 2022 12:25:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15Ws-009SIY-J6; Tue, 14 Jun 2022 12:20:19 +0000
X-UUID: 67af7096e68d48c3a1ba95d29c5dd35d-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2c9c396c-a9bf-4d13-9de6-4ca64a756c25,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:97256ac5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 67af7096e68d48c3a1ba95d29c5dd35d-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2069754375; Tue, 14 Jun 2022 05:20:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 05:10:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 20:10:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 20:10:08 +0800
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
Subject: [RESEND V3,2/8] media: mtk-jpegdec: export jpeg decoder functions
Date: Tue, 14 Jun 2022 20:09:58 +0800
Message-ID: <20220614121004.31616-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614121004.31616-1-irui.wang@mediatek.com>
References: <20220614121004.31616-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_052018_660536_ECA6C77C 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

mtk jpeg decoder is built as a module, export some functions to make them
visible by other modules.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 1e3852295f2f..d2f25f43e852 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -189,6 +189,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_fill_param);
 
 u32 mtk_jpeg_dec_get_int_status(void __iomem *base)
 {
@@ -200,6 +201,7 @@ u32 mtk_jpeg_dec_get_int_status(void __iomem *base)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_get_int_status);
 
 u32 mtk_jpeg_dec_enum_result(u32 irq_result)
 {
@@ -216,11 +218,13 @@ u32 mtk_jpeg_dec_enum_result(u32 irq_result)
 
 	return MTK_JPEG_DEC_RESULT_ERROR_UNKNOWN;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_enum_result);
 
 void mtk_jpeg_dec_start(void __iomem *base)
 {
 	writel(0, base + JPGDEC_REG_TRIG);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_start);
 
 static void mtk_jpeg_dec_soft_reset(void __iomem *base)
 {
@@ -240,6 +244,7 @@ void mtk_jpeg_dec_reset(void __iomem *base)
 	mtk_jpeg_dec_soft_reset(base);
 	mtk_jpeg_dec_hard_reset(base);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
 
 static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
 					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
@@ -408,3 +413,4 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 				   config->dma_last_mcu);
 	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_config);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
