Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606A7EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PePCPb6R3eEJnXq08KNNZSBKk/Eh/WUZ8RyEoWwxLz0=; b=dW337/bIUnNg0dEo5Boao3GMId
	KmRd9S9dy0NVLnUsKx8dn98zF6sIgxkjvP9czH/tJkG0zTzRJ7o0EiSWa1L4FRbrZs6Y4Z+Eu9CVH
	si2+pKlb/2nwaO8R7oa875MuaSJkHHrYQVORsS79bcNkI1IVX2vzmPHBOQftF1PgxK0Gn0OFoTOVI
	GyOiSV7KscksJqV5gU22lmddz8FiF1yr/1aAVSSSenR6L58e6en8h1qPlypT7WfCbK+K7f/cALYeR
	OKvoLJXKvtZmtX7hU6trL1sOu1U+7N7V1Qf0t2ZpLecQKs2kCUPG0723KGjloqyl7Fgx8I32FYcvm
	Mqj2w/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqeF-002DO0-21;
	Thu, 13 Jul 2023 07:21:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqe8-002DLo-2p;
	Thu, 13 Jul 2023 07:21:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FF9D6607042;
	Thu, 13 Jul 2023 08:21:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689232910;
	bh=YRK0l2Fi7+00Lr14CS0P4wsfe8zKwHIlkn1EhDCCvpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lAVSvvcv88bmJDE7xFLTtpLHdtrMYagCk5/xAtSbzHUesSQte1CW7Yihf2BZWCt+Q
	 4rNXqrE5HBmt4Zq+pytVb6ZiNEozni/tNVy9IeqyCrUSum1ejZtcDzQJc8p9VpZa/U
	 Q1BQ74iOHKthjWpi845N09epTy5RcsV9cqo6J3G0RGE6V2ia1Zw8J7i1LDjzjUoMew
	 +d1Q+tqojkFTevlUjF8LMIeUBpm7+KBtQXkRSjAHWsbcJFvjubUZ6WpL9lodla45so
	 bGsmiwdQ55RO8ql46cdcCL7JE991i96YV+lPfTX6i2n7DBdIU0joQbffoEoU4oI2eA
	 MZOAKJJyxEJdA==
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
	miles.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes
Date: Thu, 13 Jul 2023 09:21:38 +0200
Message-Id: <20230713072138.84117-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_002153_057481_219CB560 
X-CRM114-Status: GOOD (  13.86  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 81daa24cadde..abb3721f6e1b 100644
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
2.40.1


