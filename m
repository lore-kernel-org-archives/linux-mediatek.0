Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B931CC3F6B0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r2WWZ33U/dlACEmy4S1L/uIkrMPWtHdZZZ6oQkJmLM=; b=CVTKNNYf/hQRI0oe7XN0Z8vyOG
	ZCiKkS2D9B7H6ZUFg6hBI3qpg0/q288JVaxuVi8xJjFWFIxAwuu3r+Ru2W0b7iF1jqD1j1oQYuRW6
	rXW53C5ZeARNadxPCEOggpqupoSS4L7jGK2l05HcOotr6fPNpvSlUprgEBmHVkRKXEH1vJkNDJpjj
	If/5R6QahbYWxgxbDYGxchdN+e07wIzy1+qqpflqH0LgUMJ7ITXusA4oDChG30aF2OgNxkwrglkG8
	z747SfLHVzu454f0s1vVDwl7QCRNJDnCyXHsz2Vxy07N1fhpMmv3zf8dUN12nIS72QKtPkinSbY0C
	3FKkV/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKO3o-00Fap5-Rq; Sat, 06 Aug 2022 17:58:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKO3k-00FalC-Ns; Sat, 06 Aug 2022 17:58:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A5C3611CD;
	Sat,  6 Aug 2022 17:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D7CC433C1;
	Sat,  6 Aug 2022 17:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659808678;
	bh=HVIoATH2rby9Ront6vj1rC1jBMtGPMaPZSaw91TJhtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JrXTs20sqJK4vyHSjv3HBS8soWagAa765JcDFbrSEvhF68Gxn9v9nEOPHiBraLNAl
	 D9jST510x+bMWGdz13Euijka/DfkyioTOMLVLdsGWmUaN15eIUvpTYSO/MTHtOa3n7
	 FvHvJ9GqQDpp7ZHVHtLFXZiuPoTLzOzLxDYwP0gdKzJH92mUkbbGAAd+aA9L6Ik/Un
	 83Mr9/Syx4oIJUPpY1Xben4a6jFQ1lyxWm06TYAEY3EJZ/o2h4YcXjlLCJ0+wzlKZ4
	 +tDNjbUCXLAXUnW8Jrt/A8L+T0/DrGBlHl9qVXZHIZlfbXn7Dj+XEy47HDwgZ2q1Uh
	 NzR5e6vaHceCg==
Date: Sat, 6 Aug 2022 19:08:07 +0100
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
Subject: Re: [PATCH v3 08/15] iio: adc: ab8500-gpadc: convert to device
 properties
Message-ID: <20220806190807.4f1d078c@jic23-huawei>
In-Reply-To: <20220806190337.5f3086c9@jic23-huawei>
References: <20220715122903.332535-1-nuno.sa@analog.com>
	<20220715122903.332535-9-nuno.sa@analog.com>
	<20220806190337.5f3086c9@jic23-huawei>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_105800_880324_4084C9C5 
X-CRM114-Status: GOOD (  29.76  )
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

On Sat, 6 Aug 2022 19:03:37 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 15 Jul 2022 14:28:56 +0200
> Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>=20
> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted =
to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> =20
> Nitpick, but ideally this would have been two patches.=20
> 1) Drop parameter to *_parse_channels()=20
> 2) the rest.
ignore that.  I forgot there isn't a device_of_for_each_child_node().
So it would have been more effort than it was worth.

>=20
> As that little corner was hardert o check than the rest :)

>=20
> meh.  It's trivial as I said, otherwise looks good to me.
>=20
> Jonathan
>=20
>=20
> > ---
> >  drivers/iio/adc/ab8500-gpadc.c | 27 ++++++++++++---------------
> >  1 file changed, 12 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gp=
adc.c
> > index 930ce96e6ff5..4fa2126a354b 100644
> > --- a/drivers/iio/adc/ab8500-gpadc.c
> > +++ b/drivers/iio/adc/ab8500-gpadc.c
> > @@ -925,8 +925,8 @@ static int ab8500_gpadc_read_raw(struct iio_dev *in=
dio_dev,
> >  	return -EINVAL;
> >  }
> > =20
> > -static int ab8500_gpadc_of_xlate(struct iio_dev *indio_dev,
> > -				 const struct of_phandle_args *iiospec)
> > +static int ab8500_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> > +				     const struct fwnode_reference_args *iiospec)
> >  {
> >  	int i;
> > =20
> > @@ -938,7 +938,7 @@ static int ab8500_gpadc_of_xlate(struct iio_dev *in=
dio_dev,
> >  }
> > =20
> >  static const struct iio_info ab8500_gpadc_info =3D {
> > -	.of_xlate =3D ab8500_gpadc_of_xlate,
> > +	.fwnode_xlate =3D ab8500_gpadc_fwnode_xlate,
> >  	.read_raw =3D ab8500_gpadc_read_raw,
> >  };
> > =20
> > @@ -968,7 +968,7 @@ static int ab8500_gpadc_runtime_resume(struct devic=
e *dev)
> >  /**
> >   * ab8500_gpadc_parse_channel() - process devicetree channel configura=
tion
> >   * @dev: pointer to containing device
> > - * @np: device tree node for the channel to configure
> > + * @fwnode: fw node for the channel to configure
> >   * @ch: channel info to fill in
> >   * @iio_chan: IIO channel specification to fill in
> >   *
> > @@ -976,15 +976,15 @@ static int ab8500_gpadc_runtime_resume(struct dev=
ice *dev)
> >   * and define usage for things like AUX GPADC inputs more precisely.
> >   */
> >  static int ab8500_gpadc_parse_channel(struct device *dev,
> > -				      struct device_node *np,
> > +				      struct fwnode_handle *fwnode,
> >  				      struct ab8500_gpadc_chan_info *ch,
> >  				      struct iio_chan_spec *iio_chan)
> >  {
> > -	const char *name =3D np->name;
> > +	const char *name =3D fwnode_get_name(fwnode);
> >  	u32 chan;
> >  	int ret;
> > =20
> > -	ret =3D of_property_read_u32(np, "reg", &chan);
> > +	ret =3D fwnode_property_read_u32(fwnode, "reg", &chan);
> >  	if (ret) {
> >  		dev_err(dev, "invalid channel number %s\n", name);
> >  		return ret;
> > @@ -1021,22 +1021,20 @@ static int ab8500_gpadc_parse_channel(struct de=
vice *dev,
> >  /**
> >   * ab8500_gpadc_parse_channels() - Parse the GPADC channels from DT
> >   * @gpadc: the GPADC to configure the channels for
> > - * @np: device tree node containing the channel configurations
> >   * @chans: the IIO channels we parsed
> >   * @nchans: the number of IIO channels we parsed
> >   */
> >  static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
> > -				       struct device_node *np,
> >  				       struct iio_chan_spec **chans_parsed,
> >  				       unsigned int *nchans_parsed)
> >  {
> > -	struct device_node *child;
> > +	struct fwnode_handle *child;
> >  	struct ab8500_gpadc_chan_info *ch;
> >  	struct iio_chan_spec *iio_chans;
> >  	unsigned int nchans;
> >  	int i;
> > =20
> > -	nchans =3D of_get_available_child_count(np);
> > +	nchans =3D device_get_child_node_count(gpadc->dev);
> >  	if (!nchans) {
> >  		dev_err(gpadc->dev, "no channel children\n");
> >  		return -ENODEV;
> > @@ -1054,7 +1052,7 @@ static int ab8500_gpadc_parse_channels(struct ab8=
500_gpadc *gpadc,
> >  		return -ENOMEM;
> > =20
> >  	i =3D 0;
> > -	for_each_available_child_of_node(np, child) {
> > +	device_for_each_child_node(gpadc->dev, child) {
> >  		struct iio_chan_spec *iio_chan;
> >  		int ret;
> > =20
> > @@ -1064,7 +1062,7 @@ static int ab8500_gpadc_parse_channels(struct ab8=
500_gpadc *gpadc,
> >  		ret =3D ab8500_gpadc_parse_channel(gpadc->dev, child, ch,
> >  						 iio_chan);
> >  		if (ret) {
> > -			of_node_put(child);
> > +			fwnode_handle_put(child);
> >  			return ret;
> >  		}
> >  		i++;
> > @@ -1081,7 +1079,6 @@ static int ab8500_gpadc_probe(struct platform_dev=
ice *pdev)
> >  	struct ab8500_gpadc *gpadc;
> >  	struct iio_dev *indio_dev;
> >  	struct device *dev =3D &pdev->dev;
> > -	struct device_node *np =3D pdev->dev.of_node;
> >  	struct iio_chan_spec *iio_chans;
> >  	unsigned int n_iio_chans;
> >  	int ret;
> > @@ -1096,7 +1093,7 @@ static int ab8500_gpadc_probe(struct platform_dev=
ice *pdev)
> >  	gpadc->dev =3D dev;
> >  	gpadc->ab8500 =3D dev_get_drvdata(dev->parent);
> > =20
> > -	ret =3D ab8500_gpadc_parse_channels(gpadc, np, &iio_chans, &n_iio_cha=
ns);
> > +	ret =3D ab8500_gpadc_parse_channels(gpadc, &iio_chans, &n_iio_chans);
> >  	if (ret)
> >  		return ret;
> >   =20
>=20


