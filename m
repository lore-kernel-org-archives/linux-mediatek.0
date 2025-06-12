Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4EC61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq3Oh7MkG0Ecu2ZMpO6AlQlRHoiNU+CrpvlZyRxRlNc=; b=fpX2micbJm8tEw5e5YDZAxKlAf
	iNydPXjzwha4C7s+mDPOr0UoCYdcIah1ljQYlGNTsSI7htJTl3uQYmQEBTrv49NzG4sfXW0NRdDuY
	REt+hUag+x53KkTMJlXAJPAT1Vn2hM0C4u6YPIhgTXM4GWZQxBhVnaU0eRgQQ4YkYnYZ7CdMACsmb
	JUx2qgh4f96CgUFO9kbTLUerFJpr0MtTPQKBlBecVox728hinlKrwavR9mmV0YOvCiIrA1p2Xzqji
	csblERu0xuRNV/fbHF4Uvrv09x+oCRfqzytcGdGjLpnTFTCV6cD5QlutRqDoptMhUXETPCq8ckxpE
	HRUKAJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpj-0000000DMmh-0DRI;
	Thu, 12 Jun 2025 13:19:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfRn-0000000D2Wo-0N7A;
	Thu, 12 Jun 2025 10:46:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHzbl64zPz6L54g;
	Thu, 12 Jun 2025 18:41:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B8241402A5;
	Thu, 12 Jun 2025 18:46:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 12 Jun
 2025 12:45:59 +0200
Date: Thu, 12 Jun 2025 11:45:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Pavel Machek <pavel@ucw.cz>
CC: David Lechner <dlechner@baylibre.com>, Michael Hennerich
	<michael.hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>, Nuno =?UTF-8?Q?S=C3=A1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
	<alexandre.torgue@foss.st.com>, Francesco Dolcini <francesco@dolcini.it>,
	=?UTF-8?Q?Jo=C3=A3o?= Paulo =?UTF-8?Q?Gon=C3=A7al?= =?UTF-8?Q?ves?=
	<jpaulo.silvagoncalves@gmail.com>, Leonard =?UTF-8?Q?G?=
 =?UTF-8?Q?=C3=B6hrs?= <l.goehrs@pengutronix.de>, <kernel@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jacopo Mondi
	<jacopo@jmondi.org>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mudit Sharma <muditsharma.info@gmail.com>, Javier Carrasco
	<javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej?= Jirman
	<megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
	<petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Message-ID: <20250612114557.00007628@huawei.com>
In-Reply-To: <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
	<aEqbQPvz0FsLXt0Z@duo.ucw.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_034615_424532_F7796171 
X-CRM114-Status: GOOD (  23.06  )
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

On Thu, 12 Jun 2025 11:17:52 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Jonathan mentioned recently that he would like to get away from using
> > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > have it on good authority that initializing a struct or array with = { }
> > is the preferred way to do this in the kernel [1]. So here is a series
> > to take care of that.  
> 
> 1) Is it worth the churn?
> 
> 2) Will this fail to initialize padding with some obscure compiler?
> 
> 3) Why do you believe that {} is the preffered way? All we have is
> Kees' email that explains that = {} maybe works in configs he tested.
> 
Pavel,

I think main thing that matters in Kees email is there is a self test
that should fire if a compiler ever does this wrong.

Using this syntax is definitely not a 'kernel wide' preference yet
but I do prefer to make some changes like this in IIO just because it
reduces the amount of code that smells different when reviewing.
Given how many drivers we now have, sadly people pick different ones
to cut and paste from so we get a lot of new drivers that look like
how we preferred to do things 10 years ago :(

However it is a fair bit of churn. hmm.  Let's let this sit for
a little while and see if other view points come in.

Thanks 

Jonathan
 

> BR,
> 								Pavel
> 
> > [1]:
> > https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/  
> 
> 
> 
> > ---
> > David Lechner (28):
> >       iio: accel: adxl372: use = { } instead of memset()
> >       iio: accel: msa311: use = { } instead of memset()
> >       iio: adc: dln2-adc: use = { } instead of memset()
> >       iio: adc: mt6360-adc: use = { } instead of memset()
> >       iio: adc: rockchip_saradc: use = { } instead of memset()
> >       iio: adc: rtq6056: use = { } instead of memset()
> >       iio: adc: stm32-adc: use = { } instead of memset()
> >       iio: adc: ti-ads1015: use = { } instead of memset()
> >       iio: adc: ti-ads1119: use = { } instead of memset()
> >       iio: adc: ti-lmp92064: use = { } instead of memset()
> >       iio: adc: ti-tsc2046: use = { } instead of memset()
> >       iio: chemical: scd4x: use = { } instead of memset()
> >       iio: chemical: scd30: use = { } instead of memset()
> >       iio: chemical: sunrise_co2: use = { } instead of memset()
> >       iio: dac: ad3552r: use = { } instead of memset()
> >       iio: imu: inv_icm42600: use = { } instead of memset()
> >       iio: imu: inv_mpu6050: use = { } instead of memset()
> >       iio: light: bh1745: use = { } instead of memset()
> >       iio: light: ltr501: use = { } instead of memset()
> >       iio: light: opt4060: use = { } instead of memset()
> >       iio: light: veml6030: use = { } instead of memset()
> >       iio: magnetometer: af8133j: use = { } instead of memset()
> >       iio: pressure: bmp280: use = { } instead of memset()
> >       iio: pressure: mpl3115: use = { } instead of memset()
> >       iio: pressure: mprls0025pa: use = { } instead of memset()
> >       iio: pressure: zpa2326: use = { } instead of memset()
> >       iio: proximity: irsd200: use = { } instead of memset()
> >       iio: temperature: tmp006: use = { } instead of memset()
> > 
> >  drivers/iio/accel/adxl372.c                       | 3 +--
> >  drivers/iio/accel/msa311.c                        | 4 +---
> >  drivers/iio/adc/dln2-adc.c                        | 4 +---
> >  drivers/iio/adc/mt6360-adc.c                      | 3 +--
> >  drivers/iio/adc/rockchip_saradc.c                 | 4 +---
> >  drivers/iio/adc/rtq6056.c                         | 4 +---
> >  drivers/iio/adc/stm32-adc.c                       | 3 +--
> >  drivers/iio/adc/ti-ads1015.c                      | 4 +---
> >  drivers/iio/adc/ti-ads1119.c                      | 4 +---
> >  drivers/iio/adc/ti-lmp92064.c                     | 4 +---
> >  drivers/iio/adc/ti-tsc2046.c                      | 3 +--
> >  drivers/iio/chemical/scd30_core.c                 | 3 +--
> >  drivers/iio/chemical/scd4x.c                      | 3 +--
> >  drivers/iio/chemical/sunrise_co2.c                | 6 ++----
> >  drivers/iio/dac/ad3552r.c                         | 3 +--
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
> >  drivers/iio/light/bh1745.c                        | 4 +---
> >  drivers/iio/light/ltr501.c                        | 4 +---
> >  drivers/iio/light/opt4060.c                       | 4 +---
> >  drivers/iio/light/veml6030.c                      | 4 +---
> >  drivers/iio/magnetometer/af8133j.c                | 4 +---
> >  drivers/iio/pressure/bmp280-core.c                | 5 +----
> >  drivers/iio/pressure/mpl3115.c                    | 3 +--
> >  drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
> >  drivers/iio/pressure/zpa2326.c                    | 4 +---
> >  drivers/iio/proximity/irsd200.c                   | 3 +--
> >  drivers/iio/temperature/tmp006.c                  | 4 +---
> >  30 files changed, 34 insertions(+), 85 deletions(-)
> > ---
> > base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
> > change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
> > 
> > Best regards,  
> 


