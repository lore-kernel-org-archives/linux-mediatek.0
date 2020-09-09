Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C24C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 13:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E938620639
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 13:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k27WSdeE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J72MnFFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E938620639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zp+AfeZ9zYim5Tj2/5Q5aT3gJOIwUM8vr6WQ1YE58+A=; b=k27WSdeEa6cLKt59ipLVGfFnx
	IqZoRMlbq676LCzOnNXyZKz9hZ2hEfV9gkhLkhrMxoGtMSzB6v1+ytSW1/Y3aO7AXpjYsl3vsLIyU
	9FcgZz0L7wei9XWi8aseLmpjtNYEOmUCo9xjloV5uNMMzoWzxZC97QFVdv0f8uIYPUxyj7lqIF7d7
	y7gSRA3xqbb73SFZQCprVFVjPIga0lhka/S6A4HrVxGwSaGYwaWtwuCri3wrl+c3ufOcBuwp47Afz
	epFIp+D0F7dfgW3He2VSO1VXbAesoVdUhyhebdOX5Al02qSuorP9jUG2IS/5CntcDEtqUlNmDMnYi
	0kKO7JHlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG0T6-0005Pz-B8; Wed, 09 Sep 2020 13:49:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG0T0-0005NJ-1z; Wed, 09 Sep 2020 13:48:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id c196so2346745pfc.0;
 Wed, 09 Sep 2020 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HvDFPexsr3s8vYjArlu6gd3N2WqfJ+OIg8egu/XCac=;
 b=J72MnFFZPk8u2206qNOtZ8zlPYgrR+X7pVkPWdPhSDSmCOfDa0MEJnRcCwc5XFw0mm
 Sb1lV3OennBIkiQRhc1R9Cqh98lBtOaDVB+fAUD+z3jcJIBgQ+Oh/oqMMqSJJm1WVdD9
 14VbNIjhy1+L+Uj5j7VEF9gFJyNVZKbjv4K7dQom9wlg+yNZhsFThmEKa+XBh0dg9f5W
 19K0E481CVGu3OHopl8TAG3T7AASPx7+BNMyuozy8TwCOs9JHgphikRfA3TPcsQBkMnh
 ggETmYwWv//F/4g6KmFxUq5LFmeDeHnVgtvaWehFZqCyo+/+kL+okh/+UiDa3eBd+AaW
 wCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HvDFPexsr3s8vYjArlu6gd3N2WqfJ+OIg8egu/XCac=;
 b=kUQI9TgQcAhSgFKYvgUIM1vH6Qmu889eJ7/tMGw860CxT0zx0oXXPBkwk+VolIrSX8
 /+uY4NE/nUewQwdyGTrRwKMMBnkW4qJxZ3Al0Wd2mcfZ4J/V1tcwU2aO0RiVFEpT7b5L
 jptJ8RwQpq0ghCKrjyC0EZ+cig6/w3t6ewbMkhgR6eoCB5L5NbPfuyhRnPOxOvu+hqvJ
 i+nF+AOHzW3I8Y0Xl7Q3mWbfqsUHBaLph2wsjAHX864kJSM7czYlIOv91RcXKr9MZogF
 wKABVTiJqG2y4OwshMZK5TBiNbz2p7Tm70VIReb+aigrRIsMhbDBOoInlsb3WvTC+YEb
 oYYw==
X-Gm-Message-State: AOAM532Coz5GPbC4TqO8Uv1V0JeoT8Z8Ru44jc/ZVn9MSNke07p+KFEH
 QsVnSIrIaGYnRsaTOoaqnjsbZLccB2F4fiyhZi8=
X-Google-Smtp-Source: ABdhPJwjGN/noYtRq/MK1sDgwwqkVhBVfELDCJ83d3DmuK7PnZsQ3TAXDjKUtQ6RdtWZMOqD40lzOcLYlIZiBWGiE+k=
X-Received: by 2002:aa7:800c:: with SMTP id j12mr889318pfi.130.1599659331306; 
 Wed, 09 Sep 2020 06:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
In-Reply-To: <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Sep 2020 16:48:33 +0300
Message-ID: <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_094854_137632_2AEE1789 
X-CRM114-Status: GOOD (  23.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 7, 2020 at 1:31 PM Gene Chen <gene.chen.richtek@gmail.com> wrote:
>
> From: Gene Chen <gene_chen@richtek.com>
>
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 4-channel RGB LED support Register/Flash/Breath Mode

I'm wondering why you don't use struct led_classdev_flash.

...

> +//
> +// Copyright (C) 2020 MediaTek Inc.
> +//

Do you really need these two // lines?

...

> +enum {
> +       MT6360_LED_ISNK1 = 0,
> +       MT6360_LED_ISNK2,
> +       MT6360_LED_ISNK3,
> +       MT6360_LED_ISNK4,
> +       MT6360_LED_FLASH1,
> +       MT6360_LED_FLASH2,

> +       MT6360_MAX_LEDS,

No comma for terminator entry.

> +};

...

> +#define MT6360_ISNK_MASK               0x1F

GENMASK()

...

> +#define MT6360_ITORCH_MIN              25000
> +#define MT6360_ITORCH_STEP             12500
> +#define MT6360_ITORCH_MAX              400000
> +#define MT6360_ISTRB_MIN               50000
> +#define MT6360_ISTRB_STEP              12500
> +#define MT6360_ISTRB_MAX               1500000
> +#define MT6360_STRBTO_MIN              64000
> +#define MT6360_STRBTO_STEP             32000
> +#define MT6360_STRBTO_MAX              2432000

Add unit suffixes, please.

...

> +#define FLED_TORCH_FLAG_MASK           0x0c

> +#define FLED_STROBE_FLAG_MASK          0x03

GENMASK()

...

> +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);

Not production noise.

...

> +       ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

return regmap...

> +       u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;

Why parens?

...

> +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);

Noise.

...

> +       if (priv->fled_strobe_used) {
> +               dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +               return -EINVAL;

Hmm... Shouldn't be guaranteed by some framework?

...

> +               curr = prev & (~BIT(led->led_no));

Too many parens.

...

> +static int mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +       struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +       struct led_classdev *lcdev = &fl_cdev->led_cdev;
> +

> +       dev_dbg(lcdev->dev, "[%d] strobe brightness %d\n", led->led_no, brightness);

Noise. Point of this entire function?

> +       return 0;
> +}

...

> +       dev_dbg(lcdev->dev, "[%d] strobe state %d\n", led->led_no, state);

Noise.

If you wish to do it right, add trace events to the framework.

...

> +       if (priv->fled_torch_used) {

> +               dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n", priv->fled_torch_used);

Again, why the warning? Can this be a part of the framework?

> +               return -EINVAL;
> +       }

...

> +               curr = prev & (~BIT(led->led_no));

Too many parens.

...

> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

These delays must be explained.

...

> +       if (led->led_no == MT6360_LED_FLASH1) {
> +               strobe_timeout_mask = MT6360_FLED1STRBTO_MASK;
> +               fled_short_mask = MT6360_FLED1SHORT_MASK;

> +

Redundant blank line.

> +       } else {
> +               strobe_timeout_mask = MT6360_FLED2STRBTO_MASK;
> +               fled_short_mask = MT6360_FLED2SHORT_MASK;
> +       }

...

> +static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> +{
> +       struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
> +       struct mt6360_led *led = container_of(flash, struct mt6360_led, flash);
> +       struct mt6360_priv *priv = led->priv;

> +       u32 enable_mask = MT6360_FLCSEN_MASK(led->led_no);

enable_mask -> mask
  u32 value = enable ? mask : 0;

> +       int ret;
> +
> +       ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask,

> +                                enable ? enable_mask : 0);

  ret =  ... mask, value);

> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               priv->fled_strobe_used |= BIT(led->led_no);
> +       else
> +               priv->fled_strobe_used &= (~BIT(led->led_no));

Too many parens.

> +
> +       return 0;
> +}

...

> +       s->val = s->max = (s->min) + (lcdev->max_brightness - 1) * s->step;

Ditto.

...

> +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)

Can we keep a similar API, i.e. return a new value rather than update old?

> +{

> +       *v = clamp_val(*v, min, max);

I would rather use a temporary variable (and it actually will be
required with above).

> +       if (step > 1)
> +               *v = (*v - min) / step * step + min;

Sounds like open coded rounddown().

> +}

...

> +       lcdev->max_brightness = (val - MT6360_ITORCH_MIN) / MT6360_ITORCH_STEP + 1;

DIV_ROUND_UP(val - MT6360_ITORCH_MIN, MT6360_ITORCH_STEP) ?

...

> +static int mt6360_init_common_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +       const char *str;
> +
> +       if (!fwnode_property_read_string(init_data->fwnode, "default-state", &str)) {
> +               if (!strcmp(str, "on"))
> +                       led->default_state = STATE_ON;
> +               else if (!strcmp(str, "keep"))
> +                       led->default_state = STATE_KEEP;

> +               else

I wouldn't allow some garbage to be off.

> +                       led->default_state = STATE_OFF;
> +       }

What about

static const char * const states = { "on", "keep", "off" };

int ret;

ret = match_string(states, ARRAY_SIZE(states), str);
if (ret)
 ...

default_state = ret;

?

> +       return 0;
> +}

...

> +static int mt6360_led_probe(struct platform_device *pdev)
> +{
> +       struct mt6360_priv *priv;
> +       struct fwnode_handle *child;
> +       int i, ret;
> +

> +       priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->regmap) {
> +               dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +               return -ENODEV;
> +       }

...

> +out:

out_flash_leds_release: ?

> +       for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
> +               struct mt6360_led *led = priv->leds[i];
> +
> +               if (led && led->v4l2_flash)
> +                       v4l2_flash_release(led->v4l2_flash);
> +
> +       }

...

> +static int mt6360_led_remove(struct platform_device *pdev)
> +{
> +       struct mt6360_priv *priv = platform_get_drvdata(pdev);
> +       int i;
> +
> +       for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
> +               struct mt6360_led *led = priv->leds[i];
> +
> +               if (led && led->v4l2_flash)
> +                       v4l2_flash_release(led->v4l2_flash);
> +
> +       }

Looks like a code duplication.

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> +       { .compatible = "mediatek,mt6360-led", },

> +       {},

No need comma.

> +};


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
