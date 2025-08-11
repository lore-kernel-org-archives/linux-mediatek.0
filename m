Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C9BCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME6lEDlQ6+xxGiVBD7OFImHHY9qi9pYnBqzTMaALDkg=; b=qYtHx0Fqc+38v2y5FzGUq7ujKS
	Q0Ypof/7zP5+JBmJqUeZxmsNierPA4SvREePnfwKvyIOj6RxDDeY+yKvC0paK0nvSuVwJJcNNqabA
	3MOL8dSwTg4dZ+zcNWIqg5NW8y6rmPurbKyB+ZyZXU+G0g98Pyrb5nLRGzN7uVL0KRciT9owMn8uj
	Wt4BWCeKUfgUp9idh1qtPs1s18lhBISZDmO+2M8YhKvos7x31qCH1qqAXA6nFAIWm+MLq8+7nRTkS
	drRGzQbjb5cT9+5LWmOaz9MJcq3j5QMklmxNU6Q3fGERDSDSIkiRBvuAKAAuKaIBfvIePnwecM30N
	8fLx4LuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWyS-00000008ik0-1rs7;
	Mon, 11 Aug 2025 18:10:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIj-00000008BFu-3W9u;
	Mon, 11 Aug 2025 15:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8787A669BA;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 870DDC4FEFE;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=dOdvJdcA4P64YGOsh1mWY9qtQhLXGnbrbXZ4HSzJ/cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QNqWgYxI3xVpAydwYjfOR/2fKVtw/8uikxVa6qJ8QVH5coT3SVh23c6m9t+2HAzpu
	 kVopC31ieJ0y7pc/U8m/KeiMfM3c1WgmOdmkpAxq+6YR4V1pyRGsLF7QUUuvvEQVMW
	 xgLCIdFvgev2zX1DtHGc3sva8Utfo9Ifjgsm7Rs2dFSaMSS2FVgJ2gh9GB75DHEzom
	 ADiFMsHNWoFCHzKZJQpIMW/4+F/hHR7Zr3eQpy3fT0XkzD9P7w/fwcSA0/8w2k0oKw
	 PkTmCUFDJq0W0zRJce86Bdiq0O9g9VQOUKv0KwzQ32DrDddUZwDs1EwrF0AkSlLWWp
	 VjTjMM3j28dyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70800CA0EC4;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:24 -0400
Subject: [PATCH 092/114] clk: renesas: rzg2l-cpg: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1381;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4eocXIeBrIAhEAYoEiq6nvsnUaeIIvGe3yw0SgJVNeA=;
 b=pvzcWflSX2kzk2EFzNqx9GSBidtzEcq5UEB2YYqhdQKabwT3/B3vFcO8DHrM4EKcP/5OQh28Z
 7TbB9dM7lWHCX8nkET78PQpCBdN5trdlhCUBPND7MCzuQl+/658c9sB
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
 drivers/clk/renesas/rzg2l-cpg.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 187233302818a66a763daefdd1c982b2a6e4e71f..b508823f9723c27678aafb46eb28e3b04f011636 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -824,11 +824,10 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 	return pll5_rate;
 }
 
-static long rzg2l_cpg_sipll5_round_rate(struct clk_hw *hw,
-					unsigned long rate,
-					unsigned long *parent_rate)
+static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
@@ -902,7 +901,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
-	.round_rate = rzg2l_cpg_sipll5_round_rate,
+	.determine_rate = rzg2l_cpg_sipll5_determine_rate,
 	.set_rate = rzg2l_cpg_sipll5_set_rate,
 };
 

-- 
2.50.1



