Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C73C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+39HX+XU/AzeFqWmTpbHlbX4Me1OPJE5T2MCNHbdfVM=; b=OuTNul0mTHzTi9TMlwbFZfryuR
	nOJS6Al4IlV5ZaNatd0oG6Lnk7SrBCudIt4GvL0DahaWNILisKy7MZ7wNZtOpZ8Caj+ts7kwObsQQ
	fdgd8wVgGeJYzH4Zbz8ffWNlFWpMfyHIXbemuNlKuc5/d7KIvIQWOHDMByP0cJYJNGiKNOyW14+sF
	QVfO7xMMr/eYxysagmMlosZl6ZZqA0DSWuQWCKTpIRQp/wYV8EBt13Mo7n7CYZ46hyoFwO64teftV
	x77AD/aR1Ze82ChTQLLu7bOVVB9FQF3Is6VZKHjI9+gFDWsyNHDrOAjsJdA+AV9Fq/COG8K0DVMr0
	zT9oiBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2Jd-006S16-7E; Tue, 16 Aug 2022 19:33:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2JG-006Rof-Vv; Tue, 16 Aug 2022 19:33:08 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B512F660159D;
	Tue, 16 Aug 2022 20:33:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660678384;
	bh=gzvafDsmVPj6f0v0ggroSucH45xtJAA4wYHsWwciQiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1fFftusnvTojZEx/bskbRueFzFHVwTecmmKXB9GIseb6H/rHQNNWYoOzN0xuHVi7
	 U4f1/SFE1KKsQ4HA+RbdIBf0NhBc+BLRwdxQ+0v5VSLfBg8rEYbJtTqaOtGpi71VSc
	 FYiilBB0koR2tR6gRAnqc1g0pQyiK9izl/vdsgGMucdXUlLlPxqlc3PDG1pF7SLted
	 5fKFav7pN6TOUgP7IWE3/2Io1ge1zt0ZAF7DQFMaoitqIGBFO/90aZ1AuscZ0+52c9
	 c5pmtLQ/Ndd6RHItnKRv3KHAzAPAMGZpcMi9fFXVXipTjXE/7vVgJ30pA/jmalNRof
	 ROvb1CYSdW25w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH v3 1/2] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
Date: Tue, 16 Aug 2022 15:32:55 -0400
Message-Id: <20220816193257.658487-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816193257.658487-1-nfraprado@collabora.com>
References: <20220816193257.658487-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_123307_240480_D32BB6A0 
X-CRM114-Status: GOOD (  11.12  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
clock: this is required to trigger clock source selection on
CLK_TOP_EDP, while avoiding to manage the enablement of the former
separately from the latter in the displayport driver.

Fixes: 70282c90d4a2 ("clk: mediatek: Add MT8195 vdosys0 clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

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
2.37.1


