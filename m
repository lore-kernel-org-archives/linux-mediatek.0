Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DD9CCA479
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62bybhx/IN2NRkH0XAvncYEoa8Wu6cCr3vqab+e9Luw=; b=CUxNXfWVEMWDLvIHCWeVQMV08b
	IYW5JgO7WmyDcc/UKfUoOSZrp8ElL8auEr7hCb4uUHey00VX45uFrX12qPDPLrXVDAO1gmjvE40j1
	1wKqamVo1qZdJxEo+QpnsFkFNRKQtlxHAmILRlHESF2Za1wKa24TDEtqzEq9A6zBiVPZguOs4GOqf
	C5L0HDrUM0XwIv0qLMbERm/nJw4WatRAUBF2ptx8yYUnVJaeh94n20uOd3PJo25y4Cpk/AOSfnyVT
	ZNywDCknAA+sJdDuUUH05oC5/GwQtPQnhi4eeQg+Qbr+gVj7dy2DWd4jXN3MJdjbvZGjKs8hcrcq/
	ETgVs+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28Nm-006iAr-6t; Fri, 17 Jun 2022 09:35:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28N6-006hnr-6A; Fri, 17 Jun 2022 09:34:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14304660179C;
	Fri, 17 Jun 2022 10:34:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655458470;
	bh=Q9STMdUQcIR3bQLkRReyfMntLGa0Stetlsm7PC5C6QA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMB1QY5aIPAN5J4Yoc6UocSIRoK7OZqGP+NEeXBefOccqGJf+8hkJ45xj94ghFbfa
	 igUaVxji0/ZoVpDl1ooqCd8GvrKk0bSA0H+qmOzWD/LZf19tcsvwQ5C+Q2trmmi8HV
	 WQ9zV3EHGvvvsDYUPN0p/p1tXvmog9eoHwtERpsQ19HKnlo1ecjwafEJAp/Th3OBPm
	 cNRh6so0mD3FxAx/PiKcNu8nORgVyH7zt+VXB86CSnYVKua2LLLbWXMo2/q5muQemg
	 mB1FBdL5TCYMR8L/7Kcfb/9JzvHynOsbyuLavq1Cboz936KCE5j/nVry1amAtjbAx1
	 LDUNy8w6lX+xw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
Date: Fri, 17 Jun 2022 11:34:23 +0200
Message-Id: <20220617093424.75589-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
References: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_023432_461406_3E925C4A 
X-CRM114-Status: GOOD (  10.52  )
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

Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
clock: this is required to trigger clock source selection on
CLK_TOP_EDP, while avoiding to manage the enablement of the former
separately from the latter in the displayport driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 70282c90d4a2 ("clk: mediatek: Add MT8195 vdosys0 clock support")
---
 drivers/clk/mediatek/clk-mt8195-vdo0.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index 261a7f76dd3c..07b46bfd5040 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -37,6 +37,10 @@ static const struct mtk_gate_regs vdo0_2_cg_regs = {
 #define GATE_VDO0_2(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo0_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO0_2_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdo0_2_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, _flags)
+
 static const struct mtk_gate vdo0_clks[] = {
 	/* VDO0_0 */
 	GATE_VDO0_0(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "top_vpp", 0),
@@ -85,7 +89,8 @@ static const struct mtk_gate vdo0_clks[] = {
 	/* VDO0_2 */
 	GATE_VDO0_2(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "top_dsi_occ", 0),
 	GATE_VDO0_2(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "top_dsi_occ", 8),
-	GATE_VDO0_2(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf", "top_edp", 16),
+	GATE_VDO0_2_FLAGS(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf",
+			  "top_edp", 16, CLK_SET_RATE_PARENT),
 };
 
 static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
-- 
2.35.1


