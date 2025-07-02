Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8AAC8303F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0ke2JRsuA8RL9S+jxpNrygvub+UT9y2VHT7fkohHo0=; b=f64xRr/y/iqiC7ME0vhBYsL38G
	Pf8eIBftIYUpG3pZ0IsFDqW99GBjtvdfchfqLwWk7Jt6hXuzSOv0fwJGmjUKcvP/kEDHeBQPOAshJ
	znNpX3tqHTFE5rGIQ1dgtTEb9SntpHcvhzqm4nLq9g8RE3nrJ1WDcII+TmE6vQwsT7X/YEQm8db3D
	4TyBUq9DoH5qmWZPA3b59IL50Y8MBVPCp9kXlnKyUon0OKZo/1YM2e9zKDZPN0n6UP7FS9sX8+YST
	8yPT/pTkE/ZuTbND4LNO2neHcAtY59p63ZqxIs5FqcXHyCu5t185gD2zKc9Hkq8sYly7zDif82kdC
	FsebnZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv51-000000080z9-34BD;
	Wed, 02 Jul 2025 10:52:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuEi-00000007s3v-1VNK;
	Wed, 02 Jul 2025 09:58:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXFdQ6LTjz6L55h;
	Wed,  2 Jul 2025 17:55:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B5DAB1404FD;
	Wed,  2 Jul 2025 17:58:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 2 Jul
 2025 11:58:28 +0200
Date: Wed, 2 Jul 2025 10:58:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
CC: Jonathan Cameron <jic23@kernel.org>, Waqar Hameed <waqar.hameed@axis.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, "Julien Panis" <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>, "Linus Walleij"
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin
	<peda@axentia.se>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Matteo Martelli
	<matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Francesco
 Dolcini <francesco@dolcini.it>, =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh
	<subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang
	<songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Karol
 Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, Claudiu
 Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen
	<haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown
	<broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Souradeep Chowdhury
	<quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>, "Peter Ujfalusi"
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <kernel@axis.com>,
	<linux-iio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-input@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>, "Joe Perches" <joe@perches.com>, Andy
 Whitcroft <apw@canonical.com>, "Dwaipayan Ray" <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <20250702105826.0000315e@huawei.com>
In-Reply-To: <jeajjewfbg5qo736imozpghnpxln2pux74aegtqsi57qsbpug2@opndel6zc3m3>
References: <pnd7c0s6ji2.fsf@axis.com>
	<ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
	<20250701185519.1410e831@jic23-huawei>
	<jeajjewfbg5qo736imozpghnpxln2pux74aegtqsi57qsbpug2@opndel6zc3m3>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_025840_678206_EEE540ED 
X-CRM114-Status: GOOD (  42.05  )
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

On Wed, 2 Jul 2025 08:54:48 +0200
Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrote:

> Hello Jonathan,
>=20
> On Tue, Jul 01, 2025 at 06:55:19PM +0100, Jonathan Cameron wrote:
> > On Tue, 1 Jul 2025 19:44:17 +0200
> > Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrote:
> >  =20
> > > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote: =20
> > > >  drivers/pwm/pwm-meson.c                          | 3 +--   =20
> > >=20
> > > Looking at this driver I tried the following: =20
> >=20
> > I'm not sure what we actually want here.
> >=20
> > My thought when suggesting removing instances of this
> > particular combination wasn't saving on code size, but rather just
> > general removal of pointless code that was getting cut and
> > paste into new drivers and wasting a tiny bit of review bandwidth.
> > I'd consider it bad practice to have patterns like
> >=20
> > void *something =3D kmalloc();
> > if  (!something)
> > 	return dev_err_probe(dev, -ENOMEM, ..);
> >=20
> > and my assumption was people would take a similar view with
> > devm_add_action_or_reset().
> >
> > It is a bit nuanced to have some cases where we think prints
> > are reasonable and others where they aren't so I get your
> > point about consistency. =20
>=20
> The problem I see is that there are two classes of functions: a) Those
> that require an error message and b) those that don't. Class b) consists
> of the functions that can only return success or -ENOMEM and the
> functions that emit an error message themselves. (And another problem I
> see is that for the latter the error message is usually non-optimal
> because the function doesn't know the all details of the request. See my
> reply to Andy for more details about that rant.)
>=20
> IMHO what takes away the review bandwidth is that the reviewer has to
> check which class the failing function is part of. If this effort
> results in more driver authors not adding an error message after
> devm_add_action_or_reset() that's nice, but in two months I have
> forgotten the details of this discussion and I have to recheck if
> devm_add_action_or_reset() is part of a) or b) and so the burden is
> still on me.

Maybe this is a job for checkpatch, at least for the common cases.

There is already a check for kmalloc etc.
https://elixir.bootlin.com/linux/v6.16-rc4/source/scripts/checkpatch.pl#L64=
42

+CC Joe (who wrote the allocation functions test years ago) and other check=
patch
folk.


>=20
> So to give my answer on your question "What do we actually want here?":
> Please let us get rid of the need to care for a) or b).
>=20
> > The code size reduction is nice so I'd not be against it as an extra
> > if the reduction across a kernel builds is significant and enough
> > people want to keep these non printing prints. =20
>=20
> To complete implementing my wish all API functions would need to stop to
> emit an error message. Unfortunately that isn't without downsides
> because the result is that there are more error strings and so the
> kernel size is increased. So you have to weight if you prefer individual
> error messages and easier review/maintenance at the cost of a bigger
> binary size and more dev_err_probe() calls in drivers eating vertical
> space in your editor.
>=20
> I know on which side I am, but I bet we won't find agreement about that
> in the kernel community ...


>=20
> Best regards
> Uwe
>=20


