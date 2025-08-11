Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1433CA0EE0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXKP8EGwtJLarKUa3+ngaOG31Sg05cv/NFWDbn8pP60=; b=4qnfwzOQPD6J03dCknjQWE2xW6
	VUbqGiokuKz/4w+ijjYHz3VW89X+BU0u3JX0i687qdO8atmJkRfdRA4H7PakkbzJzlBwdA4XcZVeA
	/T1eUVXVFQAyRrhhFZWGTrpn1bZ7EV61CTiTYK/Gvzi7uX4pypbDSKGOCTEF0spxCLPgCdr1Zu0XU
	K7bZNyphq9zZO6hHfFjizwBTPOZaaReylnf/lyDVOgyXswTGtXa+llzIiZZmqhXMdXZmatx/gSo6s
	ioUNuwjDzyCvSMCUn0o3djghnvM3bh5A4keYf1dngUuHyJCfMUVthmXmLlz0bH4+mPBI25TkG0aE+
	J1j5FQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaZf-000000097PG-2eRe;
	Mon, 11 Aug 2025 22:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIM-00000008AYp-1PhX;
	Mon, 11 Aug 2025 15:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA0262A33;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09DCCC4FE12;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=ka6RsobpShW1W444hu7gZgihbVmhSL35EtuoRcCbaoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A+j9T//aXCG/U5cUkEZPYAqqYn6XNb9dvRtDFvx64+8C5N/sbf955GLg2DLyYvb4p
	 Xx+otZ6f9LMTR+s9df0ON96ksz4fGrD0FsdV8AfxEqX0R9wR75CgAe7QEbPcK/7++n
	 E3TbGtgUI4L26A1tm8VGJsTclbBXBYU6ncRp2nx93dwOo6lOo0tYVwjO7Qm/OMBiYx
	 FMMFYr+ZGAmxRhVykgvW3+MYNY/mMxpo17vo3pliNxso+q/HVqHaV0noxQYi8ik3zg
	 Uk7hAPSxuhOekNWiyWw5bT0zMsgyrP/F6eB34svY48TH4WrFcCocuRU69BwQTYJqwa
	 ttDF4Db4G84eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EEDCA0ED1;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:48 -0400
Subject: [PATCH 056/114] clk: st: clkgen-pll: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-56-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3742;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DJwN7TJEr1OocxSY3Z1pVTjDxUr8XVH+extNRlOeEW4=;
 b=MjOGu58JaAdED95YxFBxhEu7hVCzagXGHoLz7U+b8TPrq9voM+ZfA+Cmdzu2S0hB52FuGFxSF
 IPHNudtfn2qC0qrjt5lARsQWfxH/vXDw66iTVJPoSCURdxji4e9uNjz
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

Note that prior to running the Coccinelle:

- round_rate_stm_pll4600c28() was renamed to stm_pll4600c28_round_rate()
- round_rate_stm_pll3200c32() was renamed to stm_pll3200c32_round_rate()

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/st/clkgen-pll.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index b36e4d8036364a126fea3afdd8b936fb93de27f2..c258ff87a17127b872fb5591503e171571866a0e 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -395,25 +395,28 @@ static unsigned long recalc_stm_pll3200c32(struct clk_hw *hw,
 	return rate;
 }
 
-static long round_rate_stm_pll3200c32(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int stm_pll3200c32_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_pll params;
 
-	if (!clk_pll3200c32_get_params(*prate, rate, &params))
-		clk_pll3200c32_get_rate(*prate, &params, &rate);
+	if (!clk_pll3200c32_get_params(req->best_parent_rate, req->rate, &params))
+		clk_pll3200c32_get_rate(req->best_parent_rate, &params,
+					&req->rate);
 	else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), rate);
+			 __clk_get_name(hw->clk), req->rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
 		 __func__, __clk_get_name(hw->clk),
-		 rate, (unsigned int)params.ndiv,
+		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
-	return rate;
+	return 0;
 }
 
 static int set_rate_stm_pll3200c32(struct clk_hw *hw, unsigned long rate,
@@ -549,25 +552,28 @@ static unsigned long recalc_stm_pll4600c28(struct clk_hw *hw,
 	return rate;
 }
 
-static long round_rate_stm_pll4600c28(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int stm_pll4600c28_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_pll params;
 
-	if (!clk_pll4600c28_get_params(*prate, rate, &params)) {
-		clk_pll4600c28_get_rate(*prate, &params, &rate);
+	if (!clk_pll4600c28_get_params(req->best_parent_rate, req->rate, &params)) {
+		clk_pll4600c28_get_rate(req->best_parent_rate, &params,
+					&req->rate);
 	} else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), rate);
+			 __clk_get_name(hw->clk), req->rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
 		 __func__, __clk_get_name(hw->clk),
-		 rate, (unsigned int)params.ndiv,
+		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
-	return rate;
+	return 0;
 }
 
 static int set_rate_stm_pll4600c28(struct clk_hw *hw, unsigned long rate,
@@ -628,7 +634,7 @@ static const struct clk_ops stm_pll3200c32_a9_ops = {
 	.disable	= clkgen_pll_disable,
 	.is_enabled	= clkgen_pll_is_enabled,
 	.recalc_rate	= recalc_stm_pll3200c32,
-	.round_rate	= round_rate_stm_pll3200c32,
+	.determine_rate = stm_pll3200c32_determine_rate,
 	.set_rate	= set_rate_stm_pll3200c32,
 };
 
@@ -637,7 +643,7 @@ static const struct clk_ops stm_pll4600c28_ops = {
 	.disable	= clkgen_pll_disable,
 	.is_enabled	= clkgen_pll_is_enabled,
 	.recalc_rate	= recalc_stm_pll4600c28,
-	.round_rate	= round_rate_stm_pll4600c28,
+	.determine_rate = stm_pll4600c28_determine_rate,
 	.set_rate	= set_rate_stm_pll4600c28,
 };
 

-- 
2.50.1



