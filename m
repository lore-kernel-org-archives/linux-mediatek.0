Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA37C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtOpygRybRdTgryIFngZaRO49/uV1PlMUt6BGCDduIA=; b=y0K+uzDjGMo5f9
	oXZugBX6P35LmuqWoGKshy3ALYKHavRUuMlDS6tA//mkfY8A7FbtX724B8IarDrRn9ZxwwUvMc77H
	w4L/EKPMamWOFoscrfkuv8jVb8LwoSmFnqpXqtvmg5nqAJ/teu65NE08XWrHsuK+OWHVaQDtHa7PM
	2chP7vluut0eIhXEOOOhfsOKGiSAhQ7MV3XncJFbuKEa2mHPMQNCCety/epLxFY0h9u3Q9ApeKqvq
	x0YbHErt7keZSMKWBadHLc6bBuJ74X2oi841nfH3V57U7SzyvFRkorT8d55e1e/aNi3v0bD+NBn8J
	yCp7Mu48aSJ2IevzR0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC4P-00DNZg-KG; Mon, 06 Mar 2023 14:44:09 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBVC-00D4Q9-KQ; Mon, 06 Mar 2023 14:07:48 +0000
Received: by mail-ot1-x330.google.com with SMTP id a4-20020a056830008400b0069432af1380so5342407oto.13;
        Mon, 06 Mar 2023 06:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678111664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtOpygRybRdTgryIFngZaRO49/uV1PlMUt6BGCDduIA=;
        b=GwOipbKq7AzZLovFhdCldB570JfDMW5z8v/OcUY/hVyl4bcuwX/4Y7hPIgAmjLNfQJ
         nBEF2xG6Xzs5G9ZCE/6XFUJ9dwIXrigoL9D8Q5+un1AMIV3R1f44Z/AeJ+mI1zOCUkza
         fiZ6hMopIeoKBHe/1AhfPQD3Nq2wmXiMXysVAoZBC9CZcZPM9zqB/+TnLy2tQVrv4mii
         gil7J/3NfXQ+HUvnx0JLVPbv4goaDAmcrzIZS14P3JhEc8LsF02Sjnkpxb/3g1Lz/oXe
         S10DM13WigY4nmIiR5sH3hHAJn/+gf99esve4YTTE1YGDNegIlsPKSB6va8bkmGs2xJs
         3oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtOpygRybRdTgryIFngZaRO49/uV1PlMUt6BGCDduIA=;
        b=EADYptOTAUvM0yhGjXwtrLybb8wTrKj+odo4ZxXsozj6sZzH0lWrnuJzQYNinYh/9h
         i9DUnJiTzxAzXT1BvEVo0S4phQW8caikJajB3QzhdJ5oxy5FRn7NLHS9FbUZGIE5Ubtr
         HoEi2sWRJjvtkHb1EgIWKKekROksLpEYn7+zEkz887YQTB+s+ibEoWys3G2pf3dUau5d
         kgZtUCseJ+aRdVxoQBOsQs+CT5AH38A+IKpp68yO1q0sPcH4grh3QQPMG9Av/jgj2GBY
         N3DhU9jj9uTLhqQXUtBbZgKpc3dEgMmqUzkYfzWT7SCHHmSc0NtMhgzOuVRL4QH8kHdA
         E+Yg==
X-Gm-Message-State: AO0yUKWOXJqRptAq7FzkgscojV6FPidDfCwx+gWGhMW5MgY/DDKp5jtG
	DNx5K+ESETIHUavOVCyNNVGHK+mrGpjV5jt8syY=
X-Google-Smtp-Source: AK7set/KCnaWsNZQY8Vo3wwDI8I9RVvXKdkU0ZmSZlhpP4gSrDFP3rxyVuwxZ5C+PG6ym4BH6FBPS3rqQKNIkZf8jSk=
X-Received: by 2002:a05:6830:2464:b0:693:d8a3:1f15 with SMTP id
 x36-20020a056830246400b00693d8a31f15mr3284470otr.6.1678111663787; Mon, 06 Mar
 2023 06:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-6-arinc.unal@arinc9.com>
 <CAMhs-H-VGjP32AZc2cuY=Co4iqx8xPtvjr+hMg-haMMFaQzzsg@mail.gmail.com>
 <CAMhs-H8OsG-SEWigimG3fT-SGjZruH-7tnjff198Z2qhb0O=yA@mail.gmail.com>
 <2106f6d0-63cc-4656-1e52-19640994fb43@arinc9.com> <CAMhs-H869pR6CzaWfvf44w-ak+0OCyxnMEEU4kWYpw=C14ShsQ@mail.gmail.com>
 <fc6dc970-5bae-1c27-9473-8c9d90ac79a1@arinc9.com>
In-Reply-To: <fc6dc970-5bae-1c27-9473-8c9d90ac79a1@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 6 Mar 2023 15:07:31 +0100
Message-ID: <CAMhs-H_SryQqCZ3mB_VsO20ZSvKCMR5V9E7wrt+a-kbcqQxsWQ@mail.gmail.com>
Subject: Re: [PATCH 05/20] pinctrl: ralink: move to mediatek as mtmips
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060746_729505_BB63C34B 
X-CRM114-Status: GOOD (  42.25  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 3:18 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9=
.com> wrote:
>
> Heyo,
>
> On 3.03.2023 13:57, Sergio Paracuellos wrote:
> > Hi Ar=C4=B1n=C3=A7,
> >
> > On Fri, Mar 3, 2023 at 9:16 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@ar=
inc9.com> wrote:
> >>
> >> Hey Sergio,
> >>
> >> On 3.03.2023 09:34, Sergio Paracuellos wrote:
> >>> On Fri, Mar 3, 2023 at 7:17 AM Sergio Paracuellos
> >>> <sergio.paracuellos@gmail.com> wrote:
> >>>>
> >>>>    Hi Ar=C4=B1n=C3=A7,
> >>>>
> >>>> On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
> >>>>>
> >>>>> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>>
> >>>>> This platform from Ralink was acquired by MediaTek in 2011. Then, M=
ediaTek
> >>>>> introduced new SoCs which utilise this platform. Move the driver to
> >>>>> mediatek pinctrl directory. Rename the ralink core driver to mtmips=
.
> >>>>>
> >>>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>> ---
> >>>>>    drivers/pinctrl/Kconfig                       |  1 -
> >>>>>    drivers/pinctrl/Makefile                      |  1 -
> >>>>>    drivers/pinctrl/mediatek/Kconfig              | 51 ++++++++++-
> >>>>>    drivers/pinctrl/mediatek/Makefile             | 63 +++++++------
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-mt7620.c     | 34 +++----
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-mt7621.c     | 30 +++----
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-mt76x8.c     | 60 ++++++-----=
--
> >>>>>    .../pinctrl-mtmips.c}                         | 90 +++++++++----=
------
> >>>>>    .../pinctrl-mtmips.h}                         | 16 ++--
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-rt2880.c     | 20 ++---
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-rt305x.c     | 44 ++++-----
> >>>>>    .../{ralink =3D> mediatek}/pinctrl-rt3883.c     | 28 +++---
> >>>>>    drivers/pinctrl/ralink/Kconfig                | 40 ---------
> >>>>>    drivers/pinctrl/ralink/Makefile               |  9 --
> >>>>>    14 files changed, 246 insertions(+), 241 deletions(-)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-mt7620.c (=
81%)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-mt7621.c (=
80%)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-mt76x8.c (=
81%)
> >>>>>    rename drivers/pinctrl/{ralink/pinctrl-ralink.c =3D> mediatek/pi=
nctrl-mtmips.c} (74%)
> >>>>>    rename drivers/pinctrl/{ralink/pinctrl-ralink.h =3D> mediatek/pi=
nctrl-mtmips.h} (75%)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-rt2880.c (=
71%)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-rt305x.c (=
75%)
> >>>>>    rename drivers/pinctrl/{ralink =3D> mediatek}/pinctrl-rt3883.c (=
80%)
> >>>>>    delete mode 100644 drivers/pinctrl/ralink/Kconfig
> >>>>>    delete mode 100644 drivers/pinctrl/ralink/Makefile
> >>>>>
> >>>>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> >>>>> index dcb53c4a9584..8a6012770640 100644
> >>>>> --- a/drivers/pinctrl/Kconfig
> >>>>> +++ b/drivers/pinctrl/Kconfig
> >>>>> @@ -537,7 +537,6 @@ source "drivers/pinctrl/nomadik/Kconfig"
> >>>>>    source "drivers/pinctrl/nuvoton/Kconfig"
> >>>>>    source "drivers/pinctrl/pxa/Kconfig"
> >>>>>    source "drivers/pinctrl/qcom/Kconfig"
> >>>>> -source "drivers/pinctrl/ralink/Kconfig"
> >>>>>    source "drivers/pinctrl/renesas/Kconfig"
> >>>>>    source "drivers/pinctrl/samsung/Kconfig"
> >>>>>    source "drivers/pinctrl/spear/Kconfig"
> >>>>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> >>>>> index d5939840bb2a..ada6ed1d4e91 100644
> >>>>> --- a/drivers/pinctrl/Makefile
> >>>>> +++ b/drivers/pinctrl/Makefile
> >>>>> @@ -66,7 +66,6 @@ obj-y                         +=3D nomadik/
> >>>>>    obj-y                          +=3D nuvoton/
> >>>>>    obj-$(CONFIG_PINCTRL_PXA)      +=3D pxa/
> >>>>>    obj-$(CONFIG_ARCH_QCOM)                +=3D qcom/
> >>>>> -obj-$(CONFIG_PINCTRL_RALINK)   +=3D ralink/
> >>>>>    obj-$(CONFIG_PINCTRL_RENESAS)  +=3D renesas/
> >>>>>    obj-$(CONFIG_PINCTRL_SAMSUNG)  +=3D samsung/
> >>>>>    obj-$(CONFIG_PINCTRL_SPEAR)    +=3D spear/
> >>>>> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/med=
iatek/Kconfig
> >>>>> index a71874fed3d6..2eeb55010563 100644
> >>>>> --- a/drivers/pinctrl/mediatek/Kconfig
> >>>>> +++ b/drivers/pinctrl/mediatek/Kconfig
> >>>>> @@ -1,6 +1,6 @@
> >>>>>    # SPDX-License-Identifier: GPL-2.0-only
> >>>>>    menu "MediaTek pinctrl drivers"
> >>>>> -       depends on ARCH_MEDIATEK || COMPILE_TEST
> >>>>> +       depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
> >>>>>
> >>>>>    config EINT_MTK
> >>>>>           tristate "MediaTek External Interrupt Support"
> >>>>> @@ -22,6 +22,12 @@ config PINCTRL_MTK
> >>>>>    config PINCTRL_MTK_V2
> >>>>>           tristate
> >>>>>
> >>>>> +config PINCTRL_MTK_MTMIPS
> >>>>> +       bool
> >>>>> +       depends on RALINK
> >>>>> +       select PINMUX
> >>>>> +       select GENERIC_PINCONF
> >>>>> +
> >>>>>    config PINCTRL_MTK_MOORE
> >>>>>           bool
> >>>>>           depends on OF
> >>>>> @@ -43,6 +49,49 @@ config PINCTRL_MTK_PARIS
> >>>>>           select OF_GPIO
> >>>>>           select PINCTRL_MTK_V2
> >>>>>
> >>>>> +# For MIPS SoCs
> >>>>> +config PINCTRL_MT7620
> >>>>> +       bool "MediaTek MT7620 pin control"
> >>>>> +       depends on SOC_MT7620 || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_MT7620
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>> +config PINCTRL_MT7621
> >>>>> +       bool "MediaTek MT7621 pin control"
> >>>>> +       depends on SOC_MT7621 || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_MT7621
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>> +config PINCTRL_MT76X8
> >>>>> +       bool "MediaTek MT76X8 pin control"
> >>>>> +       depends on SOC_MT7620 || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_MT7620
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>> +config PINCTRL_RT2880
> >>>>> +       bool "Ralink RT2880 pin control"
> >>>>> +       depends on SOC_RT288X || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_RT288X
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>> +config PINCTRL_RT305X
> >>>>> +       bool "Ralink RT305X pin control"
> >>>>> +       depends on SOC_RT305X || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_RT305X
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>> +config PINCTRL_RT3883
> >>>>> +       bool "Ralink RT3883 pin control"
> >>>>> +       depends on SOC_RT3883 || COMPILE_TEST
> >>>>> +       depends on RALINK
> >>>>> +       default SOC_RT3883
> >>>>> +       select PINCTRL_MTK_MTMIPS
> >>>>> +
> >>>>
> >>>> I am not a Kconfig expert at all but...
> >>>>
> >>>> Should not all of these be depends on SOC_XXX || (COMPILE_TEST &&
> >>>> RALINK) and avoid the " depends on RALINK" next line in all of them?
> >>
> >> This seems to do the same thing but I'm following the "either change
> >> them all or fit into the crowd" ideology.
> >>
> >>>>
> >>>> Just asking since we have yet arch read and write register operation=
s
> >>>> in pinctrl common ralink code. Having in this way, when we address
> >>>> this arch thing  in the next series just removing the "&& RALINK" pa=
rt
> >>>> makes the review pretty obvious.
> >>
> >> You'd have to change RALINK with OF since we're still depending on tha=
t.
> >> RALINK selects OF by default so it's currently a hidden dependency.
> >>
> >>>>
> >>>> Other than that, changes look good to me.
> >>>
> >>> I think "depends on SOC_XXX || (COMPILE_TEST && MIPS)" would work als=
o
> >>> and might be more accurate for compile testing targets.
> >
> > Are you sure? SOC_XXX here is already being enabled only if RALINK is
> > already enabled, right? [0]
>
> I'm not sure who's your reply to, or what it's about here.

Bad insertion between lines, sorry :). I was just trying to explain to
you that SOC_RTXX ralink stuff is only available when RALINK is
already selected.

>
> >
> >>
> >> This is not OK in both cases. If the driver is dependent on Ralink
> >> architecture code, choosing any other MIPS platform will make the driv=
er
> >> available to compile, which will fail.
> >
> > SOC_XXX is already dependent on RALINK for real uses but the driver is
> > going to be selected for other MIPS platforms only for COMPILE_TEST
> > targets. Ideally drivers should be arch agnostic so can be selected
> > for any single arch build. Now we have arch dependent read and write
> > calls in the code, so you need the right headers to be properly found
> > to be able to compile testing. I think MIPS is enough dependency here
> > to properly find them. But if not, this should be (COMPILE_TEST &&
> > RALINK)
>
> I expect below to work without requiring the MIPS option.
>
> ifeq ($(CONFIG_COMPILE_TEST),y)
> CFLAGS_pinctrl-mtmips.o         +=3D -I$(srctree)/arch/mips/include
> endif

Yes, this will work but won't be necessary at all when we get rid of
ralink arch dependent code in the next series.

>
> >
> >>
> >> If the driver is independent of Ralink architecture code, you're
> >> limiting the driver to be compiled only when a MIPS platform is select=
ed.
> >
> > So... how are you planning to allow compile testing of the driver in
> > any single arch when we get rid of all the arch dependent code? If you
> > make everything dependent on RALINK you cannot.
>
> I intend to make it dependent on OF, not RALINK.

Ok, I see, thanks for clarification.

>
> Ar=C4=B1n=C3=A7

Best regards,
    Sergio Paracuellos

