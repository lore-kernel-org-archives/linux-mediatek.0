Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmCzOmR6ex7ieClmwYYa3UePeppwePD5IPHTAkthcC8=; b=GieKvFxVKZIzBtFE552IXONZ6C
	6UWPM0SHAnqi5gFY62iN7baOajL+OiCO398neBbIL3CF+8gGCEdLRh40lyc2vULQ23GphiqIvDJ1m
	J++azQEGEjbbgzETknlTLPZufOWGI0S0e9PQ+8xcEGL/FaHOGXutBwWNXsydxnYWcp4n1ShaKo7y5
	uDBe2IbkvIcW5+M2XW5Xvri1STwnEY64bLJzS6geq3rKKGPhjtVzrhNbXXGhkvENdGUpuMc9k/oAA
	TpjRVgyre1gw9+ZTsi0401g2NEoorB3oSMQntMSMJBooYfD8ez+tCcEjn1EF1zVr/SFy2yOgYw5lK
	XomPXX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIo1z-009X0f-4a; Fri, 20 Jan 2023 09:49:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInab-009K24-Sp; Fri, 20 Jan 2023 09:21:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EEC6B6602E41;
	Fri, 20 Jan 2023 09:21:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206496;
	bh=veBd2JTLsjF36au7M5gXmubbsmxaRJK4ZtEZdeWnvyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqdqj5baTx+slMQzGNDcAJ6mKloERHba43+caCRQnVapm146epMhBjNYhXkX6Z2XR
	 Ux4A7Pp36Hhw8unH/atKB7idDO1DyBJv3pJSR5EseJsPAD5iRuye+ZMTYMfbvjzGeD
	 NU3Df30T5NcTMsNQxUnh3DMxOLaSZJ5q93OzW2P+ABvhQIvKFVjhg1C1rliySYhc6l
	 /bm/glFYc93ngoXUOiSqXM1tW6XC5WaNgCdqs+bVCETthHzeF1+6twKXAosnvtR1Pg
	 72dachq9z6/Y7lXMJuiaXfQvSgwxeSSvGPqmHcUGTQ2r9pRGIPyvgreiedmLDem90+
	 1LjaSC4cNRPcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 22/23] clk: mediatek: clk-mt7986-topckgen: Properly keep some clocks enabled
Date: Fri, 20 Jan 2023 10:20:52 +0100
Message-Id: <20230120092053.182923-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012138_280355_E9B314A9 
X-CRM114-Status: GOOD (  11.55  )
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

Instead of calling clk_prepare_enable() on a bunch of clocks at probe
time, set the CLK_IS_CRITICAL flag to the same as these are required
to be always on, and this is the right way of achieving that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 46 +++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index c9bf47e6098f..36553f0c13fe 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -202,16 +202,23 @@ static const struct mtk_mux top_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_F_26M_ADC_SEL, "f_26m_adc_sel",
 			     f_26m_adc_parents, 0x020, 0x024, 0x028, 16, 1, 23,
 			     0x1C0, 10),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_DRAMC_SEL, "dramc_sel", f_26m_adc_parents,
-			     0x020, 0x024, 0x028, 24, 1, 31, 0x1C0, 11),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_DRAMC_SEL, "dramc_sel",
+				   f_26m_adc_parents, 0x020, 0x024, 0x028,
+				   24, 1, 31, 0x1C0, 11,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	/* CLK_CFG_3 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_DRAMC_MD32_SEL, "dramc_md32_sel",
-			     dramc_md32_parents, 0x030, 0x034, 0x038, 0, 1, 7,
-			     0x1C0, 12),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SYSAXI_SEL, "sysaxi_sel", sysaxi_parents,
-			     0x030, 0x034, 0x038, 8, 2, 15, 0x1C0, 13),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SYSAPB_SEL, "sysapb_sel", sysapb_parents,
-			     0x030, 0x034, 0x038, 16, 2, 23, 0x1C0, 14),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_DRAMC_MD32_SEL, "dramc_md32_sel",
+				   dramc_md32_parents, 0x030, 0x034, 0x038,
+				   0, 1, 7, 0x1C0, 12,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SYSAXI_SEL, "sysaxi_sel",
+				   sysaxi_parents, 0x030, 0x034, 0x038,
+				   8, 2, 15, 0x1C0, 13,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SYSAPB_SEL, "sysapb_sel",
+				   sysapb_parents, 0x030, 0x034, 0x038,
+				   16, 2, 23, 0x1C0, 14,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_ARM_DB_MAIN_SEL, "arm_db_main_sel",
 			     arm_db_main_parents, 0x030, 0x034, 0x038, 24, 1,
 			     31, 0x1C0, 15),
@@ -234,9 +241,10 @@ static const struct mtk_mux top_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_SGM_325M_SEL, "sgm_325m_sel",
 			     sgm_325m_parents, 0x050, 0x054, 0x058, 8, 1, 15,
 			     0x1C0, 21),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SGM_REG_SEL, "sgm_reg_sel",
-			     sgm_reg_parents, 0x050, 0x054, 0x058, 16, 1, 23,
-			     0x1C0, 22),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SGM_REG_SEL, "sgm_reg_sel",
+				   sgm_reg_parents, 0x050, 0x054, 0x058,
+				   16, 1, 23, 0x1C0, 22,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_A1SYS_SEL, "a1sys_sel", a1sys_parents,
 			     0x050, 0x054, 0x058, 24, 1, 31, 0x1C0, 23),
 	/* CLK_CFG_6 */
@@ -252,9 +260,10 @@ static const struct mtk_mux top_muxes[] = {
 			     f_26m_adc_parents, 0x060, 0x064, 0x068, 24, 1, 31,
 			     0x1C0, 27),
 	/* CLK_CFG_7 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_F26M_SEL, "csw_f26m_sel",
-			     f_26m_adc_parents, 0x070, 0x074, 0x078, 0, 1, 7,
-			     0x1C0, 28),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_F26M_SEL, "csw_f26m_sel",
+				   f_26m_adc_parents, 0x070, 0x074, 0x078,
+				   0, 1, 7, 0x1C0, 28,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_L_SEL, "aud_l_sel", aud_l_parents,
 			     0x070, 0x074, 0x078, 8, 2, 15, 0x1C0, 29),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_A_TUNER_SEL, "a_tuner_sel",
@@ -307,13 +316,6 @@ static int clk_mt7986_topckgen_probe(struct platform_device *pdev)
 			       ARRAY_SIZE(top_muxes), node,
 			       &mt7986_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_SYSAXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_SYSAPB_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DRAMC_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DRAMC_MD32_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_F26M_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_SGM_REG_SEL]->clk);
-
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r) {
-- 
2.39.0


