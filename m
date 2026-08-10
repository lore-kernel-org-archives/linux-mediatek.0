Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1B7C5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=; b=mP+r1oHnMWourFd+jaNoB8D/g/
	/ufwgpNB000U/b12L0AtvHwMuMIggUl6vx/PtBU02S6YX8CpcbITUMMHigo8yIlgvrzTX+y9xx54P
	FgRPg5tCKrq6Iy7l2UgRh9pVUCNbRWhKOTCI4NMUNmaFb/pJOxCv1ZOp3XYyUXmMGaPS5/CPmjo9H
	/ZVb9ydvPPFdG/cmAWonk5iosGK27EvrIA4NIvdirXL4rDMgtAd6tUtnuX9XNHsvPEhGOAgVvzagd
	ThCHrORt+42DHfJyBNVMR3bDmCXubdVnQ9oDHz5TRdCrAp8KHJ/NzNE3da7EecDyxgyTZErHPF/Vd
	zU04QJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfV-0000000BYYF-2dqF;
	Mon, 10 Aug 2026 10:55:45 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfS-0000000BYWV-30XN
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 10:55:44 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8f256eaedf8so15923686d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786359341; cv=none;
        d=google.com; s=arc-20260327;
        b=DSmrlC1kZEBzmAMIskv476Q8saEx7K+2cnSkfhgJbVf/zw/FYI9F44zdS7P5bvSI08
         7lEkdyMw4UZMdEQ/qhwSs/QD8WO+Xnn4bQn8TDyufYCs7PhG2deeMeoHdCw97oGZYjZj
         IGtbhTmIHA0hslkaZb+JY9Wf3DnweU4rePpExbvnW0JMlfedjtb7oIbZTRQRtuTH+LyG
         IXLPhKd/5OhCdw9dCQcODCQl+5g6W/0+R45cs0cIHIiiJjcfGj2uHOmV6hj03gG7c4o8
         q8becqvPOQwJjiDCmDJnRrL6Q+FN5wgLKfVkQpn/M/nZvAg6wvnf2ZyRt1jzv/f4Bp0o
         5/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        fh=P+jf7Ue3OYU/EgSjU8imcI+O1635kKvCPHMC1GyOHyw=;
        b=UzK8P9DFCQSyxiPxKjh7NeoqNDpPF1HLOf2s1gC0V/D22QzlE2kRb9NWLINheOzgBZ
         5t9Qtu9XED0y1Hxxqrz+5ohjN8WNkQcUom/tFN3JAJO3ZfMYmAng7azbkA7qADdY0pMU
         qh/8uUKoJU9/3Qf+lwwDJB1qOqq30NZkXPf6aZKnyYoHMIbZcgbs0xC9LzpyMtLffD2P
         3SPB2IBVZaQiurr1qUMPmYxNnq0O7Lny/KFdxwIq4e1GonGtNFOdlkTuege2a38PYG9/
         HgIWLocUjmrQQjFaK2tpbSs+q6k12/YmZeOx+p/glkY5Q9Q/UBgm+/+6m59koqpxc9kV
         lD5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359341; x=1786964141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        b=rpLS4fBibT0BuvJ3hAZe+wXqZ4ucta2o5kEd9qKyhuh74GYmmXH9JnWqvLm46fnRK6
         zsdCTWiQ982jXY66UL3X+1TglXJfo22hVvvCCMCK1MHmIMPGcpOdHlAjtRch61qjMrGP
         i8GakG/f0sDJ2d0QIkIr0kXl6BWHyqMcbhlc0sHyo3UoSRQimoDkaimhwHXyiy0ZX6Dm
         vFrgY0T5LhfASy1a6H+6s82624CvbF/mD4W08XIa7l1omoEznjUu7vIE7a0GihvQg30d
         vwVEIa8g31o8g//bcOgGwZSdx3PM5Dn5fKDndwjGEKvWmEfBcCscuMX/SIfHvVlz1Rqq
         FLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359341; x=1786964141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        b=ZiXX4uSvCvTR4o1BURFVOhmF5kR/EhysPzHsYsi23PoG9MrhNO6eaREYr2l5BVgotR
         Hu7vAw8ynwnm87BuLy/wXRtcdmeF7cOJX+AgiidXHLB8mrdbRMziofq4YB3DLm2tgdry
         xXy2x0qxfHazqCLoNeVrS+oDb9XGG5lntd1iMTQdCnSGhHpiMID1XaxYmO2Jm36io7DL
         4OCbTwyUi0I0urEEz2kGOGa+UxpD0KBbLTCBQrDwszDW0PWRZuI1AEdvrSTgASlqCRM2
         BndLRBhqC6qcUgGFir9ierrlOAoeTN6UyzXvBCzoOZEqebc41a/YJughbDIe3omp9AzA
         vQFA==
X-Forwarded-Encrypted: i=1; AHgh+RpwMSUZnvdhgn8IS+zBh2yowyBMVNnOj1Zbp73tfGuVnPmwz3NQtJnQjOPY3VdC8lX9FnLNjsyJyDYyP4vSqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG0DnF1T6TBmIDA2WbKl8sK9p6lLa9Uu5tkwxRRXTom2vmj2RJ
	WrdZM3pjmYbn81CY1W08C1n+XPXYYNXwFHEkIvJxOKIxXyde1Ag4b4uer6yUdnheXevgO/6wtIs
	sGPLfEzf+XFMuyWImRURSJjD6fnDTnEs=
X-Gm-Gg: AR+sD13Y+SbtpN74ZPw0KcrM3iDXzCCtUsifalk30HsPWY3HhDohRfsmqRmMFPoROhg
	w8dGmezdtCUCvduxKuB9WU0bPQvswlVphyORJz+ususwk64qFDUPV57IFOXsOlLYorkn2s1XO2H
	am5b6kSgq5HDeVJcKSjJ0vDt5eXhMo5AYYpZrA5axH8AYQb3mLB9/U5IoESZ5nHsjTnjbhk4+Gy
	KpKxnArczKwTNYkI8LyVyUE0O3DNiFo7kKUiDYODOjO0Jvs5SrM2XF8jW7Vrx/YmPWhn6DCssnU
	PbauRSbvQJAhVSYC4wuwT9UOkFyPb8+p0ZWTQ4gJpA==
X-Received: by 2002:a05:6214:2684:b0:908:9fd5:ed42 with SMTP id
 6a1803df08f44-90a34707604mr228548096d6.28.1786359341307; Mon, 10 Aug 2026
 03:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas> <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
In-Reply-To: <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 10 Aug 2026 12:55:28 +0200
X-Gm-Features: AUfX_mybRPX8_wU1Vtkqf_AyjNZAKV0N0JAhtDmUF1bKQ7p9IPinpVnjULwvpq0
Message-ID: <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_035542_780802_7C8E2DF3 
X-CRM114-Status: GOOD (  41.34  )
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

Il giorno lun 10 ago 2026 alle ore 12:33 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:
>
> On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> >
> > On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth=
@gmail.com> wrote:
> > > > This small series introduce support for 2-lanes mode for Airoha AN7=
581
> > >
> > > Just a nitpick, but I would probably name this something else, like
> > > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > > has 2x lanes as a standard feature, so this naming is a bit confusing=
.
> > > It's not like dual-LVDS display in which LVDS is only a single lane.
> >
> > I suggested the "2-lane" and "x2" terminology because I assumed the
> > result is what the PCIe spec would describe as a "x2 Link" consisting
> > of two Lanes.
> >
> > If that's not the case, maybe "cross-controller lane-bonding mode" or
> > "lane stealing" would be more accurate, but I don't know what those
> > mean, so if we use them I would also like to know what the result
> > looks like in standard PCIe terms.
>
> Benjamin pointed out later in the thread that it is just bifurcation.
>

Yes but as me, you, Benjamin and Bjorn people who weren't there with the HW
team at times the SoC was created, and given how the internal documentation
these are just assumption and observation... Everyone can be correct and wr=
ong.

> I would assume "PCIe bifurcation" is a standard term, so maybe we could
> call this "Support un-bifurcated 2-lane operation"?
>

And how coming from PCIe bifurcation to un-bifurcated 2-lane operation keep=
s
the standard meaning?

This terms is equally custom as the previous "cross-controller
lane-bonding mode"
and "lane stealing"

I want to be honest... I'm not following why we are trying in every
way possible to find
a standard meaning for an highly integrated PCIe controller for a vendor So=
C.
It's not like there are devices shipped with PCIe slot where you can
insert whatever
card you want. (there is only a single RFB board but that is really to
debug stuff and
develop)

The SoC is designed to have WiFi cards attached and only a subset of them.
And some of them require 2 lanes mode to work with this special configurati=
on.

Even the DT bindings are not that specific to the details... at the
end of the day
everything is modelled as simple as "num-lanes =3D <2>;"

And that is effectively what the HW gets configured to. If then a
robbery is done
internally to the HW to get the second lane with probably some criminal act=
 and
some murder then those are just details. But unless we have a correct polic=
e
report on that (Documentation) we can't assume someone got shot in the
process.
(sorry for the joke around the stealing thing)

> On the implementation side, having to reach into the second PCIe controll=
er
> is a bit messy :(
>

I can assure you vendor hide all kind of bad stuff behind single register..=
.
It's just Airoha that loves to expose godzillion registers and configure
everything clearly... Something that most of the time is better than hiding
everything behind ATF with SCM commands (or even configure stuff
in bootloader from HW strap)

A bonding solution where 2 controllers are configured and then bonded might
also be problematic as for 2 lanes mode the configuration needs to be done
in the same time segment. (and that would introduce lots of complexity in
both DT and driver for the sake of just having an additional reset and
an additional reg)

Aside from these 2 point... I'm open to any kind of naming and change
but it seems sad to me to delay this feature for these details that would
only affect the commit description and nothing else... This is currently ne=
eded
for Eagle WiFi card to correctly works... With the current code it works bu=
t
sometimes it doesn't as the reset and configuration phase is not well defin=
ed.
This series fix exactly that to have stable functionality (tested on OpenWr=
t
from at least half a year)

> > > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > > normally attached to this SoC that require a 2-line PCIe card to
> > > > correctly work (and give the proper performance)
> > > >
> > > > The first 2 patch address a limitation of the PCIe implementation
> > > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > > all at the same time (for all the 3 PCIe card) with PCIe
> > > > enable and disable.
> > > > The 2 patch address this and introduce correct reset to control
> > > > reset line for the relevant PCIe line.
> > > >
> > > > The last 2 patch add additional logic and support to assert
> > > > and deassert the PERSTOUT and also apply the required configuration
> > > > for 2-lanes mode.
> > > >
> > > > 2-lanes mode is implemented in DT by adding the required property
> > > > and by defining the "num-lanes" to 2.

