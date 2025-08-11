Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73127CA0EDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyGmhuxsN3svxznl9eZniWD/vTu26u9rOVwVsu1XPlM=; b=YHzCc/Dhb0LQYD27em31O0y3Fo
	meSpC7jTAv/3xytOUdylgqP8UiCktv7WiBpDkc30PBJ8xL1CVEPIVbyoj4tkicQOYGrmKVPDe9VUe
	6DW6KyOgxQGc2DyOiTi9cF9HLnnE/fAaEo0fAbqkRSMFL3fkdBb2T6AgocVKhmcga23HYU3OBZrWC
	bu08IqXVjz4CGsqTEDr5+fDe9eBvh8Hp6QemIgjMIrXqSmbHQBo98qLNDXVgPXRhwh3jsfdjd9eIy
	w1LoTvTWs1lffHPoxLXd96q3Dpr83s05wtoenitsSM+eGyFoVd/PzJsAiCvlCocmT4ZM9a5ZaiL43
	GHEel8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaaI-000000098Wq-40S3;
	Mon, 11 Aug 2025 22:01:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIU-00000008B0M-2Jja;
	Mon, 11 Aug 2025 15:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=SyGmhuxsN3svxznl9eZniWD/vTu26u9rOVwVsu1XPlM=; b=T7Hpxo5QUY/+qFJSfeVYl5wAvI
	EbgV1n1YOrVFgg23aTpOPKrgPFTdKc50jEXhlOAIXSfi5B7F2r6E9ne0SnwvxHuw9RGniYeAVZpFY
	UCIQGZD5uz5otoa6S6fzRRZdtxeWIqUHEvnupAmvZif1rfaSd6C+YoITaWlU7FswNW3dzs3q1Lu9+
	WcXUcqUk5QSqMXJdiDwjOwzj0fvBdP53Odx1h3IILyhaZisA15LYxTpy8gviEq2DfsWGc2T0xr4Pf
	YQOwqM5PIDBuNyk3kXtjMa6G7qF9ECmX/EMAByhWtOweyM9rgdaq4dztTwVW+r7U/96NnupblIIi9
	wPChOWCw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIQ-0000000FQnE-2mvw;
	Mon, 11 Aug 2025 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E031845FD0;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36CBDC5688F;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=3YHiafO5ai5TDjyb1XuiS4P3RZCXD0dPBkmj+Wz8urA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rMvcJ6AEni5KWK0ZfZGbq0BcXk+Lw742zf3c0TcrVL7ng/biXVnab+a60hfxdW4Ow
	 /xKh5d9U1wrRu4QYvFNpzalzbqZlyy7tKdbbzNuGEAvjQ8Rpz0zgqpzXxCE/XjSqPz
	 nLRQ1a2lY4S5pNfVkMrJcidkTovihCe7pxftRO53orFz5JVwYaMMsgF32R6MaUwL8z
	 yct4fGERFqbnBn989+Udc/vSvDILEb/mTgu/HJgzEfaKKiWFSgnJP+jOPi1E7vcYkg
	 +VtKqd25H3z+tmVbHHXHekbm4waPWLcPlA4DHj3XWWz6Uclmk9FAzxMHFt91csXvQk
	 UXVTdmR0K9NIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1894ECA0ED7;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:41 -0400
Subject: [PATCH 109/114] clk: versatile: vexpress-osc: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1786;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WxkhOFvXpJuPJ7xh1egBdlkK/xyPytMRdcsFFyltjAo=;
 b=S77BI7+2cZZGQObG51SfDHh+3vtt0iyhJIgVxfXMtet+TJGdq4KheCro0npIZwM5MMmAZsVli
 SX29nDOYn69AWncz3ZURtGQ9bxHYYmErvSXT7FYv1mWHeRHy8gJ9APm
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_161847_155875_6910F734 
X-CRM114-Status: GOOD (  14.58  )
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
 drivers/clk/versatile/clk-vexpress-osc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index c385ca2f4a744dff3c3e4cf30add2e80718075ad..9adbf5c33bd1cadab0968134ddee1d1061f61239 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -33,18 +33,18 @@ static unsigned long vexpress_osc_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long vexpress_osc_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int vexpress_osc_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct vexpress_osc *osc = to_vexpress_osc(hw);
 
-	if (osc->rate_min && rate < osc->rate_min)
-		rate = osc->rate_min;
+	if (osc->rate_min && req->rate < osc->rate_min)
+		req->rate = osc->rate_min;
 
-	if (osc->rate_max && rate > osc->rate_max)
-		rate = osc->rate_max;
+	if (osc->rate_max && req->rate > osc->rate_max)
+		req->rate = osc->rate_max;
 
-	return rate;
+	return 0;
 }
 
 static int vexpress_osc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -57,7 +57,7 @@ static int vexpress_osc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vexpress_osc_ops = {
 	.recalc_rate = vexpress_osc_recalc_rate,
-	.round_rate = vexpress_osc_round_rate,
+	.determine_rate = vexpress_osc_determine_rate,
 	.set_rate = vexpress_osc_set_rate,
 };
 

-- 
2.50.1



