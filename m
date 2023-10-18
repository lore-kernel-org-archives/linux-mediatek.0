Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1140CDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leHHh7J+nYXwhcMPClCWvx5ELV45fweAgYK2dMfwIQk=; b=vRVuKvwJyjV5y9ataoJm/UFmH1
	lPWr8o5anRnf6v48XVehuJ+Yd6MnGIxOlXkzLclTx5Y7Bmk5K/1rUoFKwEEC7L/BRA5M5zZLyhIrP
	UwnePAJOu2HSjbAZt94BbG62gy+J8VkBOOshd1+au/JaVtJEgnD2xUTvSFdbKM3YPNmU8p12q6yp7
	atuarsUd+LL38wAnc8bssHmh7BdmUwAgCL/nUrNEROA/jcRDZOIoO046WyldKTGe9jWL5fVBal0UX
	xqOwtIp2sze/JPhysbZioA0fsNe6OpCZFJhWg+bICv6YsrNHLqcU/7UL+2ceuyWa2re5EpzJuFcis
	RhxSLSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3uI-00ESHY-2S;
	Wed, 18 Oct 2023 10:36:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3u8-00ESEN-1f;
	Wed, 18 Oct 2023 10:35:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B4C866072FB;
	Wed, 18 Oct 2023 11:35:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697625355;
	bh=yrK40mqR2gkRIh6LcyARxcWeWdhXk/xzJHGv+Nf+PXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LfgFEm/f04v+pcByxzoSO9i4tGJc0XpHz8JuPUicRuQOEMpANSniPFw9DdPytn67k
	 rEztQG1EZ0kmdgTMnsozqcXbwz1WJTHbTc4ZZrGtb73/qbbschz9gIwqeph9gmU4gU
	 XTyvGbryYM+HaZ044pjw/cEqYyiQavT9InaAKb4JAGsL6gG7tsWVq+cugq4M0HP7PE
	 26WLazVX2U7GzIVYFa1MK99m/mE9xVMJR8Q9J9hxlvQrGWE4dosBE4QmpsqNLYSDve
	 BSfzBRWkCx4zmNmVxBWI1x7tYhRwgsuV3KJR2ERkIKkpEGDjOYoDQR4//FU/rbjz2e
	 47QO2IRZCj/mQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	msp@baylibre.com,
	amergnat@baylibre.com,
	yangyingliang@huawei.com,
	u.kleine-koenig@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes
Date: Wed, 18 Oct 2023 12:35:46 +0200
Message-ID: <20231018103546.48174-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_033556_683857_498DDD45 
X-CRM114-Status: GOOD (  14.69  )
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

The top_dp and top_edp muxes can be both parented to either TVDPLL1
or TVDPLL2, two identically specced PLLs for the specific purpose of
giving out pixel clock: this becomes a problem when the MediaTek
DisplayPort Interface (DPI) driver tries to set the pixel clock rate.

In the usecase of two simultaneous outputs (using two controllers),
it was seen that one of the displays would sometimes display garbled
output (if any at all) and this was because:
 - top_edp was set to TVDPLL1, outputting X GHz
 - top_dp was set to TVDPLL2, outputting Y GHz
   - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
     - top_dp is switched to TVDPLL1
     - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
     - eDP display is garbled

To solve this issue, remove all TVDPLL1 parents from `top_dp` and
all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
able to use the right bit index for the new parents list.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 5c426a1c94c7..4529255376e9 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -417,15 +417,21 @@ static const char * const pwrmcu_parents[] = {
 
 static const char * const dp_parents[] = {
 	"clk26m",
-	"tvdpll1_d2",
 	"tvdpll2_d2",
-	"tvdpll1_d4",
 	"tvdpll2_d4",
-	"tvdpll1_d8",
 	"tvdpll2_d8",
-	"tvdpll1_d16",
 	"tvdpll2_d16"
 };
+static const u8 dp_parents_idx[] = { 0, 2, 4, 6, 8 };
+
+static const char * const edp_parents[] = {
+	"clk26m",
+	"tvdpll1_d2",
+	"tvdpll1_d4",
+	"tvdpll1_d8",
+	"tvdpll1_d16"
+};
+static const u8 edp_parents_idx[] = { 0, 1, 3, 5, 7 };
 
 static const char * const disp_pwm_parents[] = {
 	"clk26m",
@@ -957,11 +963,11 @@ static const struct mtk_mux top_mtk_muxes[] = {
 	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_PWRMCU, "top_pwrmcu",
 		pwrmcu_parents, 0x08C, 0x090, 0x094, 16, 3, 23, 0x08, 6,
 		CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_DP, "top_dp",
-		dp_parents, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
+	MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_DP, "top_dp",
+		dp_parents, dp_parents_idx, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
 	/* CLK_CFG_10 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_EDP, "top_edp",
-		dp_parents, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
+	MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_EDP, "top_edp",
+		edp_parents, edp_parents_idx, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI, "top_dpi",
 		dp_parents, 0x098, 0x09C, 0x0A0, 8, 4, 15, 0x08, 9),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM0, "top_disp_pwm0",
-- 
2.42.0


