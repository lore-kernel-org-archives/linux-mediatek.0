Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF3EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgSnFxwGzpmjm+p7ZnjxYjteXl5sPOJEGrU4Scgygt8=; b=AaUuPghndBgM+9Pu4OsEaWlqIe
	Nm8tEHnhDzCiwSmuzQ0W7c32pPiXzzNcWEBRQrZ+5qX19oFZzB7CLPiQgSQMcHCPXDhc94fDPLtnx
	bnzeIGyi1OblIi8zEmCCVonNsw8vbTfMzSa8rojcFTyJhJGq4jd5GB+l4GU3ouwomehea1d4+f9iE
	S/1nnx+tPjtLpDqgacjDxDTJig/z0Dl859gpw4fVQNXYZV99wi4GYs4w7THWQRAMcxf8eGaK0m6HQ
	E8VFSo7ulPWGk480GJm3JJgb8t0lbEkNgENRZ4Y0LRvcG7fUGEgDWS3bgxb58tKPQjGRV9TghVFP2
	neA9bmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gQ9-001iJJ-6b; Fri, 24 Jun 2022 10:20:13 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gPl-001i8s-Tp; Fri, 24 Jun 2022 10:19:51 +0000
Received: by mail-io1-xd2c.google.com with SMTP id s17so2206226iob.7;
        Fri, 24 Jun 2022 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RgSnFxwGzpmjm+p7ZnjxYjteXl5sPOJEGrU4Scgygt8=;
        b=Ksbgww2SpxbTKSeTwjSi+p9D7IjbSHXpPB6L2alhOT0rPaZ3Jdcwu4C8kKWHxpZsNs
         pDZuW0yEoNBO0Hch6e/i/MyP8cEMrpcp0cPmroROelXTAnV/iMJJ35xzaUxnSQ80bmAt
         FltIIv4lxmVG83sudMnDJngHdXAPymOVnnH0oSIsuglA6T+ThlE9cu/QXsyrD1halwkq
         4K3YpgtFmjOQS4dXGRT42MgvZSQwT5yZfxY8tb0iUMGjYycTBPfNix0kpEQLPHOYAs/N
         BZkwaH866WD1HBeagt9fSRhQwdsNkEWRuT2z/k8aQQco4QLvUdvBC6kIAJI/qCmJqBhj
         IgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RgSnFxwGzpmjm+p7ZnjxYjteXl5sPOJEGrU4Scgygt8=;
        b=GTUzVsR5Z8X5BZCn9n7FTJTRc0YCXXLRlTpZOeOYEXjhR7aRG2XjojVQrZd8T+5Hi5
         pg0OLpMOqArxHiFS/5KQ4bGL2Yij7K+vj6LXAOhwm3qRU9701ctHCr0MBKNKkAkDiTI5
         hdyFlgaXwNnjUFbDXyWOMlBDHAI68VfwmVj7lBeaPdxxAHrq8APOVK2ecqtzGZl2Woy4
         8fckGSKiKCajae7RIkoxO4sqoODjvOvQTc4aMlbsaU0R87juhytR6pVrrGsk+2Dmh2j2
         67MjAGL1G6usjEJDGp+mqKUNM9EJ0e2FN4DaTsBYWjaWeIns1byfitIn1xYBFR4ZVxjR
         abxA==
X-Gm-Message-State: AJIora8bqHTjpzpSVEkaqwgOGfDKA3GkhRrV0jVpyMH8pFRXUhdf2p0O
	cT8vSzO69CCZIO0KwTM/aRK3l5CypUqCr1FTiEo=
X-Google-Smtp-Source: AGRyM1vutyoXzSan9RSfWSnID47w2e/WTQN3pASpI53PVkOjX+Rz7wJCkOQl3pTTKmSWx4A4FnD/sHVFYCZM+YdWIVo=
X-Received: by 2002:a5e:990f:0:b0:673:4f01:3a2a with SMTP id
 t15-20020a5e990f000000b006734f013a2amr4553113ioj.76.1656065986866; Fri, 24
 Jun 2022 03:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-8-peterwu.pub@gmail.com>
 <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
In-Reply-To: <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 24 Jun 2022 18:19:35 +0800
Message-ID: <CABtFH5K_vB5Rmo+2zAJ8PuMeMvC9x-yhDL93ByOLD+gc2maQYg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_031950_011329_7D2C2B7B 
X-CRM114-Status: GOOD (  27.22  )
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

Thanks for your helpful comments! We have some questions below.

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:01=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 1:59 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 MFD support.
>
> ...
>
> > +config MFD_MT6370
> > +       tristate "Mediatek MT6370 SubPMIC"
> > +       select MFD_CORE
> > +       select REGMAP_I2C
> > +       select REGMAP_IRQ
> > +       depends on I2C
> > +       help
> > +         Say Y here to enable MT6370 SubPMIC functional support.
> > +         It consists of a single cell battery charger with ADC monitor=
ing, RGB
> > +         LEDs, dual channel flashlight, WLED backlight driver, display=
 bias
> > +         voltage supply, one general purpose LDO, and the USB Type-C &=
 PD
> > +         controller complies with the latest USB Type-C and PD standar=
ds.
>
> What will be the module name in case it's chosen to be built as a module?

OK, we will add related text in the next patch! Thanks!

>
> ...
>
> >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)  +=3D intel_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     +=3D intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  +=3D intel_soc_pmic_chtdc_ti.o
> >  obj-$(CONFIG_MFD_MT6360)       +=3D mt6360-core.o
> > +obj-$(CONFIG_MFD_MT6370)       +=3D mt6370.o
> >  mt6397-objs                    :=3D mt6397-core.o mt6397-irq.o mt6358-=
irq.o
> >  obj-$(CONFIG_MFD_MT6397)       +=3D mt6397.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     +=3D intel_soc_pmic_mrfld.o
>
> This whole bunch of drivers is in the wrong place in Makefile.
>
> https://lore.kernel.org/all/20220616182524.7956-2-andriy.shevchenko@linux=
.intel.com/
>

hmm... So shall we need to cherry-pick your this patch first,
then modify the Makefile before the next submission??

> ...
>
> > +#define MT6370_REG_MAXADDR     0x1FF
>
> Wondering if (BIT(10) - 1) gives a better hint on how hardware limits
> this (so it will be clear it's 10-bit address).

well... This "0x1FF" is just a virtual mapping value to map the max
address of the PMU bank(0x1XX).
So, I feel its means is different from using (BIT(10) - 1) here.

>
> ...
>
> > +static int mt6370_check_vendor_info(struct mt6370_info *info)
> > +{
> > +       unsigned int devinfo;
> > +       int ret;
> > +
> > +       ret =3D regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo=
);
> > +       if (ret)
> > +               return ret;
> > +
> > +       switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> > +       case MT6370_VENID_RT5081:
> > +       case MT6370_VENID_RT5081A:
> > +       case MT6370_VENID_MT6370:
> > +       case MT6370_VENID_MT6371:
> > +       case MT6370_VENID_MT6372P:
> > +       case MT6370_VENID_MT6372CP:
>
> return 0;
>
> > +               break;
> > +       default:
> > +               dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinf=
o);
> > +               return -ENODEV;
> > +       }
> > +
> > +       return 0;
>
> ...and drop these two lines?

OK! We will refine it in the next patch!

>
> > +}
>
> ...
>
> > +       bank_idx =3D *(u8 *)reg_buf;
> > +       bank_addr =3D *(u8 *)(reg_buf + 1);
>
> Why not
>
>   const u8 *u8_buf =3D reg_buf;
>
>   bank_idx =3D u8_buf[0];
>   bank_addr =3D u8_buf[1];
>
> ?

We will refine it in the next patch! Thanks!

>
> ...
>
> > +       if (ret < 0)
> > +               return ret;
> > +       else if (ret !=3D val_size)
>
> Redundant 'else'.

I'm not quite sure what you mean, so I made the following changes first.
------------------------------------
       if (ret < 0)
              return ret;
       if (ret !=3D val_size)
              return -EIO;
------------------------------------
I don't know if it meets your expectations??

>
> > +               return -EIO;
>
> ...
>
> > +       bank_idx =3D *(u8 *)data;
> > +       bank_addr =3D *(u8 *)(data + 1);
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
ChiaEn Wu

