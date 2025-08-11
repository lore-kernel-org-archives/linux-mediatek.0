Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC6CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yaYRiRYWiql47hboWRGLC1ZJUhN/8ZE73Wbm+BpTCg=; b=drLJtJoRtThgZayYmhOmQRRrMu
	cOzJd+SxzFVR7hCmmJrz8iN/w1/NZq5A2LzMgaeEqwTLo+SIoFQaLrMXA7hoxJDF02Lb1emgV8zhd
	+F+rV6CARSYTg3nhvoZCDD9zX7Fok8XSLoCNBhE1kn4ul1a9Jqe01GRmDBi/sV+i1LjFw5zi/ahnz
	w0PLQObXyURpcAXN3vDHaopCaVHibUOIWSGMNtySwUyU/aBWYdvHPQBx77N2pbQJhbJLdNrcqDJ+s
	z82yk9pUXxH4Zdm6F1d2wu9dZLHcGtABD+9a+04kTMghtPQEH9R3EkfE1zVB2AbfLmeEr4eQE/xxg
	Neea8zKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWxg-00000008hfm-0EpS;
	Mon, 11 Aug 2025 18:09:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUId-00000008BDB-2b4J;
	Mon, 11 Aug 2025 15:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45C2866971;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE671C567E4;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925515;
	bh=TOt8GAW42gcWftLZfgpNK288oaPz0ia79bN+vRjbPyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MQ8koQTxrhR+jIyZnNhvtDolUxdWryNLV22iyyTCS8GpfcsvaVmV9Lshrq6sTGN5g
	 JFmoeHq6cvEFUeJhPN/qyamJYdQlels9VewMsG8/7oRxgllLAqte8ImVlfzzaS6Xas
	 rG+8qRE8zVUjUz5ARryVxfsJiBptmj+Ax5ZxeZL2Ah93y2ZcqRElhyeH1vzY63Nqgy
	 yS/LL6+liWxp+5xeCnQBDYfLL1xQ6FIUA4bNRwYYBZu2dsoKvoZVzi4f1S4omBo2vx
	 kfV7ZJKP0FYznJHJRT8t5a2zxhhaXybNRabO7W89qVcTilnN8txN/J3lnguDeQLzCD
	 s40tMbjcGxgTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8907CCA0ED9;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:35 -0400
Subject: [PATCH 103/114] clk: spear: gpt-synth: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-103-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1594;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3EPhFpUbwwIaXQRHOGCwBMvdxScReadCJMAlA8s3U9w=;
 b=eHgF5npubAkVlGRQbb/9b8jxvdvlrqbhFOe9oQL+YIv/fPqzK/8SMk8YX1Ii95v2t6diuOQ9p
 JPc+NNMe9v0AM8cVWkBCEdzdWMitEknsfAEt3b9wzqc3m9aFYvO8Hv1
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
 drivers/clk/spear/clk-gpt-synth.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spear/clk-gpt-synth.c b/drivers/clk/spear/clk-gpt-synth.c
index 4ef747c2abbb0374bec6d6541fa6b8b8904e6c08..cf9659dc9073cba903a0e2a9cef9629ae7f97022 100644
--- a/drivers/clk/spear/clk-gpt-synth.c
+++ b/drivers/clk/spear/clk-gpt-synth.c
@@ -39,14 +39,16 @@ static unsigned long gpt_calc_rate(struct clk_hw *hw, unsigned long prate,
 	return prate;
 }
 
-static long clk_gpt_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *prate)
+static int clk_gpt_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_gpt *gpt = to_clk_gpt(hw);
 	int unused;
 
-	return clk_round_rate_index(hw, drate, *prate, gpt_calc_rate,
-			gpt->rtbl_cnt, &unused);
+	req->rate = clk_round_rate_index(hw, req->rate, req->best_parent_rate,
+					 gpt_calc_rate, gpt->rtbl_cnt, &unused);
+
+	return 0;
 }
 
 static unsigned long clk_gpt_recalc_rate(struct clk_hw *hw,
@@ -104,7 +106,7 @@ static int clk_gpt_set_rate(struct clk_hw *hw, unsigned long drate,
 
 static const struct clk_ops clk_gpt_ops = {
 	.recalc_rate = clk_gpt_recalc_rate,
-	.round_rate = clk_gpt_round_rate,
+	.determine_rate = clk_gpt_determine_rate,
 	.set_rate = clk_gpt_set_rate,
 };
 

-- 
2.50.1



