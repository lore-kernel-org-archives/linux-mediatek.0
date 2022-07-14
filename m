Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F186CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAB/V2thJrX7oNWAiw69xQ9s2yER1z6zgaPEDVTbARY=; b=0hG1aTa9QlSNW5fqkg6rZMffOa
	GMQyw830yUrjqEsUzgO2OK3dLwXwKV1zn+WGS6gyxJH+0TYjCjIxiV4Ngy5yRBXJtl8wwsIzvGACF
	nQRagMRlFYXi5j2Q8FxB4JpBZVbCwTmCpjOBr64YVNsyfZAwDT5Xcv7O7oNhRO1oz6juuCfxfCwoH
	he8asV2uLM/i3Dk4i+zte71QIJxycIsogoawPBe/wh5HEMbXivewIJxWBrbruWRv7waNswTadE+1a
	m7oIAWFdpMuTrnwpnW8IMt94o61BhGms2rhIAxZUv+FcivYuJGRGqMgELebzzbXmJVUUCzv4tBVK7
	RNP3CScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvtq-00DGiA-60; Thu, 14 Jul 2022 10:16:50 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvte-00DGcH-5b; Thu, 14 Jul 2022 10:16:39 +0000
Received: by mail-yb1-xb29.google.com with SMTP id e69so2427831ybh.2;
        Thu, 14 Jul 2022 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DAB/V2thJrX7oNWAiw69xQ9s2yER1z6zgaPEDVTbARY=;
        b=WzDjqq1pRDiX/e0JhdlBpio8zOrckRWFWYoqqx6oFzHppl1HXZKC0K0Vo9UvICBDx4
         1IgGFxPhaOdHa0ijcMRnAWpg15ZqdMXn+A4AN+KbbyLfV+DLK/zGUswdeyoa6I/gMSWB
         mLZcWexKeicX3ZsiBj8qG9KhT504M9qLDNPa+/3b4OVXUQmkey6iL5NUBSkO06Ql9xqx
         7ABvX+TuwC6gjV6lZglt+ptPstfpEqlr1Yg9+65NKMHYYSOzn23aEysk+sSCVoQV5iL6
         RIo+DgXA1m8aiBJ1aC+G2pOf803m52JzwysZxxKXTmLKrJdLDZZrFNf6ymvczZtUZHNx
         NC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DAB/V2thJrX7oNWAiw69xQ9s2yER1z6zgaPEDVTbARY=;
        b=s3TJ6HOLvy0O98LfTcbpVdVtSvcWJEIQrtNIpY3KUxv6yWDqwNldeZE3hVcix54bzV
         /+LEpxUlFM30z3k3Rs0VcNOQg1ZqH2UNkHCcUADf7Lv3RT/ia42atApsV/nmt3o71f/r
         SIQv81hEUghLu/fQ0da7ObRONUyHa8lS5f0x7j094v6pm8BcSc0IKSUBikR4bopnLSel
         sSN7aZRohJuruRC8maodPMMTI8lpzt4UPYpl2fVrcrL8lx/raAZnX+TnNAm5aDTdiM1T
         gzsV7P3ohysQ+4ozUQXaaCI5CMaTh7evGsGaMUzx1+5nL4g28UAND25TH+qeJkv11dMp
         FgqA==
X-Gm-Message-State: AJIora+8iO8y/ikMdYzEc8L1ladZCL45P82s7Zx3/oN/SJe4rko7KF6x
	pPfICkyQzeCUZw5ML7Y3dFhtli9/UwTeVoj6MTwlOT5vCePN7g==
X-Google-Smtp-Source: AGRyM1tsa04XdX6EoBLAKq/4vJYddIuWfRGN796P9MIbmkVyYowmMMx33Ee2ini1a+JW/8CzKBWdXOgF/S8Hwfl8jYQ=
X-Received: by 2002:a05:6902:686:b0:66e:627f:4d29 with SMTP id
 i6-20020a056902068600b0066e627f4d29mr7320510ybt.385.1657793795448; Thu, 14
 Jul 2022 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com> <CAHp75VeMP4zDMmGfdya5Y1C0Hkb7=jeOQGE_HqyDdZcmd_Uyyg@mail.gmail.com>
In-Reply-To: <CAHp75VeMP4zDMmGfdya5Y1C0Hkb7=jeOQGE_HqyDdZcmd_Uyyg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 12:15:58 +0200
Message-ID: <CAHp75VdXGJtPd_oZPGkS1=DoWjFYxbQu_7Vtfj547QQkpz2KNA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370 support
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_031638_230777_46DDB741 
X-CRM114-Status: GOOD (  13.45  )
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

On Thu, Jul 14, 2022 at 11:43 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 14, 2022 at 11:27 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=
=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=
=81=93=EF=BC=9A

...

> > >  * prop_val =3D  1      -->  1 steps --> b'00
> > >  * prop_val =3D  2 ~  4 -->  4 steps --> b'01
> > >  * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
> > >  * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
> >
> > So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> > Now, consider x - 1:
> > 0  ( 0 ) --> 0
> > 1  (2^0) --> 1
> > 4  (2^2) --> 2
> > 16 (2^4) --> 3
> > 64 (2^6) --> ? (but let's consider that the range has been checked alre=
ady)
> >
> > Since we take the lower limit, it means ffs():
> >
> >   y =3D (ffs(x - 1) + 1) / 2;
> >
> > Does it work for you?
>
> It wouldn't, because we need to use fls() against it actually.
>
> So,
> 0..1   (-1..0)   --> 0
> 2..4   (1..3)   --> 1
> 5..16  (4..15)  --> 2
> 17..64 (16..63) --> 3
>
> y =3D x ? ((fls(x - 1) + 1) / 2 : 0;

Okay, I nailed it down, but Daniel is right, it's simpler to have just
conditionals.

y =3D x >=3D2 ? __fls(x - 1) / 2 + 1 : 0;


--
With Best Regards,
Andy Shevchenko

