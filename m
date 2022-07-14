Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F911C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoEUqCQ0HzWcRS/EEisE9qpbq5xcTJ7+l4FqGraIDiM=; b=3FB37nWe27nVj18msCd3ILVPJG
	XNmRjrZ9UCgRIBc9BESUcKKwCgcZKLnh0bh6gpQLJQm8RpZ29mJ9h3jqohbSdvOfQnG8OZijhjDgf
	9uXcQb1A7Pw6QsGq5qaWHQ+FxYdGtU4VBz+U2QMDg2Lo2HpFfwLL3a5sa4OpyBUJSL6KwOIvATkDM
	FBa5GblL2jjK0qci3l6DV5zM4gt+P4l4uP/dRfImORibMzakG1ka6zZRWzNNmPJ3zgzTemwvkS8sU
	I0/j/YXLpfupEriTpKyII7/NdpOvFdIMTnfbEdyDkqVpH0S3rGRHzJ90L9Gjv0s537Ra1GUbaEZFF
	0duusoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBv8c-00Cpli-E8; Thu, 14 Jul 2022 09:28:02 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBv8M-00Cpd0-EA; Thu, 14 Jul 2022 09:27:47 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31d85f82f0bso10877907b3.7;
        Thu, 14 Jul 2022 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eoEUqCQ0HzWcRS/EEisE9qpbq5xcTJ7+l4FqGraIDiM=;
        b=Ld+ADuIcLOILCqHSVmutQbx0yNCzFYK+d1CfgjosNRjzv4la0za1LrNxPVbXKyGrBU
         plEeNvs9LuKtBpdK2m8TdIf5+YpouBnaZ9Vsy9DWCZQPgh7oBlkDpas1TKNSR2vAuZ/m
         ORq+hpDzjNbMh57lvUku8daA4iIIz1ZvXj/KjuJUO8f4GYx3HxMDS3SJKg0sxPO5bA1n
         KdTdyIG7yt7UXNPxNXnsFgVEMla/Hw7WsDWj9pGpxJIEBu4dM2YsIkBZZHbP1tv7Iw1s
         /UceXFWGcqnbfJelCGnMi9F2w99ZJ8EasltdyIOX+aD94fVjhuHVUAYCDxWNBrPm1xlZ
         NyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eoEUqCQ0HzWcRS/EEisE9qpbq5xcTJ7+l4FqGraIDiM=;
        b=f4rMOfQP7DhadlVXT6m1MPignCheVP9eqZYsQLtcmsda1SaV43q1cqMgEqjSjzbJMP
         qF9BOAlIrvzzhRc1DCgNh/ERSUsMMPmbZ2KWmq+vVyQUbbTo6VCbD6ueWGArGWSoWod8
         MZWlq3MTzKI1EohEW/OqTkD3gNWgamUNbgOfx+WmXcpIJQ5hbLkYx13n1OvSl+t+Logy
         NeJEkrO0dVYiChOcwR5v2Mrae4rZIj3IyYQ87zqtypYL+M+8krm01Fw8Hs2QNs1BQu+S
         Mx5FAM4Oql0WdZEXpN3R7X9h/3TNK24a3hLIwDYNcCKEYMGXbYl8atYZnAIy4vtgi9Cu
         DcMQ==
X-Gm-Message-State: AJIora8txgI44nEh6j6UOnp7N98/wVoi291XaMQCsRTxd56WzqDVisNz
	KmO8iUIjVUjnoEH8mXhBZSMOLs93lVc+e3m4Fkg=
X-Google-Smtp-Source: AGRyM1vfgn4gESJkQheSbCNETjn+vwZk7ww5qzlDRalqVBynMRD8SYo6G8iLMHpByXaVRHoDkU+ZiCki5RU9ApOFE6k=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr8841348ywc.520.1657790864413; Thu, 14
 Jul 2022 02:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com> <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
In-Reply-To: <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 11:27:07 +0200
Message-ID: <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220714_022746_500084_E2970AEC 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=
=E6=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wr=
ote:

Please, once again, remove unneeded context when replying!
^^^^^^^

...

> > > > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val))=
 + 1) >> 1;
> > > >
> > > > Isn't something closer to get_order() or fls()?
> > >
> > > I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> > > this change is meet your expectations??
> >
> > Nope. Try again. What about fls()?
>
> I have tried two methods so far, as follows
> -------------------------------------------------------------
> /*
>  * prop_val =3D  1      -->  1 steps --> b'00
>  * prop_val =3D  2 ~  4 -->  4 steps --> b'01
>  * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
>  * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
> */

So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
Now, consider x - 1:
0  ( 0 ) --> 0
1  (2^0) --> 1
4  (2^2) --> 2
16 (2^4) --> 3
64 (2^6) --> ? (but let's consider that the range has been checked already)

Since we take the lower limit, it means ffs():

  y =3D (ffs(x - 1) + 1) / 2;

Does it work for you?

> // 1. use fls() and ffs() combination
> prop_val =3D ffs(prop_val) =3D=3D fls(prop_val) ? fls(prop_val) >> 1 :
> (fls(prop_val) + 1) >> 1;
>
> // 2. use one line for-loop, but without fls()
> for (i =3D --prop_val, prop_val =3D 0; i >> 2 * prop_val !=3D 0; prop_val=
++);
> -------------------------------------------------------------
> Do these changes meet your expectations??

No, this is ugly. Yes, I understand that a bit arithmetics is hard...

--=20
With Best Regards,
Andy Shevchenko

