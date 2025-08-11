Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416B5CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QC1shu0aEUbb94v1t4u1XGqyNlRiWw4tQWsLDVKMwhE=; b=fL6JOnoQ+DVgJ3f49U8Enkb/qo
	cKje40YfQ8kfTAUIS6Eug+42iilrM0NhuRiRCa4Zm18RHoLMSqb7AqTq3VCKl5oWPM6zmIvwNj9EG
	eMBJ4Z7JCwijq2A0dnj/joJgPEdIiU+o25o1I4xJZfhFv1mE5fsdDsZRiiJ9wgOKU1wdw4wVXu0tZ
	4wBrf0jnoFdmLqqjeIun5FaO0cdzjEA/bU2UWFJrF5DjdAw3+1qA8UV6ltAPypBdsrlqDRn6oslUe
	XScu50VzYl7fljxSO211Ah9Kd7dTTUDfaXgrTjhKfXUO3brmkxW4CV0xc5Qyw8akuD2tcyV5Exg4Y
	1r3o4bzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWvg-00000008eSG-1WdS;
	Mon, 11 Aug 2025 18:07:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUID-00000008AfU-33cQ;
	Mon, 11 Aug 2025 15:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2610F5C5931;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0005AC2BCFA;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925510;
	bh=vpirylzetY0eXNQN6lA8k19KtFjJNLXJjVryJzeBPow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JEvWttrzAcF1T/Fu735V4wr+jhER1xHiSJuF3CPAbSVDDWxPJxMhrhmGNDR6zunYq
	 gAzuwMQFZpwfbZ2mY7NtLH3itM+Io9qjDxYQvwvyU1rd/kqC1WAGgmAZBfvY7/GOhF
	 PY0vLqow4VBuI2E8h4V/rW5+VGbx4j+MOJAQpEZhHDc31Dw9gpdJ5uY2d8GpKmCk/A
	 y5QxBJPKiPs7ux+qafXDNBPK1WQvSFooUnzFRVgMj02uctIa9zFi34Nvh3/UV8EKXq
	 NYuZVr69iateclyd2Y9l2sOIhRPTJNpLRnA356HGov1gnEpNGBkApx4kweConwYz3i
	 WuzpbTPLz5goQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE684CA0ECD;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:38 -0400
Subject: [PATCH 046/114] clk: sifive: sifive-prci: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-46-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3917;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=hC/ZgUTIYom+i1g3YO1lyOW6iNGVl9CAm5qy5dkubO4=;
 b=z2VfzP5IclC6Zx5WAOeSvxHcXjD4O9gmA0kgupAYF9wzqgy1oa+JdN4ESoVCcchwH4iaYC0oG
 0CqL2NxLU7tCFZuqsttBkxwWhWS+NFWCTGJmsl/ynr4hC6Lqq/zTxXH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081833_927282_FB193813 
X-CRM114-Status: GOOD (  16.40  )
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

Note that the changes to the three header files were done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sifive/fu540-prci.h  |  2 +-
 drivers/clk/sifive/fu740-prci.h  |  2 +-
 drivers/clk/sifive/sifive-prci.c | 11 ++++++-----
 drivers/clk/sifive/sifive-prci.h |  4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
index e0173324f3c52adf128b65c02afcd94069af8ccb..d45193c210b4be658ee8c1fb81b3be612d19772f 100644
--- a/drivers/clk/sifive/fu540-prci.h
+++ b/drivers/clk/sifive/fu540-prci.h
@@ -49,7 +49,7 @@ static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data = {
 
 static const struct clk_ops sifive_fu540_prci_wrpll_clk_ops = {
 	.set_rate = sifive_prci_wrpll_set_rate,
-	.round_rate = sifive_prci_wrpll_round_rate,
+	.determine_rate = sifive_prci_wrpll_determine_rate,
 	.recalc_rate = sifive_prci_wrpll_recalc_rate,
 	.enable = sifive_prci_clock_enable,
 	.disable = sifive_prci_clock_disable,
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index f31cd30fc3951e0c8a9f9c01c7abc7b7ad39c057..c605a899d97de76a03c58b7c1209292e7acebbb0 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -55,7 +55,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data = {
 
 static const struct clk_ops sifive_fu740_prci_wrpll_clk_ops = {
 	.set_rate = sifive_prci_wrpll_set_rate,
-	.round_rate = sifive_prci_wrpll_round_rate,
+	.determine_rate = sifive_prci_wrpll_determine_rate,
 	.recalc_rate = sifive_prci_wrpll_recalc_rate,
 	.enable = sifive_prci_clock_enable,
 	.disable = sifive_prci_clock_disable,
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index caba0400f8a2cf97446a7722c28f6b2eb627dcf5..4d1cc7adb2b32d99a2187ca80dbdef7f90124309 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -183,9 +183,8 @@ unsigned long sifive_prci_wrpll_recalc_rate(struct clk_hw *hw,
 	return wrpll_calc_output_rate(&pwd->c, parent_rate);
 }
 
-long sifive_prci_wrpll_round_rate(struct clk_hw *hw,
-				  unsigned long rate,
-				  unsigned long *parent_rate)
+int sifive_prci_wrpll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
 	struct __prci_wrpll_data *pwd = pc->pwd;
@@ -193,9 +192,11 @@ long sifive_prci_wrpll_round_rate(struct clk_hw *hw,
 
 	memcpy(&c, &pwd->c, sizeof(c));
 
-	wrpll_configure_for_rate(&c, rate, *parent_rate);
+	wrpll_configure_for_rate(&c, req->rate, req->best_parent_rate);
 
-	return wrpll_calc_output_rate(&c, *parent_rate);
+	req->rate = wrpll_calc_output_rate(&c, req->best_parent_rate);
+
+	return 0;
 }
 
 int sifive_prci_wrpll_set_rate(struct clk_hw *hw,
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 91658a88af4ef6157563846399e4857ba83c8645..d74b2bddd08a0753409e0040b493bba1497593eb 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -291,8 +291,8 @@ void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd);
 void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd);
 
 /* Linux clock framework integration */
-long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate);
+int sifive_prci_wrpll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req);
 int sifive_prci_wrpll_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long parent_rate);
 int sifive_clk_is_enabled(struct clk_hw *hw);

-- 
2.50.1



