Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC6CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMerZ2RG8VFv+V6JmXor6j+GciuTsuQ50qjMzaqmonA=; b=bH+3kN2N+LI5bOGQB0ERAtgTAp
	0ZWIvPhCbU3jvCq62iVt0LAMdHUT5Kb9yEyLtgeRL5MsewXHQiXcFxOe6VE3+VRtGvaopL/PqMrlE
	WonYy4MRtk9/gjGc1eobNHo/lIE2TRHcsTOZYi3qfxzZWlA8dtgsINJZqDi4O3TIToIEcNlwDqTvi
	l1mYp0oZDYLtnnuP7QEhf8Ufa8dDC7NAbNciKipb3LNKLSt2QPAUcUoupkS2/P8TVVVkAxjT/QyzX
	7yvNNezohx7kogmUPCmoy/7hGgjgHk1XJOLn4sIpfh4wIv1EXuiMNYEC9yGwBiCtL3y5PicM7knw6
	1lPdnp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaZR-0000000976J-3d85;
	Mon, 11 Aug 2025 22:00:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIC-00000008AYp-2TB9;
	Mon, 11 Aug 2025 15:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 608286144E;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE47C4CEFD;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=KIzK1y+XvJXgXVJmpxuu1oj/TOtYyynNT1K4bxquqpQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ladf+r+f+n6mLIzsUVkEhYGuhV89YOHh1xm5PwjJdWqejO8mknxvrm0/Uu0kUnMJg
	 ypa0J0UAFTt/wXwIa9FFLUpBrbkuCKqs3TKGAP2ygJ7GznrHhKvMxDvNAY38yefc7Q
	 keI9OSOQD7Qq60BwfotALnCbK5DtdIT1B4qyLQT3zq2OmRNVoe0sgtVxT9mJ6247bV
	 s3G5UYBX1PyY9kTM1JheVrOq+lAhNjuqCEAZlGKYNFsKGouUPwtJKt8Gs3luR0g/yf
	 BX+KfFH8JcA9T1e3wmruE4MmQUQ9g7PEpRttyerBZ073OiOHtJIgvydtjd1/rWTjgG
	 QppZEQOWJ+3Xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD87C87FD2;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:19 -0400
Subject: [PATCH 027/114] clk: max9485: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-27-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=2448;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ACn7Vzsmdgc+NbDAa3T2dL1GhpryIFxMBrKCCE3Hka4=;
 b=OH/TJn3POMBI1RZ7OuWCF052s7ausTtnOWsJMmihrPM2qsKOSmjfBDkfMqICJ5bu7wjHjW7Fd
 vPIX9InPWBxDR3TMeX7PJ9YYwvobQIWrICCRcdOgZLyIa+xzx9WVjKV
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
 drivers/clk/clk-max9485.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
index be9020b6c789642e6d63065aa905088e01929147..0515e3e41162e38fb31809e7cb3116257204f2c0 100644
--- a/drivers/clk/clk-max9485.c
+++ b/drivers/clk/clk-max9485.c
@@ -159,29 +159,32 @@ static unsigned long max9485_clkout_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long max9485_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int max9485_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	const struct max9485_rate *curr, *prev = NULL;
 
 	for (curr = max9485_rates; curr->out != 0; curr++) {
 		/* Exact matches */
-		if (curr->out == rate)
-			return rate;
+		if (curr->out == req->rate)
+			return 0;
 
 		/*
 		 * Find the first entry that has a frequency higher than the
 		 * requested one.
 		 */
-		if (curr->out > rate) {
+		if (curr->out > req->rate) {
 			unsigned int mid;
 
 			/*
 			 * If this is the first entry, clamp the value to the
 			 * lowest possible frequency.
 			 */
-			if (!prev)
-				return curr->out;
+			if (!prev) {
+				req->rate = curr->out;
+
+				return 0;
+			}
 
 			/*
 			 * Otherwise, determine whether the previous entry or
@@ -189,14 +192,18 @@ static long max9485_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			 */
 			mid = prev->out + ((curr->out - prev->out) / 2);
 
-			return (mid > rate) ? prev->out : curr->out;
+			req->rate = mid > req->rate ? prev->out : curr->out;
+
+			return 0;
 		}
 
 		prev = curr;
 	}
 
 	/* If the last entry was still too high, clamp the value */
-	return prev->out;
+	req->rate = prev->out;
+
+	return 0;
 }
 
 struct max9485_clk {
@@ -221,7 +228,7 @@ static const struct max9485_clk max9485_clks[MAX9485_NUM_CLKS] = {
 		.parent_index = -1,
 		.ops = {
 			.set_rate	= max9485_clkout_set_rate,
-			.round_rate	= max9485_clkout_round_rate,
+			.determine_rate = max9485_clkout_determine_rate,
 			.recalc_rate	= max9485_clkout_recalc_rate,
 		},
 	},

-- 
2.50.1



