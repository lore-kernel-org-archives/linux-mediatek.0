Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ju3mGg5rnmtsZ2vzVoEOpbgKUiY9M++Ou7PPaXMzL8s=; b=FI2sWFxgfGVxmeiZw7mkCBdSGv
	GcTrQN+IJTxfFX6PNahdm9BQqMBhKrS5j/gEjpYs8nf35XsMzgHaXhYW760LyZ2LyC60SkCMEafHU
	fSuPavk88JMs7aX4Rhx0N3EAVFSXiCsfSeObbXVId2Q1Jd8hY23Q8HMuKEQYDsHP36UpH+kUurdQh
	TQpnmbuAhMCrakkc+znTFaxr8owieG2hvOlH008WrsfI90IB63v+3m70h3VcVP+M+TeJilxd/oAfg
	boMDqtCqGXZL/UOoiTQ59BSNGlC4+8pK5bwA2uQue9wquPBwun7uS4xu2YVf1VFLSGQRLX3yl9sD2
	LUnqNV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyLo-0080gA-I9; Mon, 06 Feb 2023 10:03:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyJP-007zEK-1Q; Mon, 06 Feb 2023 10:01:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C455B6603015;
	Mon,  6 Feb 2023 10:01:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675677681;
	bh=f7n/gsj2yRyknP4Bp5D2VU6b2iNMyPmMNQcajrOqN10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gqa/WXXJP901ofoih3gid+jeAh+DzxDIPqfukijcH/Qvcg9QDAc2z+NIb64jfz/Gg
	 5ndPzk0BeFWqkGktkTeC9uEUCW81WRj6ma6J08+BPJPZ0OCS1J+V9Ulmit6uOH9jvq
	 ge7QxMiJy4g5hchU5K1AwIOEdRWqAeat96gMUdJHAx28hWiczx198ADD242Vfaj4C+
	 SylNINACbmFGg2WW60NoostUoJQv89lG6/Rg/Ix97QS13E5WEq0ZxAJfHQZHVkIXrB
	 Wng2T/KT4NHcYEnR2H9Qnya4eOErcECXmwm+FK0JvrSPtR42rD7AHp4Bmj6rNNxGsh
	 UWoYtPlANJvqw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
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
Subject: [PATCH v3 6/7] clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
Date: Mon,  6 Feb 2023 11:01:04 +0100
Message-Id: <20230206100105.861720-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_020123_383849_4FA14BF1 
X-CRM114-Status: GOOD (  13.30  )
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
 drivers/clk/mediatek/clk-mt8192.c | 67 ++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 61299960d28a..0f9f10172148 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -12,10 +12,12 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "clk-fhctl.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "clk-mux.h"
 #include "clk-pll.h"
+#include "clk-pllfh.h"
 
 #include <dt-bindings/clock/mt8192-clk.h>
 #include <dt-bindings/reset/mt8192-resets.h>
@@ -1042,6 +1044,57 @@ static const struct mtk_pll_data plls[] = {
 	      0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
 };
 
+enum fh_pll_id {
+	FH_ARMPLL_LL,
+	FH_ARMPLL_BL0,
+	FH_ARMPLL_BL1,
+	FH_ARMPLL_BL2,
+	FH_ARMPLL_BL3,
+	FH_CCIPLL,
+	FH_MFGPLL,
+	FH_MEMPLL,
+	FH_MPLL,
+	FH_MMPLL,
+	FH_MAINPLL,
+	FH_MSDCPLL,
+	FH_ADSPPLL,
+	FH_APUPLL,
+	FH_TVDPLL,
+	FH_NR_FH,
+};
+
+#define FH(_pllid, _fhid, _offset) {					\
+		.data = {						\
+			.pll_id = _pllid,				\
+			.fh_id = _fhid,					\
+			.fh_ver = FHCTL_PLLFH_V2,			\
+			.fhx_offset = _offset,				\
+			.dds_mask = GENMASK(21, 0),			\
+			.slope0_value = 0x6003c97,			\
+			.slope1_value = 0x6003c97,			\
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
+static struct mtk_pllfh_data pllfhs[] = {
+	FH(CLK_APMIXED_MFGPLL, FH_MFGPLL, 0xb4),
+	FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0xf0),
+	FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x104),
+	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x118),
+	FH(CLK_APMIXED_ADSPPLL, FH_ADSPPLL, 0x12c),
+	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x154),
+};
+
 /* Register mux notifier for MFG mux */
 static int clk_mt8192_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 {
@@ -1068,17 +1121,24 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	const u8 *fhctl_node = "mediatek,mt8192-fhctl";
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
+
+	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
+	if (r)
+		goto free_clk_data;
+
 	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 				   ARRAY_SIZE(apmixed_clks), clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_plls;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
@@ -1088,6 +1148,9 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 
 unregister_gates:
 	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.39.1


