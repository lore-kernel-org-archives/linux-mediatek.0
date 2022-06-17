Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE+zQZQcyF759AJuVRCgUw1QrZjmmIkS9SVF/uua3CY=; b=l0YtrcaEIJnAzLqjPvnQUltUaQ
	xII04rUr3NilAxgfq77q0rDBywhMAuRPliAyEY7jvgbtV/ZxrsGwfWVKYYb6y8VgGNeWGHfbK0dsA
	ZHzIK3KCf8raQFyMYD1Kwlz6CDy1U4bjRukA89OZk18b/GhzUveOxfcJ4K7HMPIwE64SZ63pyUGNg
	9usWrHhmIm3UIa0EQzi3q1UwQRgifB9FXRRupD2YngD77AoEEsqGFIbLqxm9sbhmpzpjvqoArIOHu
	rFbZ4DHiCQK+8RUuBtcEU3EBWQj20dKdTZ93m/P4wOHVE7jSnhXdsTAQXGgYTCbnl85ffz1lWOUkN
	Bk84J4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28OM-006iZP-QM; Fri, 17 Jun 2022 09:35:50 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28NL-006hw5-Rd; Fri, 17 Jun 2022 09:34:54 +0000
Received: by mail-il1-x135.google.com with SMTP id m16so1109970ilf.6;
        Fri, 17 Jun 2022 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DE+zQZQcyF759AJuVRCgUw1QrZjmmIkS9SVF/uua3CY=;
        b=TDYeLEaQ+IkQCFwsN5ZQ3F+UqxbwCBkt2zAq1tT7vFaTl9fJAuS6YerABjtHK4mOxb
         TrWcAGr6YdcXb4ALZYnuW0EpzY4enIB9a/N3rtcIPVVz4H1oggG/gQz0f3KJwQbFOZs+
         ZDCH0HPt5AB9qRpQyELl2+owWkOE4MPyxjEyB1griWQ0FRFlaxna+kw6cHUIvotV2buP
         qGa7xwHI7l3QT8uJSCUU0PAsReT6s7CYfX0V77qw7CtMyEcqx6Q0ejjLwWvhsopT7FxJ
         em13cvYi2AvF5IlY6VaJ05xly218vuCyMNqAGbLG4d8okAD+4yvBpXEn1shR0HMx1yLK
         ISlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DE+zQZQcyF759AJuVRCgUw1QrZjmmIkS9SVF/uua3CY=;
        b=z51XP5LY6IDsm3oL9uhxdlo/OCaKRbcZ2PWR0us/q+mgzM2qOk/fRtxV9n+iaDUFLE
         1GldqFSYLS9APn/4Y9eHJJJ2IpuojNBSDsPmhb9JT8yMOx8T89svBGUoJsKbL7UmNSS2
         Y6sPLJezcCMBpA/V4qRRqec8aMb3DNyTbwt7FGbBDPU5fUk9VYPoYQyZ21Q5ojeGNTK2
         +ukGKngXDstguIrrEeAzOcDBEvPO4E5QBaxtNjsoaPBDknXgtB0hhouT2ngpU6w7cllj
         k9iaAAr2RrJrxVUSKYhaxBHrt/X966jiniijpgtAua7KdRM07MA+KQa4+AsfUOxy0qRY
         wraA==
X-Gm-Message-State: AJIora9dnfG766dBSQ1yOG7efnavDB5ZoAU4pVCDbAsLsvOmerDUSYYE
	S6LAoQicQ1rxhGSiLV8lDf2Sf2ilxaIm4iuXTz8=
X-Google-Smtp-Source: AGRyM1ubwnEFy3CYAH9fHWaontZ0WgA5WaEtmBHPaT66gte2AsL67svPaO35GdaGEkb9HpkJB7x7C2X7WR6oIGxmrjk=
X-Received: by 2002:a05:6e02:4a1:b0:2d3:a778:f0f1 with SMTP id
 e1-20020a056e0204a100b002d3a778f0f1mr5168320ils.212.1655458485946; Fri, 17
 Jun 2022 02:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-16-peterwu.pub@gmail.com>
 <20220613170853.bffuwkcmflfgg4gt@ash.lan>
In-Reply-To: <20220613170853.bffuwkcmflfgg4gt@ash.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:34:35 +0800
Message-ID: <CABtFH5JKnxF5TqV=9EiAZEm4Un0npNo-GX8xLD4W5+S+pA+ysg@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370 support
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com, 
	lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiaEn Wu <chiaen_wu@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_023447_941642_458FF753 
X-CRM114-Status: GOOD (  23.68  )
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

Hi Daniel,

Thanks for your helpful feedback!

Daniel Thompson <daniel.thompson@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A81:08=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jun 13, 2022 at 07:11:46PM +0800, ChiaEn Wu wrote:
> > +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> > +                                         struct backlight_properties *=
props)
>
> Most of the changes in this version looks good... but it looks the new
> code in this function has a number of problems. See below...
>
>
> > +{
> > +     struct device *dev =3D priv->dev;
> > +     u8 prop_val;
> > +     u32 brightness;
> > +     unsigned int mask, val;
> > +     int ret;
> > +
> > +     /* Vendor optional properties
> > +      * if property not exist, keep value in default.
> > +      */
>
> That's not the right strategy for booleans. Not existing means false
> (e.g. flags should actively be unset).
>

I am so sorry for making these mistakes...
I will try to refine them in the right strategy in the next patch!

>
> > +     if (device_property_read_bool(dev, "mediatek,bled-pwm-enable")) {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_EN_MASK,
> > +                                      MT6370_BL_PWM_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> As above comment... all of the boolean properties are now being read
> incorrectly.
>
>
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable"=
)) {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_HYS_EN_MASK,
> > +                                      MT6370_BL_PWM_HYS_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-pwm-hys-input=
-bit",
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_HYS_SEL_MASK, val)=
;
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-ovp-microvolt=
",
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);
>
> This has been renamed but still seems to the using 0, 1, 2, 3 rather
> than an actual value in microvolts.

I=E2=80=99m so sorry for using the not actual value in microvolts and micro=
amps.
I will refine these mistakes along with DT in the next patch. Thank you!

>
>
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OVP_SEL_MASK, val);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown"))=
 {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OVP_EN_MASK,
> > +                                      MT6370_BL_OVP_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-ocp-microamp"=
,
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_OC_SEL_MASK) - 1);
>
> Likewise, should this be accepting a value in microamps?
>
>
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OC_SEL_MASK, val);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown"))=
 {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OC_EN_MASK,
> > +                                      MT6370_BL_OC_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* Common properties */
> > +     ret =3D device_property_read_u32(dev, "max-brightness", &brightne=
ss);
> > +     if (ret)
> > +             brightness =3D MT6370_BL_MAX_BRIGHTNESS;
> > +
> > +     props->max_brightness =3D min_t(u32, brightness,
> > +                                   MT6370_BL_MAX_BRIGHTNESS);
> > +
> > +     ret =3D device_property_read_u32(dev, "default-brightness", &brig=
htness);
> > +     if (ret)
> > +             brightness =3D props->max_brightness;
> > +
> > +     props->brightness =3D min_t(u32, brightness, props->max_brightnes=
s);
> > +
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-channel-use",
> > +                                   &prop_val);
> > +     if (ret) {
> > +             dev_err(dev, "mediatek,bled-channel-use DT property missi=
ng\n");
> > +             return ret;
> > +     }
> > +
> > +     if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> > +             dev_err(dev, "No channel specified (ch_val:%d)\n", prop_v=
al);
>
> Error string has not been updated to match condition that triggers it.
>

I will refine this wrong error string in the next patch, thanks!

>
> > +             return -EINVAL;
> > +     }
>
>
> Daniel.

Best regards,
ChiaEn Wu

