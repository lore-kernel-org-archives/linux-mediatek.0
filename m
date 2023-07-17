Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7903AEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUpV0i69cnfkz2nelxENlLbeUDKFc0MGa24POWERkHA=; b=ZtR8hGiY8fkSqDdLs8XudEtl2t
	8PRH6UQP3TXFwjEKdQ8dleUYUBRY7bYgw+gcjCV3kATiFbD4/FCBTEorGHE1uUJ/YF/jVCbLRp1lJ
	1yMoyznyoUKxHq+s0Tx7NwtiflbjsIFX2kCuviOAKX2K4GrKAC8GOdm6hwT2Y50PH/d/EJgVFSElc
	aH3qJMlgzsPcTFzRXwWPXNi6P6Lap6Ze74O7hnC/zJ/vYvaw9FPXLdVI1EB2jGvUv1Yo7YGI+iwWs
	QvtOtDn0y9l7EddSRoLxUJJ/ugqxBmec5J8grMLZp9QfXeTxlU1BVLz7rfkMGm3ksAF6Cxy9M09l5
	Be9p9bnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIwI-003LhC-0h;
	Mon, 17 Jul 2023 07:46:38 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIwE-003Lgf-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 07:46:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qLItl-0005e3-Cd; Mon, 17 Jul 2023 09:44:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qLIte-0004Us-4z; Mon, 17 Jul 2023 09:43:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qLItd-005WwB-3s; Mon, 17 Jul 2023 09:43:53 +0200
Date: Mon, 17 Jul 2023 09:43:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
Message-ID: <20230717074352.dz3ex7fwi77loayc@pengutronix.de>
References: <20230714174852.4062251-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3pw4fff6xzsrv6pf"
Content-Disposition: inline
In-Reply-To: <20230714174852.4062251-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004634_882939_0CC0117A 
X-CRM114-Status: GOOD (  26.43  )
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


--3pw4fff6xzsrv6pf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:48:50AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.

so the eventual goal here is to prepare for:

 - drop #include <linux/of_device.h> from include/linux/of_platform.h
 - drop #include <linux/of.h> from include/linux/of_device.h
 - drop #include <linux/of_platform.h> from include/linux/of_device.h
 - drop #include <linux/platform_device.h> from include/linux/of_device.h
 - drop #include <linux/platform_device.h> from include/linux/of_platform.h

> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pwm/core.c               | 1 +
>  drivers/pwm/pwm-apple.c          | 1 +
>  drivers/pwm/pwm-atmel-hlcdc.c    | 1 +
>  drivers/pwm/pwm-atmel-tcb.c      | 3 +--
>  drivers/pwm/pwm-atmel.c          | 1 -
>  drivers/pwm/pwm-berlin.c         | 1 +
>  drivers/pwm/pwm-cros-ec.c        | 1 +
>  drivers/pwm/pwm-fsl-ftm.c        | 3 +--
>  drivers/pwm/pwm-hibvt.c          | 2 +-
>  drivers/pwm/pwm-imx1.c           | 1 -
>  drivers/pwm/pwm-jz4740.c         | 2 +-
>  drivers/pwm/pwm-lp3943.c         | 1 +
>  drivers/pwm/pwm-lpc18xx-sct.c    | 1 +
>  drivers/pwm/pwm-mediatek.c       | 1 -
>  drivers/pwm/pwm-meson.c          | 1 -
>  drivers/pwm/pwm-microchip-core.c | 2 +-
>  drivers/pwm/pwm-mtk-disp.c       | 1 -
>  drivers/pwm/pwm-pxa.c            | 1 +
>  drivers/pwm/pwm-sifive.c         | 1 +
>  drivers/pwm/pwm-sl28cpld.c       | 1 +
>  drivers/pwm/pwm-sprd.c           | 1 +
>  drivers/pwm/pwm-sun4i.c          | 1 -
>  drivers/pwm/pwm-sunplus.c        | 1 +
>  drivers/pwm/pwm-tegra.c          | 1 -
>  drivers/pwm/pwm-tiecap.c         | 2 +-
>  drivers/pwm/pwm-tiehrpwm.c       | 2 +-
>  drivers/pwm/pwm-visconti.c       | 2 +-
>  drivers/pwm/pwm-vt8500.c         | 5 +----
>  28 files changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 3dacceaef4a9..d37617c60eae 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/acpi.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pwm.h>
>  #include <linux/radix-tree.h>
>  #include <linux/list.h>

This file includes neither of_device.h nor of_platform.h and up to now
gets of.h via <linux/pwm.h>.

What is your plan for <linux/pwm.h>'s include? I think it would only need

	struct of_phandle_args;

to replace that. (But that would need another patch like this one, as
then e.g. drivers/pwm/pwm-sl28cpld.c fails to compile because
device_property_read_u32() is undeclared. It would need to #include
<linux/property.h> which now it gets transitively via <linux/of.h>.)

If <linux/pwm.h> is planed to continue #including <linux/of.h>, the
explicit include here isn't necessary (and probably elsewhere).

I don't care much either way, but maybe your quest would be a bit
simpler if you only touch files that include the two files you want to
modify?

*shrug*, this patch is still an improvement so:

Acked-by: Uwe Kleine-K=F6ng <u.kleine-koenig@pengutronix.de>

Another thing I wonder is: How did you identify the files that need
these includes. I guess you have a list of types for each header and
search for files that use any of the types but doesn't include the
respecitve header? I wonder if tracking this type -> header mapping in
machine readable form somewhere would be nice, to e.g. make checkpatch
warn if a file uses struct of_node but only gets it by chance?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3pw4fff6xzsrv6pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS08TgACgkQj4D7WH0S
/k6d7QgAjn09jbMtpLkxkAPiHCL/fUXRMWWMV76Fu8uZjs4221J2gsMK6PDWTeiP
ybzv24/V+5/OyOeBVsFqZPw0gxNhTh8zmtyIdEvZO8eMBcZOX6JPcm/DI4YG3WU+
6nYSRGc7D+AV+eD7s5CxHboHtOwY7RC2RGyPCNPA0yIYNTLYpdIVHYyn+8BpfeXj
wnBKUiJAcJH7+JGUSFhRV7Xpd4RenRBnT3l8KEm9HUjJlEvqmNpueg64ho1bSXAH
+fbd5TtrHh001xp2BdyJ57uhh+KQggrhgLPhOSiiBQ7+oaro/jiO4IxUODUDCTia
LGNDfrMHQ1gjS2ZQQPQwRr0vdmwd2w==
=DUiw
-----END PGP SIGNATURE-----

--3pw4fff6xzsrv6pf--

