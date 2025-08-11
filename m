Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4012DCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOsRHRX5VTyU3MAWlr36hHn/B4YhVSHgLdpekrd6+MY=; b=lBi2ffFfXJf6yfz1WWSpv9ZgL/
	IpehtP7jf7HJ8llPhtkmmetHRrBYQgLG2Xrj4xjXwNohpnb+k6v1cadCyq9jJcDpEHTNnhcmdz0YA
	8lfrF7zbdnhFl+HT60EQoxoYtl/wr37EKShjZguAD+CBgBkDUzJJaP3aD1UyLc49T1GLDRTeR/aDA
	ANB2yaQLBQw/pBy8a+Ywseawe1dOASAmAIAhf8Yny1vjnILhjq0xCnUfJ9PjoPnDFofzOae69VYVr
	kqOnRvJ7a8XStG60sKcBFKz34pSL+tvYWZhMF5vxRVsIjJwar1smAy/KaclhoV1yQcZmrNt+bHG+H
	87464JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXzY-00000008sR0-3vJA;
	Mon, 11 Aug 2025 19:15:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUI9-00000008AZY-3NpZ;
	Mon, 11 Aug 2025 15:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E64D7A57286;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB40C19422;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=GDBbCi4sx3Kp5l+kvCcvvvRUo/IgUsYvJ6NwMWxGsEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FVUssxftST2dek6Q4r8S+rCTHEQ9Ye8zXXzlvb46vwIlliWJaorntnALS98Vw2QWP
	 czJ6+8c5LJTYu7GAxLe9OBU8WIJI/HPQmJ4iNSSlasp7SXHlap+YG7soM6b58lkkzw
	 yvzn4CeDwWI9De235yQCHSIDG3WoGKxE4Mw9HjR8mcrOgxhEy7FRPDoYmjLCwxHxsV
	 mU+ufZindzchcF8/3+nzA7kZbs9No4mjc/CFVGDcOA2kp3rbic2WRUg9aMdVMlXbBX
	 tprIX7ANLq79NJkgI5nFWi/abs4noR5BZdKwqlCnMQuAvjJBrSs/eERbjxFISN5/Kn
	 vH1UKgLoShcKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2C7C87FD2;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:16 -0400
Subject: [PATCH 024/114] clk: ingenic: x1000-cgu: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1676;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=U9vNul5ctFRsJ+cg3HiYsqW7zeu8fHnWHIvus1lAqJo=;
 b=d7U0ETgjsmdWey22Vpt1SZg964FylYIIqQWd52fV8C7GbHEHlAksiEr9OO5lDEBzVGpXGdf5S
 WTS+Gp0J5zlB0kAltAWUMtwk3JfACKSaxxwSHfVNUKq6Yvqgw9opAEq
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081830_061005_E14F33E7 
X-CRM114-Status: GOOD (  14.41  )
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
 drivers/clk/ingenic/x1000-cgu.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index feb03eed4fe8c8f617ef98254a522d72d452ac17..d80886caf393309a0c908c06fb5aa8b59aced127 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -84,16 +84,17 @@ static unsigned long x1000_otg_phy_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long x1000_otg_phy_round_rate(struct clk_hw *hw, unsigned long req_rate,
-				      unsigned long *parent_rate)
+static int x1000_otg_phy_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (req_rate < 18000000)
-		return 12000000;
-
-	if (req_rate < 36000000)
-		return 24000000;
+	if (req->rate < 18000000)
+		req->rate = 12000000;
+	else if (req->rate < 36000000)
+		req->rate = 24000000;
+	else
+		req->rate = 48000000;
 
-	return 48000000;
+	return 0;
 }
 
 static int x1000_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
@@ -161,7 +162,7 @@ static int x1000_usb_phy_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops x1000_otg_phy_ops = {
 	.recalc_rate = x1000_otg_phy_recalc_rate,
-	.round_rate = x1000_otg_phy_round_rate,
+	.determine_rate = x1000_otg_phy_determine_rate,
 	.set_rate = x1000_otg_phy_set_rate,
 
 	.enable		= x1000_usb_phy_enable,

-- 
2.50.1



