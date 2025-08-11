Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99ACA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVirFHGQinuEg7VXBiD7lxgd9mvOhp6mVujSxMQLlqw=; b=IkEjmsWzCkc0ak7Zi0Sd0soeOw
	qFe3yLPWAODgRJO4MqX5BA0NLo5IyItXf8YY3t27cinLSCe2LmO1wnT9XmKFdrgo1Z5VKjl/6reqa
	zgeMvU/4AjbsrSVsGvAB5GrAYso1prlJFbdckJYWTKaACVKayaxXraM9osElS5504ntezrYdvCEJA
	su0L+O/KyyYbITzdQml50u4Eq0G4LZdqMig4q+57kOBnVY9KmbMK7yrC4tWY3lEfJhwFcRn9XMN42
	UlXVQWUoG3SLZCSxEsWDxRlKtp8Us/xPOgR8nmPqBIMixiqtKClxbNtjatJYSrvJhDTjgBPYVFZZd
	K1eqcmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwP-00000008fRS-3O4g;
	Mon, 11 Aug 2025 18:08:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUII-00000008AgZ-2VTJ;
	Mon, 11 Aug 2025 15:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6BCA5C5A99;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FDB7C2BCF7;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925513;
	bh=ROaN4eyBVwEFVrBWTDzbW5wnwX0Du1rCsskz6Hnt110=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bYP/8WYtBPfN2qKAMEd0sAAEjfkG5EnO8i1uhZh5bERSZsOc6Jo5YtxeRCu/kX3YC
	 6IRg20pgTufxU+CxTUHxF6dSpUEAYWjjL/SdugibcIbMk3sk7Ad3/MLeFqLAeYwoJV
	 ibRCJ6Ig+RlUMGdhgXFff66oq7veVQw57W/NefAZeqaNvs2M6n+hNrj9KiX5lynQP5
	 ZIjyhR/hw5nctbh0j7h0sXndwoplV4sl4CvJHEA2HrDpd5Sewr6N5IjNZ2tXTS4U6u
	 z0DgKdJUVOb2d4+GRgwQEa4X5h7SZgPDmcgjdjNDFRhLaF2C78FsnGs/aOgQIlyV8N
	 44BfVqCWM+Zlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BADECA0ED1;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:12 -0400
Subject: [PATCH 080/114] clk: cdce706: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-80-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2194;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=UaSvd89DwndfC/Jfkrn5bzm2mpom1d/OQ5nJ7RnMUek=;
 b=52jSnCcEU3HNMp6ESkgp6tuWFfcF+PbyIJFATB0+VXkng/zgF+/My8bTw5/tY5zZHKN2t3E+z
 XVO7I4hD8OzCm+1WTmWt5wcqgyDU2Valob+3GveF/gswEN7vxFCa20H
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081838_833243_E06ACDE4 
X-CRM114-Status: GOOD (  13.88  )
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
 drivers/clk/clk-cdce706.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index d0705bb03a2aae2c2a1abc7031183ee0a9ec053e..a495d313b02f39840b4ad0242758db06f1715e28 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -183,8 +183,8 @@ static unsigned long cdce706_pll_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long cdce706_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int cdce706_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct cdce706_hw_data *hwd = to_hw_data(hw);
 	unsigned long mul, div;
@@ -192,9 +192,9 @@ static long cdce706_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	dev_dbg(&hwd->dev_data->client->dev,
 		"%s, rate: %lu, parent_rate: %lu\n",
-		__func__, rate, *parent_rate);
+		__func__, req->rate, req->best_parent_rate);
 
-	rational_best_approximation(rate, *parent_rate,
+	rational_best_approximation(req->rate, req->best_parent_rate,
 				    CDCE706_PLL_N_MAX, CDCE706_PLL_M_MAX,
 				    &mul, &div);
 	hwd->mul = mul;
@@ -204,9 +204,11 @@ static long cdce706_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		"%s, pll: %d, mul: %lu, div: %lu\n",
 		__func__, hwd->idx, mul, div);
 
-	res = (u64)*parent_rate * hwd->mul;
+	res = (u64)req->best_parent_rate * hwd->mul;
 	do_div(res, hwd->div);
-	return res;
+	req->rate = res;
+
+	return 0;
 }
 
 static int cdce706_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -251,7 +253,7 @@ static int cdce706_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops cdce706_pll_ops = {
 	.recalc_rate = cdce706_pll_recalc_rate,
-	.round_rate = cdce706_pll_round_rate,
+	.determine_rate = cdce706_pll_determine_rate,
 	.set_rate = cdce706_pll_set_rate,
 };
 

-- 
2.50.1



