Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB556C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c43dIr8TaA7Uap9q5Nb2o4doz6SRREOvF6llN85BfNw=; b=I1ALfHwqEiTrlbVyK951uCXWve
	3OYRG9glxvjoFzO3n7NBOfWVGEjwQR45AHsY2LsbzMyefIHo+26Kog6qFt5RcK7+XM/kd85u8xlQJ
	IUN0QaQ+LNXnEHGIZGokcia6FCKKccTHHILojZqpPsN0/+faeGgOWxf0d8wzYN845rjNYFFQdl6gM
	2Xf5XHffWAfJjNfd/BRO2RNwVXIRIO6bmhMpMXKbwrZNvFnRZRNB6OsqUH6fF6s0zfgGQoK0vezfq
	PWDQepxHgkjywtbrZEMy3aHlWlRb8WSyBVI27/DXelZSbHk7fZmHW8HQkb5FKcNy/ntOjWvCphCq8
	Ek0AhNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2A1A-007He3-CO; Fri, 17 Jun 2022 11:20:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29uI-007EoB-K8; Fri, 17 Jun 2022 11:12:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E10F660179B;
	Fri, 17 Jun 2022 12:12:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655464373;
	bh=xmGis2wqk9howX9w26cQ+zfn6UOV6aN48S5Z7v46gtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6aJc5ZBpfSogs9a0v0NGrgOAbYI1DjWA2fh4Ca4fdxfhEG/SY3mtMVHNhaCcRk87
	 nUoZKPI2TkMo+wBYdCrWqwCOgCM5S5JROwulsjwuZ2vHa6rq4E2lDwrSbAl2jn+W4v
	 Yx+b++Uw8IKbmozNeBVcgdRjgUVARdC8LuEUG84gGJ16ihaWJ2X9vB+qAJAMgghXCL
	 rJAnUcSAYvVmECmw/b54l0LoRzJiNLHTQKE6R9rIzOGSpc1dPHd/CX6PwSaN0G8lK4
	 OwtO9dQ6is3aSEMNUh1YTMg94pebEAnoM/kw7fd33R7paFCGtt0CeSRWSK/SF1O/2G
	 BMZu//mmSgMrA==
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
Subject: [PATCH v3 1/2] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
Date: Fri, 17 Jun 2022 13:12:47 +0200
Message-Id: <20220617111248.90505-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617111248.90505-1-angelogioacchino.delregno@collabora.com>
References: <20220617111248.90505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_041254_848519_12478AD2 
X-CRM114-Status: GOOD (  10.50  )
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

Fixes: 70282c90d4a2 ("clk: mediatek: Add MT8195 vdosys0 clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
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


