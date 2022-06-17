Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B077C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz0lLy6mqOul6m4UGFEznBGxyvJ6wMNs0ESfjd9eHVs=; b=vFcldt8GaVcXBHMNe0VkzmIR7s
	/IkQ3kEf3tK7xQ+E53SWZhXIkc4rLu0jGiJ3m5H4KzbsYHgl07ph3oC02OunMvcYWaqNkSiiV9yae
	qzFSB4uMRwKiHN+pvCYLj1DVh267rwPl+B4U5+1+Ml34sGPi37GL2pS7/9/NCAvYiE5aHBbAl0NLr
	f6O51owM/wC6CNJQIbSDzp+B679QIvS9FI16FQ7ZSo9yjWe0tqv5HELxdy2zLqz0gBfnyjR/doZY0
	bRJemmYwf8RCSJh5kqiIw43YvP5TUGSmHsZYPyJsjHoBW2eG4qI8hnDTWSwW5xyYJ+xunQunhuwZJ
	JTkO79gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28O4-006iMs-M1; Fri, 17 Jun 2022 09:35:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28N6-006hoP-Oo; Fri, 17 Jun 2022 09:34:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D1DD3660179D;
	Fri, 17 Jun 2022 10:34:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655458471;
	bh=pGH8Jhv8K2/nD4MKxwp8iQfMRDcZpcfthKCb1vXYh2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJyotv6t4Hiv4uT6+vHHfgJSpwbVQGm+bhfIc3s3jUCxTIfCoHF5Z9MnG6MVlq+aj
	 whAdRbaaFqIchO11AOf4dcEC2sGPJO5dqwc/dXtwzmjhr4MObVw7Qex48SXuhjLe9z
	 2C71GzdOIkDyG0037SJnLaP/Nblv9F4K4HxSlFUAsYq5Ghp51jlYviRmuG2rGVZ3hE
	 92D07YHRMu8tnkKfp/cc6Fc3tGtdW71ilzmqRuZds/i42Ceet3hKNsPnZDxYF97Cvd
	 witAY/tFVtA22foFeLsQaM4cs5q5ZxPDkfjNSOivCcU/11/iCEmfduEtwUzX6f6/FC
	 bFYKgXSs7tHhA==
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
Subject: [PATCH v2 2/2] clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's parent
Date: Fri, 17 Jun 2022 11:34:24 +0200
Message-Id: <20220617093424.75589-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
References: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_023433_016439_3F529571 
X-CRM114-Status: GOOD (  10.62  )
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

Like it was done for the vdo0_dp_intf0_dp_intf clock (used for eDP),
add the CLK_SET_RATE_PARENT flag to CLK_VDO1_DPINTF (used for DP)
and also fix its parent clock name as it has to be "top_dp" for two
reasons:
 - This is its real parent!
 - Likewise to eDP/VDO0 counterpart, we need clock source
   selection on CLK_TOP_DP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 269987505ba9 ("clk: mediatek: Add MT8195 vdosys1 clock support")
---
 drivers/clk/mediatek/clk-mt8195-vdo1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 3378487d2c90..d54d7726d186 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -43,6 +43,10 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_2(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_2_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdo1_2_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, _flags)
+
 #define GATE_VDO1_3(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -99,7 +103,7 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0", "top_vpp", 1),
 	GATE_VDO1_2(CLK_VDO1_DPI1, "vdo1_dpi1", "top_vpp", 8),
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1", "top_vpp", 9),
-	GATE_VDO1_2(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_vpp", 16),
+	GATE_VDO1_2_FLAGS(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_dp", 16, CLK_SET_RATE_PARENT),
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "top_vpp", 17),
 	/* VDO1_3 */
 	GATE_VDO1_3(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
-- 
2.35.1


