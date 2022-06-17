Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD41C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rwjg/1YINzqxKrc7KAD/i4G4OnLWc8a5sJgC2L1EvV8=; b=ipRKx+wG+ZRePgjtXNWWBjxuJh
	tXOX+cmzUmFIG5C21sv8nmJWVBR2Afl/SmHYbzURcLQ/qNFfb8q1/I311dw22X/YbTzyo12SpAyzo
	Wern782HAgVy1eE9bOBz9EcrJC5uP3AZm9ciUcJ1lpaWXFIxJF1CNghgvQQ40yKwSWmfXe8kU8YdV
	O7BuUgIVxKjanSkVwVT5fqw8aj4yoaIiUBpNzb6HR/Vgep+L0r8+VwgMYbf+3qT6+vGwcQf3Dz0Zz
	u4rTolvilemlGTPtxLrM0qIOZlh3kD87NvZCjuAiYmRQdzHdDr5QPmOoP1eDtf+ezCTdvlat5ZmP9
	/9iqtG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2854-006dYI-Oh; Fri, 17 Jun 2022 09:15:54 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o284r-006dTd-Nd; Fri, 17 Jun 2022 09:15:42 +0000
Received: by mail-il1-x136.google.com with SMTP id h7so2588215ila.10;
        Fri, 17 Jun 2022 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rwjg/1YINzqxKrc7KAD/i4G4OnLWc8a5sJgC2L1EvV8=;
        b=T7RlZkRmUrk1uPWymyVaIYEm2USnc/kiRpW1DN7Cx2fgKOPadbLJ9hDWp330pVll0b
         nVbSUAeOw0ind5aX2DvD+qJ8edzVQwQd3vVZJpL8lsPgf97MamIi1jYUacpEmf4yt4Nv
         8RRQrqnZlA+v/EIUq3IJoumZPhS6kWTzFZg2DF9GNU3fnbSMCbrE+BajwsAUMooWjcpt
         9mPv6dhXPsyKfQqvI+pMgreCD1G0ZEiRwMHTufp3vlcXKkuxk6+kqTFh4zOAP+G5b4Na
         EpWtKBRqGJyZrmKT1ZeI3lx3hOwvQwReCYUJPQvQLh44wdub2G8emdWusMIolDoHXPjN
         eScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rwjg/1YINzqxKrc7KAD/i4G4OnLWc8a5sJgC2L1EvV8=;
        b=erAfUYpamzNuLyCmyYNPR0EVTt1EKyi0gAXI9IFWtT7GGCrxs43/vVtJuFgYexCwX0
         5TNW/Ee3Zg618w8cD10maZhoCjQT5akRabon7mSR2qYbXNk4WtK+vsPtICqhYk/UOrE5
         R+YiHjlpHGvfsAj+mUUib+QKMb3iYb1JIwiqc+tCnueXaLSQxI0qVVnDNzfNtaj8gvvU
         mdJM/7zEjWHcZy2qGGPoFAfJrJhwzd0aqFd41m0kZ5pgUnwaxcTOz6e2poEOyGCIZALW
         NqQpmnAlPaZ+sV27FC/qzqcsbBC6/D1TZdIQMH0kShciak6dAdehw1YnOhp2OzqCe0+/
         29RQ==
X-Gm-Message-State: AJIora/KOt99DUjC833bNiui9UHua4J90GuaRL6jIXF0ggTvD02ACyUY
	7MLwBVu7PsDjQRe5F0/Z830e6+Rvg0LOLaaKlMA=
X-Google-Smtp-Source: AGRyM1ulXgBKYwRX4sDQBTJgY1sJ1HQy/qNt3KPa2+zyrl3Y4yDe7BzlO+x/VaU+eUVa36+znFzZdfjPq6R82D89JK0=
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr5212028ilo.211.1655457340207; Fri, 17
 Jun 2022 02:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-12-peterwu.pub@gmail.com>
 <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
In-Reply-To: <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:15:29 +0800
Message-ID: <CABtFH5JyESUuMkDuRSKdc7pf5M4Zah2eZ_LG1RMbMVYxYkcBxA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] iio: adc: mt6370: Add Mediatek MT6370 support
To: Randy Dunlap <rdunlap@infradead.org>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com, 
	lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiaEn Wu <chiaen_wu@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_021541_807740_FD924AE2 
X-CRM114-Status: GOOD (  15.01  )
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

Hi Randy,

Thanks for your comment!
I apologize for any inconvenience caused when you decoded this help text.
I will refine this in the next patch, thanks!

Randy Dunlap <rdunlap@infradead.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A84:17=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 6/13/22 04:11, ChiaEn Wu wrote:
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 71ab0a06aa82..09576fb478ad 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
> >         is used in smartphones and tablets and supports a 11 channel
> >         general purpose ADC.
> >
> > +config MEDIATEK_MT6370_ADC
> > +     tristate "Mediatek MT6370 ADC driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 ADC support.
> > +
> > +       Integrated for System Monitoring includes is used in smartphone=
s
>
> Please try again on the help text. I can't decode that.
>
> > +       and tablets and supports a 9 channel general purpose ADC.
>
> --
> ~Randy

Best Regards,
ChiaEn Wu

