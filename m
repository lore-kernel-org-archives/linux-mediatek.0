Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0CBC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJDBNEKoGpDzecGU04b8ngORcNkOEhFsRkRwaHu8tFc=; b=lEhkfROspYARxZvtzfmNjdqGSo
	cfO6tIuZGnEtqd7piLkNeKCZVMf0yHnT/FI28/h7fqT3Bl0dqvOS5kvKzTKFMHJD8f+XZYCozElPo
	HL5zvCvLt4J/f9Crils1IQyGbxCo5ux2uZMKdeZF7ZV9ou2Mi6ZJtKXejYm65mRD6ajwi+gVJx5f4
	+lSDzGol2QEqXCVflMX2QX1LWvG7lEjz1i320uXHzbq3WuyiqsF8C/PMM2TWZF4gXgzZ1oUbssp9K
	RAY67qtjCXdqN7vfHDD6pqwiFqiAw5kr7b/mwDenq4M5MfLXLlX7XGRnUQOj0B7YUb6HomuewauPn
	J7HOm62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4aR-00FzAe-Jl; Mon, 07 Nov 2022 16:02:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4aN-00Fz8l-Iz; Mon, 07 Nov 2022 16:02:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 17F89CE1712;
	Mon,  7 Nov 2022 16:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F88C433D6;
	Mon,  7 Nov 2022 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667836963;
	bh=Q/9M3qSa1bFKeX3VjOKXXNeZQ8B6sH7ewCOsQSJl+z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOmgvny4UUp7BZnQahaV6KsWUNhmwIhMxpmcOq3tw9+9teYm6GP3wrPKa3hZGoLnw
	 E8JjujtcqktG/KkrpbyyurTKPktTQdPK912YFUTtXWMPkM5Mc8ahGVOnmMw4Uhs9uI
	 cTBlpsSY6QMvq4ve9Z36ouACRIQs64gqbTRuCpXHF7tFc/7x4f8H/Qv0fo1LJXDNr9
	 JzeHD9nkKpifY1CmMZpd4sb8KMqk3fuEl3XqfTd7Ru1lKOsEk7X40/JP1ugM9/6yCX
	 WursSOfQ18hBTkSv25XwIi5vVUTkBzpxlLxQrxg8iYZ3853WT5wCALjP37Nihp0/J3
	 NEZKY1McJ+eyw==
Date: Mon, 7 Nov 2022 16:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Abel Vesa <abelvesa@kernel.org>,
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
	Sekhar Nori <nsekhar@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Lechner <david@lechnology.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-stm32@st-md-mailman.stormreply.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2ksFHGNIEVm1ldF@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk>
 <20221107152603.57qimyzkinhifx5p@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTyRvcr/YAY3aApU"
Content-Disposition: inline
In-Reply-To: <20221107152603.57qimyzkinhifx5p@houat>
X-Cookie: Minimum charge for booths.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080256_045214_AB5B23CB 
X-CRM114-Status: GOOD (  23.79  )
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


--hTyRvcr/YAY3aApU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 04:26:03PM +0100, Maxime Ripard wrote:
> On Mon, Nov 07, 2022 at 12:06:07PM +0000, Mark Brown wrote:
> > On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:

> > The series does fill in __clk_mux_determine_rate for everything though -
> > if it was just assumed by default the only thing that'd be needed would
> > be adding the flag.

> The behavior assumed by default was equivalent to
> __clk_mux_determine_rate + CLK_SET_RATE_NO_REPARENT. We could indeed set
> both if determine_rate is missing in the core, but that's unprecedented
> in the clock framework so I think we'll want Stephen to comment here :)

> It's also replacing one implicit behavior by another. The point of this
> series was to raise awareness on that particular point, so I'm not sure
> it actually fixes things. We'll see what Stephen thinks about it.

We could also just set the operation and still require the flag to be
specified.  I'm a little surprised to learn that it's something you
might want to override, never mind that the API didn't have a default -
it feels like a bit of a landmine that this is the case and is probably
why there's so many cases to fix up.

--hTyRvcr/YAY3aApU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNpLBMACgkQJNaLcl1U
h9BS0gf/chIMp6chtu1p8LwUn+lniQOfOjVm2GoGAQ06qSr9+3KsWgvPO3J4pFNa
l036gwiNNFPM5gXlEj19YU0NgiAQIt2hoh9q92PY1kN8vmSQutr8U6QVxq27pphZ
5T2AVdZG2/L1Za5fy+qtwzx6ji1EENFmdLOF/NRrtc1zJPm/bT9E14uqwH7vmK0f
Jh1uBONY+x2wM44EMNgt3p4HTS/37ARwT9njBao9UUdt1uFWnUx05o0lerkyk4Xg
QlkvyC2hU+mXML3s6FVEbx0TQImsJItRx7Fk4E0Pij30qxWDtd0uybSJOzuWo16R
emQv+2HsLgl0L3qkctPVJREpPwCQuQ==
=mfv5
-----END PGP SIGNATURE-----

--hTyRvcr/YAY3aApU--

