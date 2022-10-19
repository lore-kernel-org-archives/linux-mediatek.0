Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 02:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpGio/EV5mFj12MkStq+ZtNWOZ7KYN1GJgKcsHsBZJ0=; b=DLHmfadOtYziPcbmPyidcCdaCT
	J4hTCQjDCLCrDTiFN9lGA/iE7kBiKoMzaGyjkSEf8mTp6j1GWSvCsaNDrmhOFM/CH/tfCsvibUkh6
	eL8KzdufgXXYgMj17xJmO8n1KBnuWSCO0SqPoxx/1TcZvHOEoeAi6ERySReGLeSG6VtNyVleQjrv5
	8AI8HurjUs25O1dfXCjKWWrcoN72qqblXMB/RJIWnSdZ2PFj67f7Z+sbLNGc8f64AQjJSNrcJuUzE
	5uz6vbSC+3P0lyUYOxedOAGH1iuI9eI0iyBUN/zd6JQm01qpFyTnJjzGVMh4LOalfmUH13JUmaJs+
	CqkvN+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzD4-00E1AL-JO; Wed, 19 Oct 2022 02:53:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzCj-00E0Ql-H1; Wed, 19 Oct 2022 02:53:15 +0000
X-UUID: 1e4072e898cd4056b9aece8893d4c0a8-20221018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QpGio/EV5mFj12MkStq+ZtNWOZ7KYN1GJgKcsHsBZJ0=;
	b=dJng+F4xGwUYlVXm6CWBft6t6Y9eErzUgDeehhVn2GFCAiqJYGrZL93aLNrkIqRravGYWUOlYQSvWVo6pK6+z56K75QQFpc9+WoZxk9Yf8u9B/cbXrsxELzfLUbeXg73PzFlW+w7SJfWOXFLLzC/WkfjuoOJqbzy8ThN6V9I0JE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b8959f6d-fdf1-4d45-96b9-60d5ff886d5c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:d9ba3ba3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1e4072e898cd4056b9aece8893d4c0a8-20221018
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712168542; Tue, 18 Oct 2022 19:52:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 10:52:21 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 19 Oct 2022 10:52:20 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<nfraprado@collabora.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v12,1/3] soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func
Date: Wed, 19 Oct 2022 10:52:14 +0800
Message-ID: <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_195313_584491_37644916 
X-CRM114-Status: GOOD (  13.12  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

The difference between MT8186 and other ICs is that when modifying the
output format, we need to modify the mmsys_base+0x400 register to take
effect.
So when setting the dpi output format, we need to call mmsys_func to set
it to MT8186 synchronously.
Adding mmsys all the settings that need to be modified with dpi are for
mt8186.

Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
output for MT8186")

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
 drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++------
 include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
 3 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index 09b1ccbc0093..035aec1eb616 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -5,9 +5,11 @@
 
 /* Values for DPI configuration in MMSYS address space */
 #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
-#define DPI_FORMAT_MASK					0x1
-#define DPI_RGB888_DDR_CON				BIT(0)
-#define DPI_RGB565_SDR_CON				BIT(1)
+#define DPI_FORMAT_MASK					GENMASK(1, 0)
+#define DPI_RGB888_SDR_CON				0
+#define DPI_RGB888_DDR_CON				1
+#define DPI_RGB565_SDR_CON				2
+#define DPI_RGB565_DDR_CON				3
 
 #define MT8186_MMSYS_OVL_CON			0xF04
 #define MT8186_MMSYS_OVL0_CON_MASK			0x3
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index d2c7a87aab87..205f6de45851 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 {
-	if (val)
-		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
-	else
-		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	switch (val) {
+	case MTK_DPI_RGB888_SDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB888_SDR_CON);
+		break;
+	case MTK_DPI_RGB565_SDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB565_SDR_CON);
+		break;
+	case MTK_DPI_RGB565_DDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB565_DDR_CON);
+		break;
+	case MTK_DPI_RGB888_DDR_CON:
+	default:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB888_DDR_CON);
+		break;
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d2b02bb43768..b85f66db33e1 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -9,6 +9,13 @@
 enum mtk_ddp_comp_id;
 struct device;
 
+enum mtk_dpi_out_format_con {
+	MTK_DPI_RGB888_SDR_CON,
+	MTK_DPI_RGB888_DDR_CON,
+	MTK_DPI_RGB565_SDR_CON,
+	MTK_DPI_RGB565_DDR_CON
+};
+
 enum mtk_ddp_comp_id {
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_AAL1,
-- 
2.18.0


