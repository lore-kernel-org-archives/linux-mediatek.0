Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B15ECA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N67QgDp6CPuc76V2No30JI+yB76CH8wP6o1e6ltCIek=; b=yRx5c0X4OV1r/2Pi/LQuzLjF1b
	mGeYX3045n2PEGDDREeQCw9lQcNKPEBf2aGZtp73OHs6USIkU7yqB5U1vzwSAc+wDXx4L/F1CJeRA
	3mswcRKje1bMbh9Wz1ekg0U53yzl5YdY5rJofO/apsqy1Fv0g39AhUudnkyopt9whJcs2pbmfFH84
	gRqwN9lS9+oxutjwHYB4K+zicGZ0btwAZf2pBkfa2WoDBwxcoZlTB/T34EAOkpQu6JS7gKLEambyy
	ZgLze6fLq+8r6B9yqj9s7RZEBgVtQL9301QN5BDRAgqpCxQAEJHGez/HYoJXqb8RM+LoU64f708v4
	NaQCOHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWvh-00000008eUJ-2dcA;
	Mon, 11 Aug 2025 18:07:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIF-00000008AeW-2pZp;
	Mon, 11 Aug 2025 15:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF9B561453;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58A17C113D0;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=BWrLK/2QKaqELL99etzCkstSanCH8EmFMrKJDjviGF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l6k9HvJNHPq5NuLL9gSWNWzBKFvU1Top5ripFANvxWyElR7IC+fm5d8yJAYNX/ufZ
	 iz2jwjXLbueB99e0UqEOTxZm3XRitkjF3lxWuJ1QqjPqtqd4jURbqrOLXvuk6uUIrc
	 vN6rU++ktKOY2R40TaL/m/Yn/3pC0JNancyRG47beQnXKO0NGCfNxSAC5t232C0ySs
	 2Yf17MIwe5GmM4ayKM+Gk+IJKjK3bFCIL1fLQUihVwdEag/omR0O+OJcWamIwCpfbg
	 4AkSKKyT8GBnJ4nCW9x1fy3lVsX2/FMlqk26IqGFWhrzAX8Z9crhJA9aDCSRNXO/HK
	 12LTk2Eu11mqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C316C87FD2;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:31 -0400
Subject: [PATCH 039/114] clk: pistachio: pll: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-39-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2146;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+1V8g819DjGvzEtSfNNXylx/juLgkkEkLmGzMnrjKxk=;
 b=zLWZ69AM98C3GotJh43hKXsmUseBKcv/FKBh6Bvp80TXqKOvqDECFY/rBAjmqzAF/3LuE38dI
 Fo+bO703n+zDeIzqQhm7F8aIb/hhu9z6CApkMZ3IIOCIZxU/4tIsg+F
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
 drivers/clk/pistachio/clk-pll.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index 025b9df76cdbdb338b3653f8ff60b6225da27034..d05337915e2b4514d031d15ed41aa75ed1fdae2c 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -139,19 +139,23 @@ pll_get_params(struct pistachio_clk_pll *pll, unsigned long fref,
 	return NULL;
 }
 
-static long pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			   unsigned long *parent_rate)
+static int pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct pistachio_clk_pll *pll = to_pistachio_pll(hw);
 	unsigned int i;
 
 	for (i = 0; i < pll->nr_rates; i++) {
-		if (i > 0 && pll->rates[i].fref == *parent_rate &&
-		    pll->rates[i].fout <= rate)
-			return pll->rates[i - 1].fout;
+		if (i > 0 && pll->rates[i].fref == req->best_parent_rate &&
+		    pll->rates[i].fout <= req->rate) {
+			req->rate = pll->rates[i - 1].fout;
+
+			return 0;
+		}
 	}
 
-	return pll->rates[0].fout;
+	req->rate = pll->rates[0].fout;
+
+	return 0;
 }
 
 static int pll_gf40lp_frac_enable(struct clk_hw *hw)
@@ -300,7 +304,7 @@ static const struct clk_ops pll_gf40lp_frac_ops = {
 	.disable = pll_gf40lp_frac_disable,
 	.is_enabled = pll_gf40lp_frac_is_enabled,
 	.recalc_rate = pll_gf40lp_frac_recalc_rate,
-	.round_rate = pll_round_rate,
+	.determine_rate = pll_determine_rate,
 	.set_rate = pll_gf40lp_frac_set_rate,
 };
 
@@ -432,7 +436,7 @@ static const struct clk_ops pll_gf40lp_laint_ops = {
 	.disable = pll_gf40lp_laint_disable,
 	.is_enabled = pll_gf40lp_laint_is_enabled,
 	.recalc_rate = pll_gf40lp_laint_recalc_rate,
-	.round_rate = pll_round_rate,
+	.determine_rate = pll_determine_rate,
 	.set_rate = pll_gf40lp_laint_set_rate,
 };
 

-- 
2.50.1



