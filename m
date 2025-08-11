Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E4CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irGpKgQWYTNZKgLsZv9a3UyGxbhiEIi2V2sgm25p9M0=; b=ykJbdrsGn5r8qViSo+aByXGVFy
	gMic5GxyvgEAO9v3NA6ZdwSxIDGRgrFeBm4kNMLMKIx2/E1KWjEd7ATszL1JeK/efd7h9VaYfD9OJ
	GlqbyHIsvqRLuisxUnBniyoKto5lfChthWfUo5WrYmqF9SdIDqRq0co+7JzAM75cT+232Kr2/9IJZ
	tkY6M+YHrlA3+ZQa/H5i1SGaNcu0/lQuZqwa4XiQNR9n4ChJAPUMSIvve0+kZb5DNPPse8WObL9SU
	BCHjscuJFJiBuIWQ0sY8cMsY+FbwS65JSlUZMlBAC0IKYnWDcRbxlor9ymYFWT9eSF8L6C9ho8dct
	lnFNxbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwU-00000008fZm-1bJB;
	Mon, 11 Aug 2025 18:08:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIJ-00000008AeE-2hAH;
	Mon, 11 Aug 2025 15:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AB135C5985;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C0B6C2BCB3;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=JbAFsuFtdb23xFCUE5PoYk+wnoLjpHf6TmfmPQNwmD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fs8mgTZh2HrqAhKx6QpFlTRi25VDinSofra7I3YjTQoiVCJWCymdC6SiirxJxkT0X
	 CbjyNo+Q11ZT8vHvqpeRPw0LjDoPEGC+9dZ+Ry1OksMxS+dsYb+TLlfW53e4gB3l0D
	 +CFS54d1FVVDiA/278Jweaiad2G8WXaetceqYer/TTdhShrWj9S6JQe5HFAt24TJUM
	 4+TgmUJor5tQ98+jt6HDG0AjEttpQcl03w5LYqPOGxxtxBZrHOnAA83svu2GjMxngW
	 mWOPJPknwzG8j1WW2AcxSt1X4x9c7aCdC/gZaOzl74CuLCoi4byImMN+db7jLhzVXV
	 B+WuVebEknrRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB3CA0EC4;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:19 -0400
Subject: [PATCH 087/114] clk: mvebu: corediv: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-87-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2796;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NS9zgUZ/lkWw958Faw/x74CjsEPIvLlB4+FSKZAsyx8=;
 b=nZ53u2dYSOTsFRAIdh3yMPgJZh9VCXPHelYAsSZINROYBNVpBhjrqlzP90BgrmJNP+n6QGLLT
 V4L2PUdSQwCBZJiiUco50Koj59cdo0HIDYsE2R7HozKZBoeaF+fwyI1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081839_894949_7AAB1CF0 
X-CRM114-Status: GOOD (  14.40  )
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
 drivers/clk/mvebu/clk-corediv.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mvebu/clk-corediv.c b/drivers/clk/mvebu/clk-corediv.c
index 818b175391fadb9dbfd2ea7950598741b008d0ba..628032341cbb879628f1e0219689801d26d10f7f 100644
--- a/drivers/clk/mvebu/clk-corediv.c
+++ b/drivers/clk/mvebu/clk-corediv.c
@@ -135,19 +135,21 @@ static unsigned long clk_corediv_recalc_rate(struct clk_hw *hwclk,
 	return parent_rate / div;
 }
 
-static long clk_corediv_round_rate(struct clk_hw *hwclk, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_corediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
 	u32 div;
 
-	div = *parent_rate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div < 4)
 		div = 4;
 	else if (div > 6)
 		div = 8;
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int clk_corediv_set_rate(struct clk_hw *hwclk, unsigned long rate,
@@ -199,7 +201,7 @@ static const struct clk_corediv_soc_desc armada370_corediv_soc = {
 		.disable = clk_corediv_disable,
 		.is_enabled = clk_corediv_is_enabled,
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -215,7 +217,7 @@ static const struct clk_corediv_soc_desc armada380_corediv_soc = {
 		.disable = clk_corediv_disable,
 		.is_enabled = clk_corediv_is_enabled,
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -228,7 +230,7 @@ static const struct clk_corediv_soc_desc armada375_corediv_soc = {
 	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
 	.ops = {
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -240,7 +242,7 @@ static const struct clk_corediv_soc_desc mv98dx3236_corediv_soc = {
 	.ndescs = ARRAY_SIZE(mv98dx3236_corediv_desc),
 	.ops = {
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(10),

-- 
2.50.1



