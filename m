Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFFCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ud88eeiF9mjcdtI8lECA1fxWXirhwRsvKcJzOw9puyw=; b=tPguPFQ9KUPMCEd2dnCqqqWJ7u
	wFHGcnRGXjmDPXrrX27Im5wYOlzMUi9w8NB/cVgvLR5yjXg9NPx5szNP9GL3ojSLjJ5wit9jVsaXH
	tG1r+84Qrrz+GhJtqLzOCrHXY8W6vsqYlJ6sv9LXjFARKyvih4EKzAARQbwIoKumUr/cdEEAAWBT2
	24UGn/g9gB90iQWLEXMrdTmnsUdnNlrmSX+5qS/cG7r+lZG4jjdoxuG/H1eCDsBrcIOJq5OxjUwZ7
	Q5S54sC4+KHzmTr8r6kRmGa7TJ5LHrZbPfxBEFSLKuwovZM+ge0XdcMt9ARRESaSFOD49EUfdy9pA
	5Pzqz5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwF-00000008fAz-35Tm;
	Mon, 11 Aug 2025 18:08:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUII-00000008AeW-2mUd;
	Mon, 11 Aug 2025 15:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D40E668B8;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237B4C4CEF9;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925510;
	bh=Vrvk3I7D6mV9DE38/8gDVwSHh9PSpaxdgVZQ0yk7Uy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WkIUokb5NlBhh5isbn//YJ341vnN22v59CAsKEyDjyhshZPQeLQAtWIZZYrm6Fju8
	 pB/r8mrZI63R65SisGLFpbk6uFDmjc6Ritu1UA1SfJ3wTx9Jf+SYSHyz6Ks+7XXthr
	 aOR/uk9BUzNkP4vpz00D3F4/oxBr4PaRp/hXREiu5UPrVq6nzW0Nq6u95LOvptd2cZ
	 mZ0+ldsJn8Kz0UdOpXDAjdcT89iYGAFgofSm8eWeuuiUYTNxJ0m4b+T9/+JiisiB8s
	 gHbDBpb0OueRprB7RtsqZJ/RrlzUDVcPDCWz+NH91Oj6ioR1YZp8MqPt6eoURM9QwE
	 ddhcJSnee8iag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00403C87FD2;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:39 -0400
Subject: [PATCH 047/114] clk: sophgo: cv18xx-ip: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1334;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=aI/p31/cNZH1KkFnW7+NWEpLSa7fUPR9iBXDG5TMugc=;
 b=YazoAEF/yVcII3EcEN8PobdI+1Vp9eraWAmHwjaJbMtEgGUW08d30TaaxJt9Cd0dCADvtkX5Z
 mNmIljjjqVYBE9q+NF2YjZQldQxEaLgtfcTCu7w8O2zHtMjD2hkCyuK
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
 drivers/clk/sophgo/clk-cv18xx-ip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
index b186e64d4813e2701b17520e544c453fc13d0e77..c2b58faf0938b7d537dc3a81aef59c549b9c9c79 100644
--- a/drivers/clk/sophgo/clk-cv18xx-ip.c
+++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
@@ -45,10 +45,12 @@ static unsigned long gate_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long gate_round_rate(struct clk_hw *hw, unsigned long rate,
-			    unsigned long *parent_rate)
+static int gate_determine_rate(struct clk_hw *hw,
+			       struct clk_rate_request *req)
 {
-	return *parent_rate;
+	req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int gate_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -63,7 +65,7 @@ const struct clk_ops cv1800_clk_gate_ops = {
 	.is_enabled = gate_is_enabled,
 
 	.recalc_rate = gate_recalc_rate,
-	.round_rate = gate_round_rate,
+	.determine_rate = gate_determine_rate,
 	.set_rate = gate_set_rate,
 };
 

-- 
2.50.1



