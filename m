Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277DACA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSw7UbH5OSfiwukkYv9IKnLhgB/0QRy91jGjoSrcP04=; b=lhbLAgrOPMl67QJI/BOjJQyuHI
	7ybvXqb4jxoG1bKTQAlJN60a2OV3Y77v/rRul0XSDwIoROJDxj9pP8valvvRSY7t4kTT0OC5c+m0M
	qnUlzOhCzgxNeLcMv7biU8ZrDpk3Tvl99pDbxafbBz0+2piULegBSD9DjiZqNLglN7EdmlmhKrk6V
	tIhd368HgukRSBrdX5kdEGAf3TeLF96QU2De+CPSq5JMBVxRRkndXJeq+R5du1bHI+VZE/AFXMiqT
	rUhZYxHVgeunaI5+VqlOVjb9MHc8Uav1i8zRJjRNRvPVSFYGHRkcV/J45rUcKZvz2QYPnVkwvyVS8
	BuFwwhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWw1-00000008eoc-0TJC;
	Mon, 11 Aug 2025 18:07:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIE-00000008AZ7-3InJ;
	Mon, 11 Aug 2025 15:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC19046056;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56F49C116C6;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=C05qN+rnG/d3AGses+aAapiwOZCatP6PgtsobjYNUxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nQVlfLC5FERuGVAYNhIDC7pCSE1/v48Z2gdzhs4CNkdY1w/daDSpV0AOT3eYPWM1p
	 k+M2sOpSyN4dd3TS3i1Sp3VnpjBr5V508mW0O4o2j01jJ/d/k/0i6wowPRVoxqIQLt
	 +gkjyOGLrOhVfew0rcm3jDyXz3utMyzOBwZDDycZCm4ZpYZ5Jz+SZa5prgxc2qArgd
	 pxudJnL0X5/ospwn5MR1r+ofn0VCZlEXOK5b0S3D3jGlPrL7VPqsf/7azLXTDGeYVm
	 AdwAgVUAI4nBQhek7pFgkF4tCzBw6W1XPD0+somwRetdNg5NenFg4eLD5nn1Tahhj1
	 jijBE3nOg0z3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F74C87FDA;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:14 -0400
Subject: [PATCH 022/114] clk: ingenic: cgu: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-22-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1643;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=HtI1wvPz+5VdtS2qexqe2gHJW0XaSbgytBsDxFNInmk=;
 b=I/ftK0zO5KhfvWSspMM0n3T2XFtDNqi7KJXM5VDoHnMC3O9R8uaRBcQXlqQXM8RSKKFShUBUy
 KuGS3/JXiDxCQH6WtfJ9PL2VP8I7ckSpcvVp7q4O7vVmAi2h4M2G/rB
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081835_030543_29299E8B 
X-CRM114-Status: GOOD (  14.35  )
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
 drivers/clk/ingenic/cgu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 0c9c8344ad1103b13337a26e14b0d5d5c340d705..91e7ac0cc3342e3552acb9d2ec00865a5234ad4f 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -174,14 +174,16 @@ ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 		n * od);
 }
 
-static long
-ingenic_pll_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		       unsigned long *prate)
+static int ingenic_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 
-	return ingenic_pll_calc(clk_info, req_rate, *prate, NULL, NULL, NULL);
+	req->rate = ingenic_pll_calc(clk_info, req->rate, req->best_parent_rate,
+				     NULL, NULL, NULL);
+
+	return 0;
 }
 
 static inline int ingenic_pll_check_stable(struct ingenic_cgu *cgu,
@@ -317,7 +319,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops ingenic_pll_ops = {
 	.recalc_rate = ingenic_pll_recalc_rate,
-	.round_rate = ingenic_pll_round_rate,
+	.determine_rate = ingenic_pll_determine_rate,
 	.set_rate = ingenic_pll_set_rate,
 
 	.enable = ingenic_pll_enable,

-- 
2.50.1



