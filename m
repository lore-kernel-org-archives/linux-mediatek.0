Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21949C48BC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 03:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NomEafUi0BlvmPAqcRxhFPb6lSDC4VXd0EWUHxd6tFk=; b=wen4CkDL5abHgZHRrbP5Q1ySG+
	kyGqTl0yvK3hRT2ZVF5hV8AYw60PVgLhsPVSAeV+hDDMxLqoKlCPhvX0y3zmzGyF3Ec2o/Ep1NRsZ
	rUi6TTvjhCSrHIhNejpFaWwPFHOpi7auyTrxEwrbsgGQ28s0Z6vf4a3hrSReJia/BVEGtMMwRxy0r
	XRuVguvE1wK4NUglfVGDIbbrEObjms88OA4cuFJzHeprypsuMiFaAz2w+S5o7Xa8MnAmzp7iVNGhz
	uJw5+XrLznNXDpaUN0HlX5rxVEFrzxY3EpNZ9pu4wnHghw4uYjUr6XI7vqhUFAgkfdbF9VIVhb2M4
	4Efg2dDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGNZ-0000000CvUx-4427;
	Tue, 20 Feb 2024 03:01:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGNW-0000000CvRr-1FQr;
	Tue, 20 Feb 2024 03:01:07 +0000
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EBD8899;
	Tue, 20 Feb 2024 04:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708398053;
	bh=fi2kbSyA3ZrfR3cC3WHLondtm0nGs7rJi1ZFqm0U/vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHXdhSVJxQZjDv+YBnDEYoRoVutXWunp+mModsjWczVP65wmvKlAR8aTm4elJJbMF
	 k3SG61DqOjVt48p8aQ9GfHoOMCsJMuvporwwtxk195PMwDfpHBFzg9vGIrVJ2sp1Y8
	 kYNDbfewAb1oofhURcdvbnjzbzj8MzPVBDJIzJeo=
Date: Tue, 20 Feb 2024 05:01:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <20240220030104.GF20376@pendragon.ideasonboard.com>
References: <20240204061538.2105-1-zhi.mao@mediatek.com>
 <20240204061538.2105-3-zhi.mao@mediatek.com>
 <20240206184542.GE2827@pendragon.ideasonboard.com>
 <598f62bbb55157eec1e23dd1dbc307fea3851b21.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <598f62bbb55157eec1e23dd1dbc307fea3851b21.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_190106_529800_1FA5B01B 
X-CRM114-Status: GOOD (  28.17  )
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

Hi Zhi,

On Tue, Feb 20, 2024 at 02:12:26AM +0000, Zhi Mao (毛智) wrote:
> On Tue, 2024-02-06 at 20:45 +0200, Laurent Pinchart wrote:
> > On Sun, Feb 04, 2024 at 02:15:38PM +0800, Zhi Mao wrote:
> > > Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.
> > >
> > > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > > ---
> > >  drivers/media/i2c/Kconfig  |   10 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/gc08a3.c | 1448 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 1459 insertions(+)
> > >  create mode 100644 drivers/media/i2c/gc08a3.c

[snip]

> > > diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
> > > new file mode 100644
> > > index 000000000000..3fc7fffb815c
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/gc08a3.c
> > > @@ -0,0 +1,1448 @@

[snip]

> > > +static int gc08a3_power_on(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct gc08a3 *gc08a3 = to_gc08a3(sd);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(ARRAY_SIZE(gc08a3_supply_name),
> > > +				    gc08a3->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(gc08a3->dev, "failed to enable regulators: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(gc08a3->xclk);
> > > +	if (ret < 0) {
> > > +		regulator_bulk_disable(ARRAY_SIZE(gc08a3_supply_name),
> > > +				       gc08a3->supplies);
> > > +		dev_err(gc08a3->dev, "clk prepare enable failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	usleep_range(GC08A3_MIN_SLEEP_US, GC08A3_MAX_SLEEP_US);
> > > +
> > > +	gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);
> >
> > Are you asserting reset when powering on ? That sounds wrong, you should
> > de-assert reset here (and acquire the reset gpio in probe() with
> > GPIOD_OUT_HIGH). Drivers should use logical levels for GPIOs, setting a
> > GPIO named "reset" to 1 should assert the reset signal, even if the
> > physical signal is active low. You may have the wrong polarity in the
> > device tree.
>
> According to the sensor power sequence sepc, "reset" pin should be pull
> from low to high after "dovdd/dvdd/avdd" power on, so I follow this
> power sequece to pull "reset" pin high in software flow.

From a hardware point of view that's right, but the Linux kernel handles
logical level of GPIOs. If a GPIO is named "reset", it is expected that
calling

	gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);

will "assert" the reset signal, setting it to a logical "reset = true"
level. This maps to the hardware 0V output level, as the signal is
active-low. To achieve this, define the reset GPIO as active low in DT,
and the GPIO framework will invert the signal for you. You should then
call

	gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);

in the driver when you want to assert reset (set it to 0V), and

	gpiod_set_value_cansleep(gc08a3->reset_gpio, 0);

when you want to deassert it (set it to 3.3V, or whatever the I/O
voltage for the signal is).

This way all driver use logical states, and the inversion is handled in
DT.

> > > +	usleep_range(GC08A3_MIN_SLEEP_US, GC08A3_MAX_SLEEP_US);
> > > +
> > > +	return 0;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart

