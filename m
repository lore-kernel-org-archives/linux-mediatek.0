Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C45C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sjf0z8IAq5AD6Jw0ekILYwGr29EuGWrmNwTFhU+raG4=; b=ht0EESS16whqyt
	DwdInYyd0xQXn7lsaYLmaD3agn4L2vWm7Z0+baS+ojwGCIehqzom773M1x2dzW1lSZb3OIFzb4zyF
	+Y624JLx5lbj2UcCBO+f2jDbXIsvN7T886kCQ9NA/L9pP/tQbHtBmStb7KSw1m5iRtRh4Zki4TwsI
	iJeT/Ey3QjLK8rC0iD3XF1o/rkSMQEC+kVshrfeZiQUP81JZ8HDGSyY6MUSbGGimXKbnb7/5SfeQT
	BzCoA9m3iOZhi/TUMdIg0jbfxNu1wNh7DNBx7oY3xn/U+H+IcCx/8YAXFnyt+k8+NzWKCiHhRkVtl
	UtzJflBG+uF5Ns/Xk0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12jn-008fcY-NR; Tue, 14 Jun 2022 09:21:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12ZD-008a1G-7u; Tue, 14 Jun 2022 09:10:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7202B66016A0;
	Tue, 14 Jun 2022 10:10:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655197827;
	bh=4DR1T/pSi8XL/XvHbqB/gYOloys10AlaIbBw9rkIUmI=;
	h=From:To:Cc:Subject:Date:From;
	b=JxXL3GzuRTvVROXKxCVs2uXc9PpuLPmai+GyPpWhUg7yd2Vv9PNvNbLICJwW7me6C
	 puoUZVtkcM/QSM9zL7OP0x7a4gs2x9ju2Rdxgb36F+Nup5ZH7nlanD23aVGCF+b0bE
	 nIDoJE3ta7oWtNlabW0J3t1HhTM7FZ0F2nf9JYOkwXynAranTaAkxRrNoiV6E3wR4k
	 rRAoWkGDrwAEjFfATAXq/B5kAEtIK4iQjRlvE0mpJ3lQ7MWzGj2i9+GvcjopHCAs5w
	 INO7wPuVMSiDuM7criM9rrS17TWN8ZJhJqhlM1kC5+tHB7pSCiofbs68I+JPbczPDI
	 DKGTvxFXe3TBw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rex-bc.chen@mediatek.com
Subject: [PATCH] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
Date: Tue, 14 Jun 2022 11:10:20 +0200
Message-Id: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_021031_533424_88A94562 
X-CRM114-Status: UNSURE (   9.45  )
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

Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
clock: this is required to trigger clock source selection on
CLK_TOP_EDP, while avoiding to manage the enablement of the former
separately from the latter in the displayport driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
