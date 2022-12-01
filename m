Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2493C47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpM012qOECh0oiIP5wgLVF5L8IgM73qVHbrp7H8jrWA=; b=GxZf4F74kgFNG8zN0XAU1YVJp9
	jTKxNsGbjzFQ2oGvrm6x8hu5t2uNAz0O5h2A/JTOkksou1+E9N2S0qCEH57aVFlduFYYkv4Zs+t57
	InvqiaEqXXtm+HLEGG7W6J6BJGHeqotYlzIJM9+BNOmipKh5qObYCh9O2YtShnNRZ2/swUBbaI+dr
	d5xGeYCn3JvL5iyph6xUKJU/GGdUedJ5m3sUJCblxGGqEcLm+ScMSgxWc0xrcMDVySjVwfBmTTHvF
	uPUxYFLK9aJwT8n6IMe944aKXnHxpSkoE81wMb6PWooWGd5p57Fs1AuoTn4uSwB8vuabQDK0ulFAV
	wvzii1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jTt-007ez2-9p; Thu, 01 Dec 2022 13:20:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jTg-007eun-P9
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 13:19:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0jT6-0005zw-Lz; Thu, 01 Dec 2022 14:19:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0jT1-001alJ-Sp; Thu, 01 Dec 2022 14:19:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0jT1-001ng9-TI; Thu, 01 Dec 2022 14:19:07 +0100
Date: Thu, 1 Dec 2022 14:19:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
	linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	chrome-platform@lists.linux.dev,
	Florian Fainelli <f.fainelli@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sean Anderson <sean.anderson@seco.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Hammer Hsieh <hammerh0314@gmail.com>,
	linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>, linux-sunxi@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-amlogic@lists.infradead.org,
	Benson Leung <bleung@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <sbranden@broadcom.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <20221201131907.bmrenldnua7uaeab@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y4iL9xf5bJM5pyeR@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="twdnam2bj5te67tc"
Content-Disposition: inline
In-Reply-To: <Y4iL9xf5bJM5pyeR@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_051948_826658_CDB128F9 
X-CRM114-Status: GOOD (  14.29  )
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


--twdnam2bj5te67tc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Thu, Dec 01, 2022 at 11:11:51AM +0000, Conor Dooley wrote:
> TL;DR, I quite like the ability to return an error and not mislead the
> caller.

Is this an Ack?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--twdnam2bj5te67tc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOIqcgACgkQwfwUeK3K
7Am3+gf9HQlrVI1DS5daIvtH5ajPj10gQCf7wUVcwdDqDzHuJW7mEQVvG1vEEaVC
1sZxg13cFekIRhMzVMDj6JMG7MCuBqT0KWFDrstMLC2g7ot2+xZ6iJXXJL/3AQSm
pf/UiOQYYN7VXn0Wpf8L2FkfFuTglAuZE6bLdE2t1/+pQnp9oR81aoPWJgZ8vhax
WOkQYiH16UpgLNbhu7dV4133nkA6dfsSG+DrZjPy9vDdjCyDXUpxPnldpcHu+KCh
zRNQ9gX0bYT60vQejp9169VriwhcHhts0uT6AnSYVw/MzYrwx/pJu9bdq+iq86Uc
bMsdCWzzY9XerANJF7JdTMcJrfah8w==
=luMq
-----END PGP SIGNATURE-----

--twdnam2bj5te67tc--

