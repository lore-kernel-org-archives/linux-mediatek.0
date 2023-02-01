Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11F0C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 02:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0RLYJNNjOaZwIF3K4Tu0NmZq0XJJx6TB5aHEi73l4Y=; b=1R0k/ZI/H2STu9Ha8gFEEPuyGp
	o565gRUj7PMda2IY4q70dIVGzzjYfzqxrl9KsmFMlke9IAHwd3nmCoowlXgc6zbWC4fSJVycn4Ki5
	3pK1xnCLgWDUQxmfrTIMeMBcwZ/HbhbUlQPSEu/eBviq/I+xTtBKvvbCFxEYAXHlnOyIybgZbaN+p
	Vpewq49a+pScGg9i6NQiZ4eg0OTIE/YAwMVJPDioSs0vhnhRmNrSN0VcvkHI2TZUKEPe+448QSty2
	0CIw7ocVh9WfqezEkregMEUOOS1CkY9DFKPunLpWYbKVdNeQyDk0r0G7jW2/HfCfnUf9/sprGXGKW
	WfjgKvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2aT-009uGd-Sk; Wed, 01 Feb 2023 02:11:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Zn-009u00-Hn; Wed, 01 Feb 2023 02:10:22 +0000
X-UUID: 8baa79daa1d511edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v0RLYJNNjOaZwIF3K4Tu0NmZq0XJJx6TB5aHEi73l4Y=;
	b=M9G3DXjNqRIou93ppeyELlWNgaIB0hz137+/bbjixulZyKapeapkUwZrkAr7PfAlOc6SC5NAVFCRfB3KkKMVT0+oTmDMMx9KW+w4GoBbPqmfW+WEj3V8tvdN7MM6+ymb1OtqKsCqCbkL2Auc3Y0lXDk543xsJfrAbuojogxzFQ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:79235c03-a63d-4c3c-bbb5-79214989c622,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:490914f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 8baa79daa1d511edbbe3f76fe852e059-20230131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1051638485; Tue, 31 Jan 2023 19:10:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 10:09:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 10:09:29 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Chuanhong Guo <gch981213@gmail.com>, Xiangsheng Hou
	<xiangsheng.hou@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 4/5] spi: mtk-snfi: Add snfi sample delay and read latency adjustment
Date: Wed, 1 Feb 2023 10:09:20 +0800
Message-ID: <20230201020921.26712-5-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
References: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_181019_713016_D04A6CB9 
X-CRM114-Status: GOOD (  12.16  )
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

Add snfi sample delay and read latency adjustment which can get
from dts property.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mtk-snfi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 85644308df23..f3f95eb37365 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -195,6 +195,8 @@
 #define DATA_READ_MODE_X4 2
 #define DATA_READ_MODE_DUAL 5
 #define DATA_READ_MODE_QUAD 6
+#define DATA_READ_LATCH_LAT GENMASK(9, 8)
+#define DATA_READ_LATCH_LAT_S 8
 #define PG_LOAD_CUSTOM_EN BIT(7)
 #define DATARD_CUSTOM_EN BIT(6)
 #define CS_DESELECT_CYC_S 0
@@ -205,6 +207,9 @@
 
 #define SNF_DLY_CTL3 0x548
 #define SFCK_SAM_DLY_S 0
+#define SFCK_SAM_DLY GENMASK(5, 0)
+#define SFCK_SAM_DLY_TOTAL 9
+#define SFCK_SAM_DLY_RANGE 47
 
 #define SNF_STA_CTL1 0x550
 #define CUS_PG_DONE BIT(28)
@@ -1368,6 +1373,8 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	const struct of_device_id *dev_id;
 	struct spi_controller *ctlr;
 	struct mtk_snand *ms;
+	unsigned long spi_freq;
+	u32 val = 0;
 	int ret;
 
 	dev_id = of_match_node(mtk_snand_ids, np);
@@ -1446,6 +1453,19 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	// switch to SNFI mode
 	nfi_write32(ms, SNF_CFG, SPI_MODE);
 
+	ret = of_property_read_u32(np, "rx-sample-delay-ns", &val);
+	if (!ret)
+		nfi_rmw32(ms, SNF_DLY_CTL3, SFCK_SAM_DLY,
+			  val * SFCK_SAM_DLY_RANGE / SFCK_SAM_DLY_TOTAL);
+
+	ret = of_property_read_u32(np, "mediatek,rx-latch-latency-ns", &val);
+	if (!ret) {
+		spi_freq = clk_get_rate(ms->pad_clk);
+		val = DIV_ROUND_CLOSEST(val, NSEC_PER_SEC / spi_freq);
+		nfi_rmw32(ms, SNF_MISC_CTL, DATA_READ_LATCH_LAT,
+			  val << DATA_READ_LATCH_LAT_S);
+	}
+
 	// setup an initial page format for ops matching page_cache_op template
 	// before ECC is called.
 	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);
-- 
2.25.1


