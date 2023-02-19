Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309DC05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj5Qph10M1N4MQt3NlxqiBGyEeiAFAy607GKhiGrBcs=; b=ncbjClyBPgJ30PYCtFIcGRuB5d
	esueDBrL++Z7/hWShBg4/osonUNfxp+DYvUcy4oZsqrV6smhADxAFoRAghKnJ801mvNAwBGBsEWN+
	6eV3THQyDkgkqV+xgPI574v6eSnrfr+boCMx6dCeJPMy6Dfp+pYv1iYdbEVoRJbckXAu85PnBxeS8
	Hs7iY7t1hZLhupEAYqrigSdkOsgr8Fxbg8AK3ShiTWecmlpBIlT+X7RU84xy1CIFCUYgsVDYDzO2o
	GXFsgB/A1KazqNxoo3vrb8+mP/iuMlr/VOiLQhD1mZIv3fI3D/iSMw9K/XUa+FQ3hPRc/POHszvaM
	YrANQPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTsGZ-002PUJ-6A; Sun, 19 Feb 2023 22:34:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTsGV-002PSa-08; Sun, 19 Feb 2023 22:34:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BABB0B80ABA;
	Sun, 19 Feb 2023 22:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA138C433EF;
	Sun, 19 Feb 2023 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676846074;
	bh=Rj5Qph10M1N4MQt3NlxqiBGyEeiAFAy607GKhiGrBcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QknT0W3y6TsX+TayniMsGpFXVfZtOjT/nAq8KzOf9AlJQhiANq7osV79aq4fcITL6
	 Hg7+Lw2u77AIIdaf8YpBa24evSde/4bir9XM4MhCFrwsCyUAblXyo6pKk3OtFwMtLM
	 1g09yrZ0wML/pzOgNMputSoonB9n99hVaBhV0enKKeDnOdqcWobVPNkGL315o1SZb4
	 zxwB1uI4V2OlBqAxHh5UEoRQ0Re7vsLL4AyY3BBDd5YWYgtOj9N1e6pTBZu3I7BeCx
	 AexWtipprMU+wDDIw8lHtm8b1Vy52wQRYVbX0IEjzxA3qouoOfKbEbq5VEjhGI6Qf4
	 1uGDSiqc6ZFtQ==
Date: Sun, 19 Feb 2023 22:34:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kucheria <amitk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Talel Shenhar <talel@amazon.com>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	Tim Zimmermann <tim@linux4.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
	"open list:INTEL WIRELESS WIFI LINK (iwlwifi)" <linux-wireless@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata'
 accessor
Message-ID: <Y/Kj+BHpAmqzTYVz@sirena.org.uk>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NIn5HqEcLWwUktt/"
Content-Disposition: inline
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_143439_373358_E47D1A1D 
X-CRM114-Status: GOOD (  16.51  )
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


--NIn5HqEcLWwUktt/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2023 at 03:36:41PM +0100, Daniel Lezcano wrote:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
>=20
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
>=20
> Provide an accessor to the 'devdata' structure and make use of it in
> the different drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--NIn5HqEcLWwUktt/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPyo/UACgkQJNaLcl1U
h9DM8Qf/Zmlh3lXuePXfWRw0LZtzREQmKoy5pRmB/DOVamg35ZgY0wcSzoBWY1aQ
0CG5AKqrl3o9DDZNHLIlNvBV9bwHNMfWpg4v4Dg2E62N/spx8ytzblabmS1i3Nq2
xZ1gwsGdnR+KBhWWrIqF8k/Fl4tyeFBMnypvUbBY7GeHDt68olsJE4OfAbNAd6Js
3GS4Vmyeh74XUAwbAvx9jdona+bYN7cY8j8vQ5esi55rqmyfOQ3rUxRCW0kWifu8
kPkx3gycE9EYfRgBFwoqjWdfhhuwlzVLZa5hPx3+erMdBVtguWlDArU6Mm7C7wNL
1Pt8qdM5et8nPioby2thi64z0t5/2g==
=iwAk
-----END PGP SIGNATURE-----

--NIn5HqEcLWwUktt/--

