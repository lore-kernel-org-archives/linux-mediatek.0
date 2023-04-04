Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA552C77B62
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8qQ4T9Zn0=; b=dGgoHNJYB4oEB9DiWEEAbpu71d
	F3T9QKAIt+7iM7vhddMF2UGydzcG7NREaT82WFLJecHeqhA0O9EUc/qlsdLiKDuCJQ0HlV9tTjAlM
	Vd5shMgJuPZQ7IBnzoppOqNbR7rbFxm1Ru5+iIHzMO7TN+1ixxSKq5EKTIi4RMfxZf/tiAMfe2I9L
	a+doiiKQsxzDI3jvhWFpPwQ7t5PTyLvC8MTQq66O7/vhYCYw6FbkfKmEFXI/EJKxjoGubvffQp2Tf
	kI4MycOyY+k+UxtU3hsRx/OcvnugJglS1XvSeSuPVlxShSEKI5/yg1HU4jQ4o8tAHjmpdaqp1oPN1
	1jNyGMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhAf-001fO4-0M;
	Tue, 04 Apr 2023 13:58:01 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhAD-001euS-2t;
	Tue, 04 Apr 2023 13:57:44 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 00A4A5821A5;
	Tue,  4 Apr 2023 09:57:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
	qQ4T9Zn0=; b=km7KRmL0YXjnP/meUd+DcvUHazwMYR7lt5dN45/wkkooBj4B8qU
	ZrGww+AkMePc+R2TkyXgZmskmymjuP/FzY8svkzkapVGcKdttcZHMAJDFsqGockO
	sGYg/5U6VuUfm5AP9mQxJxtbIW8IS9jT8tw6GMX5u7FTuihpQ9/dhmIwmJwh+hBy
	St5Bfecyobe3jvELshTkG8xdlASivgWsK9ZS9aSViooaOWGm0zgmvlpNF+7oI3IO
	F26GEKtCJ20wq+z7ec/UPB/z8G95sTbzHD4c/Toaa5BWdsvpzReQIY5sGfOPHP6J
	1smMSIPJbO0pNq6QqEuUbUP61Eys4M7wVZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
	qQ4T9Zn0=; b=tBl8dAV1XGouArzqpExRFtAA2Vfup3jTGzKeWuO3PeM2IDkvf0R
	Kiz+cq7zeUKTs8MHWxy2XEMSj20y1luajaE3Ba9WNjbWqExpVL7AZJKv6E6kppwA
	ctI13AfdaDRK+fD+RBu3tr0DcAUA6LQ/uaj60rFGlsfpIk+aTVKgYhXPUs1Y13yz
	QO0vlf35OMs5BKbPKyU8/51AjEdA8tuXFcI9A9zgkKUwyexMIu7EaYyrLxh8LJPu
	GClgUYSpxxLrptoXxIA8mWCekwYOxldTcnZOuvk/xQA2btjPGeBlePOYQiCdH9cq
	ozBBNXnwR454rLqveTKA+vc2ChTIMee7fqA==
X-ME-Sender: <xms:zCwsZBK9EeId2aElEaBHn26Gfaq2IjQjps_GgL8oEcdSWFiG9f8c_g>
    <xme:zCwsZNLI-WF_-5lUBD7pbdJBpzwhAyzdRvuQmDLEC7zYYghez2XiuxXb_Oyth2yHa
    yAEtLWodFBnuwpv1HQ>
X-ME-Received: <xmr:zCwsZJuFv1YpVW4t768nHygqYUzVTQhFlImmzhg0e0NVTAcsk_IqGnq2Yb81aOnF2y54r5AA9UCTVMHn8pOQvGUP0nDtEjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zCwsZCaRXNtdQzi3s3VmKwVZFMjZ0TzN6QYhrDPD7yNZKM_BcZIKDg>
    <xmx:zCwsZIa1HZATPIxxoz4MWP_Lz3nIaSgrokbWZY3hbDTX8PqZ_mx0dQ>
    <xmx:zCwsZGBKKxrfzF7T-37Lbz5v2t0VAg7nKI61riyosQJZKTseJMfS-w>
    <xmx:zCwsZBkrqfQf7tuTnSdeK-HXprDE_16USYKH6esUK36M5bUpjF6LCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:49 +0200
Subject: [PATCH v3 59/65] clk: st: flexgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-59-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,
  =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@microchip.com>,
  Max Filippov <jcmvbkbc@gmail.com>,
  Charles Keepax <ckeepax@opensource.cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,
  David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
  Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,
  Dinh Nguyen <dinguyen@kernel.org>,
  Peter De Schrijver <pdeschrijver@nvidia.com>,
  Prashant Gaikwad <pgaikwad@nvidia.com>,
  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,
  Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
  Kishon Vijay Abraham I <kishon@kernel.org>,
  Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org, 
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ne7+Ni8GdplaAMyjTXPRz6J0r6sewA5LY1sPpnagops=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c/XPFcOumCmLJCVs/N2q3Fv/SmMZid0OKw3f2J7/xO
 x+9vOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARnnhGhvttc0uMmNum5BXrr2/NWt
 j3e899x6lvmXfbrf4Tmfor5DPDP90HXyQDSy8e+xMv3B6z6Mzi2tgkO3NmgxbNfd/Vt2pn8QMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_065734_044241_F0DBC487 
X-CRM114-Status: GOOD (  19.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The ST Flexgen clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/st/clk-flexgen.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 7ae4f656191e..5292208c4dd8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -119,20 +119,21 @@ clk_best_div(unsigned long parent_rate, unsigned long rate)
 	return parent_rate / rate + ((rate > (2*(parent_rate % rate))) ? 0 : 1);
 }
 
-static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int flexgen_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long div;
 
 	/* Round div according to exact prate and wished rate */
-	div = clk_best_div(*prate, rate);
+	div = clk_best_div(req->best_parent_rate, req->rate);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		*prate = rate * div;
-		return rate;
+		req->best_parent_rate = req->rate * div;
+		return 0;
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
@@ -197,7 +198,7 @@ static const struct clk_ops flexgen_ops = {
 	.is_enabled = flexgen_is_enabled,
 	.get_parent = flexgen_get_parent,
 	.set_parent = flexgen_set_parent,
-	.round_rate = flexgen_round_rate,
+	.determine_rate = flexgen_determine_rate,
 	.recalc_rate = flexgen_recalc_rate,
 	.set_rate = flexgen_set_rate,
 };

-- 
2.39.2


