Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CEC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX96/K1n3jEQE3Y4WuIp22M0SCOeLx709fnhV2EyKp0=; b=XaVs54zuPhzKHDjZZVDmGICP46
	FZL9D1y2h06X0mQpJoVNKTy4V+i0rs4HSOhBCm26a9hR7sougeHSHkKAKSbtC8f1LF56LDY0dZSWv
	BwEMDXATKKKDqjE3rr6bTFWG6vzN7Do0NMWmGCyRKfGAAi6iLDTzIgOBxSijsQipAU2yYiBH9AvtE
	v/5bhqvGZeKUO8i5kfcQyQI0EsxFx8d041gVDIByz4hOK8uXPmYP5F0+objL3y0XMkMUOyTxd2hKk
	6UJaULOmLsBVvMPzyA0tE0cZzS4DPZAIAORULn0TrKnhjRJJBTQR21qYSzqs/CmuIVMq9eWlz9oVB
	dWemuHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuO4-005M2P-Q0; Wed, 08 Mar 2023 14:03:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuNo-005LsR-6Y; Wed, 08 Mar 2023 14:03:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 448B3B81CB0;
	Wed,  8 Mar 2023 14:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA44C4339B;
	Wed,  8 Mar 2023 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678284179;
	bh=3hWMzSBp2LshUH8WZVkMXZ1L/iWYq6eMTZ5lUjo/grs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdmFLfC6hlLq+1GYsbbKXcBliS1OW9OAzBOk9ohJbLILNteUJU9Noq9z+dJYlK4UZ
	 r3qRccMzo2ZcVxH+O/cxYIaT+oI0zQWNxOqS+nY7fzTTvAB/8N4y5ipYDRKTkPduvn
	 zJkMTpdZ/Ayyy7qS0YlUmFWwABIfzJLsdrsp/fGVODd/NDxI82919GmTb76tvSqQlQ
	 jWUs1tHEL4XM88rEqQpZKbh/v07sqOulZ+6Fbm1kK6PQqCJn1n9zsS2DAgNtZmrr8b
	 sMSwz8qDuzVIIqMEULZqIjJTr10b7eRgNQy7WiO5Pe5hzk+xAHBCfpKJukiPFjJ9AC
	 yehCwZeRtErTw==
Date: Wed, 8 Mar 2023 14:02:52 +0000
From: Lee Jones <lee@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>, corbet@lwn.net, pavel@ucw.cz,
	matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
	jacek.anaszewski@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-doc@vger.kernel.org, peterwu.pub@gmail.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v17 RESEND 1/3] leds: rgb: mt6370: Add MediaTek MT6370
 current sink type LED Indicator support
Message-ID: <20230308140252.GM9667@google.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <8f139c773de274311c8ca63a47d6b207c30913e2.1677150607.git.chiaen_wu@richtek.com>
 <20230305085533.GC2574592@google.com>
 <20230307022302.GA4930@linuxcarl2.richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307022302.GA4930@linuxcarl2.richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_060308_572297_822BD185 
X-CRM114-Status: GOOD (  36.60  )
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

On Tue, 07 Mar 2023, ChiYuan Huang wrote:

> Hi, Lee:
>
> Thanks's for the reviewing.
> To prevent the misunderstanding, reply as below.
> No reply means will do.
>
> On Sun, Mar 05, 2023 at 08:55:33AM +0000, Lee Jones wrote:
> > On Thu, 23 Feb 2023, ChiaEn Wu wrote:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > > which includes a single cell Li-Ion/Li-Polymer switching battery
> > > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > > a display bias driver and a general LDO for portable devices.
> > >
> > > Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> > > driver. It can control four channels current-sink RGB LEDs with 3 modes:
> > > constant current, PWM, and breath mode.
> > >
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Co-developed-by: Alice Chen <alice_chen@richtek.com>
> > > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > ---
> > > v17
> > > - Update the year of Copyright from 2022 to 2023
> > >
> > > ---
> > >  drivers/leds/rgb/Kconfig           |   13 +
> > >  drivers/leds/rgb/Makefile          |    1 +
> > >  drivers/leds/rgb/leds-mt6370-rgb.c | 1009 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 1023 insertions(+)
> > >  create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c

[...]

> > > +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> > > +				     struct led_pattern *pattern, u32 len,
> > > +				     u8 *pattern_val, u32 val_len)
> > > +{
> > > +	enum mt6370_led_ranges sel_range;
> > > +	struct led_pattern *curr;
> > > +	unsigned int sel;
> > > +	u32 val = 0;
> > > +	int i;
> > > +
> > > +	if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * Pattern list
> > > +	 * tr1:	 byte 0, b'[7: 4]
> >
> > Perhaps this is standard formatting and I'm just not aware of it, but
> > the space is throwing me and making me think twice.  Does this mean bits
> > 7 through 4, so b'11110000?
> >
> Yes. like as you said. Sorry for the redudant space make you confused.
> I'm not sure whether it's a standard formating or not.
> Sometimes, in datasheet, we'll use this format to represent the bitfield for functions.
> Your format is also good for it.
> And which one is preferable?

Since neither of us are sure, just take the space out for now please.

> > > +	 * tr2:	 byte 0, b'[3: 0]
> > > +	 * tf1:	 byte 1, b'[7: 4]
> > > +	 * tf2:	 byte 1, b'[3: 0]
> > > +	 * ton:	 byte 2, b'[7: 4]
> > > +	 * toff: byte 2, b'[3: 0]
> > > +	 */
> > > +	for (i = 0; i < P_MAX_PATTERNS; i++) {
> > > +		curr = pattern + i;
> > > +
> > > +		sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> > > +
> > > +		linear_range_get_selector_within(priv->ranges + sel_range,
> > > +						 curr->delta_t, &sel);
> > > +
> > > +		if (i % 2) {
> > > +			val |= sel;
> > > +		} else {
> > > +			val <<= 8;
> > > +			val |= sel << 4;
> > > +		}
> > > +	}

[...]

> > > +static int mt6370_led_register(struct device *dev, struct mt6370_led *led,
> > > +			       struct led_init_data *init_data)
> > > +{
> > > +	struct mt6370_priv *priv = led->priv;
> > > +	int ret;
> > > +
> > > +	if (led->index == MT6370_VIRTUAL_MULTICOLOR) {
> >
> > This too could be split into separate functions to tidy things up a
> > little.
> >
> Like as below?
>
> if (led->index == MT6370_VIRTUAL_MULTICOLOR)
>    return mt6370_multicolor_led_register(....)
>
> if (led->index == MT6370_LED_ISNK4) {
>     .....
> }
>
> ret = mt6370_init_isnk_default_state(...)

Yes, that kind of thing.

> Since the multilor case directly return from the sub-function, else can be removed.

> > > +		ret = mt6370_mc_brightness_set(&led->mc.led_cdev, 0);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret, "Couldn't set multicolor brightness\n");
> > > +
> > > +		ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc,
> > > +								init_data);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret, "Couldn't register multicolor\n");
> > > +	} else {
> > > +		if (led->index == MT6370_LED_ISNK4) {
> > > +			ret = regmap_field_write(priv->fields[F_CHGIND_EN], 1);
> > > +			if (ret)
> > > +				return dev_err_probe(dev, ret, "Failed to set CHRIND to SW\n");
> > > +		}
> > > +
> > > +		ret = mt6370_isnk_init_default_state(led);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret, "Failed to init %d isnk state\n",
> > > +					     led->index);
> > > +
> > > +		ret = devm_led_classdev_register_ext(dev, &led->isink,
> > > +						     init_data);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret, "Couldn't register isink %d\n", led->index);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> > > +{
> > > +	unsigned int devinfo, vid;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
> > > +	if (vid == 0x9 || vid == 0xb) {
> >
> > Are there nice human readable associates of these (vendor?) IDS?
> >
> For clearly understanding, I'll define these two as 'MT6372_VENDOR_ID' and 'MT6372C_VENDOR_ID'.

Much better, thank you.

--
Lee Jones [李琼斯]

