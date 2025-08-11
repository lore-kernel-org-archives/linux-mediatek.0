Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C4FCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0JZA/agf+JEz8Yg72q65nQ/AjA5Mf1tLlYzhPmYov4=; b=btldUC5XsIVOs8yaCHaBgGngr5
	FG9ZfK3gIDqCi5AVYec5iv2Cw0vfWVh8y5s1jGiNzpdG8wBFDG9uOpu2dgAAZhG703hCQTIq3fz5y
	9w8QEsiA+LPwvFlNxEsNBZu9tZK4gZJMpNfT4O67Xx6nL3LF/attR+WwLUnwgJeEUWBc50QFlzEiq
	tWRzoXBFjwsIZVbrhwLpuzGgEHg2X9wKFS0fO0GUnkxh2pu/T7pKXBis5PIIhhnk1axaLJogTp4jF
	9hTcCdO3ocRYitUCTp4UZiRqrNCTg7k51AsuOipnJcRuD+8jGsQmrk2bZikFFX6IpETJ9JBYJ4AST
	Mk6vgBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaZl-000000097ao-2whN;
	Mon, 11 Aug 2025 22:01:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIS-00000008Ay4-3fdR;
	Mon, 11 Aug 2025 15:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=h0JZA/agf+JEz8Yg72q65nQ/AjA5Mf1tLlYzhPmYov4=; b=mQ9yYGrAapgcrv66NS7nUKj6qW
	iCaDKDE7vBc7byYF0pORBBM5MKxOfT78KSV3PcT2P/Mr0kLyovtzjJ6mqlHyg/K0nYB3/6pbfRp9V
	hup1D8ouUhwah87QpLLp5GsH2qjQDaa7BZX1/LN8kF8SHkvlEb9t9Nniqjde8MD3bR0OLpS6qcpiF
	YNJFkTggq4K1fyL978cxYBA1ACJcjYFIRLC4U43lmyH2IvcXnZDME0MuOZ/jQmpIb2mahodfc23eb
	VyeJ6cSFLGtboFoz2Aozjc8gmHGBX75MCjGhwygNAFSlfsEvAkiaJXkiJP53l1afqVNb+X+g/zHSj
	2wFxBfZw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIP-0000000FQnC-2Vn3;
	Mon, 11 Aug 2025 15:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1EBBA57314;
	Mon, 11 Aug 2025 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C94FFC4AF17;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=aleHzy/bmLuB3s89O+buRyV2P2i7py5ZdZ6P6jiPHIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A6QpMquUC7zaa7TXuUesWidWPtYOBnmvJ8J8zOTsk0VhlXk8cmAbDbqf/+w+6wKVK
	 yJSe+Uk0iaslGrhkwEoLPCM4RQBn7pbJ9DDkMcePkE7bp+7PsKbJz0X6LHIOf5NEnE
	 PxIhzkbe0lmWQvGzP2GF10BeP6gPEPEyfQ4/j0mnBgIt9zrVTb0MqMxZW3Lw9QpSFl
	 RqRy9fru9i+kOEasCVde3u0m0cR1pHgyeuIQGfkiVRHES0UekuXJM96bd/ASyFNdfN
	 FBB0ge4ekWvm6LW0iKYmepinPvfS3urvrVI4Tw2WzynT+yHK/aP+hNcIXK9ytjhsUK
	 IFAQHStpMGisQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EA9CA0EC4;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:46 -0400
Subject: [PATCH 114/114] clk: fixed-factor: drop round_rate() clk ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1803;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fJm5zLm7t/b679pxq5XVBMXHd16flIW2D3MZ7AgyXpw=;
 b=+PM5fg2XrMfsZlKktcebRCobsnkNQm59uWONhCTgKl2shyo7rlGnDOfyXt/RbzeHqcx/hKJz6
 OmeZt4fbsUuClQMhJaW+3Y9EvTTV4IU2juRSNxMnB9dXoAzPDAye2RR
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_161846_143976_22D35231 
X-CRM114-Status: GOOD (  12.24  )
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops. Also all clk drivers that directly calls
fixed-factor's round_rate() have been migrated over to determine_rate().
So let's remove the round_rate() clk ops.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-fixed-factor.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 79b9a8c57d4b84be990955d8bc3159b818f38d50..de658c9e4c5386a7a8d22074322577e0e9efd2b8 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -47,21 +47,6 @@ static int clk_factor_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
-{
-	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
-
-	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent;
-
-		best_parent = (rate / fix->mult) * fix->div;
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
-	}
-
-	return (*prate / fix->div) * fix->mult;
-}
-
 static int clk_factor_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -87,7 +72,6 @@ static unsigned long clk_factor_recalc_accuracy(struct clk_hw *hw,
 
 const struct clk_ops clk_fixed_factor_ops = {
 	.determine_rate = clk_factor_determine_rate,
-	.round_rate = clk_factor_round_rate,
 	.set_rate = clk_factor_set_rate,
 	.recalc_rate = clk_factor_recalc_rate,
 	.recalc_accuracy = clk_factor_recalc_accuracy,

-- 
2.50.1



