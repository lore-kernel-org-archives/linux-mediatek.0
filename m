Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41185C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56+j94Lxvkexz6EbyLZnBxd8RS75a5wYFuS66Ho9fNs=; b=i0YXaQ28hYzWJmI26o1ykaPRJE
	RoC6ZmYXHzqEXu1F08FgQnASYmvaNw6empWgqBwpXOTtnXIOcYOLnxZKB2wHDHuzCDoMAH8muAdeI
	fCnrPj9co7a13YtgBPmAW1XaF3ZuqIy3jJRxAG3311aH2cqEf/3H9x6+z8Rn+/Tu/lElQwvYdO4UL
	mD96JBP4hr/2PIZZetISevSbuRqakw+kFCXcyzCCClJpZwAUEOKrYZCJrn1AM+946pYvvdBigR4S1
	nm/fzCMnG8wLNi/4wA6Vi5xbMkCXSTS1HwQHfIp9/0XgXbY6BKq7ZdKNPcb/baey0Rx8UsN1B4TUF
	Q46aU/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8O0Z-00Dnyw-AH; Thu, 22 Dec 2022 16:01:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NrP-00Divu-Nh; Thu, 22 Dec 2022 15:51:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A10856602CDE;
	Thu, 22 Dec 2022 15:51:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671724314;
	bh=hsRKdUlhnDLJbGIwsqwoaTUXgSw/PcP7XnAaJTpL7Eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5wJkVK6mVQgS5rlVFgutEJojPtjV5WShElwTWK4wgTSADJq02ddSeZwI+/OmCoqk
	 nPP7V8ta63fBHcPtnZe0L3KHnWG/YV88jMZv+d5RcZq38M/3I4A6FByUWpyyB6lvzY
	 Mfe9Rrrk6SlLtSpbgGnJUYvKcC6epwL629+TUOjQyEds68hJ48RP/oZlWt6ShKiNEq
	 SQmRgWyUQje79rpe6cWv8ibMsRXwn2Hg0XmJBjmaYHhEPcZabOLcio8QXgpPhg09Tg
	 tE3UPlCiGnZ0Azx9BBJA3tECGcLEzM83fjy04TGahNa+0+cGUIm1//NRp2ai04rQ/S
	 W338ltjL7XLcQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 3/6] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
Date: Thu, 22 Dec 2022 16:51:44 +0100
Message-Id: <20221222155147.158837-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_075156_099004_0EA60DC2 
X-CRM114-Status: GOOD (  13.00  )
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

Add FHCTL parameters and register PLLs through FHCTL to add support
for frequency hopping and SSC. FHCTL will be enabled only on PLLs
specified in devicetree.

This commit brings functional changes only upon addition of
devicetree configuration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 63 +++++++++++++++++++-
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 59761c72d3bc..03fa30527868 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -7,8 +7,10 @@
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include "clk-fhctl.h"
 #include "clk-mtk.h"
 #include "clk-pll.h"
+#include "clk-pllfh.h"
 
 #define REG_REF2USB		0x8
 #define REG_AP_PLL_CON7		0x1c
@@ -58,6 +60,56 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", 0x2b4, 0x2c4, 0, 0, 31, 0x2b4, 4, 0x2bc, 0x2b8, 0),
 };
 
+enum fh_pll_id {
+	FH_CA53PLL_LL,
+	FH_CA53PLL_BL,
+	FH_MAINPLL,
+	FH_MPLL,
+	FH_MSDCPLL,
+	FH_MMPLL,
+	FH_VENCPLL,
+	FH_TVDPLL,
+	FH_VCODECPLL,
+	FH_NR_FH,
+};
+
+#define _FH(_pllid, _fhid, _slope, _offset) {				\
+		.data = {						\
+			.pll_id = _pllid,				\
+			.fh_id = _fhid,					\
+			.fh_ver = FHCTL_PLLFH_V1,			\
+			.fhx_offset = _offset,				\
+			.dds_mask = GENMASK(21, 0),			\
+			.slope0_value = _slope,				\
+			.slope1_value = _slope,				\
+			.sfstrx_en = BIT(2),				\
+			.frddsx_en = BIT(1),				\
+			.fhctlx_en = BIT(0),				\
+			.tgl_org = BIT(31),				\
+			.dvfs_tri = BIT(31),				\
+			.pcwchg = BIT(31),				\
+			.dt_val = 0x0,					\
+			.df_val = 0x9,					\
+			.updnlmt_shft = 16,				\
+			.msk_frddsx_dys = GENMASK(23, 20),		\
+			.msk_frddsx_dts = GENMASK(19, 16),		\
+		},							\
+	}
+
+#define FH(_pllid, _fhid, _offset)	_FH(_pllid, _fhid, 0x6003c97, _offset)
+#define FH_M(_pllid, _fhid, _offset)	_FH(_pllid, _fhid, 0x6000140, _offset)
+
+static struct mtk_pllfh_data pllfhs[] = {
+	FH(CLK_APMIXED_ARMCA53PLL, FH_CA53PLL_BL, 0x38),
+	FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x60),
+	FH_M(CLK_APMIXED_MPLL, FH_MPLL, 0x74),
+	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x88),
+	FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0x9c),
+	FH(CLK_APMIXED_VENCPLL, FH_VENCPLL, 0xb0),
+	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0xc4),
+	FH(CLK_APMIXED_VCODECPLL, FH_VCODECPLL, 0xd8),
+};
+
 static void clk_mt6795_apmixed_setup_md1(void __iomem *base)
 {
 	void __iomem *reg = base + REG_AP_PLL_CON7;
@@ -85,6 +137,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	const u8 *fhctl_node = "mediatek,mt6795-fhctl";
 	void __iomem *base;
 	struct clk_hw *hw;
 	int ret;
@@ -97,7 +150,9 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
+	ret = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+				      pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (ret)
 		goto free_clk_data;
 
@@ -124,7 +179,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 unregister_ref2usb:
 	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
 unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return ret;
@@ -137,7 +193,8 @@ static int clk_mt6795_apmixed_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(node);
 	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 	mtk_free_clk_data(clk_data);
 
 	return 0;
-- 
2.39.0


