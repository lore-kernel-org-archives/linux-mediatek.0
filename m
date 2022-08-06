Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1672C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMdLUsHWNxwxxhEXbL76pBf5PTyOR2vRB1PwPl7NoX8=; b=fsWI78PwY7psgoJQEHjeP42ydv
	zNWRT9nCoePNUoUv4FDgItinTzEzI5KC4FyYdlb+cLJQlQCqylleLlHPPLetm+00Ooj4hCuwUbHHM
	SlgkaxWXqwVo7+nYYFLglgz+Bsb2KGx77/ch38b7CKmupqE86V/h6y/4lmwOkWyWYa/ZMTJeQ9dmW
	+SK0Ktq3o3olWxzOj1TlDE3R7z+jnIcH4t1e4AEvntyrWdk9uuJMxOStH3lUjM/f/ywPZ4XTZF+xn
	tvCJKkFAAlBlSXRiTUe0GPmanF0YMB3XRONxtQsgWqQ2ZZUGLi/qZppl7mWDGqpITBhBjG70jqKZP
	uZaTXKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOhv-00G21d-KY; Sat, 06 Aug 2022 18:39:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOhr-00G1wo-Lr; Sat, 06 Aug 2022 18:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF2C76115D;
	Sat,  6 Aug 2022 18:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898C9C433D6;
	Sat,  6 Aug 2022 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659811166;
	bh=1nxy2+EMukkR2gSWYRMBlAV6EjYfDMI0H3oB1FQKqrA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gRWZNgj60+7OibFgqj+1KPSlYeza9zTyo8nruOuXXGmGW9nIOaTKRx7LJgrdc7CuC
	 4V8DhTOBYnFKm7cWzWwJmKsbWBIdQBMmdJ6GV4QkcXnuiMztTspZ9Y/opP8SqIRilp
	 oyV9+f6Ro9z+pFQsyKFD5FV2dv5prL3CZEbcN9MZBpQDmeKowigZEq4bPA3208Uy4u
	 qXs9x6i1qXNk60c55e+73yFZNnbwApMOVRoBIkK/uPmw6mGUd7+S3NAuDR+UOKOTiu
	 cBnN24w7Voxfdzlo8GsE0dacm9/IQmb9UYdKNL/UxwX7WzxHocD8ySj/Y8lUnI9twD
	 nF8xnw8HDl+rg==
Date: Sat, 6 Aug 2022 19:49:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: <Claudiu.Beznea@microchip.com>
Cc: <nuno.sa@analog.com>, <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-iio@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-arm-msm@vger.kernel.org>,
 <gwendal@chromium.org>, <sravanhome@gmail.com>, <tmaimon77@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <lorenzo@kernel.org>, <festevam@gmail.com>, <shawnguo@kernel.org>,
 <olivier.moysan@foss.st.com>, <tali.perry1@gmail.com>,
 <thara.gopinath@linaro.org>, <bjorn.andersson@linaro.org>, <arnd@arndb.de>,
 <benjaminfair@google.com>, <Nicolas.Ferre@microchip.com>,
 <rafael@kernel.org>, <venture@google.com>, <kernel@pengutronix.de>,
 <fabrice.gasnier@foss.st.com>, <daniel.lezcano@linaro.org>,
 <bleung@chromium.org>, <yuenn@google.com>, <miquel.raynal@bootlin.com>,
 <alexandre.belloni@bootlin.com>, <rui.zhang@intel.com>,
 <linus.walleij@linaro.org>, <cbranchereau@gmail.com>,
 <cai.huoqing@linux.dev>, <avifishman70@gmail.com>,
 <Eugen.Hristev@microchip.com>, <matthias.bgg@gmail.com>,
 <s.hauer@pengutronix.de>, <lars@metafoo.de>, <andy.shevchenko@gmail.com>,
 <groeck@chromium.org>, <paul@crapouillou.net>, <agross@kernel.org>,
 <amitk@kernel.org>, <Michael.Hennerich@analog.com>, <haibo.chen@nxp.com>,
 <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 09/15] iio: adc: at91-sama5d2_adc: convert to device
 properties
Message-ID: <20220806194935.383bf393@jic23-huawei>
In-Reply-To: <ada4c2a2-e13d-77aa-f489-7cc0a063adbd@microchip.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
	<20220715122903.332535-10-nuno.sa@analog.com>
	<ada4c2a2-e13d-77aa-f489-7cc0a063adbd@microchip.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_113927_818272_280330A0 
X-CRM114-Status: GOOD (  25.26  )
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

On Mon, 18 Jul 2022 05:21:47 +0000
<Claudiu.Beznea@microchip.com> wrote:

> On 15.07.2022 15:28, Nuno S=C3=A1 wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted =
to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> =20
>=20
> Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>=20

Hi Nuno / Claudiu

Lots of fuzz on this one because of Claudiu's series that I took whilst thi=
s was under review
I haven't really checked the result of forcing it in but please take a look=
 at the
testing branch of iio.git for anything silly that happened.

Jonathan

>=20
> > ---
> >  drivers/iio/adc/at91-sama5d2_adc.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-=
sama5d2_adc.c
> > index fe3131c9593c..df716584c117 100644
> > --- a/drivers/iio/adc/at91-sama5d2_adc.c
> > +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> > @@ -16,8 +16,9 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > -#include <linux/of_device.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/sched.h>
> >  #include <linux/wait.h>
> >  #include <linux/iio/iio.h>
> > @@ -650,8 +651,8 @@ at91_adc_chan_get(struct iio_dev *indio_dev, int ch=
an)
> >         return indio_dev->channels + index;
> >  }
> >=20
> > -static inline int at91_adc_of_xlate(struct iio_dev *indio_dev,
> > -                                   const struct of_phandle_args *iiosp=
ec)
> > +static inline int at91_adc_fwnode_xlate(struct iio_dev *indio_dev,
> > +                                       const struct fwnode_reference_a=
rgs *iiospec)
> >  {
> >         return at91_adc_chan_xlate(indio_dev, iiospec->args[0]);
> >  }
> > @@ -1876,7 +1877,7 @@ static const struct iio_info at91_adc_info =3D {
> >         .read_raw =3D &at91_adc_read_raw,
> >         .write_raw =3D &at91_adc_write_raw,
> >         .update_scan_mode =3D &at91_adc_update_scan_mode,
> > -       .of_xlate =3D &at91_adc_of_xlate,
> > +       .fwnode_xlate =3D &at91_adc_fwnode_xlate,
> >         .hwfifo_set_watermark =3D &at91_adc_set_watermark,
> >  };
> >=20
> > @@ -1920,6 +1921,7 @@ static int at91_adc_buffer_and_trigger_init(struc=
t device *dev,
> >=20
> >  static int at91_adc_probe(struct platform_device *pdev)
> >  {
> > +       struct device *dev =3D &pdev->dev;
> >         struct iio_dev *indio_dev;
> >         struct at91_adc_state *st;
> >         struct resource *res;
> > @@ -1933,7 +1935,7 @@ static int at91_adc_probe(struct platform_device =
*pdev)
> >         st =3D iio_priv(indio_dev);
> >         st->indio_dev =3D indio_dev;
> >=20
> > -       st->soc_info.platform =3D of_device_get_match_data(&pdev->dev);
> > +       st->soc_info.platform =3D device_get_match_data(dev);
> >=20
> >         indio_dev->name =3D dev_name(&pdev->dev);
> >         indio_dev->modes =3D INDIO_DIRECT_MODE | INDIO_BUFFER_SOFTWARE;
> > @@ -1950,34 +1952,32 @@ static int at91_adc_probe(struct platform_devic=
e *pdev)
> >=20
> >         st->oversampling_ratio =3D AT91_OSR_1SAMPLES;
> >=20
> > -       ret =3D of_property_read_u32(pdev->dev.of_node,
> > -                                  "atmel,min-sample-rate-hz",
> > -                                  &st->soc_info.min_sample_rate);
> > +       ret =3D device_property_read_u32(dev, "atmel,min-sample-rate-hz=
",
> > +                                      &st->soc_info.min_sample_rate);
> >         if (ret) {
> >                 dev_err(&pdev->dev,
> >                         "invalid or missing value for atmel,min-sample-=
rate-hz\n");
> >                 return ret;
> >         }
> >=20
> > -       ret =3D of_property_read_u32(pdev->dev.of_node,
> > -                                  "atmel,max-sample-rate-hz",
> > -                                  &st->soc_info.max_sample_rate);
> > +       ret =3D device_property_read_u32(dev, "atmel,max-sample-rate-hz=
",
> > +                                      &st->soc_info.max_sample_rate);
> >         if (ret) {
> >                 dev_err(&pdev->dev,
> >                         "invalid or missing value for atmel,max-sample-=
rate-hz\n");
> >                 return ret;
> >         }
> >=20
> > -       ret =3D of_property_read_u32(pdev->dev.of_node, "atmel,startup-=
time-ms",
> > -                                  &st->soc_info.startup_time);
> > +       ret =3D device_property_read_u32(dev, "atmel,startup-time-ms",
> > +                                      &st->soc_info.startup_time);
> >         if (ret) {
> >                 dev_err(&pdev->dev,
> >                         "invalid or missing value for atmel,startup-tim=
e-ms\n");
> >                 return ret;
> >         }
> >=20
> > -       ret =3D of_property_read_u32(pdev->dev.of_node,
> > -                                  "atmel,trigger-edge-type", &edge_typ=
e);
> > +       ret =3D device_property_read_u32(dev, "atmel,trigger-edge-type",
> > +                                      &edge_type);
> >         if (ret) {
> >                 dev_dbg(&pdev->dev,
> >                         "atmel,trigger-edge-type not specified, only so=
ftware trigger available\n");
> > --
> > 2.37.1
> >  =20
>=20


