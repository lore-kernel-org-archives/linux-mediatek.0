Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECACEC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 00:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UKQhOigrDLEgeDWGD84hTlrB50inUdwvmzSWDEPPvc=; b=xSOxrApk43xXIOo5hEVkFKR8Ql
	gZnt9z9WVxFJSmTLWeRnyrVZsXEQY2yBUCJFBU7/IVeBb4aqwnjbOzNxJwGZ3x0ggzI2+xsKgS4aW
	m/ZuAwYi7DfXgaAn5lvyy3czgriU0h1XOzz6UpASqzcjaTeaNlbHGMgQcOS0WuSrQrWx1nF6Oqge9
	cBP2GBeflrDKExgff1eKFQMXu2vN1nS01Zft7jliDUUTYuabF6YUftTci2XNI/4DMps/UYxtk1Gr4
	kWGWiP0SjEEFz4Us3+1aLjycfNBXxTky48UEBmcdjmSrRSbFF5BV/k0OGlBtXOWOgrFhdsD7vvK2p
	RNc2b0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2KiV-0000000B4On-0sop;
	Thu, 02 May 2024 00:54:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2KiP-0000000B4Ma-1SS5;
	Thu, 02 May 2024 00:54:28 +0000
Received: from [192.168.148.88] (unknown [120.20.105.107])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 088B420009;
	Thu,  2 May 2024 08:53:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714611252;
	bh=2UKQhOigrDLEgeDWGD84hTlrB50inUdwvmzSWDEPPvc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mEGxVQndQ7eIpM8jn5g71jdxtIHcuCBHuXLX3t5HOduXT6G3KWhFZnai5E2QWPjpt
	 xUbxUMw8Z0D7c5pD24vc3ZzhGQXYfLHWVGmOrlPgPRJmKshV4rf1+Spnba3BnjBf4l
	 8kLrN/vlnSlI42W2LzZcE2L6SrWlkinmiVnj3Rl3LhPxwTZqfRHyGa9k6V52F+FI5F
	 O5UUH9X8QHzbu1WEy+dCXTrm0/I1k7hs6S6p0FEuot7yADPKouHcSE4oy6JC/UkbhR
	 coiTMdEGtIg1BQPHt0NyDzVrbhFKr3BlOwadA5+C73I61sUw6Ujqb07PJS0zHw2Vf1
	 h9752xRr1Wnyg==
Message-ID: <eda5b1da03d4adfa5761c49527a9232ec7facae3.camel@codeconstruct.com.au>
Subject: Re: [PATCH 20/21] pinctrl: aspeed: g5: Use scope based
 of_node_put() cleanups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, soc@kernel.org,  Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
 <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,  Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,  Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc
 <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sascha Hauer
 <s.hauer@pengutronix.de>,  Joel Stanley <joel@jms.id.au>, Dan Carpenter
 <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  imx@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,  Peng Fan
 <peng.fan@nxp.com>
Date: Thu, 02 May 2024 10:23:58 +0930
In-Reply-To: <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
	 <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_175425_797208_B68EFCF2 
X-CRM114-Status: GOOD (  16.06  )
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

On Wed, 2024-05-01 at 20:56 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Use scope based of_node_put() cleanup to simplify code.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index 5bb8fd0d1e41..61fbfddb5938 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -2629,14 +2629,13 @@ static struct regmap *aspeed_g5_acquire_regmap(st=
ruct aspeed_pinmux_data *ctx,
>  		return ctx->maps[ip];
> =20
>  	if (ip =3D=3D ASPEED_IP_GFX) {
> -		struct device_node *node;
> +		struct device_node *node __free(device_node) =3D NULL;
>  		struct regmap *map;
> =20
>  		node =3D of_parse_phandle(ctx->dev->of_node,
>  					"aspeed,external-nodes", 0);
>  		if (node) {
>  			map =3D syscon_node_to_regmap(node);
> -			of_node_put(node);
>  			if (IS_ERR(map))
>  				return map;
>  		} else
> @@ -2648,7 +2647,7 @@ static struct regmap *aspeed_g5_acquire_regmap(stru=
ct aspeed_pinmux_data *ctx,
>  	}
> =20
>  	if (ip =3D=3D ASPEED_IP_LPC) {
> -		struct device_node *np;
> +		struct device_node *np __free(device_node) =3D NULL;
>  		struct regmap *map;
> =20
>  		np =3D of_parse_phandle(ctx->dev->of_node,
> @@ -2660,7 +2659,6 @@ static struct regmap *aspeed_g5_acquire_regmap(stru=
ct aspeed_pinmux_data *ctx,
>  				return ERR_PTR(-ENODEV);
> =20
>  			map =3D syscon_node_to_regmap(np->parent);
> -			of_node_put(np);
>  			if (IS_ERR(map))
>  				return map;

I think I agree with Krzysztof's feedback on the Samsung patch[1], and
that I prefer the existing approach for the Aspeed driver. My reasoning
suggests the existing implementation does the right thing. That said,
the code could be adjusted to use early returns and consistent variable
names, which might make it easier to reason about. I'll consider a
follow-up patch to address that.

Regardless, thanks for taking the time to explore the cleanup.

Andrew

[1]: https://lore.kernel.org/lkml/34193501-5b7b-4ffd-8549-a04c6930d02d@kern=
el.org/

>  		} else
>=20


