Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66A8C5DF87
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhigk4FfzQYWTvMTLq/I40KhIpujv/zfq6N4v+rAOow=; b=r3IJYjVQphVmaKlYFoC0RuGWqd
	FGTO1mnYFCWJT6682mKMtxZ/LXqbJSOayaLaKcluDaL2a4s6vcRVIptYtxd8iduWOcuQau+jJUqWn
	x9Gm8sJd/Q/phPGvwKJHr4ODyo0eaTgJ3csWvv7mQeUjbcLP6tUYsmW1akiFB7eK/V0XKkqTZLAGQ
	8bWxNkW6usx4dGAkqKun0xToUCsZdRCkITBSKQLNoyL2+nvvPR3w4LKkM+H1oKT5s7rXjK7sQV3Mh
	4Q2RnE5Y8tssZ+r23ENhPQZul1iaXXlb8CN3HvxaKhwHpFQP+ZarWUWH4/K4lt8rmxKMKU8iJ45zO
	EhcuMFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMwB-0000000D8Jj-1bgg;
	Fri, 21 Aug 2026 10:57:29 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMw8-0000000D8Hx-1j65;
	Fri, 21 Aug 2026 10:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1787309837;
	bh=vTxNGzhiU+qNcfdup2iOrcIIe1C5zjV7/YGX2sRgMes=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BpBexqdHP7l9UXTEi7tNsKJ7v5JrQ5ZdZndkkOW3FK62QJkZPxJxds1XBB60/ptCZ
	 +4FqA3I5gWE42Mn2k6xdUvuXJ8BcmPf1ehfDBkHnO4hKYrgHCV6w9pWnetTgnV1jir
	 xW2jslhE/JH3XZR6Ix/Z58ce1yPaK58iX5BHv9Jg=
Message-ID: <3596303d8fc1ccbdbae9277e599b1a37682fac2a.camel@crapouillou.net>
Subject: Re: [PATCH 14/45] clk: ingenic: Make sure clk_init_data is fully
 initialized
From: Paul Cercueil <paul@crapouillou.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Ryan Chen	
 <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stephen Boyd	
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet	
 <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Taichi Sugaya
 <sugaya.taichi@socionext.com>,  Takao Orito <orito.takao@socionext.com>,
 Linus Walleij <linusw@kernel.org>, Avi Fishman	 <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry	 <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen	 <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Sudeep Holla	
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
 David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Santosh Shilimkar	
 <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Heiko
 Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen	 <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Emilio =?ISO-8859-1?Q?L=F3pez?=	
 <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec	
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Prashant
 Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter	 <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Matthias Brugger	 <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 21 Aug 2026 12:57:09 +0200
In-Reply-To: <e3a8b277773f46eb200f3c4bac98ee380f3a24bc.1787239813.git.geert+renesas@glider.be>
References: <cover.1787239813.git.geert+renesas@glider.be>
	 <e3a8b277773f46eb200f3c4bac98ee380f3a24bc.1787239813.git.geert+renesas@glider.be>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035724_645095_BF4B4994 
X-CRM114-Status: GOOD (  17.56  )
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

Hi Geert,

Le vendredi 21 ao=C3=BBt 2026 =C3=A0 10:53 +0200, Geert Uytterhoeven a =C3=
=A9crit=C2=A0:
> The clk_init_data structure contains several mutually-exclusive
> members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.=C2=A0 However=
,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE
> is
> enabled.
>=20
> Make sure all members are fully initialized, to avoid such bugs, and
> to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> Compile-tested only.
> ---
> =C2=A0drivers/clk/ingenic/cgu.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 41e4c69131bd6ec7..ad223aa20e8db5a5 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -644,8 +644,8 @@ static const struct clk_ops ingenic_clk_ops =3D {
> =C2=A0static int ingenic_register_clock(struct ingenic_cgu *cgu, unsigned
> idx)
> =C2=A0{
> =C2=A0	const struct ingenic_cgu_clk_info *clk_info =3D &cgu-
> >clock_info[idx];
> -	struct clk_init_data clk_init;
> =C2=A0	struct ingenic_clk *ingenic_clk =3D NULL;
> +	struct clk_init_data clk_init =3D {};
> =C2=A0	struct clk *clk, *parent;
> =C2=A0	const char *parent_names[4];
> =C2=A0	unsigned caps, i, num_possible;

