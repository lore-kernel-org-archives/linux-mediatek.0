Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1ADCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCeuu0lZCoZ29bEjcv6MrNqWr3B/LJ88K4JK4Yu231Q=; b=RN5iQeoGN4ubWbNk/SB9Ce5QPI
	OYaNxPQuxdz29pjdk9RJgTPCAjbUaEITF0HrBfL6eRTcSmC64pnRUnucI54FUqnYT8c+RKiW8wnkh
	u2ul+mi6IVLCcn4VxahVHTQfMLR6P4P8bjecHxCDurWeBPYEB8mugkUDbemd9UJXLjWLLlblKy/3H
	9oQ4XdGFrURWsltcKGfuOrMvFebkId2exK6az0LYyytM3CUcLTQaOwkUCRf8r7n26QoiP9o5RRgBL
	YjbuBeJOvAynk0YVvJiiznnNZdiFrGwsCeQ4zaQ/SaBgfzrbVoThF9W6rYTMErlWSGWBl8atr9Szd
	Pl2u4ICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwN-00000008fNt-3IE0;
	Mon, 11 Aug 2025 18:08:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIL-00000008AeW-2j8h;
	Mon, 11 Aug 2025 15:18:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36A33668D3;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDC3FC4FE07;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=Rw9Gk4+QNNQQ22Oplb/nL6UadRxNdVe8S5ltBz9aEjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V+UmgY5RPoiQjUgGh8zftmb+UZPjlG3zK+FfqL9fXQut0cErfA1HF38XeRDuK6cWe
	 9MVVWHTNdupX3AiNfDesbaGJaRPgQTrgmQS2lMFtujwLc4RTkyE7RlGKxpRW2CBUkf
	 tFCPGepvG3NrJkXE82t8UzujU/bW568SubHigT0QGwWzf5uhalXtFqzXiy3XMFjjk5
	 0HoCZPPR3JjuqiHXBos46KlNlqVf6kuijoHMB8OskMk4yTUYsxX+c5CRMLz35BBrcI
	 hUTQsOevyDHlWK6M0LLXrwhj1J9c/Va+D7qRqYEuEZGK5h2s3ik2YIRypXE44Bahcu
	 cTwdj/Dd3U4HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58BDC87FDA;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:47 -0400
Subject: [PATCH 055/114] clk: st: clkgen-fsyn: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-55-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3173;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gUSLbeZHr73B/I2fV9jotoRj8MmBd1lu8kA4ol+iIJ0=;
 b=G6k4uh/JRAn4/1Td8h7erdt/dHCXUCAhiA0vLqRrFWA9B+Z4UG8OeJjyBbv4xxj66+p+h/rCk
 7Ok2dvXQYtwDl/u4bPzZSai6M4gKpoLwoMpcJ2RakLzXW4yhmR6iimb
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
 drivers/clk/st/clkgen-fsyn.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 40df1db102a77bbe5144d42f6e05361b66634e9a..e06e7e5cc1a56192cceeea20343c292423015bbe 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -375,22 +375,21 @@ static int clk_fs660c32_vco_get_params(unsigned long input,
 	return 0;
 }
 
-static long quadfs_pll_fs660c32_round_rate(struct clk_hw *hw,
-					   unsigned long rate,
-					   unsigned long *prate)
+static int quadfs_pll_fs660c32_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
 	struct stm_fs params;
 
-	if (clk_fs660c32_vco_get_params(*prate, rate, &params))
-		return rate;
+	if (clk_fs660c32_vco_get_params(req->best_parent_rate, req->rate, &params))
+		return 0;
 
-	clk_fs660c32_vco_get_rate(*prate, &params, &rate);
+	clk_fs660c32_vco_get_rate(req->best_parent_rate, &params, &req->rate);
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u]\n",
 		 __func__, clk_hw_get_name(hw),
-		 rate, (unsigned int)params.ndiv);
+		 req->rate, (unsigned int)params.ndiv);
 
-	return rate;
+	return 0;
 }
 
 static int quadfs_pll_fs660c32_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -436,7 +435,7 @@ static const struct clk_ops st_quadfs_pll_c32_ops = {
 	.disable	= quadfs_pll_disable,
 	.is_enabled	= quadfs_pll_is_enabled,
 	.recalc_rate	= quadfs_pll_fs660c32_recalc_rate,
-	.round_rate	= quadfs_pll_fs660c32_round_rate,
+	.determine_rate = quadfs_pll_fs660c32_determine_rate,
 	.set_rate	= quadfs_pll_fs660c32_set_rate,
 };
 
@@ -814,19 +813,21 @@ static unsigned long quadfs_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long quadfs_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int quadfs_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct stm_fs params;
 
-	rate = quadfs_find_best_rate(hw, rate, *prate, &params);
+	req->rate = quadfs_find_best_rate(hw, req->rate,
+					  req->best_parent_rate, &params);
 
 	pr_debug("%s: %s new rate %ld [sdiv=0x%x,md=0x%x,pe=0x%x,nsdiv3=%u]\n",
 		 __func__, clk_hw_get_name(hw),
-		 rate, (unsigned int)params.sdiv, (unsigned int)params.mdiv,
-			 (unsigned int)params.pe, (unsigned int)params.nsdiv);
+		 req->rate, (unsigned int)params.sdiv,
+		 (unsigned int)params.mdiv,
+		 (unsigned int)params.pe, (unsigned int)params.nsdiv);
 
-	return rate;
+	return 0;
 }
 
 
@@ -873,7 +874,7 @@ static const struct clk_ops st_quadfs_ops = {
 	.enable		= quadfs_fsynth_enable,
 	.disable	= quadfs_fsynth_disable,
 	.is_enabled	= quadfs_fsynth_is_enabled,
-	.round_rate	= quadfs_round_rate,
+	.determine_rate = quadfs_determine_rate,
 	.set_rate	= quadfs_set_rate,
 	.recalc_rate	= quadfs_recalc_rate,
 };

-- 
2.50.1



