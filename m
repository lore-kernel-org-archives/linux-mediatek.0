Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC0C47422
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eehw8xyDiZKe3Ta/XcMEznmzFYJTK+Bv5i2VMfGjjM0=; b=b+d9/mlHBJ1Vqh
	gzOYHaF/DyQf5Is7UxIlHAfEIlE+T9Y8sL+Annymu5U/6GutQh/7pZiYHIH/h9nM62EramqHAXwLC
	+prbRRnm4h0HyP2QAOeOLCsg4q+NN8gseSuhvRsc9Dsl1ymHvdW0AzNcM0DVadUNGCw+fYQ4rlx70
	pTnaHYhY2bSvqicwG7pDv9D/Y3eUOroVcjYPI1GtvYQ59AEcsU43ivZ64gYXqFl8tircffeOnwwCS
	mwVWivadWPapclyKmo2/S+ch40NIaIqBn9QBSXHWX7iYIOOQ+BqyVrjQ/GJRGqRdEqbiK1DeqBQL0
	bg7DUMbDvyzXoLxGpBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAqq-000Oap-0z;
	Wed, 17 Jan 2024 18:41:24 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAql-000OXy-1q;
	Wed, 17 Jan 2024 18:41:21 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 945F8605FE;
	Wed, 17 Jan 2024 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1705516876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eehw8xyDiZKe3Ta/XcMEznmzFYJTK+Bv5i2VMfGjjM0=;
	b=M6/QKBL945SLCiX3SObAD3UVp8V1jXvZ7+OCFilnQu/Zw5KRlyJbuuF8uWUmxQOI2KcyV4
	gVWaOMUugPfb8bPDoXE7+AIz1QMLTXiw09d45jilzZ5SQ91oQTAZ/9NP4JT/yRmB9oIaKA
	eSm6ZRLutKlprpiC/6ZdgqUNQ2ysvyU=
Received: from frank-G5.. (fttx-pool-217.61.151.254.bambit.de [217.61.151.254])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B06A610022F;
	Wed, 17 Jan 2024 18:41:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 2/2] clk: mediatek: add infracfg reset controller for mt7988
Date: Wed, 17 Jan 2024 19:41:11 +0100
Message-Id: <20240117184111.62371-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117184111.62371-1-linux@fw-web.de>
References: <20240117184111.62371-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 19467ab5-d765-4cf7-a1c2-db41340e92b1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_104119_764028_F01DE2C6 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg can also operate as reset controller, add support for it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- start with RST0 (LVTS is in RST1)
- rename reset offset to contain SOC to not collide with constants
  defined in reset.h
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 8011ef278bea..449041f8abbc 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -14,6 +14,10 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
+#include <dt-bindings/reset/mediatek,mt7988-resets.h>
+
+#define	MT7988_INFRA_RST0_SET_OFFSET	0x70
+#define	MT7988_INFRA_RST1_SET_OFFSET	0x80
 
 static DEFINE_SPINLOCK(mt7988_clk_lock);
 
@@ -249,12 +253,31 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA3(CLK_INFRA_133M_PCIE_CK_P3, "infra_133m_pcie_ck_p3", "sysaxi_sel", 31),
 };
 
+static u16 infra_rst_ofs[] = {
+	MT7988_INFRA_RST0_SET_OFFSET,
+	MT7988_INFRA_RST1_SET_OFFSET,
+};
+
+static u16 infra_idx_map[] = {
+	[MT7988_INFRA_RST0_PEXTP_MAC_SWRST] = 0 * RST_NR_PER_BANK + 6,
+	[MT7988_INFRA_RST1_THERM_CTRL_SWRST] = 1 * RST_NR_PER_BANK + 9,
+};
+
+static struct mtk_clk_rst_desc infra_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = infra_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_rst_ofs),
+	.rst_idx_map = infra_idx_map,
+	.rst_idx_map_nr = ARRAY_SIZE(infra_idx_map),
+};
+
 static const struct mtk_clk_desc infra_desc = {
 	.clks = infra_clks,
 	.num_clks = ARRAY_SIZE(infra_clks),
 	.mux_clks = infra_muxes,
 	.num_mux_clks = ARRAY_SIZE(infra_muxes),
 	.clk_lock = &mt7988_clk_lock,
+	.rst_desc = &infra_rst_desc,
 };
 
 static const struct of_device_id of_match_clk_mt7988_infracfg[] = {
-- 
2.34.1


