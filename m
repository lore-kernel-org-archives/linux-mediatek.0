Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C6DCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCCmwgFVdWzu6wgMSAt4b+kELsFje88zepTzUwsqN6Y=; b=axO0P8sPB+Bvt8HPU+DUqcnB7B
	pqGby8MLYtwCRZ1xSc8Ma/mFGjqbCYGTMIU2fylviP5/p7nHvbZkuiWvWJkGPM2vlxsxwEteRvg0l
	UTDtZvD2VpbmNlCIWUbEpwujc7nx29ip9VvnkG7PNXFETsNYinVfl/OptVnwXmJB+DR9si/39Wbxy
	HKd7r8HciwGDKt7btA5pi50xSsvIA/kaMlG2QmLH+gAWFl1fqDDQxxni0BFV/EnXvWGTXK7GB1UcV
	BQ46KvgEYZFk42WlcQ220stizzJmqDzlHHm68wFumng8Zxab5uVwp5k4Q8YaibqHLulWfDvOIixQA
	mVBy6kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXzy-00000008t9k-3GxI;
	Mon, 11 Aug 2025 19:15:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIg-00000008BGs-2r2I;
	Mon, 11 Aug 2025 15:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D00E6699F;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05B03C4DE01;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=wTgud6tQwIyLfx0HB1tF4KhBQQnjEgnYtuPNQw5ihWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aZxyoP2Secxor+RGDxhNNhVsfbkSVfVHekQGNMzQ00BHlXyF/zqGpuYPTT0nHiRYs
	 HH0hqPnqVEvoMYojvTR50y5wgH+MCGKbz6idQ9XgiX4QYUVmMRBbU8U/A282K3AKZC
	 Z2M3IM3TJiU4kc+H4jC+8gkI5Q/Ctow6S4uVMo6jCQSQeVXbemIwcfKP5c1jyFJ4Yl
	 UiQ8vP6YaaqgSzGt8EuZhFHBzij0ghKlQQ2HQqYm9PHuNA0F5WEnc95rBlyrLsc6Cp
	 XqkoaRWCpEL4zJSwdwLiM/6NvFDLPvDdzjTWANq3pyr65mRED9aUE/kt1ucMOlWpWS
	 XoRMrKMh3OiNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC28BCA0ED3;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:18 -0400
Subject: [PATCH 086/114] clk: mvebu: armada-37xx-periph: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-86-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2154;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zwDunKg0lpAhFaodOmT22ze6HLMcfBssPgf6TXDOiXk=;
 b=6ad8PB3l2Nqn41bpE9FA76MGUBvzXCTk75xig2LzUCXVw2TZeb0QVl/EU9/lw5/jOOW6ZBq2f
 UlWdPGJ6/PXD81Z+ls3NBipmAVeQZq+jdD/LYSNDNYntA5JsZjymEU+
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
 drivers/clk/mvebu/armada-37xx-periph.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 13906e31bef8691c59631e7f1940e6cab82549a6..bd0bc8e7b1e7781c6ddeff2a00aab50e57ae30e2 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -454,12 +454,12 @@ static unsigned long clk_pm_cpu_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
 }
 
-static long clk_pm_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int clk_pm_cpu_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct clk_pm_cpu *pm_cpu = to_clk_pm_cpu(hw);
 	struct regmap *base = pm_cpu->nb_pm_base;
-	unsigned int div = *parent_rate / rate;
+	unsigned int div = req->best_parent_rate / req->rate;
 	unsigned int load_level;
 	/* only available when DVFS is enabled */
 	if (!armada_3700_pm_dvfs_is_enabled(base))
@@ -474,13 +474,16 @@ static long clk_pm_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		val >>= offset;
 		val &= ARMADA_37XX_NB_TBG_DIV_MASK;
-		if (val == div)
+		if (val == div) {
 			/*
 			 * We found a load level matching the target
 			 * divider, switch to this load level and
 			 * return.
 			 */
-			return *parent_rate / div;
+			req->rate = req->best_parent_rate / div;
+
+			return 0;
+		}
 	}
 
 	/* We didn't find any valid divider */
@@ -600,7 +603,7 @@ static int clk_pm_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_pm_cpu_ops = {
 	.get_parent = clk_pm_cpu_get_parent,
-	.round_rate = clk_pm_cpu_round_rate,
+	.determine_rate = clk_pm_cpu_determine_rate,
 	.set_rate = clk_pm_cpu_set_rate,
 	.recalc_rate = clk_pm_cpu_recalc_rate,
 };

-- 
2.50.1



