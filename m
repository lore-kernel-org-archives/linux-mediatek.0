Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE108C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwN6IxyQjuvVAsZLjo36uq20E2C9scRHPNKcXTuVvbA=; b=Ysh4xXSgjLU2hZtucicvpsZXph
	xlMh5+1Vwj9U1cEjXf0RkY57xNMrcGYmjEnXACGlTVrnV6hhTEtDcXmeeRELbqybvTa2vMw7xnYMM
	lVy8Ap74xHy5KyJ7rrkLfvFJ5OZsaM+dO2x9rBnY14KuusqiZZN4ddM2V4e/FHmELrWUZSnljxCz7
	ezfnAfDqH5h7rOphzG67fchDaM99xUnRX29xWlUrTpklRS2VoiafL50VBF+ALgcTSYyaQYXOd5u+S
	hlKBlkEo8zEvhlfNqKJ5nV/elHvRtkBc+g+YJpszrpNNp63fgZl39PjEhwb0akqSexuhAUqvPKsLn
	CCVQ7CVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ATG-00GNnz-OC; Mon, 20 Jun 2022 06:01:10 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3AT2-00GNj1-JO; Mon, 20 Jun 2022 06:00:58 +0000
Received: by mail-il1-x141.google.com with SMTP id k18so1222460ilr.11;
        Sun, 19 Jun 2022 23:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cwN6IxyQjuvVAsZLjo36uq20E2C9scRHPNKcXTuVvbA=;
        b=g6PojB88FJpDGekaEQW5sgtt2awlIg9Kyk+OmVxnfABwAPRZbln/Y/uyyXMGCfm5er
         1R0+e483BrsBWcnsxOmWnurViueosKKnTooTuvNzUQMFav5s+AbIomGcK2PP1DZYPPpr
         VQ9yUoTx79KEo59DnPTs2lGLIKmUyAHc7ejDxujesUmt3jln8fx88SDSJ7Xc4h4fpZ+m
         YStImi8HoHdq4ffN+XYmEH9iKrQpXmIjZvY6BidOkJ07b9JEBCQIG0EV892yb0kP3kZR
         L+mSaXygBIURfwfvW7HX1XbwBPpR7BkPNJr0VxPdz7HSXxsudDSiVGYuklRWY+DOvNS3
         bRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cwN6IxyQjuvVAsZLjo36uq20E2C9scRHPNKcXTuVvbA=;
        b=Qgxjc2kO/q0ucvLlu9Lz+JAixjqx6fumRCFrCjDv6lzLIP/671evw7OkK2Af9e/uff
         wUt+V+9ARsZa1Ozbys40596vLMx9ey2t+dJdwRG26ykhGuvgCCi6/JQNTm2yiBU2TXGz
         GEt2z0cqbC5SSBa9+FzWUa3jNiOZQUjhgQrBmM86EzMbTxL43p9UFjnUi9DyHuKtCX19
         im5tF1d3ntfHBD1Oa8WldwRFIRjmsTDiVymf1RvPrGhjoCIdE20EnGfoM7lcjNOb6VAn
         XsWXAnJCbh1Ed0OvDE9iYXYKs8QNaK32nmPbGbOzvpBS4ggYALQXHCwOnZTxn/qJqIa6
         rgrg==
X-Gm-Message-State: AJIora8vp1Z85G9ao3UC6LTKu6xkUtGMbF2cMBFaRsy8A4ZtYz5NvJJX
	7hwNEL6P3JvJxuHvcMlXWr5ELwWwzeOYCSqrp6s=
X-Google-Smtp-Source: AGRyM1uXlPLygCXpmbKeDXm5LIO35jz/XjYzrLDMy2nvrMmyGvaWds72J9n4lNin+B4hhL3oHWaBa/1XDczfnzCMFbM=
X-Received: by 2002:a05:6e02:1aa4:b0:2d3:aeb9:930 with SMTP id
 l4-20020a056e021aa400b002d3aeb90930mr12576572ilv.45.1655704854169; Sun, 19
 Jun 2022 23:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-8-peterwu.pub@gmail.com>
 <20220618164820.2eeb8ae8@jic23-huawei>
In-Reply-To: <20220618164820.2eeb8ae8@jic23-huawei>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 20 Jun 2022 14:00:43 +0800
Message-ID: <CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, lee.jones@linaro.org, 
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
X-CRM114-CacheID: sfid-20220619_230056_695688_F6488893 
X-CRM114-Status: GOOD (  22.33  )
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

Thanks for your helpful comments, and I have some questions want to
ask you below.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=85=AD =E6=99=9A=E4=B8=8A11:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, 13 Jun 2022 19:11:38 +0800
> ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Docum=
entation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > new file mode 100644
> > index 000000000000..039b3381176a
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > @@ -0,0 +1,36 @@
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
>
> Unfortunately the kernel documentation build scripts do no support duplic=
ating
> standard ABI for particular devices so as to provide more information.
> Hence you can't have anything in this file.
>

I want to confirm with you again,
because my ABI file duplicates with standard sysfs-bus-iio (voltage,
current, and temperature channels),
Should I just remove this ABI file and modify the code of mt6370-adc
to meet your expectations??

>
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
> Curious though, voltage with a mA accuracy range?

Yes, this description is based on the data sheet.

> This scale should be presented directly to userspace anyway so no need
> for this doc.
>
> > +             higher measure range(1~22V)
> > +             Calculating with scale returns voltage in uV
>
> No. All channels return in mV. That's the ABI requirement as
> in sysfs-bus-iio and we cannot vary if for particular drivers.  If we did
> no generic tooling would work.

Ok, I got it!

>
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
> > +             lower measure range(1~9.76V)
> > +             Calculating with scale offset returns voltage in uV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 TS_BAT ADC
> > +             Calculating with scale returns voltage in uV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 CHG_VDDP ADC
> > +             Calculating with scale returns voltage in mV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 IC junction temperature
> > +             Calculating with scale and offset returns temperature in =
degree

Shall I modify the scale of temperature to milli degrees in
mt6370-adc.c and remove this item??

>

Best regards,
ChiaEn Wu

