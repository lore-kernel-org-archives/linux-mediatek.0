Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D177C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s/SQiHrMtbLMc5s1RS5azwFR9Jlu0Qes4Fx76oVRc5w=; b=2njAO09AYVq9B3FRZwVaTJAAi3
	rqoQuobi0I6fJ+66z5LpBCcJMShBk8gPdj53TeYUD7tY6eqBgU+vbWCMWAk1a1OHqKydGKyWImhlF
	q/9FWCglEGwsmUdXzdOaa3kSEr+KaSVGD7yy3oXcjkqI9E0KK/XZOo9VQ9wVE0dHzYPajoEnrkzNX
	cEIXfuVpzjA5ct2UpqzM9JEmvBusU2jtpS0mORJDDe9I8pCaz0lP/h0AfOCKPOIgmIuolU11/mIiJ
	2Z/FRl4et0ukneqW7+Cwy6fVsHuhqLC+CsKMMZMFkjqaHhxtvRxbIR6NLMb7K1kfDm2eSFfF+ZTI7
	RpKpFiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjbz-007QYS-8c; Tue, 19 Jul 2022 09:33:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjbl-007QHw-6F; Tue, 19 Jul 2022 09:33:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EF2B6601A84;
	Tue, 19 Jul 2022 10:33:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658223209;
	bh=yjRdxTBmptUMN4auYeM9Y82+2shgUi3524K4SvRLuJE=;
	h=From:To:Cc:Subject:Date:From;
	b=QbkfSgiQ3hzr/Zr8LvmYIcl2fBsFQiByscOKdsb43oIvT6sw8TcGugKzCcdH9p7Jv
	 NHb1Uo1Cw7PTE493REX31cUou9KrVOatxv7yZj76j9TmJWrV3yLrqsKgR3FjvYb9Oc
	 C0kdCH+5Up+6ZSrXcU7gfWGxhRAYpV8DRNoNW9YIF1GzGPJ0Jf6BwgG/OYIeQt6ynm
	 znZQkZujL6AiPA3/XE8XDQ0zsptWp87f6eRTRwPzVUvFU0BMQEOI7F7EXROyYly5mi
	 Ylh1VF1muMuxabbQGJIAlpd9UWy43K+6WNS5+L2d2tFN0avc7pJBUiTzLbd6yaw2NL
	 AebOGwAOM9YrQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8195-infra_ao: Set pwrmcu clocks as critical
Date: Tue, 19 Jul 2022 11:33:16 +0200
Message-Id: <20220719093316.37253-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_023337_488212_DFCAE23F 
X-CRM114-Status: GOOD (  10.77  )
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

The pwrmcu is responsible for power management and idle states in SSPM:
on older SoCs this was managed in Linux drivers like sspm/mcupm/eemgpu
but, at least on MT8195, this functionality was transferred to the ATF
firmware.
For this reason, turning off the pwrmcu related clocks from the kernel
will lead to unability to resume the platform after suspend and other
currently unknown PM related side-effects.

Set the PWRMCU and PWRMCU_BUS_H clocks as critical to prevent the
kernel from turning them off, fixing the aforementioned issue.

Fixes: e2edf59dec0b ("clk: mediatek: Add MT8195 infrastructure clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index ce7ac16a2f42..75b54ec9c46c 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -55,8 +55,12 @@ static const struct mtk_gate_regs infra_ao4_cg_regs = {
 #define GATE_INFRA_AO1(_id, _name, _parent, _shift)	\
 	GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, 0)
 
+#define GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, _flag)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao2_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, _flag)
+
 #define GATE_INFRA_AO2(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &infra_ao2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+	GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, 0)
 
 #define GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, _flag)		\
 	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao3_cg_regs, _shift,	\
@@ -136,8 +140,11 @@ static const struct mtk_gate infra_ao_clks[] = {
 	GATE_INFRA_AO2(CLK_INFRA_AO_UNIPRO_SYS, "infra_ao_unipro_sys", "top_ufs", 11),
 	GATE_INFRA_AO2(CLK_INFRA_AO_UNIPRO_TICK, "infra_ao_unipro_tick", "top_ufs_tick1us", 12),
 	GATE_INFRA_AO2(CLK_INFRA_AO_UFS_MP_SAP_B, "infra_ao_ufs_mp_sap_b", "top_ufs_mp_sap_cfg", 13),
-	GATE_INFRA_AO2(CLK_INFRA_AO_PWRMCU, "infra_ao_pwrmcu", "top_pwrmcu", 15),
-	GATE_INFRA_AO2(CLK_INFRA_AO_PWRMCU_BUS_H, "infra_ao_pwrmcu_bus_h", "top_axi", 17),
+	/* pwrmcu is used by ATF for platform PM: clocks must never be disabled by the kernel */
+	GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_PWRMCU, "infra_ao_pwrmcu", "top_pwrmcu", 15,
+			     CLK_IS_CRITICAL),
+	GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_PWRMCU_BUS_H, "infra_ao_pwrmcu_bus_h", "top_axi", 17,
+			     CLK_IS_CRITICAL),
 	GATE_INFRA_AO2(CLK_INFRA_AO_APDMA_B, "infra_ao_apdma_b", "top_axi", 18),
 	GATE_INFRA_AO2(CLK_INFRA_AO_SPI4, "infra_ao_spi4", "top_spi", 25),
 	GATE_INFRA_AO2(CLK_INFRA_AO_SPI5, "infra_ao_spi5", "top_spi", 26),
-- 
2.35.1


