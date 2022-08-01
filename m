Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9BFC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uetOwY75YdSkRkOmZ7kqjcqe6M7pgBJrux4C6ueh2dc=; b=XzWuofDMPG1N8tHENSIk6uQC8Z
	lzegbjCzh/h+78jZzfM9FAjxHnU5QzA+vYitYNZ69OyGKYiYHpeHI+RctXFfJ4vqWPfXvYND5UKAm
	fMCktxDt2qg7IRp1/h+Y9nL+UXzedGai7scB5sIQyJZqqCVJnOgS8IWJ6O4I5DGies6BK/RzOrRK+
	A3lRCERFEUqexmHC0IflsdPPs0qnSQW7RkN7l29x80k7RDkMA0mrMN55kVg+S2BkNb1suLSJK1eWF
	2Q7nWPQnyzat18LMd9QFX0B8RtZVe9Cr+uFi7VNB5H0ckOSbZZeTS3hhevcx01f5yZukeucaKO9ZX
	5CN8XadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIQGw-003flq-NY; Mon, 01 Aug 2022 07:55:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIQGj-003feL-Hc; Mon, 01 Aug 2022 07:55:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so11306720pjz.1;
        Mon, 01 Aug 2022 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=uetOwY75YdSkRkOmZ7kqjcqe6M7pgBJrux4C6ueh2dc=;
        b=C29sey2y0GPIrbCS1cC5P88q5AOwiJEWMKfpOhoEpoq5K3kncC1gldVs6rhVi8BtcE
         iIQ52S3NH1H9vx44xLKhIMn1zCf9/ERISI8EIe0uuXI9Bv5KEN2v3T+2uqHoSvRA7V+s
         N5npdgHtX8URJO/y2DQLFrGOLkeWM50IovV1QYdz956TMqBImdgZPZ3A1oddKDyAgGl9
         FpCdWKV2uTsx/p/2x+ELaBcaGwMlhSymB13qKmhc/2GmHv36G1ysuEqdZ2C3hx304DCU
         8gHdyrbT7OU85bAHV5I5dca7/J6R+PTZh/LjYR5AA0gfe1y5qlI3gvj5sPLJ7oshUIzv
         QLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=uetOwY75YdSkRkOmZ7kqjcqe6M7pgBJrux4C6ueh2dc=;
        b=tD6/o4sDdbOjbr8M3cclsygIgrI2/nxfbnaiUMMKiNTxr1jVhqq5yQoOU3Mszr4Noz
         JsQcudSSAOhYYAO2n9DSMZBXInh+hZJ15EjHCF6lgZ/bodjbQP5ZkugXNtJIRyRKTQEO
         hjUCY1WcXCEtoMW3D29OEN8/IC3hHLejOgqkZ7bvkuY83eEf8haj6Nk8njvWbzBO3AGu
         E0rwIGgSkUqVPazmxPcQ/osDZlcA58ufXjduYWNMIfYUGXiWEv7aZwvmR1aUux/S4yyB
         9yXr3U8nNZkYCyRmMBB1le0iwPy4rFxddWwn+izaiDZ5NcD+B9IJyHc6pUX8dU9QdIop
         WbyA==
X-Gm-Message-State: ACgBeo1tKd4L998Z0qd1QbGEwJ4te301vAcrNsmWNWy9Vvc0K3k2POZ5
	wpgCtzypZu7CCZLCT2zqHc8e4z3cVX0xv9QJJjA=
X-Google-Smtp-Source: AA6agR4XQs0SfniccMvwBwEbhZr9DuCZhpAzorqzz/klNEEIk+hI+XSuBOa4ULddUpASHKk37VGPc9LS8p1Pl6/mYJA=
X-Received: by 2002:a17:903:268f:b0:16d:d62c:5b8b with SMTP id
 jf15-20020a170903268f00b0016dd62c5b8bmr13763583plb.107.1659340515630; Mon, 01
 Aug 2022 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
 <20220730213913.GJ23307@duo.ucw.cz>
In-Reply-To: <20220730213913.GJ23307@duo.ucw.cz>
From: szuni chen <szunichen@gmail.com>
Date: Mon, 1 Aug 2022 15:55:04 +0800
Message-ID: <CA+hk2fakxuWD2kFSW2e6p7sgWF5jrk0gZg3BU6MtFxcxv6g5jQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
To: Pavel Machek <pavel@ucw.cz>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Alice Chen <alice_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_005517_613454_4CDC0279 
X-CRM114-Status: GOOD (  36.46  )
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

Hi Pavel,
Sorry for resending the mail, I add all reviewers this time.


Pavel Machek <pavel@ucw.cz> =E6=96=BC 2022=E5=B9=B47=E6=9C=8831=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E6=B8=85=E6=99=A85:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
...

>
> > +config LEDS_MT6370_RGB
> > +     tristate "LED Support for MediaTek MT6370 PMIC"
> > +     depends on MFD_MT6370
> > +     select LINEAR_RANGE
> > +     help
> > +       Say Y here to enable support for MT6370_RGB LED device.
> > +       In MT6370, there are four channel current-sink LED drivers that
> > +       support hardware pattern for constant current, PWM, and breath =
mode.
>
>
> > +       Isink4 channel can also be used as a CHG_VIN power good  indica=
tor.
>
> That does not really belong here.
>
Should we just remove it, or describe Isink4 in another position?

> > +struct mt6370_priv {
> > +     /* Per LED access lock */
> > +     struct mutex lock;
>
> Do we really need per-led locking?
>
Sorry, maybe the comment is not precise.
The lock is used to prevent LEDs from accessing the HW at the same time.

If I use
/* LED access lock, only one LED can access the HW at the same time */
will it look better?
No, we aren't.
There are six steps tr1, tr2, tf1, tf2, ton, and toff in MT6370 led breath =
mode.
We parse duration settings from node "hw_pattern" and set them to the regis=
ters.

This function is used to generate duration settings from hw_pattern.

The brightness of the six steps mentioned above in breath mode is
limited to the node "brightness".
The target brightness of tr1 and tf1 is 25% of node "brightness", and
they are automatically set by HW.

> > +static int mt6370_init_led_properties(struct mt6370_led *led,
> > +                                   struct led_init_data *init_data)
> > +{
> > +     struct mt6370_priv *priv =3D led->priv;
> > +     struct device *dev =3D priv->dev;
> > +     struct led_classdev *lcdev;
> > +     struct fwnode_handle *child;
> > +     enum mt6370_led_ranges sel_range;
> > +     u32 max_uA, max_level;
> > +     const char * const states[] =3D { "off", "keep", "on" };
>
> We'd really preffer not to add "keep" / "on" support unless you need
> it.
>
Forgive me, but I would like to know why "keep" / "on" is not preferred.
We think the users might have some conditions that need them.


Best Regards,
Alice

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2022=E5=B9=B47=E6=9C=8831=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E6=B8=85=E6=99=A85:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> > support hardware pattern for constant current, PWM, and breath mode.
> > Isink4 channel can also be used as a CHG_VIN power good indicator.
> >
>
> > +config LEDS_MT6370_RGB
> > +     tristate "LED Support for MediaTek MT6370 PMIC"
> > +     depends on MFD_MT6370
> > +     select LINEAR_RANGE
> > +     help
> > +       Say Y here to enable support for MT6370_RGB LED device.
> > +       In MT6370, there are four channel current-sink LED drivers that
> > +       support hardware pattern for constant current, PWM, and breath =
mode.
>
>
> > +       Isink4 channel can also be used as a CHG_VIN power good  indica=
tor.
>
> That does not really belong here.
>
> > +struct mt6370_priv {
> > +     /* Per LED access lock */
> > +     struct mutex lock;
>
> Do we really need per-led locking?
>
> > +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> > +                                  struct led_pattern *pattern, u32 len=
,
> > +                                  u8 *pattern_val, u32 val_len)
> > +{
> > +     enum mt6370_led_ranges sel_range;
> > +     struct led_pattern *curr;
> > +     unsigned int sel;
> > +     u8 val[P_MAX_PATTERNS / 2] =3D {};
> > +     int i;
> > +
> > +     if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Pattern list
> > +      * tr1: byte 0, b'[7: 4]
> > +      * tr2: byte 0, b'[3: 0]
> > +      * tf1: byte 1, b'[7: 4]
> > +      * tf2: byte 1, b'[3: 0]
> > +      * ton: byte 2, b'[7: 4]
> > +      * toff: byte 2, b'[3: 0]
> > +      */
> > +     for (i =3D 0; i < P_MAX_PATTERNS; i++) {
> > +             curr =3D pattern + i;
> > +
> > +             sel_range =3D i =3D=3D P_LED_TOFF ? R_LED_TOFF : R_LED_TR=
FON;
> > +
> > +             linear_range_get_selector_within(priv->ranges + sel_range=
,
> > +                                              curr->delta_t, &sel);
> > +
> > +             val[i / 2] |=3D sel << (4 * ((i + 1) % 2));
> > +     }
> > +
> > +     memcpy(pattern_val, val, 3);
> > +
> > +     return 0;
> > +}
>
> I wonder how this works... you are not creating private sysfs
> interface, are you?
>
> > +static int mt6370_init_led_properties(struct mt6370_led *led,
> > +                                   struct led_init_data *init_data)
> > +{
> > +     struct mt6370_priv *priv =3D led->priv;
> > +     struct device *dev =3D priv->dev;
> > +     struct led_classdev *lcdev;
> > +     struct fwnode_handle *child;
> > +     enum mt6370_led_ranges sel_range;
> > +     u32 max_uA, max_level;
> > +     const char * const states[] =3D { "off", "keep", "on" };
>
> We'd really preffer not to add "keep" / "on" support unless you need
> it.
>
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "led %d, no color sp=
ecified\n",
> > +                                                  led->index);
>
> led->LED.
>
> > +             if (num_color < 2)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "Multicolor must include
> > 2 or more led channel\n");
>
> "LED channels".
>
> > +static int mt6370_isnk_init_default_state(struct mt6370_led *led)
> > +{
> > +     struct mt6370_priv *priv =3D led->priv;
> > +     unsigned int enable, level;
> > +     int ret;
> > +
> > +     ret =3D mt6370_get_led_brightness(priv, led->index, &level);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_field_read(priv->fields[F_RGB_EN], &enable);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(enable & MT6370_CHEN_BIT(led->index)))
> > +             level =3D LED_OFF;
>
> Just use 0 instead of LED_OFF.
>
> Best regards,
>                                                         Pavel
>
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

