Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039DCA0EDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJx/fo8ZX12RkpUkuO87RW7TgbbhDnywFK4+BcO5W64=; b=lOiXYE9pfkQ/e82A9XW2MOT2/u
	7Id4N9MnjRTcbnxLK+UIoZKYYE+263cQIrSjaM2TVj4lMIidvVXaC+hLqCnfB7a8c+99fHWR/sDk/
	ZwENnudVmoyDip+6QU4lRu79LcAl3NjTglUb4Rd2k6ZTyGIsNpYfDQXH3LvdpPWirpAAEOSsqJ6+o
	JclGCuUlRNM5uxaKfZ+S4A07xkhJ7rJm7kdGWYanw/+1MTWcrAXYAmz/Q2xe5M01zQU9rirdR1KtQ
	li+nfV00xlE63WSFRZlvQPcPCMFdJ0xOXjq/YzQqg2j+87XClHiseSFBQkut0dYcXhcBWsMOB4umm
	nFVvoGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWxN-00000008h9v-3vlu;
	Mon, 11 Aug 2025 18:09:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIW-00000008B3V-3imJ;
	Mon, 11 Aug 2025 15:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B38D966957;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15324C5383C;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925513;
	bh=NuJCEAEh3idUr6pU5F77ik+B6H4UWsdyl59LYOYF++w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d8SazZ9w82FFuZtrLd5bErX8sLaWibRYAywfZlG5TFVPJAlSe3CirHFTR9KVdtT6p
	 9XdaQspHo0t8a4/cco0NnRtdFVFGVq6PMPpkRxknLFCroJYJ6mhsXEOG/9H+v+Wi50
	 FG7fThVD7djnv98bmvUfm+KaI3koTcYvTZnnjXSPxpnChm7k8KaS6igfWHjcuCkJfT
	 beeE2dMsI+r6FSHTUeIoSaKOqULgaIQnBVOI8XdNIXaXPylzoMv/zR7Zd6qxCD7B30
	 rEaEzIO7/2A84Gj6nBzgmQ2LgP6w2uPTGHpjaVXdPRPdue2t+PLWuZ3Yoz668+xWvo
	 iAdrkLMRdQ9lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F133ACA0EC4;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:09 -0400
Subject: [PATCH 077/114] clk: axs10x: pll_clock: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-77-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1754;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=tJrefzaCIDHByIhDmSEbTFNo+MefLj7nMaGKSK6K6Kw=;
 b=m/812GTBmvOl/yXEoIRoY72Q2sCPGjSyIZ0zetPLMAujCyyipwCyUqF8+bQbyT504uREIcJX6
 Iy59Ks71TLEAws3xxupdrOq2zkLiYBEYQNSKs0r9amPdTNJKylARqU3
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
 drivers/clk/axs10x/pll_clock.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/axs10x/pll_clock.c b/drivers/clk/axs10x/pll_clock.c
index 6c7a2b62b406379279b1aab71ac0759f3c5fc64a..c7ca473ee76c83a52e924651046414f60736d542 100644
--- a/drivers/clk/axs10x/pll_clock.c
+++ b/drivers/clk/axs10x/pll_clock.c
@@ -149,8 +149,8 @@ static unsigned long axs10x_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long axs10x_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int axs10x_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	int i;
 	long best_rate;
@@ -163,11 +163,13 @@ static long axs10x_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	best_rate = pll_cfg[0].rate;
 
 	for (i = 1; pll_cfg[i].rate != 0; i++) {
-		if (abs(rate - pll_cfg[i].rate) < abs(rate - best_rate))
+		if (abs(req->rate - pll_cfg[i].rate) < abs(req->rate - best_rate))
 			best_rate = pll_cfg[i].rate;
 	}
 
-	return best_rate;
+	req->rate = best_rate;
+
+	return 0;
 }
 
 static int axs10x_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -208,7 +210,7 @@ static int axs10x_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops axs10x_pll_ops = {
 	.recalc_rate = axs10x_pll_recalc_rate,
-	.round_rate = axs10x_pll_round_rate,
+	.determine_rate = axs10x_pll_determine_rate,
 	.set_rate = axs10x_pll_set_rate,
 };
 

-- 
2.50.1



