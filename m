Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6257EC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 02:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBEE2W3FjydD0/XD0h/jv8cpLUWQxzRJ40zan6MUb+E=; b=WmL59Om1SP8xNnl9Tnzkispio+
	ktEBCDb8qGX9hZtCnnnFOtTqJmed1kBPvfhL0Pbd1f3xr/RLBsoxbooMs3zb7YqU2+R7waCbW1uxl
	hvyoh0GI1XHKS+1glXLAeIwf9+7661DiStPe9o5F9JiCgeQb0M9+R4meckbAJygsd4et+vi7tSKGh
	8XgBE7NX4FDO6BN49rvsB+K6FdRjneEOoeUgWzZm9PiJHF3UmqpwY0MkjezZueLpxvitx5LAoymiF
	PTk1jva5eIS11Tv8rH8IYYPDGMsJ7ULo1KEQb2KWD+TygJXDV2+Q0IS2q7gopzzcrZJvHkdGcoV0U
	7Kt9rT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3TrK-003HT5-Ie; Tue, 21 Jun 2022 02:43:18 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Tr9-003HQm-BE; Tue, 21 Jun 2022 02:43:08 +0000
Received: by mail-io1-xd43.google.com with SMTP id a10so12913376ioe.9;
        Mon, 20 Jun 2022 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XBEE2W3FjydD0/XD0h/jv8cpLUWQxzRJ40zan6MUb+E=;
        b=oWfVzxZxhoE4HCZZdM8AG2g15e+tsDablb3uv6NkJNr1Kh3zVrgyKtEPApzczQpRms
         bD8RZbDm7aMtscYJEN8XXGOlsTqkZf1dtxoWPDORJ7urpKFNz5I0ZAkz1Y6lu2L3VKxk
         jsgOC3+8UD4PmI07mrFKGYJUB4K2+cCuGgR1lLkTssDUPma6usi742emzjDomnez/fO7
         gkncrR62Ovc5cM/k3mTqd9wRYOhJWE1fAYa4f47f2OUNxvJeF/xsemZbX25KUkPaIWm8
         FPCUCW3ESzi7b+Cjy8YYs3GbGU2ami25BYtYRPOZWh4ANtHkZtNS3Ocb5DmSnpwpiC2t
         VZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XBEE2W3FjydD0/XD0h/jv8cpLUWQxzRJ40zan6MUb+E=;
        b=xMC9zXUJuYeoeL1dRj6l+OEdLNX9BYSAm9hKMgXFIWfJqXhrFcY503TOIXM8TYF2Sk
         cZO5zsasYvxVv18F0BFcALtfepzPEmWqM5tJYHVkt1wIDODgJs/Dsm+YyhZr1G2UvjlK
         RcV93LENcwreUn/d2a+B/7mNk/LBCR8G+IARZIp/e93m9vMP1HpiAFgfXTw08dPU4ZD6
         Tlhm5PInX5cb9/8/E5tEg4r4tRUuKCB7RmO9cqM2W+35O4QtSMzRJRj38UpbDFzg9hxe
         NZwvZqzkl6rMvHo8NVRep3PIG9PrQGLK2fvcHp9YpbVMoNze3+iUe5P3F6OPYIKCLsNM
         7avQ==
X-Gm-Message-State: AJIora8TQMc6eyBE9cvV+1Fx+mMBzhzodK8DMhGdMK7QD2keoQohEGAd
	o4BcWlNQiWfBRcr2fWJXCrN9j1WMC7QfgQrhnGA=
X-Google-Smtp-Source: AGRyM1vpQzgV0zlZHowqIGzYAAvxpyakFnm6y9bItBulj3V4Z+ncRS7AdAAHY3Rk9Fm+0HC+g4QHLAUy8HRH6yxI77s=
X-Received: by 2002:a02:6d61:0:b0:338:398c:1be8 with SMTP id
 e33-20020a026d61000000b00338398c1be8mr10684754jaf.271.1655779384400; Mon, 20
 Jun 2022 19:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-8-peterwu.pub@gmail.com>
 <20220618164820.2eeb8ae8@jic23-huawei> <CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
 <20220620193500.145f05b9@jic23-huawei>
In-Reply-To: <20220620193500.145f05b9@jic23-huawei>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 21 Jun 2022 10:42:53 +0800
Message-ID: <CABtFH5KsiDchvshPEEs2hejCWW3z+7RFUXuUBkpR-uiWqOMKyQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, pavel@ucw.cz, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiaEn Wu <chiaen_wu@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_194307_448004_F128A3D3 
X-CRM114-Status: GOOD (  31.20  )
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

Hi Jonathan,

Thanks for your reply!

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A82:35=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Mon, 20 Jun 2022 14:00:43 +0800
> ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > Hi Jonathan,
> >
> > Thanks for your helpful comments, and I have some questions want to
> > ask you below.
> >
> > Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8818=
=E6=97=A5 =E9=80=B1=E5=85=AD =E6=99=9A=E4=B8=8A11:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Mon, 13 Jun 2022 19:11:38 +0800
> > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > >
> > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > >
> > > > Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> > > >
> > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > ---
> > > >  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++=
++++
> > > >  1 file changed, 36 insertions(+)
> > > >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6=
370
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/D=
ocumentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > > new file mode 100644
> > > > index 000000000000..039b3381176a
> > > > --- /dev/null
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > > @@ -0,0 +1,36 @@
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage0_=
raw
> > >
> > > Unfortunately the kernel documentation build scripts do no support du=
plicating
> > > standard ABI for particular devices so as to provide more information=
.
> > > Hence you can't have anything in this file.
> > >
> >
> > I want to confirm with you again,
> > because my ABI file duplicates with standard sysfs-bus-iio (voltage,
> > current, and temperature channels),
> > Should I just remove this ABI file and modify the code of mt6370-adc
> > to meet your expectations??
>
> yes.

OK! I got it! I will refine the code in the next patch!

>
> >
> > >
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
> > > Curious though, voltage with a mA accuracy range?
> >
> > Yes, this description is based on the data sheet.
>
> Weird :)

First, I want to apologize to you because I rechecked the datasheet
and asked the hardware engineer,
the conclusion is I wrote the wrong unit...
The correction is that the accuracy of vbusdiv5 is +-75"mV", not "mA",
and another one, vbusdiv2, is +-30mV.
I sincerely apologize for this mistake and for any inconvenience...

>
> >
> > > This scale should be presented directly to userspace anyway so no nee=
d
> > > for this doc.
> > >
> > > > +             higher measure range(1~22V)
> > > > +             Calculating with scale returns voltage in uV
> > >
> > > No. All channels return in mV. That's the ABI requirement as
> > > in sysfs-bus-iio and we cannot vary if for particular drivers.  If we=
 did
> > > no generic tooling would work.
> >
> > Ok, I got it!
> >
> > >
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage1_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 VBUS ADC with higher accuracy(+-30mA=
)
> > > > +             lower measure range(1~9.76V)
> > > > +             Calculating with scale offset returns voltage in uV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage4_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 TS_BAT ADC
> > > > +             Calculating with scale returns voltage in uV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage7_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 CHG_VDDP ADC
> > > > +             Calculating with scale returns voltage in mV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 IC junction temperature
> > > > +             Calculating with scale and offset returns temperature=
 in degree
> >
> > Shall I modify the scale of temperature to milli degrees in
> > mt6370-adc.c and remove this item??
>
> yes.
>
> Thanks,
>
> Jonathan
>
> >
> > >
> >
> > Best regards,
> > ChiaEn Wu
>

Best regards,
ChiaEn Wu

