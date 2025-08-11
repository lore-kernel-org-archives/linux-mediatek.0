Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B7CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ePo5Eyos4BIxVhfV/Py4bVeOdiymoizvKGl1Bk5AZU=; b=PMMoOtrdym3zpoMantNu5yTB6C
	FsBCCwVFr8sSkXjHUk7tkQVNmHY18/S3qWQD9HQ0+iHRxpeu13eIJ50mbdcdN64hg0+cMKWcwpq+Z
	yE5j3aW7p4p4TivGkm5Qur2NRHX1s3BZk/KvKkPlHzsu+VFerdHcPq+6S72+Da2FsqmZtnCy1nheM
	q3VC9Lo56TxqvMhhOMZydKtNCg8DFr+TEjya6a3pj92kkAQSXsIhMN5BpygnQiCNbnpuli2iB97qv
	Ot7jIx3Oer7p6yPVQ9x2mGHRYKNPUnbCoP0hRk7POwUlkhKHAIVrCtlF3slXykx4aMkVvCSD02sTj
	8tExsJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaaE-000000098OR-348q;
	Mon, 11 Aug 2025 22:01:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIS-00000008Ay3-0rUY;
	Mon, 11 Aug 2025 15:18:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83AED6691C;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FA41C2BC86;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=udEcZLLxyWYeqzWha0rjrze3r3ePmpoplHJgawnLqRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZSpnFM8TuHg3H+yFA7fdIJrN66SWAwmbic2OnwQv+bjrA+/XC+zRB7Brmfh9M90Vr
	 j3z8yOWkbs3XwbBcIwOBWYnXp/POyRjZhglNsQHqgWpJm1k+hVXcxEpfLbmcHtQWVD
	 quxgqGHRimklsFOC3kpSoJc8IwrYI0ozOlD0hSN3NoK8wHQaNKh1Y2fh3wkHrYxKBM
	 C0nZqHnqtd/OBbJW/kDAWHJ7eOz+qI6jmQIDcRyR/xoD/oTnRgB6n7HABYeO87VY9t
	 v9PcoMoO0sKlFvP3t177OamA5k2EOeODg5wSAzitxoEKGjx09Zp4pmvM3pdpPajwkA
	 QFNB6xC+sHjcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2982CA0ED3;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:59 -0400
Subject: [PATCH 067/114] clk: xilinx: xlnx_vcu: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-67-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1864;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=82qR/ZRJSeYXbGnr0soHZMhXD3A3PwOES4maoFV30vY=;
 b=4jol9sapsSWNpZQnMHZgNxJnIWie1Lf+ASszpOwTPb8maLgVdzwNCJLnNjrPrjUaEcQPmqeNe
 wqWkD0ziSEsDs2R71hWmkSKjy/0GDB5nHX3k9i30q4oR/mDUJlH7PKn
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
 drivers/clk/xilinx/xlnx_vcu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 1ded67bee06c3903b14bd32af36238ee02661b07..02699bc0f82c6b37d7d373a90160a63aa5df52a2 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -311,18 +311,21 @@ static int xvcu_pll_set_div(struct vcu_pll *pll, int div)
 	return 0;
 }
 
-static long xvcu_pll_round_rate(struct clk_hw *hw,
-				unsigned long rate, unsigned long *parent_rate)
+static int xvcu_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct vcu_pll *pll = to_vcu_pll(hw);
 	unsigned int feedback_div;
 
-	rate = clamp_t(unsigned long, rate, pll->fvco_min, pll->fvco_max);
+	req->rate = clamp_t(unsigned long, req->rate, pll->fvco_min,
+			    pll->fvco_max);
 
-	feedback_div = DIV_ROUND_CLOSEST_ULL(rate, *parent_rate);
+	feedback_div = DIV_ROUND_CLOSEST_ULL(req->rate, req->best_parent_rate);
 	feedback_div = clamp_t(unsigned int, feedback_div, 25, 125);
 
-	return *parent_rate * feedback_div;
+	req->rate = req->best_parent_rate * feedback_div;
+
+	return 0;
 }
 
 static unsigned long xvcu_pll_recalc_rate(struct clk_hw *hw,
@@ -394,7 +397,7 @@ static void xvcu_pll_disable(struct clk_hw *hw)
 static const struct clk_ops vcu_pll_ops = {
 	.enable = xvcu_pll_enable,
 	.disable = xvcu_pll_disable,
-	.round_rate = xvcu_pll_round_rate,
+	.determine_rate = xvcu_pll_determine_rate,
 	.recalc_rate = xvcu_pll_recalc_rate,
 	.set_rate = xvcu_pll_set_rate,
 };

-- 
2.50.1



