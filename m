Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15536CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXysDa6tt5+eGJimRZMwhhgXlIuotl1QdMVAL/l1aLM=; b=oaM0VXu1AfxYGQxuUgkKgxZTWp
	c9k8znbfZV6bHvHgaDnqpkd/2ss3BZHooQ9s//UE2xZb/Dzj72GSFhvaM6db7MIjbM22y2EBHExAm
	TOYaHBgZqowwwOu2GV4vXUiLnLzlBQlZxCNNntzGxEKg0GsGjM7YV+fJegvcLLhiv3PSgfafTRWHo
	/Q8dPzh0R+LpuzRh6+daDr8hBqc/Ro7Ye5qNJf0sVnRJmLEHJeBbvLuVka6cdGYRZwaspWw4ORppY
	kQcMz7ABLHLB34IJMaevWIOerjt/DMG170SBRNy+Fk8eEbSoBKT8nr5JXg4hkGd5vkubh+OvkoaqO
	VP2YI0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaaM-000000098dX-1Dno;
	Mon, 11 Aug 2025 22:01:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIT-00000008Ay6-2JtU;
	Mon, 11 Aug 2025 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 546F46692A;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37C3CC4FDFE;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=DgV6YlTBDkUrNyyRhS1zI2zv3QMz45uq7zsOajWSEz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OjjQmsmrucefoLxUr5OGQ9+yc8HRDkXRiaiAN0UQoZwZdXC0HWHQBuEbFtbiFxObx
	 M1GY1bgnkOWa5PZi63N9Cim7AlyvC5fE2SBivftdGE83Jqz0so0EQSNJzddnH14Ba5
	 4OGirdsM8DGRsRSEVujUpEg1HDql7Ef+VT/+HvxRT9Zs+WiKM4afMKYhhgJUsUzWtj
	 gVR8VoxG4ndmOZ9MYrJPmctDRN3SBUL4JpmfdByrm10CQiWHyejrgaqpjE0nZeMG2n
	 owIiI5AKtn5Z9W/lC4VnMyF4+6Qo4BL0tz1JtOtXo/Ynt1ZpWQO4aMydQvD201Wfpn
	 wUO2bhoEWmiJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C6CA0EC4;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:01 -0400
Subject: [PATCH 069/114] clk: zynqmp: pll: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-69-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2224;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lskpKNDz5PXgHwG043xSBBoY9L3jCf8IYdbJMbo+pqY=;
 b=6K32Cq3AtxddqDEswKIewVZ6ixls6cXq38xWyGnT4SPjLfcqb9QH4+emafqpKpp6DcKj8YU2k
 djHjbLNcQJUCBZxr2eRk+dQ8L6FLPKL1KwiFgtRDg7HTIkbp7gMoxm/
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
 drivers/clk/zynqmp/pll.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 7411a7fd50acf7b718f789074598c25bec509aa1..630a3936c97c348c1d36252cb93c5551b2469969 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -98,29 +98,29 @@ static inline void zynqmp_pll_set_mode(struct clk_hw *hw, bool on)
  *
  * Return: Frequency closest to @rate the hardware can generate
  */
-static long zynqmp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int zynqmp_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	u32 fbdiv;
 	u32 mult, div;
 
 	/* Let rate fall inside the range PS_PLL_VCO_MIN ~ PS_PLL_VCO_MAX */
-	if (rate > PS_PLL_VCO_MAX) {
-		div = DIV_ROUND_UP(rate, PS_PLL_VCO_MAX);
-		rate = rate / div;
+	if (req->rate > PS_PLL_VCO_MAX) {
+		div = DIV_ROUND_UP(req->rate, PS_PLL_VCO_MAX);
+		req->rate = req->rate / div;
 	}
-	if (rate < PS_PLL_VCO_MIN) {
-		mult = DIV_ROUND_UP(PS_PLL_VCO_MIN, rate);
-		rate = rate * mult;
+	if (req->rate < PS_PLL_VCO_MIN) {
+		mult = DIV_ROUND_UP(PS_PLL_VCO_MIN, req->rate);
+		req->rate = req->rate * mult;
 	}
 
-	fbdiv = DIV_ROUND_CLOSEST(rate, *prate);
+	fbdiv = DIV_ROUND_CLOSEST(req->rate, req->best_parent_rate);
 	if (fbdiv < PLL_FBDIV_MIN || fbdiv > PLL_FBDIV_MAX) {
 		fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
-		rate = *prate * fbdiv;
+		req->rate = req->best_parent_rate * fbdiv;
 	}
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -294,7 +294,7 @@ static const struct clk_ops zynqmp_pll_ops = {
 	.enable = zynqmp_pll_enable,
 	.disable = zynqmp_pll_disable,
 	.is_enabled = zynqmp_pll_is_enabled,
-	.round_rate = zynqmp_pll_round_rate,
+	.determine_rate = zynqmp_pll_determine_rate,
 	.recalc_rate = zynqmp_pll_recalc_rate,
 	.set_rate = zynqmp_pll_set_rate,
 };

-- 
2.50.1



