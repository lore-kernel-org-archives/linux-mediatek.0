Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D53AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RayBIx8fpgv/JRMfqcE3Iv+08TaIj0FKXAYZOJDnL4=; b=swqzzTQfRufZFnUJBi36zHknbO
	JhmTyi4ZASTZ04Ha5UtrvtkJWdLy1P4d5SIaznkV5W3MZT6+dzbQCEA1W5B3N9w+pWz9hScrJBP5p
	u19NrIknjF4J9NBDyBoXQIzFs1XZEnxSt53PWUlfL6Bo/hLKMCWNslRf0UwjSBflDqqRHWVxm72eR
	bHULMi4vPQujfh2dWOcVTZO4U0L85rRxxP3K5p4623TfZvNoEHQH9IOLHEusPmc06fgytFHO8CrvL
	l3GCxi0V1tMewbOc9RpXrtftImK0BOF2Wq7CIePoCZMSlGJbqlLYl8Mg1TjHLuccVMmlcl8JQWyKR
	dz7jruGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqLI-002GnL-CN; Thu, 29 Sep 2022 10:00:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqKy-002Gdl-MW; Thu, 29 Sep 2022 10:00:14 +0000
X-UUID: 352b9a2dadee4e57aaf204318fa997cd-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4RayBIx8fpgv/JRMfqcE3Iv+08TaIj0FKXAYZOJDnL4=;
	b=Um+Y2Z5nyhPW80hWOQ4Zmuvqzb8AVJTrZUBd6a4iTAug6n/T/lVBkNjkGRpxC5NWHTcobpGmxq/aRmu608bsVGrVaDkek7bV5biAgEl7iCnkiYJIXbfltTwFSNswp4QJaLr+eki5GzWGxcoLbYwysfnJ6vQ0hSBOxLXWfbNXqY0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e83f9bba-d5a0-4556-9d2f-a9662deb96fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c938a5e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 352b9a2dadee4e57aaf204318fa997cd-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1223203256; Thu, 29 Sep 2022 03:00:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 17:08:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 17:08:30 +0800
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
Subject: [V17,09/15] media: mtk-jpegdec: export jpeg decoder functions
Date: Thu, 29 Sep 2022 17:08:11 +0800
Message-ID: <20220929090817.24272-10-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929090817.24272-1-irui.wang@mediatek.com>
References: <20220929090817.24272-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_030012_781243_F17F6EFE 
X-CRM114-Status: GOOD (  10.15  )
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

mtk jpeg decoder is built as a module, export some functions to make them
visible by other modules.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
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


