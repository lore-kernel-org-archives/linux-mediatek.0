Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB612C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdipHJQcUj266PLPEbEmcprZ34Syq9EbeJ0nWcxYTz4=; b=vmjsGmInaqzJJRNeX9JQDBiEM/
	7IHy9oaVW4ZjTZFzhoC5DVZKa7jWQg4i00EfkFiz6ga1EziFREFSlPudXzypaLOm4PT1C8s9HWmIy
	zDuO413LGaOxgq2XyBTNO1iL4LkQrngj+17XBaCK0JOUvNVKrPxzlLIl3Fe5Gm8NLrfxKfk5ACzhY
	uCK6QeVVU7f0UeBmtoUS46AHZaqJajsPwqFYYAz5xMAeZDIr0GY0rm/wQY5b9op1jNq4YpveJvhvE
	SDnDgJnxTcLocWklM0jOUlzSsCN5OiqCxtB6l3jo2bQKwwMbCiL4nrJ/flM5wQb16tQeprsIIOiWO
	kkMWF+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFteo-0074EZ-Al; Mon, 25 Jul 2022 08:41:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFteK-0073o8-9d; Mon, 25 Jul 2022 08:41:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id u12so7919472edd.5;
        Mon, 25 Jul 2022 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UdipHJQcUj266PLPEbEmcprZ34Syq9EbeJ0nWcxYTz4=;
        b=ABfKDB+hF3n9Vc4uXcJH/wxowVuuZXANQHezQzdWr5Ngsh/idO85i0Q+mD/KzM+CSB
         JRG1GVu0xs6ZoCw7wBbOa5FdTc5eWvaqw+UVN9SHdJEHFfzbRmgkEdix6DCMyHAi1FCr
         JAr6axiQmtyvfzbVJQU1yILv+fNOSMc4pdNm12H0yVakxITFMYusQqnWis60Xho8AsGP
         L+ODp9hB0BQ9UuYk5DfBPx3HnH1fkimsB44PQM+VpR5aT9SXUllZ5JiUeNza+o1o5KiL
         NcV0q9dJ/h5dX9Q0H/4tQoS8YRcvn0AIT770BeqYm2Um/2gYOKrCHjcAMx/p6BEsJKeg
         en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UdipHJQcUj266PLPEbEmcprZ34Syq9EbeJ0nWcxYTz4=;
        b=LDDArAg3ewNjTf8Yll9xm9bS7+tZPY15dWHx69j/tRgNkZklWRNAo20rrmqZP8g2Fh
         DwOLT6JSL+kgoGQfDe/T5uL/obS+n551a6zx/GB8ecgttavG05cL1DnfyQtSHgF/e5LQ
         Kv2S1R0N1wcB1154O2/2NwoXGEDVR7WjYi9XVtW2dIIAH1JozmDTokdE1QGeljmpNqj8
         dssxcK0AhI3Vd69GprD2krJo5kn3PfpzWSxRe0LO4fd3CkK91+HxAdCgYUtA73tnBqhf
         oWvZAYAX2PXbtu+kyRoQIr4keiNRZQw5Ka0Z4ldfraHF1mjF4b7nhfyIpZu7vmbV6VNf
         XKqQ==
X-Gm-Message-State: AJIora9mfgppUQQ5pA2ym+QU5HE7r2knUVnAPPPbdG1OCm9Mzdil9wE8
	+hSxxexgHK5OnfbWnW8W+56QU+c4eMVEBIg0PTI=
X-Google-Smtp-Source: AGRyM1uGDvTB0F/h0jI2/Ct5fK7yQVedUikOG6t/KbrLBDyp6j54RIAxbhLcpZDExQEJMEzhAem3RNohcfKc/MXfF0k=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr11897371edc.88.1658738469088; Mon, 25
 Jul 2022 01:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-12-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:40:32 +0200
Message-ID: <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_014112_380996_FE834322 
X-CRM114-Status: GOOD (  23.21  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>

^^^^ (Note this and read below)

>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> support hardware pattern for constant current, PWM, and breath mode.
> Isink4 channel can also be used as a CHG_VIN power good indicator.

> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

In conjunction with above what SoB of Alice means?

You really need to take your time and (re-)read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

...

> + * Author: Alice Chen <alice_chen@richtek.com>
> + * Author: ChiYuan Huang <cy_huang@richtek.com>

Would
 * Authors:
 *    Name_of_Author 1
 *    Name_of_Author 2

work for you?

...

> +struct mt6370_led {
> +       union {
> +               struct led_classdev isink;
> +               struct led_classdev_mc mc;
> +       };

Where is the field that makes union work?

> +       struct mt6370_priv *priv;
> +       u32 default_state;
> +       u32 index;
> +};

...

> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +                                    struct led_pattern *pattern, u32 len,
> +                                    u8 *pattern_val, u32 val_len)
> +{
> +       enum mt6370_led_ranges sel_range;
> +       struct led_pattern *curr;
> +       unsigned int sel;
> +       u8 val[P_MAX_PATTERNS / 2] = {};
> +       int i;
> +
> +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +               return -EINVAL;
> +
> +       /*
> +        * Pattern list
> +        * tr1: byte 0, b'[7: 4]
> +        * tr2: byte 0, b'[3: 0]
> +        * tf1: byte 1, b'[7: 4]
> +        * tf2: byte 1, b'[3: 0]
> +        * ton: byte 2, b'[7: 4]
> +        * toff: byte 2, b'[3: 0]
> +        */
> +       for (i = 0; i < P_MAX_PATTERNS; i++) {
> +               curr = pattern + i;
> +
> +               sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> +
> +               linear_range_get_selector_within(priv->ranges + sel_range,
> +                                                curr->delta_t, &sel);
> +
> +               val[i / 2] |= sel << (4 * ((i + 1) % 2));
> +       }
> +
> +       memcpy(pattern_val, val, 3);

Isn't it something like put_unaligned_be24()/put_unaligned_le24()?


> +       return 0;
> +}

...

> +static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
> +{
> +       struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +       struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +       struct mt6370_priv *priv = led->priv;
> +       struct mc_subled *subled;

> +       int i, ret = 0;

Redundant assignment.

> +       mutex_lock(&led->priv->lock);
> +
> +       for (i = 0; i < mccdev->num_colors; i++) {
> +               subled = mccdev->subled_info + i;
> +
> +               ret = mt6370_set_led_mode(priv, subled->channel,
> +                                         MT6370_LED_REG_MODE);
> +               if (ret)
> +                       break;
> +       }
> +
> +       mutex_unlock(&led->priv->lock);
> +
> +       return ret;
> +}

...

> +       if (!fwnode_property_read_string(init_data->fwnode, "default-state",
> +                                        &stat_str)) {

ret = fwnode_...(...);
if (!ret)

> +               ret = match_string(states, ARRAY_SIZE(states), stat_str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

...

> +       int i = 0, ret;

unsigned int i = 0;
int ret;

-- 
With Best Regards,
Andy Shevchenko

