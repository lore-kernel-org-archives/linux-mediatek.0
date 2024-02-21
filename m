Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35495C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3Daaw0Dcf2nABbvAMRYqMKPzsgnTCV1QI7V7j1/eIM=; b=2B0uEJ5BYwYKXrQ62xWUdG8MRx
	k2O1aFQONQFkcTpr6XqRMBmAzx3t+Zx/5dLucX4weOK6JSHFr9PD41ElWRZk7ZMBtY0nDtdKCoJPg
	jnwwWs8CSwTN+pZ4a63EU+9XrTlXVU+TEzqtGvSwYCuC555xbfaCtg0m7lpcfOsWbqiZQEXl83pGs
	K2vPYthxfwiX4v9NDMrG0jECCaFKrfKOJAoDdod/yJsWEJbk2bezx/0493JOkF9skV7jDRAheV9Zv
	WmhIAl4iLzEdUkSgbjdn4lJWJjUp2QDeR32VsMxmgFQ4jrW7x3Jj9cR5mCBe6/XBKFCzFtUA2APAs
	fOPb5eNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchGg-0000000HXb3-0JPz;
	Wed, 21 Feb 2024 07:43:50 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchGd-0000000HXa6-2biZ;
	Wed, 21 Feb 2024 07:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708501427; x=1740037427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ltTht77zSLOZYTaO34bNZ2vXR72J5XsBwuQr3EcrxMc=;
  b=Gt5ju+u8liKz5b13vkYTpCclU4U0AVylzOxri0msSwCaNQf9jRpqFYWt
   zaGD2VvODIXgvC7y783QOi4cCp0zjaHy8ULO/Z5JVhcrgbV3eLU7Nkj5v
   /chY4cenWtu29ApfrpB+tufuokGNuNjt0b8ptAFLw44Lc2Q8MOLehY318
   qmNPiRqH7QnKI9iJuVVX7+7WitinqozVjN77CAHLMJn/SJyVeLm3b05KC
   RyF/tt9t2TaXTNToDD9lyVTBWhAKXc/wt3BEE94nrBcUzktHryREOg2lj
   3lumC3jSzMpW9aw07YG0SiE5NbvWao55/rh3F+ab/cGJV0ZprwPFlbAMs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13267314"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="13267314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 23:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827300778"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="827300778"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 23:43:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6E6511F855;
	Wed, 21 Feb 2024 09:43:31 +0200 (EET)
Date: Wed, 21 Feb 2024 07:43:31 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <ZdWpow0JIM18Hc4u@kekkonen.localdomain>
References: <20240204061538.2105-1-zhi.mao@mediatek.com>
 <20240204061538.2105-3-zhi.mao@mediatek.com>
 <20240206184542.GE2827@pendragon.ideasonboard.com>
 <598f62bbb55157eec1e23dd1dbc307fea3851b21.camel@mediatek.com>
 <20240220030104.GF20376@pendragon.ideasonboard.com>
 <115698c0c549e747026cc8841a3bd571533f8e6f.camel@mediatek.com>
 <ZdRUB92gkbRGPyr_@kekkonen.localdomain>
 <063fa9763efb1570295cfef385829714dd5e42cf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <063fa9763efb1570295cfef385829714dd5e42cf.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_234347_690867_0C35C98E 
X-CRM114-Status: GOOD (  52.35  )
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

On Wed, Feb 21, 2024 at 02:37:27AM +0000, Zhi Mao (毛智) wrote:
> Hi Laurent & sakari,
> 
> Thanks for your feedback.
> 
> On Tue, 2024-02-20 at 07:25 +0000, sakari.ailus@linux.intel.com wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi Zhi,
> > 
> > On Tue, Feb 20, 2024 at 05:45:54AM +0000, Zhi Mao (毛智) wrote:
> > > Hi Laurent,
> > > 
> > > Thanks for you reply.
> > > I'd like to ask for advice about how to contrl "reset-pin", please
> > > check the below comments.
> > > 
> > > On Tue, 2024-02-20 at 05:01 +0200, Laurent Pinchart wrote:
> > > >   
> > > > External email : Please do not click links or open attachments
> > until
> > > > you have verified the sender or the content.
> > > >  Hi Zhi,
> > > > 
> > > > On Tue, Feb 20, 2024 at 02:12:26AM +0000, Zhi Mao (毛智) wrote:
> > > > > On Tue, 2024-02-06 at 20:45 +0200, Laurent Pinchart wrote:
> > > > > > On Sun, Feb 04, 2024 at 02:15:38PM +0800, Zhi Mao wrote:
> > > > > > > Add a V4L2 sub-device driver for Galaxycore GC08A3 image
> > > > sensor.
> > > > > > >
> > > > > > > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/Kconfig  |   10 +
> > > > > > >  drivers/media/i2c/Makefile |    1 +
> > > > > > >  drivers/media/i2c/gc08a3.c | 1448
> > > > ++++++++++++++++++++++++++++++++++++
> > > > > > >  3 files changed, 1459 insertions(+)
> > > > > > >  create mode 100644 drivers/media/i2c/gc08a3.c
> > > > 
> > > > [snip]
> > > > 
> > > > > > > diff --git a/drivers/media/i2c/gc08a3.c
> > > > b/drivers/media/i2c/gc08a3.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..3fc7fffb815c
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/media/i2c/gc08a3.c
> > > > > > > @@ -0,0 +1,1448 @@
> > > > 
> > > > [snip]
> > > > 
> > > > > > > +static int gc08a3_power_on(struct device *dev)
> > > > > > > +{
> > > > > > > +struct i2c_client *client = to_i2c_client(dev);
> > > > > > > +struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > > +struct gc08a3 *gc08a3 = to_gc08a3(sd);
> > > > > > > +int ret;
> > > > > > > +
> > > > > > > +ret =
> > regulator_bulk_enable(ARRAY_SIZE(gc08a3_supply_name),
> > > > > > > +    gc08a3->supplies);
> > > > > > > +if (ret < 0) {
> > > > > > > +dev_err(gc08a3->dev, "failed to enable regulators: %d\n",
> > > > ret);
> > > > > > > +return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > > +ret = clk_prepare_enable(gc08a3->xclk);
> > > > > > > +if (ret < 0) {
> > > > > > > +regulator_bulk_disable(ARRAY_SIZE(gc08a3_supply_name),
> > > > > > > +       gc08a3->supplies);
> > > > > > > +dev_err(gc08a3->dev, "clk prepare enable failed\n");
> > > > > > > +return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > > +usleep_range(GC08A3_MIN_SLEEP_US, GC08A3_MAX_SLEEP_US);
> > > > > > > +
> > > > > > > +gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);
> > > > > >
> > > > > > Are you asserting reset when powering on ? That sounds wrong,
> > you
> > > > should
> > > > > > de-assert reset here (and acquire the reset gpio in probe()
> > with
> > > > > > GPIOD_OUT_HIGH). Drivers should use logical levels for GPIOs,
> > > > setting a
> > > > > > GPIO named "reset" to 1 should assert the reset signal, even
> > if
> > > > the
> > > > > > physical signal is active low. You may have the wrong
> > polarity in
> > > > the
> > > > > > device tree.
> > > > >
> > > > > According to the sensor power sequence sepc, "reset" pin should
> > be
> > > > pull
> > > > > from low to high after "dovdd/dvdd/avdd" power on, so I follow
> > this
> > > > > power sequece to pull "reset" pin high in software flow.
> > > > 
> > > > From a hardware point of view that's right, but the Linux kernel
> > > > handles
> > > > logical level of GPIOs. If a GPIO is named "reset", it is
> > expected
> > > > that
> > > > calling
> > > > 
> > > > gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);
> > > > 
> > > > will "assert" the reset signal, setting it to a logical "reset =
> > > > true"
> > > > level. This maps to the hardware 0V output level, as the signal
> > is
> > > > active-low. To achieve this, define the reset GPIO as active low
> > in
> > > > DT,
> > > > and the GPIO framework will invert the signal for you. You should
> > > > then
> > > > call
> > > > 
> > > > gpiod_set_value_cansleep(gc08a3->reset_gpio, 1);
> > > > 
> > > > in the driver when you want to assert reset (set it to 0V), and
> > > > 
> > > > gpiod_set_value_cansleep(gc08a3->reset_gpio, 0);
> > > > 
> > > > when you want to deassert it (set it to 3.3V, or whatever the I/O
> > > > voltage for the signal is).
> > > > 
> > > > This way all driver use logical states, and the inversion is
> > handled
> > > > in
> > > > DT.
> > > > 
> > > 
> > > Sensor power sequence as below:
> > >                       ------------------
> > >                      | | |
> > >                      | | | 
> > > dvdd/avdd/dovdd  --------
> > >                                ---------
> > >                               |
> > >                               |
> > > reset-pin        -------------
> > > 
> > > In order to match this power sequece, "reset-pin" contrl flow is
> > below:
> > > 1. config the "reset-pin" is "active-high" in DTS:
> > >     reset-gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
> > > 
> > > 2. image sensor driver probe function:
> > > gc08a3->reset_gpio = devm_gpiod_get(dev, "reset",
> > > GPIOD_OUT_LOW);  //init "reset-pin" is low
> > > 
> > > 3. image sensor driver power_on function:
> > > gpiod_set_value_cansleep(gc08a3->reset_gpio, 1); //pull "reset-pin"
> > > high 
> > > 
> > > so, the expect state of "reset-pin" is from low to high.
> > > If I am wrong, please correct me.
> > 
> > 
> > From Documentation/driver-api/gpio/consumer.rst:
> > 
> > As a consumer should not have to care about the physical line
> > level, all of the gpiod_set_value_xxx() or
> > gpiod_set_array_value_xxx() functions operate with the *logical*
> > value. With this they take the active low property into account.
> > This means that they check whether the GPIO is configured to be
> > active low, and if so, they manipulate the passed value before the
> > physical line level is driven.
> > 
> > I.e. when you want to enable reset, you set the value to 1 in the
> > driver. I
> > think you're now setting the value to 0 in that case. The opposite
> > for
> > disabling it of course.
> > 
> After checking "Documentation/driver-api/gpio/consumer.rst":
> To summarize::
>   Function (example)                 line property          physical
> line
> ...
>   gpiod_set_value(desc, 1);          default (active high)  high
>   gpiod_set_value(desc, 0);          active low             high
> ...
> 
> 
> From my understanding, it seems that "reset-pin" is using the
> following(active_high) case in current code: 
> "gpiod_set_value(desc, 1);          default (active high)  high" 
> 
> Do you mean, we should use the "active_low" case:
> "gpiod_set_value(desc, 0);          active low             high"
> Code should be changed as below:
> 1. config the "reset-pin" is "active-low" in DTS:
>    - reset-gpios = <&pio 19 GPIO_ACTIVE_LOW>
> 2. image sensor driver power_on function:
>    - gpiod_set_value_cansleep(gc08a3->reset_gpio, 0); //pull high 
> Is that so?

Correct.

-- 
Regards,

Sakari Ailus

