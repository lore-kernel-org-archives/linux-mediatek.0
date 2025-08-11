Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A7CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hTqv5ghIWaBJaMkGnNe2/WxzHqiB1ibDRMUGrENz+w=; b=wozJxpgoIGq8PRwyfkRLMCqVnG
	JNgkFrNQoU3Swj3Ts9Mxxx5CzxRqWyvpi/0hR/LhwlzHdH79MOLIwk6tk2f0GoM8IFtPt1mYl1eNf
	A+andc4kTbbCoYFlAt8KSPH28dnxTn8PdWS0T/5izsL8VFERMtyE2uqLHI4ZLGMJohE+1WnmHiD94
	1C/4kYZhvO0b6HJX0n9lDqOAPhQRyTiuorVxdMGnA9S9Lnk1fuhfOzXwr/6V7Awi5GFCdbxWTySBd
	+i0+L3oJ9qaRC2MWZGfxeRkVIFL+EAOOooIR0IpZDdpmcUKb0Z1+tzQWtqYjl3GYctPEmzYoi4GcM
	X5EG4+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaZP-0000000974b-2fqx;
	Mon, 11 Aug 2025 22:00:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUI7-00000008AX8-2Dut;
	Mon, 11 Aug 2025 15:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47595458A7;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 697E6C19425;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925505;
	bh=Wnk8BgOipo2N9m2Ea9uOpJhaiYbl+Z6j0QpOrSLOTE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LbJ6KzgspBgsAPmYGfJknK33s/eHMgzX7lVbHf2pzr9DVHzBc9chYcOZa8nM6tEvM
	 yZi72iJaf6E6ldHVy7FDw7pJf0nmJk4Y+KWi06jIrqKk5+XVfz1iMNvh3heUCBiTSL
	 PeAn0G3lHG4sU5yTRGYZrtukRYvJXUkOh1PvjUAMlciQpMLMGLPAnjO4+93p8FkZtv
	 RlKwIzVENygfObbosflZzrq+kiRxBrBgYclKP2u2sf7BEiLZSLMR2CsFsQi/PZJluU
	 8jNPTmZhPjj1qr5niXk47aZrSo9aExytqHFLH0XcfTeW5TFTCMOknimrKqS9zf5cL0
	 fhrmC8kPAotSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C336CA0EC4;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:17:57 -0400
Subject: [PATCH 005/114] clk: at91: h32mx: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-5-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1996;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+Gy4fG2AJvROWxLhbBjQuuilZZnIYreI5B1/XGUumAw=;
 b=bddnmfr4Qq1udz7evPQmYKx0VTkqElCn38ZpoP64EqHSc8I+tppgsKu0InDLdio46Q6TiYUZ2
 DhMOktZu9bvDKJ96MsnGmtOMrcr/Nv5jIn3B5BUb3PZfzg+8EZLKNzL
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081827_621174_96BBCD01 
X-CRM114-Status: GOOD (  15.48  )
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
 drivers/clk/at91/clk-h32mx.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 1e6c12eeda10c4abb51c2046ea27b238db2560cb..a9aa93b5a870988677ad4609a210ed9570295228 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -40,21 +40,32 @@ static unsigned long clk_sama5d4_h32mx_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long clk_sama5d4_h32mx_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int clk_sama5d4_h32mx_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	if (rate > *parent_rate)
-		return *parent_rate;
-	div = *parent_rate / 2;
-	if (rate < div)
-		return div;
+	if (req->rate > req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
 
-	if (rate - div < *parent_rate - rate)
-		return div;
+		return 0;
+	}
+	div = req->best_parent_rate / 2;
+	if (req->rate < div) {
+		req->rate = div;
+
+		return 0;
+	}
+
+	if (req->rate - div < req->best_parent_rate - req->rate) {
+		req->rate = div;
 
-	return *parent_rate;
+		return 0;
+	}
+
+	req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_sama5d4_h32mx_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -77,7 +88,7 @@ static int clk_sama5d4_h32mx_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops h32mx_ops = {
 	.recalc_rate = clk_sama5d4_h32mx_recalc_rate,
-	.round_rate = clk_sama5d4_h32mx_round_rate,
+	.determine_rate = clk_sama5d4_h32mx_determine_rate,
 	.set_rate = clk_sama5d4_h32mx_set_rate,
 };
 

-- 
2.50.1



