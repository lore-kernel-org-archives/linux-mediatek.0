Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5937ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fbdeHR+s646w6oDUs5+49lvZUiSchoQjKFtS+q36+w=; b=v9qTeH0dV/GrmnZYNDR7KRog4z
	6vdFNau5l91L6ZssxWoZqGRf/l0Shrt8vbKBFo+CjNieBTCX5S0NgrR81q/VNHFmlXEhM9miH8uPE
	i/t+cz2V1ByrAN+ZNLZw3k3Tv6zreD4X+qE0jm/tOAgbtTHaxPY2AsLAk+wHi1IuclcdxKCjjEm0Z
	4WDWIiZ4wilzgQlNPjHB5Eqmi68Hp0G+pL0tGiC835awQKiYns/yEdfHAt7H8VymDdyxprOP0R1P7
	FdxsHwYr509N/cO+3KQQbOFI5uC+VYIttucRL6fHvzwTY26puQHxojEhBgzXg/2YfwmLpqjPsI3hp
	DsWsj+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omueg-000i7f-IG; Mon, 24 Oct 2022 10:26:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucI-000grU-6B; Mon, 24 Oct 2022 10:23:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1999E6602827;
	Mon, 24 Oct 2022 11:23:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607013;
	bh=Mq9twGbY6UZGP7eQ93JIXnpDsfHgHcgSIK4smKa1rSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVPSwK9b+GyreNN73BJxPoJ40mLsqXJMqLzhzvc6KLsWLdXhyA0lkXqIEpD1YvSiQ
	 fYw5jhzpEOHDFXFYezdq/EtWNMjFlJISS6hzx2SOx+g945Uo+YoODbb5daZ5H6CxzK
	 tGi+omsVS13g6sDfpLDrE3d6KJQ0w7iDkvXpQOKjv8wGbrkdqK6+G2pXJcjeFSrn7l
	 Rno7sYmAUCsnwkLhzaehO8I+6wtWfh2uIiVqHOm5ReCjOfSByRHTQcBv8g/LphrBCO
	 0WE2+FicR8qaLMfvbQEJn1cGCyBErxsk0Gv0eebzXIqcg+k+dnk1xf42OGhsELVXBd
	 Tjc3BvSj4Ua4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
Date: Mon, 24 Oct 2022 12:23:04 +0200
Message-Id: <20221024102307.33722-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032334_515368_A5F1175C 
X-CRM114-Status: GOOD (  10.04  )
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

The main/univpll clocks are used as clock sources for multiple
peripherals of different kind, some of which are critical (like AXIs);
a rate change on any of these two will produce a rate change on many
devices and that's likely to produce system instability if not done
correctly: this is the reason why we have (a lot of) "fixed factor"
main/univpll divider clocks, used by MUX clocks to provide different
rates based on PLL output dividers.

Following what was done on clk-mt8186-topckgen and also preventing the
same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 76 +++++++++++++++----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index d0f226931070..0e88588b2c49 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -31,38 +31,38 @@ static const struct mtk_fixed_factor top_early_divs[] = {
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
-	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll_d4", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll_d4", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll_d4", 1, 8),
-	FACTOR(CLK_TOP_MAINPLL_D4_D16, "mainpll_d4_d16", "mainpll_d4", 1, 16),
-	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
-	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll_d5", 1, 8),
-	FACTOR(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll", 1, 6),
-	FACTOR(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll_d6", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll_d6", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7),
-	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll_d7", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
-	FACTOR(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll_d4", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll_d4", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll_d4", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll", 1, 6),
-	FACTOR(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll_d6", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll_d6", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll_d6", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D6_D16, "univpll_d6_d16", "univpll_d6", 1, 16),
-	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll_d4", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll_d4", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll_d4", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4_D16, "mainpll_d4_d16", "mainpll_d4", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll_d5", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll", 1, 6, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll_d6", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll_d6", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll_d7", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll_d4", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll_d4", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll_d4", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll", 1, 6, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll_d6", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll_d6", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll_d6", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D6_D16, "univpll_d6_d16", "univpll_d6", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7, 0),
 	FACTOR(CLK_TOP_APLL1, "apll1_ck", "apll1", 1, 1),
 	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
 	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
@@ -96,12 +96,12 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "ulposc", 1, 16),
 	FACTOR(CLK_TOP_OSC_D20, "osc_d20", "ulposc", 1, 20),
 	FACTOR(CLK_TOP_ADSPPLL, "adsppll_ck", "adsppll", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll", 1, 13),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll_192m", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll", 1, 13, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll_192m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32, 0),
 };
 
 static const char * const axi_parents[] = {
-- 
2.37.2


