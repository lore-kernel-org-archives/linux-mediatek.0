Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3517C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJ3M+zYS15q5Quad0wzrZG7xL5+9ADdP5E4EpauPQDA=; b=LbR9aLqDJFSAB6emEsPSTjspyT
	qebAieInaIlZ7CCUrkqpe+7jT/fNPwlw9zlZsNWUYsGHFCM6xS9cfnOsUCz/J02LP8q4IuxEzGvJ5
	xKc3DOdIsxWlBK/uwHH95hUk7A1y2kqEEFILWnVWpcWipw7N+1fL9PI42lN+qxrhVbZuvaDOQFGz3
	F2SlCmery0Z9N+IIPLOt7J4Rpsm2rM3smtu+6dIfa5uNdMplJjZSWKhoqXztQyektCnh2wpHHN+ZH
	2QC5kkOHxWD6XziRsk0DC+tX21e52NLUYoK59/p9lxc4PNKziYpCF76ju6BgzDq9/qu4yCG+GE+mJ
	LCT4+BEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4m4-004oGO-35;
	Wed, 05 Apr 2023 15:10:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4ly-004oCd-20;
	Wed, 05 Apr 2023 15:10:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD7E2626EA;
	Wed,  5 Apr 2023 15:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604D1C433D2;
	Wed,  5 Apr 2023 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680707405;
	bh=rJ3M+zYS15q5Quad0wzrZG7xL5+9ADdP5E4EpauPQDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwvoLG9Mg6dizDLr402j7UdbsqsQxuYjteYBhYwhrJlAsrbTC9nd6DQo1IzXxCIaN
	 9U72nBXMiZahaLCTdTcDIyoRUQ+ocS5hUtOmf5c/huPkH9rNDWmoozW7pynZHzH+D0
	 BGkdmKh+F8uLhLLPmXVxsc28WnJBRX2V3SfGP8T4wKvdqas3AfRJERK4rgMzIwhb2E
	 qUgFyspMctrP+YLPss7RMpYkfaXUxCSqnJxvkR2qxW/mhhhcEOUM7AD8vA30RzOHfq
	 MNkaCuaeprkDAK/eetegajbSH5jkLfbeRNdoBlc7xa5It9mB4L6J4Y1vI1mBg8lIkR
	 DpSUyJSUzAZBg==
Date: Wed, 5 Apr 2023 16:09:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 63/65] ASoC: tlv320aic32x4: pll: Switch to
 determine_rate
Message-ID: <6b83dd87-3819-4db4-bd07-92487a1df09d@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-63-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bXPsTMNAHQ2iLa6U"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v3-63-9a1358472d52@cerno.tech>
X-Cookie: 1 bulls, 3 cows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_081006_771417_111A1997 
X-CRM114-Status: GOOD (  19.67  )
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


--bXPsTMNAHQ2iLa6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:11:53PM +0200, Maxime Ripard wrote:

> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.

> However, It's hard to tell whether it's been done on purpose or not.

> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.

Similar comments to the other patch, I'm pretty sure this is just
surprising design on the part of the clock API and we should just allow
reparenting.

--bXPsTMNAHQ2iLa6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtjzwACgkQJNaLcl1U
h9AOwgf9ErN1u2S7sQlFKj2SeLpE5lRKnNP6D1ooc6560nzhA27lBtrYHbRW8SJl
T+kbhVrNtrlNbq+4ODnnfurtCWZnzgv4x6SDSb4ifzjckcCo4hjqHk9kcGQk/0Cw
pe5S6KjNiGE3LWSWa85iqnAHH8XPVms/VcjAtDbLdiXBqV0fBmvKHpKkqpQ2IKiJ
CPVabkZYMXj4Qh+tGAScos2ZPgNI6nG1euebgm1iPDvutLxcxU8RVHA++BVKNa62
/ijunLrZY+U2Msq+RZQGuSWr7TfdD1DUhxhdnTG4Hjm4Q3r0KaWeixGyICYY6TyC
r4CUzpWuZDn+9YNx2ETW7ACv6ayuMg==
=P5db
-----END PGP SIGNATURE-----

--bXPsTMNAHQ2iLa6U--

