Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB7C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FFWXQHfHuTAnSajIxw6WITRnf577MGViKmqh2rQTck=; b=NlLb0pq4iVckGqCHVBQQWcUndp
	f1/GWYqBxdy8wHkptCIbexBU6SErtoRimqpyZXbF509Eu8e1tJBoFpiIR6tVp1JEh61Z3QhlTmAu7
	Yos0svtrTlgW8RMBzQ3YeflT1XnHalxk+Fd4+VJgdU5oiwNSNuZDGqlWkPs/ByRGqwwAI5VPyDllg
	PfU/o3a1bz5JuO1SgO+OEtMc58kO6zxfZ+hacq6ZbrWCPT1L4rnAnxglzAeVvBmvO53L3cUwv5G8i
	8gcVMUYj6TtgnhpYPlBtOo4ZSUof/BLqo2HUZXts7phJhtapw2KQjEgTintZB2k2PHizS2isZq/01
	WvsIQ2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P4y-00FfR8-3R; Thu, 07 Jul 2022 10:49:52 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P4m-00FfNy-TV; Thu, 07 Jul 2022 10:49:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id o18so16588122pgu.9;
        Thu, 07 Jul 2022 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/FFWXQHfHuTAnSajIxw6WITRnf577MGViKmqh2rQTck=;
        b=pNuDXa/tbcZ8L6jUMcFhfkiiN+HCY2bTy8g4vxrKF0uCnbdZzaUEHFI3UEhvKFQ1UC
         eE6uNL4ZcikxGKWmBQMWNFn2vi2ETQWNjJHAKM/K8ooax1hYtWjIkuCEoiWjzlwmG9GX
         WoMgg2sO0TOL1BOmFZkYZQjlUeFnk4VUM4ID13qr9aO5fAUOHNV8WcMiuWT0KyCv3tNs
         yt5TOLt/k314oncIAs4MSxNIPDyesqnVGGLLLmR1OaKx2ayShDI5LtdAatcf/iDhjUT+
         nlXRge1dqHFL7OZkv58zzWV44JyXq8nAHQm1a8SdNpsI3zpdsjcEr5X6BK+lhzi+b04Z
         O/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/FFWXQHfHuTAnSajIxw6WITRnf577MGViKmqh2rQTck=;
        b=yxYfcGBlTqEg8+ilnYIyCrFECs8mYO+hZO7HazCJ2dNfD5HbNvTIRbMwLG8q30rZGV
         Ek6lelxhaXaV0+qOs9+pyM1CDOKhsKGM3+CbKMz+j6xMjGlSmL+EZPgLF9bu+f/LNiqQ
         ryBt8T7W7RHanvrGdN+Gaoc0Uvn8rOV9RY9AUoi5wRyeguM7aAJEJFyNiPECQ/okAe0Z
         CA15xhH6b2PgSnBGuuhbW9E7vmCxK1vU3aEjiQxqcTztuei6ebCmOv5slsKynvPESM7Y
         xhT6lkmq0nKwKkcQA42L873wSIhCzBwZCSje6VZtmv67qadMIi9z8KN9cLIG0+IKQ06P
         YJ5Q==
X-Gm-Message-State: AJIora+YQrvrcW+dzlckB1HaMz/3s9PR/Fh+h0f9Iu1MPdfRPIPGJq1U
	vep5mBKwGIhXcxWvqk2OCZxthHjm3FApmaBwX5I=
X-Google-Smtp-Source: AGRyM1uUqVtaUItLC5GM5dPIqcXaBtnctDbivq8Sa/TY+MZ4zlzxxNsXElMIyQ3R0dNWkSwoY0p+UAWXxA72d7sMMAo=
X-Received: by 2002:a05:6a00:179e:b0:518:9e1d:1cbd with SMTP id
 s30-20020a056a00179e00b005189e1d1cbdmr52012436pfg.12.1657190977288; Thu, 07
 Jul 2022 03:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-13-peterwu.pub@gmail.com>
 <CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com>
In-Reply-To: <CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Thu, 7 Jul 2022 18:49:26 +0800
Message-ID: <CA+hk2fbm8ppKecVJL6D9rYJizf9baV8mOmwRx6GyO+MKvJ3xBQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_034940_994881_718E49DD 
X-CRM114-Status: GOOD (  28.26  )
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

Hi Andy,

Thank you for the valuable comment.

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:06=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > Add Mediatek MT6370 flashlight support.
>
> ...
>
> > +         This driver can also be built as a module. If so the module
>
> If so,
>
Thank you, I'll fix it in the next version.

> > +         will be called "leds-mt6370-flash.ko".
>
> No ".ko" part.
>
Thank you, I'll fix it in the next version.

> ...
>
> > +#define MT6370_ITORCH_MINUA            25000
> > +#define MT6370_ITORCH_STEPUA           12500
> > +#define MT6370_ITORCH_MAXUA            400000
> > +#define MT6370_ITORCH_DOUBLE_MAXUA     800000
> > +#define MT6370_ISTRB_MINUA             50000
> > +#define MT6370_ISTRB_STEPUA            12500
> > +#define MT6370_ISTRB_MAXUA             1500000
> > +#define MT6370_ISTRB_DOUBLE_MAXUA      3000000
> > +#define MT6370_STRBTO_MINUS            64000
> > +#define MT6370_STRBTO_STEPUS           32000
> > +#define MT6370_STRBTO_MAXUS            2432000
>
> Make units suffix visible, i.e. _US, _uA, etc.
>
Thank you, I'll fix it in the next version.

> ...
>
> > +       if (curr)
> > +               val |=3D MT6370_TORCHEN_MASK;
> > +
> > +
>
> One blank line is enough.
>
Thank you, I'll fix it in the next version.

> ...
>
> > +       /*
> > +        * Due to the current spike when turning on flash,
> > +        * let brightness to be kept by framework.
>
> brightness be
> the framework
>
Thank you, I'll fix it in the next version.

> > +        * This empty function is used to
> > +        * prevent led_classdev_flash register ops check failure.
> > +        */
>
Thank you, I'll fix it in the next version.
> ...
>
> > +       } else {
> > +               ret =3D regmap_update_bits(priv->regmap,
> > +                                        MT6370_REG_FLEDISTRB(led->led_=
no),
> > +                                        MT6370_ISTROBE_MASK, val);
>
> > +               if (ret)
> > +                       return ret;
>
> Dup of the below.
>
Thank you, I'll fix it in the next version.

> > +       }
> > +       return ret;
>
> ...
>
> > +       /*
> > +        * If the flash need to be on,
> > +        * config the flash current ramping up to the setting value
> > +        * Else, always recover back to the minimum one
>
> Missed periods.
>
Thank you, I'll fix it in the next version.

> > +        */
>
> ...
>
> > +       /*
> > +        * For the flash turn on/off, HW ramping up/down time is 5ms/50=
0us
> > +        * respectively.
> > +        */
> > +       if (!prev && curr)
> > +               usleep_range(5000, 6000);
> > +       else if (prev && !curr)
> > +               udelay(500);
>
> Comment doesn't explain why this is suddenly a busy loop operation?
>
For the flash turn on/off, HW ramping up/down waiting time is
5ms/500us, respectively.
The busy loop is for preventing turn on/off in wait time, which will
cause unexpected problems.

If I change the comment to
"For the flash turn on/off, HW ramping up/down waiting time is
5ms/500us, respectively.
Need to wait until HW ramping successfully to prevent the unexpected proble=
m.",
will this meet your expectation?

>
> > +static int mt6370_led_register(struct device *parent, struct mt6370_le=
d *led,
> > +                               struct led_init_data *init_data)
> > +{
> > +       struct v4l2_flash_config v4l2_config =3D {0};
> > +       int ret;
> > +
> > +       ret =3D devm_led_classdev_flash_register_ext(parent, &led->flas=
h,
> > +                                                  init_data);
> > +       if (ret) {
> > +               dev_err(parent, "Couldn't register flash %d\n", led->le=
d_no);
> > +               return ret;
> > +       }
> > +
> > +       mt6370_init_v4l2_flash_config(led, &v4l2_config);
> > +       led->v4l2_flash =3D v4l2_flash_init(parent, init_data->fwnode,
> > +                                         &led->flash, &v4l2_flash_ops,
> > +                                         &v4l2_config);
> > +       if (IS_ERR(led->v4l2_flash)) {
> > +               dev_err(parent, "Failed to register %d v4l2 sd\n", led-=
>led_no);
> > +               return PTR_ERR(led->v4l2_flash);
> > +       }
> > +
> > +       return 0;
> > +}
>
> ...
>
> > +       } else
> > +               val =3D clamp_align(val, MT6370_STRBTO_MINUS, MT6370_ST=
RBTO_MAXUS,
> > +                                 MT6370_STRBTO_STEPUS);
>
> Missed {}
>
Thank you, I'll fix it in the next version.

> > +
> > +
>
> One blank line is enough.
>
Thank you, I'll fix it in the next version.

> --

Yours Sincerely,
Alice

