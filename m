Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADF7C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivwVh7pZb1fcTFGcIsJcA/Ibg0VcRU+F4mqC8+jdWHM=; b=PRozMaFYIrx9NrljL4MtalIHQH
	hEGwxKvj6VEvNaPGnkyWX6+rH1muV9iGzKvdpAnSUTvqctX1i/Ea7xvp5X7sCnq5KVRluhOpVZ3r3
	TKxYbgEwhGW0SbER7kOwg4WWBRMKIqHfK+tBqS7DLK9i+LkpgqbMQUUdHEHX4IF6Kj7hh0ylbhhUf
	yo3fhNpvKxnw0gRhZRhkfH0nGTrcVLyL10+CvzwxL7J7Yy9VkoqWfgF+W6efEUfP630B8TN4Wk9wl
	QRoQB08XOop2jNIuryrfA8j7Dz9Q6bGG0Y0w1b0lbG9hbvcx6KiiXpzCuKLx36Y2MhhP5uihnWX4k
	u5V0BZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOlf-00G6QR-IS; Sat, 06 Aug 2022 18:43:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOlb-00G6NL-VG; Sat, 06 Aug 2022 18:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02AB76123F;
	Sat,  6 Aug 2022 18:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4642C433C1;
	Sat,  6 Aug 2022 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659811398;
	bh=9zcEKsBlFaq2Abp3Ujre2SKv4E24ne+3Amc5GKr94r8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c9gsw5fxL6QdsooDIbb4X9vk/stoJ712TyCVJOtC9CJKSkjLFQCmXi/5mDrkXTPFl
	 jwrx2ij+iN76kBuqX9E1RI3tmZt4rQAFUuSKPdHAlNEoeHtQQmFD+RkvIxrDw+QiHA
	 pWSLiv4Et6Ox7W7nGspv5/wWXDvIqhyFgJ+QiSbeFsZXNY3pcirIGvvvl4tuSvzzRW
	 x2bfobAuH8Qw/R6aRDHODz3poGX1Vras3COg4325mAbnVJjU+HP+0u4w7c6iC55bt2
	 JRB9CaMTRw+5fLxFkM46MspQLfkomAlJE7T8i/QU3kwz6vO3V2HaHuYdvxorrGC8LB
	 mAA2JfHh4MrsA==
Date: Sat, 6 Aug 2022 19:53:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-iio@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-arm-msm@vger.kernel.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "Olivier Moysan" <olivier.moysan@foss.st.com>, Tali Perry
 <tali.perry1@gmail.com>, Thara Gopinath <thara.gopinath@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Patrick Venture <venture@google.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Benson Leung
 <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, Zhang Rui <rui.zhang@intel.com>, Linus
 Walleij <linus.walleij@linaro.org>, Christophe Branchereau
 <cbranchereau@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman
 <avifishman70@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, "Andy
 Shevchenko" <andy.shevchenko@gmail.com>, Guenter Roeck
 <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, Amit
 Kucheria <amitk@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, "Haibo Chen" <haibo.chen@nxp.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 13/15] iio: adc: stm32-adc: convert to device
 properties
Message-ID: <20220806195327.14626e0d@jic23-huawei>
In-Reply-To: <20220806191538.7019ecfe@jic23-huawei>
References: <20220715122903.332535-1-nuno.sa@analog.com>
	<20220715122903.332535-14-nuno.sa@analog.com>
	<20220806191538.7019ecfe@jic23-huawei>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_114320_108170_71299E17 
X-CRM114-Status: GOOD (  21.77  )
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

On Sat, 6 Aug 2022 19:15:38 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 15 Jul 2022 14:29:01 +0200
> Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>=20
> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted =
to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> =20
> One query below. Otherwise LGTM (not that's true of the other patches I h=
aven't
> comment on at all)
>=20
> > @@ -1885,8 +1887,12 @@ static int stm32_adc_get_legacy_chan_count(struc=
t iio_dev *indio_dev, struct stm
> >  		num_channels +=3D ret;
> >  	}
> > =20
> > -	ret =3D of_property_count_elems_of_size(node, "st,adc-diff-channels",
> > -					      sizeof(struct stm32_adc_diff_channel));
> > +	/*
> > +	 * each st,adc-diff-channels is a group of 2 u32 so we divide @ret
> > +	 * to get the *real* number of channels.
> > +	 */
> > +	ret =3D device_property_count_u32(dev, "st,adc-diff-channels"); =20
>=20
> I think this can return an error code which should probably be handled.
> More than possible that was true of original code though...
>=20
> If it can't return an error for some reason I'm missing perhaps a
> comment to explain why.

Given this was only outstanding question I stuck a conservative

if (ret < 0)
	return ret;
here whilst applying.

>=20
> > +	ret /=3D (int)(sizeof(struct stm32_adc_diff_channel) / sizeof(u32));
> >  	if (ret > adc_info->max_channels) {
> >  		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
> >  		return -EINVAL; =20


