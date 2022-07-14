Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA41C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5UuNt5TPK0IuG39xN+NMro5LKgIqNbr9Zx7mA/mPiM=; b=NcVyyS2biihZ9g5d5/Kg1ozopZ
	j1GaYBwPBIuUzfaxef3smXMn/ERhQMcZDQcsGWoyXoEfsvAd2h9pg8so/ZID2eMVWL73iJ6/ky514
	1JU4daqVOBBJKYbPXGthTkRbzvAvDAqmGBhJ5p7joJwAIjug0te/FIaD2PmLCflAEh9E8IpkHnD1l
	3HDN1LLohIuRYQuhpS25VSQfFNf/hxf0iz5Qqbg6lLdLldPV0BJebW4b8YEQP+ET26S7XNW4+QK6+
	pc3jouj58GPsfpZmW+0oH/SvMZrRBVeowpW9EJAIde6B8lO6vpQa/Q9lmp1kNWaLIKDcKuvddn6Md
	tYu5y88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBt2q-00Bix6-47; Thu, 14 Jul 2022 07:13:56 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBt2T-00Bijw-By; Thu, 14 Jul 2022 07:13:34 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id g9so842258qvq.7;
        Thu, 14 Jul 2022 00:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q5UuNt5TPK0IuG39xN+NMro5LKgIqNbr9Zx7mA/mPiM=;
        b=b0E3JTU5pYWhoLa3ap7YFqzgEMsmY9DzPinFwRbVIUxY93YXyUx7ZCDKj7KmfhQ21C
         rbLfBjhA9+2Iw8+wRoHdzOZmhqnsY+50XpmOdqNkHbt1cSMSHEnAu5vgSo2cTU4Vp00E
         OzftT9WeV+jRXDaaNmeyjhArEApdAVnDvnAaK0sb17BX1/wJ+erATO6cVT2LmSg5zo1C
         AkB0gsToiInDLayKBxHHJLxYpaxBz2afFFQmHItaY08Jtmauimz5lnfp+bStbZf1nc6w
         aPm7pRJ9mU/zUvlfPRnxcyejhyXF2kYZj0eimP7+p17pN8EvNWU5/v59Wtwmk5hE8TwL
         aWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q5UuNt5TPK0IuG39xN+NMro5LKgIqNbr9Zx7mA/mPiM=;
        b=nmYUGcNk9VTJBktj9wEr4Jkhycb5/sMo57XIuyNTxyDEciDyidMjkDtYg+DJQipp4W
         2OT8uZ68F8zDAgdQ+Svp7bftc8f52SFnElc/wynVNBkbaLILRRpFRSneUpWKuIRtdKKx
         QXZgeydnhttrpktLZS10rLb2Tdwautx8PtYWhhvJVi7r2TWQO0AjYHfF8sQbvG9PkK0S
         wOD5p0bQ25Q0FSi0N0fPO7WmqkqnApirCh859YxoqwX4KQSs5CQD31c3gKBRsO4yEYm5
         0wvGZOzy1R92qKlT1PAgrFlXreSRKTUdqo7dkC5pmzkMOY/1LVMVhdpOXCNMS47HJjmd
         5+MA==
X-Gm-Message-State: AJIora/Gnv/Ix8dxmZAZRWKVIc+QSo+YGYwEMjAQK8aLisyA57TMDjND
	9Cv+V2DY92BnYZerrIDRtG282fi2Me1xtxF+HKZDM9wjGAw=
X-Google-Smtp-Source: AGRyM1vJRbWeeJQDQ5VsDhXvc8TWmApQquCsp5U/iybMpcD3LNzACs5RVUGTHl5IJiCF7b4f25ZlvyBfRyQDbXD00iQ=
X-Received: by 2002:a0c:9a0c:0:b0:470:54d7:cfd5 with SMTP id
 p12-20020a0c9a0c000000b0047054d7cfd5mr6903769qvd.46.1657782811193; Thu, 14
 Jul 2022 00:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com> <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
In-Reply-To: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Thu, 14 Jul 2022 15:13:19 +0800
Message-ID: <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370 support
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
X-CRM114-CacheID: sfid-20220714_001333_450873_FA803840 
X-CRM114-Status: GOOD (  16.91  )
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
>
> Please, remove unneeded context when replying!
>
> ...
>
> > > > +               brightness_val[0] =3D (brightness - 1) & MT6370_BL_=
DIM2_MASK;
> > > > +               brightness_val[1] =3D (brightness - 1)
> > > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> > >
> > > Bad indentation. One line?
> >
> > Well... if indent to one line, it will be over 80 characters(or called =
columns?)
> > From my understanding, it is not allowed, right??
>
> It's allowed to some extent.Use your common sense.
> Here it's obviously broken indentation.
>
> ...
>
> > > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val)) +=
 1) >> 1;
> > >
> > > Isn't something closer to get_order() or fls()?
> >
> > I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> > this change is meet your expectations??
>
> Nope. Try again. What about fls()?

I have tried two methods so far, as follows
-------------------------------------------------------------
/*
 * prop_val =3D  1      -->  1 steps --> b'00
 * prop_val =3D  2 ~  4 -->  4 steps --> b'01
 * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
 * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
*/

// 1. use fls() and ffs() combination
prop_val =3D ffs(prop_val) =3D=3D fls(prop_val) ? fls(prop_val) >> 1 :
(fls(prop_val) + 1) >> 1;

// 2. use one line for-loop, but without fls()
for (i =3D --prop_val, prop_val =3D 0; i >> 2 * prop_val !=3D 0; prop_val++=
);
-------------------------------------------------------------
Do these changes meet your expectations??

>
> ...
>
> > > > +       props->max_brightness =3D min_t(u32, brightness,
> > > > +                                     MT6370_BL_MAX_BRIGHTNESS);
> > >
> > > One line?
> >
> >  Ditto, it will be over 80 characters...
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko

