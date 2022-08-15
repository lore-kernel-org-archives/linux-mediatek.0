Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563AC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFs3HBZ2sYo5B0KlYg3UGKXoZhke/2HXpu3Qn6wXDmk=; b=4RF5n2rpVZqNzF8PzEajCUbp16
	UqC3TpUhnqA1e0aT3oO7+iL1mRyPXPlskp6nmEQzxTqMkykPCvjiKbgdIwUsEYOgp8a2KbIyIXp2O
	V9C2z39sIvpU6cW+eg1ZkcWfnCqkIbzIf5cKKK9s1OGs561MLwLrkm2Hfm6CZvJIOVpXv9VztIP+R
	CNmOMdzAxlY7EZofGE5v9cKr3o389GiSWrnCN1jtZTsKnjrzGKcpAdtJqfFe+iant7Pi62cmSsdC1
	UxfQ0kjs3JavWxC8LZGxUji5bEFwV0lpfWYQgm/FkblrmFj5yYphGDbnf4gq48uQEGwrhIdIB54kK
	CBXLgTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg9A-004MGq-97; Mon, 15 Aug 2022 19:53:12 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg96-004MAe-3Y; Mon, 15 Aug 2022 19:53:09 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MG9c4-1o9Mnl2RrA-00GWuz; Mon, 15 Aug 2022 21:53:05 +0200
Received: by mail-ej1-f47.google.com with SMTP id fy5so15281302ejc.3;
        Mon, 15 Aug 2022 12:53:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo0VN+ARzDJQ3XkOJbtucnMnB4wQdxPv5q9l/j+yxyMTnQSiIMvu
	JVVoOUwXnhx4U6CV9szrdUBpX91jgxyhiXzNFZQ=
X-Google-Smtp-Source: AA6agR6WukBGcfTJVUl5CIbKuxExURcZy41XrLH6cR4WZu9dKLWxqz0LIbjhFDRnvnzwIquLGWfm92gIJBXogAGXdQo=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr11372637ejc.766.1660593185195; Mon, 15
 Aug 2022 12:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164235.40293-1-f.fainelli@gmail.com> <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
 <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org> <CAMuHMdWDDY_72y3WYt401hG122xg1s7_VRCG9Vyhhkzco-nBYw@mail.gmail.com>
 <fb4f4444-20c2-0e35-bb83-79a419ec87a7@gmail.com> <f4adf05b-d3da-a692-3bd8-0b4d705e0dc2@gmail.com>
In-Reply-To: <f4adf05b-d3da-a692-3bd8-0b4d705e0dc2@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 21:52:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0R7tL0+saXK-+pHUfT=ZsmOVr6LEecn40e+OSUtZAWLw@mail.gmail.com>
Message-ID: <CAK8P3a0R7tL0+saXK-+pHUfT=ZsmOVr6LEecn40e+OSUtZAWLw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, william.zhang@broadcom.com, 
	anand.gore@broadcom.com, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Matthias Brugger <mbrugger@suse.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4i5P9KTi82dRV2RXeslF02kSwCeaf2KhTskbuBgGc4LHQiFc9Q8
 yFQrTAKdkr9ktr8M5nKQ1pUtLhvLEdTU68hjp86J0sxzTvLS63gJwJx2ZwxKYnvZQoLk2jf
 cuFsTDKj6719TtqHTlRWLt4k7C1K+EzBtsucCvZQsfxo1iuMDCNUFGEkG/XwnjITvPEe6eu
 VpSuyIhRx1EnUY3yPY+3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pe73b2HhoW0=:zyhenjFHjpVe/3S08a5obJ
 QDWWeH/KJkH4va96JYZxGNa+X24TGVQh9Ybre7KxLDfCQW0i+vwgK2k8NcSQyo4gCnHwQxZ4m
 i8z/dKVVjk6EPhrYZs4uaE4EB/5VxD9Sd+69dlZ+DT6yT0FdI5NI1iS3G0lg+mx1kehXdVTqm
 V9giT627NCQvofq/Qxww0Pbnn8/DCO9WroYT3+bjusQ0Pg+ZkIArSNBA8oLW7oUKuh+KhCjEy
 MXv1zv7qQ8khbrKri5x+dzWoLAwaPHM4+OOLFxaIBKGvXFkeRkUBb4sgmRW+cXWNOlwukdn0M
 eYSfS0YO1+zLunPi06klKsCQmX9clFZeForuitWrBgGCVjtHJ8ojttdgQggGQDRvaS61Z3cUh
 qzM26dtJTE7k5dJ5WVyQK2kVIwws29gLwLa+0mh3IGLda2Fn+aK34WKrqQjtduGuqTpSW6BfW
 Djau2Nf/SIIHPlY7ehCdOQd6XV/qqVhDb7qUdYfS82k1dxIv+AX6z8VsccDWfRscNK0vd7zDs
 X3oGlmNqUbky6E3w5XpfYXnPnwul1ALyZ+0O01D7uOrMHL7jpQI66T4+EEn3UO/Dviz41AZgR
 /OWmXYHgDSP/0rVRiSJzdH3Ugig0KTIhA82nG7H6xDeraMxwCg813cb+w7zfLRbLrkOEgGNVh
 /TIKlL+tMg+kb9cxV8lCoaoVyruK/dwHY9bbZ8Y1dh9562ykg0YqSc92Lia89mi8u6ra+dObW
 2rXHjA0zAG8CVfxl55buZ6PcLmdgCkR7IxSAut7vq7fag/PxAeKnNX/VYKMLfYjUhri0dK4QT
 SC+Y1xOcgqxuPrFgvH5M/4ZDBYSA28wYOb1kqTkIbjLlkSd65wNLdeGsM/uOTXYWcuTZEAKO2
 t45lkzFFYmlaCbPtlqPw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_125308_507586_6B3DDC79 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, Aug 15, 2022 at 7:15 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 7/13/22 15:05, Florian Fainelli wrote:
> > On 7/13/22 02:17, Geert Uytterhoeven wrote:
> >
> > The itch that I wanted to calm was that ARCH_BRCMSTB was after the other
> > Broadcom platforms separated by ARCH_BERLIN. if you prefer a pair of
> > KConfig comments to delineate them and flatten the platform selection,
> > that works for me, too.
>
> There are 2 Marvell-based platforms (Berlin and mvebu) as well as two
> NXP-based platforms (MXC and S32), would it be better to also group them
> under an ARCH_MARVELL and ARCH_NXP menuconfig symbol the same way this
> patch does it for Broadcom-based SoCs?

Berlin is now Synaptics after Marvell sold them the business unit, so that one
should probably stay separate. For NXP, there is also Layerscape. I
agree it would
be nice to group the three NXP together.

        Arnd

