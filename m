Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D735BC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vktqaF0FgAymg4NNxU36k4MdhmcX/jyIc5rZP0GxZpg=; b=2Bw3R1oEN4ffgGzM0/Nwc6kWHy
	2/iPW/Ln8GLa9G1Zrw+fjMPlFojTKlx/6SodH3vjDMsdT1SrG/Jslc5IVzlc0A9dIE1ADR3E3egRj
	FLzIgWCSoYotRI8gXwGMi9Ac+8WyFcYkhmsS/BuJ+O6kxBCOjPSqKBcPRGB3r3mFmM91EcCgwvUyl
	F9P+zKN7akca+ALELXdW/xPdyUKykPoLgxV3AZ/6dODxBWAR4QOcMiej1pL11B4/UMLdcgVSIUYEn
	J7Xh/eMOo8JF8+TJEIcZjEsmvpP8sjOC0RhA2XdQTNE388EotmvIrCr6V0HCE5aRKnQj67MW/BuQO
	bIH/Dk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfry-001Hs3-2l;
	Tue, 04 Apr 2023 12:34:38 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfrt-001HmK-36;
	Tue, 04 Apr 2023 12:34:35 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 547075821A5;
	Tue,  4 Apr 2023 08:34:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611673; x=1680618873; bh=vktqaF0FgAymg4NNxU36k4MdhmcX/jyIc5r
	ZP0GxZpg=; b=s31JpOYw0Is5/H0qPRNsBySPDf1dQBp9BiLEi1UH63Z8qrcRm43
	3DMo29YnPJ4snvAS11TquNBAL2ntJsozPZVDmeUu8Nge5mXlX67OlvzaMyiRJO65
	eiLI7YLqbzqrMePEjKi2vhn3+chumIlPmc+gEyzBwPqLAKZlgVG2U/FWQ712kGYN
	SBqX0yHX2UISw+HaGQu3+5yEpJCBy8Gg3SEopFayC7trIBwXQar8a04ifJVCzlcx
	7m9X7rRE/WsOBD8Bi/oXu5ybrxRagavE/CV3cxrlG3I56LAW8FOBrI4tbnR4DsE0
	dUpn63oR1Yf4+vo+AWVW7NVueXk6KK/hZRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611673; x=1680618873; bh=vktqaF0FgAymg4NNxU36k4MdhmcX/jyIc5r
	ZP0GxZpg=; b=McnDD3pDNWe5jFSRLdTPcaF+hy3ZRwuouf/pwuemAuy6aNDVToF
	UXsRkckGcQVvL4wIBsh59dlJWquRuvoCcBiFQAWuFNtAEaoqD3MRgH4eP2XjvZPU
	9kyplbzY4f/4p9Nt+JWsukMTCp2nsbr+jHK1DEDYcsh/BmbqvnPhsbWo4U9ODM1p
	YCdKc6RIZruxVs8fhSLu669rpCe6njyOv4i8Ffd+xsQ43ojTMnveMZ4d9JjNVd90
	MRpduVH5UZ7BuSaofUdXWhSpnpNx9WqWeOzgmgUbgniXsnEz1v3bvbrlbkevdXB9
	WwuJZOUMHI20X//ctpUYDIeu+2oaINML34A==
X-ME-Sender: <xms:WRksZACUBfAWM5klj9XPNywolUaeHHCeH5uFkpAOTo-3JmW_UwNDTw>
    <xme:WRksZCggTu3Fp6C8xde_mqYkHFRO5iaVptnPuIMexWzeV92MyK2uf1HEuZwEheO9B
    AHd8Rxu3kxhgkjzlSQ>
X-ME-Received: <xmr:WRksZDn5Z4cCrBunAg3qIR5gvMPnCshtJ7_8RCrDH6EJOn7IFnc8Uvpsd7PBMycfiwDJD5mc4dj4XN7Ewwpp_NK-WFEc5os>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WRksZGy_nYRYIbe1PfGaSegLPd3fi5Z2hS1b4f7mSoD2nE4JR2LO4Q>
    <xmx:WRksZFRN-YyEjVmRYsTLbuXfX_hx7aEdUzsZLocAYHn0RDcz75rg7w>
    <xmx:WRksZBYB9qMwfVhPalpcm1gt8x7um1Tn8YMPZIlSQJ4MJtRLb8xbQQ>
    <xmx:WRksZJfWg7zPHQmUnpXQfKa6BuHflZ3rEQkM8vBHHIWUXHiIT-wFEQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:11 +0200
Subject: [PATCH v3 21/65] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-21-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5lyHHQpQWAiRxeRx338/dvOcr5jka0snE7w9nKtfF/s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cejXnpcyT/Z7qC/p1vZn+6HgbunqjVUO07ae/8mx4L
 pCdv6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEjvAz/I/bNkn4yrcZjFuscw8LTH
 /y5JGdp4f0at9LXz1FtJas33iJkeHxorQr7axm37f8jCibcFgra7tbA1vRspOb2Y5yid7QL2EHAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_053434_067848_E141ED4E 
X-CRM114-Status: GOOD (  18.05  )
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

The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4103d605e804..c04276bc4051 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -229,6 +229,7 @@ static u8 da8xx_cfgchip_mux_clk_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_cfgchip_mux_clk_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= da8xx_cfgchip_mux_clk_set_parent,
 	.get_parent	= da8xx_cfgchip_mux_clk_get_parent,
 };
@@ -251,7 +252,7 @@ da8xx_cfgchip_mux_clk_register(struct device *dev,
 	init.ops = &da8xx_cfgchip_mux_clk_ops;
 	init.parent_names = parent_names;
 	init.num_parents = 2;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	mux->hw.init = &init;
 	mux->regmap = regmap;

-- 
2.39.2


