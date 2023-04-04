Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C32C77B77
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdzjt22hJSiMg2YTQ7mbXT8d68cxG3e76Rr5e9sCrNg=; b=fm3Kad7iU7/U+S5bvqyUzTRDlE
	9yRLDNPv+c6xqpLf7UVE6ojwKLhoedSWe03UmZWR7NJK+bNsGmwCIhiwC8XsRkoJ9xy8pYPXPlX6Z
	kKiJReiZQ1gB+f1/9UqohNq1EhHFiKZ39CVOfmcdgI32W0bnlBBvyJysAxGIJZRCaSRHSwje7TJOC
	VOssWXxoAtUnrF/2FPwRwQd5BS+EcRLGTaubTK8DCZrIvCF/2AzEI8HGQSV216rYY1vweZoeSjrZS
	inhDQ+b/dcTGZ2TW/zBKkKOM5z2F4R0xySSpoecdzRSsD0CyivRDqHSpbgmMkRdjl1yGguo8fM/TC
	E0Qs6qSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg2Q-001Kf3-0C;
	Tue, 04 Apr 2023 12:45:26 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg2L-001KYX-07;
	Tue, 04 Apr 2023 12:45:23 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5699E5821A3;
	Tue,  4 Apr 2023 08:45:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612320; x=1680619520; bh=cdzjt22hJSiMg2YTQ7mbXT8d68cxG3e76Rr
	5e9sCrNg=; b=cWSwHiXssSvu9yeOeHJ/RXGdcP+RyB/bQtyDFVwyqX6RJ9CaOo6
	287nrQpsErO7ARg6esD/6FxgR5wtC/9u/ZZtXcw4I/pzGERXNPm9Dn75BLvbTG8M
	QjyvIJ/vmSn37rXHUxnvs2CNkbOYAOnwWdhnAFCyFCRSQxQv9iIl0avH3avaajvI
	pQVyAOwOIur+OPdD8LHPtUYvUWI2DsDwB4vBuy+qEB/JNCw9Wu16Ianex7ys1STz
	I2HSt4IkSTnQ3AynDMjkqucKe46AOfCzxjt2cwn5dA1C4YOz3zG98B4JTvI5A+82
	lLdLzYUPUOp7ffICDwJf2um0kr0eROXaT0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612320; x=1680619520; bh=cdzjt22hJSiMg2YTQ7mbXT8d68cxG3e76Rr
	5e9sCrNg=; b=jRc0mpK0bCrrI0Yc1i78K6cEcyVR3RXnxuok4Wgi9gTQ++tsCBf
	HunjfQHzDXdipemNdhnGoR09+KWdODiccU1LhysMr2SHrW90nuypBbxNrITlXX9t
	mnGPfTChiG1ubTEqVDP7k0ovaAZUvQNzso92Ezzxew//yNCaAT3wT2TItoXU/r8T
	SPmJODqXm+jWOLpTkpXhtKS9DKIWn7ZgFevU5nUPS18jVp6od16e+lwjqFjEYi1q
	gynu87sg03F9certWpFeuaEBFdIFwTmSFEt46SmMOji5yBR85o9rMkHf/Em/x6vc
	pQvIWo3Ok03ulGZftineYe3ywmekJyAo0Qg==
X-ME-Sender: <xms:4BssZKGNyHWPm2iaKYRQ7vYnAGNPsFu5QqY3tWRBJOYCDyuRXjptVg>
    <xme:4BssZLUPBcwrUeRfGC5ggrL9qX9BydNULzAFYEaE-Ad1bwrOhVUWuGVDlVRjmpxjp
    bELqMP6lm_KhtuMJcM>
X-ME-Received: <xmr:4BssZEKmgNLwk5-LL0pfPgjBYAK9nCZlvQeXWIttzwPBQurrmNLmL4ddasxtC7w4gwDxH-AYs7YQO_ugAb627CvggOHqsbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4BssZEGC4ftEQbimzxCu1GmcpLe7PGNn5siVYv_NTBxbEpTuIpyV7g>
    <xmx:4BssZAWgOogqvj2Y-oZ_iHllQG8FARsDCekZxWAWI_8cJe0w9IUblg>
    <xmx:4BssZHM8PQh_Y-Sa6-kdl7I5ggSnKgfNh7XnEAuzjctC4XDKz916yw>
    <xmx:4BssZDAtFMI8QS9xZv2Z3vjIla0-bZLUFP0y-1Jj2NqBL97nPV5_4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:26 +0200
Subject: [PATCH v3 36/65] clk: versatile: sp810: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EDiSdT8lrofINqjQWvr4tQoxlAUlXWdHchZ5sQJI9go=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e5+Z5oDFujb7eH+3pRrrABl0r4vcJ7l07YTpp69KjG
 K3/GjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExE04mR4c2prAnX70Ze6JzMGR/86I
 6LzMpcSSmeFctWbKs//T3ktjrDf9c92lvSGZX4A4xUbaPez1nW+j11h3je05mqxj9qN/8+wggA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_054521_145476_AAD03AD7 
X-CRM114-Status: GOOD (  19.10  )
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

The Versatile sp810 "timerclken" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/versatile/clk-sp810.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index caf0cd2fb5b6..a45b1b7b7d49 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -63,6 +63,7 @@ static int clk_sp810_timerclken_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_sp810_timerclken_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_sp810_timerclken_get_parent,
 	.set_parent = clk_sp810_timerclken_set_parent,
 };
@@ -105,7 +106,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 
 	init.name = name;
 	init.ops = &clk_sp810_timerclken_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num;
 

-- 
2.39.2


