Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C7C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yr8CMeCeO4ZhWVxQDfJ98/DRbmLx7FFVRYE94TKtodA=; b=OZDDR6a3X1UhQmh3qMNs4KPwtf
	5QeClaHrZVs06YdHpxX8rjjLOmZHOTHHayIVLIEduslTsRd9H3JRO9ivVkKhqLjlk8zkU2hyvU3Au
	JqdgGu5tHHCVkuGwTdWzhA4Y80NYuDQxAlNYGn63Y18o0SIGX+3wI8li45lrVTAu3PbNbUc+KuY2e
	VrxumiGCytNgysVoPmwKdaGURWiUNbTWk9dOblbs6/8A45SI62RWIq/D7vfce0XPvmAc8mCBXFTsH
	GJ+XNSQHviNPm8ZGF1yzSIf24v2YPXriEE0y3BMog/088JzA/pum4BaJ/9m3OLlkMpRrvs7lR2spq
	QpCFn8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prL3Z-001aJm-03;
	Tue, 25 Apr 2023 15:58:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prL3T-001aIP-37;
	Tue, 25 Apr 2023 15:58:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2FD046283A;
	Tue, 25 Apr 2023 15:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173C0C433A0;
	Tue, 25 Apr 2023 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682438290;
	bh=itrfj1uL7ULKhIO/qSGGwopdMhHtcuGv7fowY1MDPYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EgTh2lVlpMtQ5px5R+jV+EfXPM/vMd0vZZcesoDR/dZgys7DryqsRrWS2pdpS9uas
	 OYd9yTEmElOVrIZbn0OqVscAcdbafdiKbG9xGY95F+dXOVKPpAW5UFqkaPFQaikMgo
	 aWZCYgp15j+P/IiGD62g++flweL1qEmmRIyA46J9ZxdgcgQr67x7Q3TlACfNIAqEWA
	 ybnHZqICC3N6Bh2h/8vZ/QwOp/oM5lTZZiMl9J1LI5jXGxCqVcLQ5wSHavpOM+9lzJ
	 GcWe9oPB1zz3J6OXPcR6ftsIf9jN3vnmyzPm8qTrcAX6jvM8Z/Yhdc9tzdb3LHV6hX
	 cc5h5IH4H4Nww==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b8f510fecf4so8839268276.1;
        Tue, 25 Apr 2023 08:58:10 -0700 (PDT)
X-Gm-Message-State: AAQBX9fz2nGyqAUxkQ0hr9HgOL6ucWUEAxzqBJqR8q4f7JS6dguCMOZA
	ixgwdw78LvSf9N3RYeQl9M5ZJDpBPdmdK3YSzA==
X-Google-Smtp-Source: AKy350bpts/PPga3+dzd9vak+rbAaLdXpa4DHHS4UXvr1kLSlKfqR897O6l7AESMOVdvAuhJNuLkwu1gSc/085IiOR0=
X-Received: by 2002:a25:b097:0:b0:b97:f46:a2b8 with SMTP id
 f23-20020a25b097000000b00b970f46a2b8mr12284894ybj.17.1682438288965; Tue, 25
 Apr 2023 08:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Apr 2023 10:57:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_085812_078159_8B3053D2 
X-CRM114-Status: GOOD (  17.76  )
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

On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.org>=
 wrote:
> > I have a script[1] that does the conversion written the last time this
> > came up. Just have to agree on directory names. I think the easiest
> > would be for Arnd/Olof to run it at the end of a merge window before
> > rc1.
>
> "emev2" and "sh7" are missing for renesas.

No doubt it's been bitrotting (or I may have missed some).

> Does your script also cater for .dts files not matching any pattern,
> but including a .dtsi file that does match a pattern?

I assume I built everything after moving, but maybe not...

That's all just "details". First, we need agreement on a) moving
things to subdirs and b) doing it 1-by-1 or all at once. So far we've
been stuck on a) for being 'too much churn'.

One nice thing with subdirs is 'make CHECK_DTBS=3Dy
arch/arm/boot/dts/foo/' can build everything for a platform family
without having to mess with the kconfig. Maybe most folks don't care,
but I do. My CI job running schema checks looks like this to deal with
grouping the arm dts files (this list is probably out of date too, but
less so):

        if [ "$ARCH" =3D "arm" ]; then
            VENDOR_LIST=3D"alphascale alpine artpec aspeed axm bcm cx9
(ecx|highbank) \
              efm ep7 imx1 imx23 imx28 imx27 imx5 imx6 imx7 ls vf qcom \
              (am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motoro=
la-cpcap|da|dm)
\
              nspire armada dove kirkwood orion mvebu mmp2 berlin pxa
(arm-|integ|mps|ve) \
              (at91|sama|usb_|tny_|mpa1600|animeo_ip|aks-cdu|ethernut5|evk-=
pro3|pm9g45|ge86)
\
              exynos s3c s5p gemini (hisi|hi3|hip) mt meson moxa nuvo
lpc owl ox8 \
              (r7|r8|r9|emev2|sh73a|gr-|iwg) (rk|rv11) socfpga stm
(sti|st-pin) ste \
              spear (sun|axp) tegra uniph (vt8500|wm8) xen zynq"
        else
            VENDOR_LIST=3D$(ls arch/$ARCH/boot/dts/ | xargs)
        fi

Rob

