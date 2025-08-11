Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F8DCA0EDE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5cNjtsEB9tLQwOwLHddX/QCJ3fRmXY/YaaFcCyd6iI=; b=MxTv3SCbXGzNpe/F4pMmpK1UwQ
	56G3wCn7umQnOEZzFgfTM/qz9WZG8Ehqgk+I7Dj3EKYb4ZhERebVs7n5UxmBZJHE/3Pla8mFdYnTO
	gvBfoc6xXkdP4MY3H24/kkGddNNKV6EBOhxm1r1h041S9o1g8A1MCsA0aBCtlbteI4xLHX72bFfjc
	fUstP+SxRMtk9hBAoxuEqCOXYsPswjX8XPbHP/EOAN+rs+bpxKlQKFmwZWFPTRQRDkEtdsKiiXFEv
	B8AWSEC+VCtk+XI5/eMJTmsjyIvaSEjIKWXfekiW9ca5acrPdrQJXxnN7gl4nYPXD0ON4hQhAIrUQ
	zU+p67xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXzh-00000008scz-25Gx;
	Mon, 11 Aug 2025 19:15:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIA-00000008Abl-3h1A;
	Mon, 11 Aug 2025 15:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FE945C5835;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97708C4DDE0;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=ZK2ueDcN0UvIf+WpMaEl1nVptCb1de8SKwqwC/gyshI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=raf8cYBj0nLy2iZuKvJkM5PLfOsGQ9ZTj4SRIlQxjY1MgolaaaAFtTFG4xF9KYk4A
	 1FZVwTC7PIfcb/xCQ0eOsD/epBfPT8/B7+ZBFclUOT1PFJwwccyva4exu29+nd5T/T
	 Gl7PVatNXLp/bKr4/wJpjEpIb2mQ2nl3zZmJ8zTKLakgBHuQY8Ls4gOIf5plI3o1v+
	 i2W4DzI5C9ED6xrIhGIkjMUiE/cV8+OeddiVEbdzbzQV+Gw+N0nCxy66ktjeNbG7W4
	 8NR/c2/ZN2zJ/kjgmBovfjlPUbv83XBZpiBNBMcBPgh6i85cxlpfNkh2hkTWFoVm4/
	 mLpBIl3NDdrpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A9ACA0EC4;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:34 -0400
Subject: [PATCH 042/114] clk: si521xx: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-42-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1821;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=IYfcBgwkQpHDyc8q2RV5A5vv1udYTKTPHUiTmW2Cwno=;
 b=waUAjIfKrQAV57XrANvP9EEjChBsr6Yt07UIfnBK3ZshiRnoCJySmfzJCRr5NSot/62ay4Kev
 5PzOKFX1ommBOmvXhrcksOjRNQwgxc2iotqiGVZtfsSVOH+sJncYevs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081831_078202_EB61BB86 
X-CRM114-Status: GOOD (  13.57  )
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
 drivers/clk/clk-si521xx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 4f7b74f889f1e7e9400a61f15d1e6671408bb1fc..4ed4e1a5f4f2b3b9fe063d79fc5140f1b41c4ace 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -164,15 +164,17 @@ static unsigned long si521xx_diff_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si521xx_diff_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int si521xx_diff_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	unsigned long best_parent;
 
-	best_parent = (rate / SI521XX_DIFF_MULT) * SI521XX_DIFF_DIV;
-	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	best_parent = (req->rate / SI521XX_DIFF_MULT) * SI521XX_DIFF_DIV;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
-	return (*prate / SI521XX_DIFF_DIV) * SI521XX_DIFF_MULT;
+	req->rate = (req->best_parent_rate / SI521XX_DIFF_DIV) * SI521XX_DIFF_MULT;
+
+	return 0;
 }
 
 static int si521xx_diff_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -208,7 +210,7 @@ static void si521xx_diff_unprepare(struct clk_hw *hw)
 }
 
 static const struct clk_ops si521xx_diff_clk_ops = {
-	.round_rate	= si521xx_diff_round_rate,
+	.determine_rate = si521xx_diff_determine_rate,
 	.set_rate	= si521xx_diff_set_rate,
 	.recalc_rate	= si521xx_diff_recalc_rate,
 	.prepare	= si521xx_diff_prepare,

-- 
2.50.1



