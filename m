Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE14CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fxu5+6HgIjf+tDdojd5CWiLq3rwiXKWv6+XT4/dp3U=; b=IzTMJQz4Biv1jY+y2ld8cpnXUx
	GfN5J4S0kqW0ebL3d9FGaNXPYJhsclDryZKpPI/CX1PEkwIzP3rbhi/N7rtkoP4FRakGUZOJZYRk1
	K6Zy3bK5NRHXUErvFebX1dVhr+YgRLb+rv8LNO6MX3+iuHYkK3/WH9dyz8gEzWyXnhzNoV24CMWf4
	ToXezXrFbTimTafObKS2425TOedhYoUwlTbF7qNJB5AuFMCnx7Af/6/ng8UCOWQSZkwHktQJNDefP
	OYxwa8ag93JFelIrn0moQ0jhqedyaNgxvnwW8JAQOb9puVZr6pFftn2guR/BEsqVzZH6rFx1n57NC
	qaEI07hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwT-00000008fYH-2ifh;
	Mon, 11 Aug 2025 18:08:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIN-00000008AeW-0rly;
	Mon, 11 Aug 2025 15:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA3D62A2D;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15423C4FE87;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=jG3yxXJ79lHdae10GlwGV2mo/hPUrMugrmvjpwEgG6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i1cz5cMjl77nGHNZ3V24o7SKDmktE56TXnC35AD5Vb300rDz8iujAWmvoP0FxyUhb
	 SifaH9VEIzVsxcBmxsNpkqz3xvPb2aHp2AMbkTofUvDtPTAF1Qdnyms2c5nmTa35Bq
	 oU0R/iJ/00vervbj9gn5WU90m/Gd2IpIDlhrfX6Q4Yf5v73+Jcz6xKbkbaVBWN8Oil
	 Wq65nZlowMflkzNaM8eRsV3oU8qALHAF3+sOMtW2d4JtAqneiPdzn4PQYblpR6kY09
	 PU6FjgDlpQy+KRdJW0Ni+krK8j/2/F008/NV6E+jvLatEFsEup7NJvMe6CBc0fdmwa
	 O9qOG5jAgy/aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA50CA0ED3;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:49 -0400
Subject: [PATCH 057/114] clk: stm32f4: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-57-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2998;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=AumK8BwNqzO627oEWWSfUxrEbI4mV0KAS1s9UAxn9TA=;
 b=pNrNmNIcyX36FbFqMWLlv3eoG6G/f+nT9NUyvbIM67aj47jQla4WbcCgNFVyBGKoRc6fMJY9g
 /Hc08HVRHA4Bnhh/vlJMd14EV3TINDDYbL4KIb3mILPMqr9tATZabYE
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
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
Reply-To: bmasney@redhat.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-stm32f4.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 719cddc82ae6f8f706716e5ba91a69759c066415..b5d4d48432a0be0a416d628667893e7165caaf0a 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -443,8 +443,8 @@ static unsigned long clk_apb_mul_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long clk_apb_mul_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_apb_mul_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_apb_mul *am = to_clk_apb_mul(hw);
 	unsigned long mult = 1;
@@ -453,12 +453,14 @@ static long clk_apb_mul_round_rate(struct clk_hw *hw, unsigned long rate,
 		mult = 2;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent = rate / mult;
+		unsigned long best_parent = req->rate / mult;
 
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
-	return *prate * mult;
+	req->rate = req->best_parent_rate * mult;
+
+	return 0;
 }
 
 static int clk_apb_mul_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -474,7 +476,7 @@ static int clk_apb_mul_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_apb_mul_factor_ops = {
-	.round_rate = clk_apb_mul_round_rate,
+	.determine_rate = clk_apb_mul_determine_rate,
 	.set_rate = clk_apb_mul_set_rate,
 	.recalc_rate = clk_apb_mul_recalc_rate,
 };
@@ -670,21 +672,23 @@ static unsigned long stm32f4_pll_recalc(struct clk_hw *hw,
 	return parent_rate * n;
 }
 
-static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int stm32f4_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
 	unsigned long n;
 
-	n = rate / *prate;
+	n = req->rate / req->best_parent_rate;
 
 	if (n < pll->n_start)
 		n = pll->n_start;
 	else if (n > 432)
 		n = 432;
 
-	return *prate * n;
+	req->rate = req->best_parent_rate * n;
+
+	return 0;
 }
 
 static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_rate,
@@ -749,7 +753,7 @@ static const struct clk_ops stm32f4_pll_gate_ops = {
 	.disable	= stm32f4_pll_disable,
 	.is_enabled	= stm32f4_pll_is_enabled,
 	.recalc_rate	= stm32f4_pll_recalc,
-	.round_rate	= stm32f4_pll_round_rate,
+	.determine_rate = stm32f4_pll_determine_rate,
 	.set_rate	= stm32f4_pll_set_rate,
 };
 

-- 
2.50.1



