Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CC8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq/rXhvOvHCvrLASPVtA3GhXPBKkD/XGjmzw/rPkVIM=; b=SUSDxmtkEGzUeI2L3Z5ceCx4HS
	5IaiJlecrc913tj2fSqqONjEBlnJ7Puv9YKUcvDK2jloeIKQc7J9RAmXqqxA4tuic4XhKg4XW5xH8
	LPBvlnhTIB+2KgdCRP9Jh8X2NIlxbBRaed4yLkLRj2DV50Z1KZTNXAEVhMozFi+HoM8pdXdg6Pv2A
	6l0vj1vUDRHmZwqpLBY/cYOvsqJpu1E0XzCg9FXo8RkFJX9Oryu9GQpCdbtcBeGwupWog7BEFui+e
	kGg8FXlvMm2Dp34l9sUYEz5Slkm2/xEslRHwtZtuvlEMM+0EcwAK8SGIp0AeNEPUHF2vsnW5CYroU
	PrW3HKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxjG-00CuKa-Vk; Mon, 07 Nov 2022 08:43:38 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxjD-00CuHZ-KW; Mon, 07 Nov 2022 08:43:37 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id DCF6C5809A3;
	Mon,  7 Nov 2022 03:43:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 07 Nov 2022 03:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1667810606; x=
	1667817806; bh=Aq/rXhvOvHCvrLASPVtA3GhXPBKkD/XGjmzw/rPkVIM=; b=X
	Mzr/NIXE6ygs347sr9HjDgFFmGK0kq2KoXS6EvljdsT42q4HsSnbBFrXk17Pe+gZ
	dWbVuf6oW1+RlsFCQbTn544CssUriWkdV+D7FXCbxrEp8AxET1HdURrEBKJzUYip
	gVp212D/tSe6iCpYb8VYliJ6Hev5v0qHDCpkBoJUaujjvJGMUAqW8xJ0KWDbIhx2
	f5norJaeRYMtACTiES69qUrDVZarBnstpffE60GXGDd6KlKdXhD/p6mDfle1Oi4F
	tw8iedF5sTGvIEhGaml/Nc6ebkrPtqOu9NjXpE5BUxEsl1U9zmVbTM0yWe9Za4Cz
	JF3Za+gLAV5z5vYvIwltw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667810606; x=
	1667817806; bh=Aq/rXhvOvHCvrLASPVtA3GhXPBKkD/XGjmzw/rPkVIM=; b=l
	wO0TYr73LbJV0++Mo0Um+3yOostKt5yo2CyyIGo8HFTSTPAi2RrbvF/eRSp9o2o2
	+aEVg2asFpEDgNzFCjzsmWw/I+winn7en/mnpBxWoy/G9LDRZ5zDpfIzUw5/ExAf
	Y7SEm+UrAAGqRUJtHB7t0Xc50b9C6WaAjlDM4qjFcrD2PcYNYOE9QOiOy4F7vJjr
	fmjXTSUWCZhrxcaSeBX3LtrMMbHa4zhhWUrzwuBioKbLUhXVRM289XoLHGsg3xp2
	6zbPAykMclfzZdWbQloPKRXZpM9u+s22KxEGCZhH8wEOlTH1HKC+Jt2c+4+482O8
	Z39ITGRaZngh6H60+S0aA==
X-ME-Sender: <xms:LMVoYx7dsZ21l2kErXuCb57W6V-JAsoe4W4HyM-WpbOoXImjvs3hCg>
    <xme:LMVoY-41AhVywvyeK4JfUUsEXi7yGSMTiVKjjqjrhVi3Vf1Yt9cKCBrkudXStPFiS
    80CbN6QU3FxaDKrquA>
X-ME-Received: <xmr:LMVoY4ciLQGBbg4CzXUFW73ZhYqObOA6ViBEUq4OeCeWLiBj7LCQ0Jxh9VVQb2zHcTSkhAgpDRwjT3Ql7rjQtJFL6DUYyC-FaDJ1OEZlc5vEZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
    feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LMVoY6JplDgIhemcdbpXp5Yl8GMlUJ2C4lCcCvxIoPX9Qw0Zvdc0mQ>
    <xmx:LMVoY1JKtIdwUipzss4LM7NNIWStHUol6IdWpo5CiSQ2mvmoUJi-bA>
    <xmx:LMVoYzztB-PRe8uYYyegx0uiiyjfwD6LHztfsDpgQpUsGlbjTfSTUA>
    <xmx:LsVoY5TW4OQFLtlRuiANOQeiVNxH9XWmg3_g5ax-jjleBakAR9plvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 03:43:23 -0500 (EST)
Date: Mon, 7 Nov 2022 09:43:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,	Ulf Hansson <ulf.hansson@linaro.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Dinh Nguyen <dinguyen@kernel.org>,	Paul Cercueil <paul@crapouillou.net>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,	Abel Vesa <abelvesa@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Sekhar Nori <nsekhar@ti.com>,	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,	Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Lechner <david@lechnology.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,	Max Filippov <jcmvbkbc@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-stm32@st-md-mailman.stormreply.com,	alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,	linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org,	linux-renesas-soc@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <20221107084322.gk4j75r52zo5k7xk@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y2U2+ePwRieYkNjv@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_004335_763858_FD5157CC 
X-CRM114-Status: GOOD (  20.52  )
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

Hi Mark,

On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:
> On Fri, Nov 04, 2022 at 04:51:23PM +0100, Maxime Ripard wrote:
>=20
> > Just filling determine_rate if it's missing with
> > __clk_mux_determine_rate will possibly pick different parents, and I'm
> > fairly certain that this have never been tested on most platforms, and
> > will be completely broken. And I don't really want to play a game of
> > whack-a-mole adding that flag everywhere it turns out it's broken.
>=20
> Well, hopefully everyone for whom it's an issue currently will be
> objecting to this version of the change anyway so we'll either know
> where to set the flag or we'll get the whack-a-mole with the series
> being merged?

I'm sorry, I'm not sure what you mean here. The only issue to fix at the
moment is that determine_rate and set_parent aren't coupled, and it led
to issues due to oversight.

I initially added a warning but Stephen wanted to fix all users in that
case and make that an error instead.

If I filled __clk_mux_determine_rate into clocks that weren't using it
before, I would change their behavior. With that flag set, on all users
I add __clk_mux_determine_rate to, the behavior is the same than what we
previously had, so the risk of regressions is minimal, and everything
should keep going like it was?

Maxime

