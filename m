Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DB9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0pHXTN5UXRyh8g53m06aJ1O4pdRE+ZlKdzDpUzPXnA=; b=xVFfE1OWX3JBFrWsRQ5obPlLqn
	w4NCvSaqtaUNgnG2sj86/kXHBVPZ6JojbuZ7950a07bjdPUjsHtIbQMziHoKBvAdpLhTqf7ZUbmsz
	tWQpNGTpjpetgifI3Hg2B9rSQGLJUd8TNCssuqA8whf5EwLkTmKKVm2tBUO/sTfAkzmdH4iJ8En0M
	yCZAVlbrhSjzecmHM8yiz+V2ZQlvZberN3jZcRJ8QBWeazWvR4hu9tvEuicpsmenSCihK02yRGijI
	RyXYNioc8MEUQGm8JwbwXV3D4d5TH6HfEKmHjgQp4tAt0Wz/C8EH3RupsSvKKjjD8VY89OufZIL/c
	sMektDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouz8i-00DEht-L2; Tue, 15 Nov 2022 16:50:24 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouz8f-00DEek-6U; Tue, 15 Nov 2022 16:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668531009;
	bh=8KBr+dIwP/E3nNmJhfiOtBZ1JSdlPyiU8UUhwKa1DSs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qOrFoIcZd8TjeDnJMhYqAJrSVirE4ig1f8tkGTZeV7s4nLlfwNpLhrPKgB2tIa5F+
	 KUnSgPvx67kWVZF3ykn/VtwSVYpTsYm/bZ8ZcvW49J74zNcJSn1eMrM0+FudsjbimW
	 6Bm2WtmBrvPoorwfiAh1W+AZ6wUt49YxlvJjcMufpCiCPCq7cGx00khkPR9hzPlncb
	 u1XJ33Wb1RjbwJlJfQO2svUSzaG+2A+UkRy8a7WFj6eMssVWz9rveTXm6TTkWbmbLJ
	 T9CcN6PcMZBApL3InbW75d98eBRUEYDB8OTnXvbGsrZZPikw5ByBeElqsi9SdiLVmA
	 4Lem90/JQuFLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.148.186] ([217.61.148.186]) by web-mail.gmx.net
 (3c-app-gmx-bs03.server.lan [172.19.170.52]) (via HTTP); Tue, 15 Nov 2022
 17:50:09 +0100
MIME-Version: 1.0
Message-ID: <trinity-8aa3b798-0819-43e6-beef-f04dd821b664-1668531009359@3c-app-gmx-bs03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [RFC v3 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor
 overlays
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Nov 2022 17:50:09 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <5ece2b19-cbc7-5ecf-c29a-8f0258f260f4@gmail.com>
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-12-linux@fw-web.de>
 <5ece2b19-cbc7-5ecf-c29a-8f0258f260f4@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:SQl+29+ImbUvKrSPHRXSWUbo2yuDKo4wgq4m9hI8/KdxHmt0dogqarVIDiBshOyUXu6KS
 PVlVkWH6vY85K4YqnQXo2XT5Y3b3MLWUsTTXAZorsBUMVCfJGv80gM0vdUzA0G5wNbhWH8S4RFa3
 xNHO8TVrsCFDhdGCQoxzMGA9MIpgblcJWWK4IlpLN9li2e6seCu5fLwYVwfsyt/rCa1h9F5IV5mM
 AXdg15jEhGJ512Ne6Wrw5i2PpexmhPHrvzieQbd397gnvz5L6868jlRWij68CNycqRrNZQZUCCxG
 TQ=
UI-OutboundReport: notjunk:1;M01:P0:mgoznSFtpkg=;qZru3duK4QSUWnNUEd/j4FW8s7z
 edoRdzgUFm8wr6wNkYtomyHg/m60LnXYJ9/xoSmPYjER8U9qCMkmt7m8v88O6AEQ60V0dWyet
 NA/YlkLL5w7n19/QqKBg9cZ887F4/1SLyfH3yXKviNTGcCFfmlQgr3LEozE7otAmJPSJci30i
 facc5D63urBbv1cs68BxsfcGWr8dVF/vvSev1C35090PUJ5+Kao25OppMqGJi6MmUJosAv8O9
 wNx87WAjjRQjI8QLkVBb0xinAvihij2RQoVwzdQtY/5Uhs1gQDmTOqHpvLQ0kYhCy3vtvTeDz
 xapdJzZ4phJ0J4THheYYlGUJ2MYlZ5WXoXbe7EFP2XHoaAMbNEmvBz4mRljHepi+YzQhQnR3h
 6aogZwbh1y8MIX7kcDLwZyosJTZ9efJZqvXrErB0TZLPNrzNRRZUCOIPv4MCPAH+dv/fCHsog
 239+fAv9FoYTdZm9McbJWIm2Kv7llKTTM2ltWKP39I7rwZNOmaiGx55NQJal+pGgmwFbIBxtb
 Jw5KGSTWH1oyBjqlL4DRpbnVHZqH9tjXn8z9JuPW6u/h9enb9KRidp4v88qHoa23XmB5p3mCI
 ru9Xt+h+yQ92jX2ZCbZ5CN6VmZyW/IWFQYQDe2jxXj6TLfnGkFeXaKgvlHQQ0QmZS6fIfP48j
 HymSdaiiSBmZGOMvVjjMPVIRfvsuR/z+85052gIfx7FXvUWBFCF36Ihb3g0eYPndYDWIML4wG
 ZHigqdfpk6W2+frrOqmOHHtlUIHzv2/xl1VLgctEuVpEmTZ8wQjLDyzug08VCfQlGWnObOM8F
 /QWuP/yKK/9ZUg/9ziLUnvDw==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_085021_648829_10311274 
X-CRM114-Status: GOOD (  19.14  )
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

Hi


> Gesendet: Freitag, 11. November 2022 um 10:16 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> An: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead=
.org, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof=
.kozlowski+dt@linaro.org>
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, linux-arm-kernel@lists=
.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
> Betreff: Re: [RFC v3 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor over=
lays
>
> Rob, Krzysztof,
>
> On 06/11/2022 09:50, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add devicetree overlays for using nand and nor on BPI-R3.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
> >   .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 53 +++++++++++++++
> >   .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 67 +++++++++++++++++=
++
> >   3 files changed, 122 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi=
-r3-nand.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi=
-r3-nor.dts
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/d=
ts/mediatek/Makefile
> > index e8902f2cc58f..d42208c4090d 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
>
> Do we allow the inclusion of overlays in the kernel?
> I don't think so. I see there are some dtbos for some freescale platform=
s, but I
> wasn't aware that we support that. I thought it is all about dtsi includ=
es.
>
> @frank In any case we would need to apply these overlays to some base bo=
ard to
> create a valis dtb.

yes of course, the "base board" is either the sd or the emmc fdt i added 1=
 patch before.
This way it allows all 4 combinations (sd+nand, sd+nor, emmc+nand, emmc+no=
r).

as i pointed in v4 of this Patch there is a commit in robs tree allow buil=
ding dt overlays
from dtso-files...

"kbuild: Allow DTB overlays to built from .dtso named source files"
    https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/=
?h=3Ddt/next&id=3D363547d2191cbc32ca954ba75d72908712398ff2

maybe this is the right way to go (rename my current dts to dtso)?

> Regards,
> Matthias

regards Frank

