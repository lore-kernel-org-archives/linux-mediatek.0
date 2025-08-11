Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD7DCA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhcWB6WOlCHyakXLFfwlfRkIaU3M5hwaLiHmEaGzOEM=; b=FeoGlhBMlcJDlwHlgy08NLM4Cu
	1VCtoTUgaOYloN0RPItHp54pjZxywf1OSt7EYXXtL91IXW7vB4tsR/aKCzaGSJT+ix4iTQ5xv9n8f
	O5YNGCb3meCws1uTnsDKjtSUnPewNBzhjAzC1i2EIFSl0ZQ8nNFlCpTev3J+siChasz7+E9a7DCLc
	S8MANbCmlxGUp7Btlrmmm3xEZ4DvzePoloIa0GO18HczBRjoTOz3nUesxTe4Nam1ylwH0Zf8oOQZC
	6GsIKVBjaO3l33y+f4S3fynrpRg1XN7z6rZ+ZmWy9hX23otQFwUFeZnsqnXwIi2poXJ/Ds8+vP15G
	YsltAhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaa1-00000009812-3m5j;
	Mon, 11 Aug 2025 22:01:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIL-00000008Apm-1kun;
	Mon, 11 Aug 2025 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7664A5729A;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF4D1C4CEFA;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925515;
	bh=zw9hWSN5n+Kpeh+wodQ5uxYPF57I3p/MhkkzEzCZbeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p0a51hvQGztCYL0wHK44Wc6VmQe5U3b4raQo6ILX1+TmGkv0V5qH8ByiHcRTBlnzL
	 Uwwer6YhApqIeYZv7APj2adpJlSGy4byALHvdHzGfwDCPrtr8H89miaeryEj44l7EG
	 RXmdo+1E+1Cga28dzidjJP/aVDoO4T9ZDoH71iwIt9wqOjhgvgokZWsFCUmiNFLQ6x
	 OF7P+c0yIN5K2XgF/r/qt7mvoF2zfoyjVDsfjCQC9yzXCree6PZ+lFErDAA64P/HID
	 4HZ2TfHuRtLPb6gIjkhzTLI1wJ8sDrLnxMkC924PJVTfajiXH4/sWSxorEnEIhpVEY
	 ABpKqSRW+1bJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09FACA0EC8;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:26 -0400
Subject: [PATCH 094/114] clk: rockchip: ddr: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-94-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1666;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+mTNNaA/Rw26i0WQAx+OIQblwc90KAUsuFHwu0lEWj8=;
 b=rTl0OqGx+j74m+r7f4wrHisEEDRwWTntvTo+iCDJVcKHw2awCwJ9lKPHIWuR7jm5OOl41r7C+
 ghPrb9Sfv2NDz2WVpcs21qKgRU7FQnBQSxyD5/9wqvK9Fd71FNgBTUA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081841_792683_33D81786 
X-CRM114-Status: GOOD (  14.55  )
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
 drivers/clk/rockchip/clk-ddr.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-ddr.c b/drivers/clk/rockchip/clk-ddr.c
index 86718c54e56b3ff52ee6ea9f209159de91e9da39..8866a65982a0489f1aacd546bda60af1d30278ee 100644
--- a/drivers/clk/rockchip/clk-ddr.c
+++ b/drivers/clk/rockchip/clk-ddr.c
@@ -55,17 +55,18 @@ rockchip_ddrclk_sip_recalc_rate(struct clk_hw *hw,
 	return res.a0;
 }
 
-static long rockchip_ddrclk_sip_round_rate(struct clk_hw *hw,
-					   unsigned long rate,
-					   unsigned long *prate)
+static int rockchip_ddrclk_sip_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(ROCKCHIP_SIP_DRAM_FREQ, rate, 0,
+	arm_smccc_smc(ROCKCHIP_SIP_DRAM_FREQ, req->rate, 0,
 		      ROCKCHIP_SIP_CONFIG_DRAM_ROUND_RATE,
 		      0, 0, 0, 0, &res);
 
-	return res.a0;
+	req->rate = res.a0;
+
+	return 0;
 }
 
 static u8 rockchip_ddrclk_get_parent(struct clk_hw *hw)
@@ -83,7 +84,7 @@ static u8 rockchip_ddrclk_get_parent(struct clk_hw *hw)
 static const struct clk_ops rockchip_ddrclk_sip_ops = {
 	.recalc_rate = rockchip_ddrclk_sip_recalc_rate,
 	.set_rate = rockchip_ddrclk_sip_set_rate,
-	.round_rate = rockchip_ddrclk_sip_round_rate,
+	.determine_rate = rockchip_ddrclk_sip_determine_rate,
 	.get_parent = rockchip_ddrclk_get_parent,
 };
 

-- 
2.50.1



