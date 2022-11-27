Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436ECC43217
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W89+2CdgTUMOBVrn3bg/H2VrdcCMSu5sxqBQMcoVWN4=; b=1WrpFzlz8gSSsQFH7lLcK1gCQW
	YsnjkF0CxeUUQUUjPVH9+dLMWGOMjI19cTSbn0Qqj7q4SI3Z4ri9/sF02ldz3ko5Ro/70hQTeUxrv
	2LPBCXilqGz2X4NbTkzhrHqjLXOjxD792jXIbNRWcmObey6uS82OHGezb/Gk7yVuGz/nv2RphoRhW
	fzZFeKWmlyAKBmRtBaNwUiWdt172kM07ItNcoRp0dvAmzYT27Wr5xsCUniGg4Ygp6d0WXbQGJFJUR
	LI5YO9aEFHt6IibmGnGLPRcsOEYLmmK2HxgXSZd3wmAnRAx4iwIcKn1CZptjYjVIgSWCK2YfJXF7c
	GUnKZWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozCj1-00ARbN-OU; Sun, 27 Nov 2022 08:09:19 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozCiy-00ARZ4-1l
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 08:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1669536546;
	bh=CHb0AmYGEjJmJoCSyYm7AxM0Fd5Ceja53BlH4o7QehQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kIHVx7bArV+zGjy9XpcPFPZLtdhwbbCBqBobgiqzoyjZcsTu7NqKpWqvbFW9Om9hK
	 J2Iu2HWMw9yRldOizU00BN7gjwYPkuJr7axCoIlLyWyY94iAn+LeDtRBn8yE6A/UAG
	 NqiW7WnIkVedaZqJ7+6SVtMCUEsxfRBEYM41q0P29OnmSJmm09k8xfC3DSUiEW29O3
	 XiXGDMdtkfgZk75w/GTlYcSXpDy4nZxvafgGuAKwlT/aqRr0Xax44pKjmdZlJNmy1i
	 lHi7Ai80MH8mDnrTnzIE2/ODiHIkApqTWAOWhIkcywHEwuWyw1vl4zD3kCiV3TJyYf
	 Bq/Z72WF5zLjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.157.144] ([217.61.157.144]) by web-mail.gmx.net
 (3c-app-gmx-bap05.server.lan [172.19.172.75]) (via HTTP); Sun, 27 Nov 2022
 09:09:06 +0100
MIME-Version: 1.0
Message-ID: <trinity-f35c57e6-1812-45fe-8b70-7512a07dd450-1669536545808@3c-app-gmx-bap05>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Subject: Aw: Re: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3
 nand/nor overlays
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Nov 2022 09:09:06 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com>
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-12-linux@fw-web.de>
 <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
 <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de>
 <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
 <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de>
 <20221120161251.GA3133853-robh@kernel.org>
 <trinity-51c09159-9b2d-44a6-8e9d-3457482a2add-1669474784280@3c-app-gmx-bs18>
 <CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2rIMDIB90mO6e3VRcJYKDaACxMGgek07gXnPRlUVtIf7QmTP1ycHmBTJt2gjyYFKc7zXz
 Xkqb49T+rS2uT18NtT0jvYQXTqJYCbZOSXqn+tss894FKqVwgHCeCnmIguvu2updC+GwaALWsHOZ
 YBiVVzLbjVkyvjEpQiifR5ouW0eEvj90fbHxDLTnM/EwwJSsztbV5jV7/VRHo2peM7IGnPkApVVB
 wWCHcgBG/eaitMAmgF1jYaZ1V1+yJ4d995Qft2dgO4hxu9rQ0N8oNzrobHCuJS/EZVLd+W0ZGC34
 YQ=
UI-OutboundReport: notjunk:1;M01:P0:FCi1to8+LRE=;mWUFBTU7Y2vXIJiIBPHySY1CWSl
 qTlTwCOHtv3/BdlkXMlsLq4mPN3qp9y4MeisTY+enHrF8zdmlW/I3EfTjK7ltMZAm/Hipv+ro
 8AfvfKcMth7OaK53QKNvxBF2ZoryVRv4d+KrdmDEpretT5WRXqAek5DhsKohFpEV4yEbuUmaW
 J57qhL/tvzsV9DSFkqCfo68kajk3m62UXV16XF9NlSXW8KJp6i9zSjIHExZqFAAlCedhrISmK
 viKt6zzPn0h5/e/BtyH0XjHIm4X58X/fDgK01DT8LdcjoC9oxNEMTGu0fK9aatu1D4ACAoMp+
 VrfmVoIZHl2txCNsqaX6g0ISC/vMcCRDMwWvkd88np+5Vsc0DDknqEN+nXDwCi+Z+DlLmReOD
 Fi3pvMMRjLkW/L3iEl/yKU59pn+qbO+lDorQcVyN9ej8CTjIH64MdHZCnJjqBfR5PIBezvIZa
 x1MgVCfF+kZYWA2K+wi8DIVFZH2jB0CkVNaU2ymqddHfCml7VxEXG20i3TJ2E+NnziV02S2b+
 yieX/Pzeu6srYNW/49XWj0U4d0G/JYVk5n0NwsESt1Hrv+H8EjlOQCSsQydbQ9E1BydRhmuHM
 mKNF+5QgDZKKh0gY47b0qoI/2SFg3RDgGFA2iNCEYRLZ4AitHWhjiamw3n+W8O0Pv3uddwmoP
 TgYIAwr8kxhcuh4WfEa679Rf+bg/Tlz+N0EKzjoO588S6vF75RfJ749NL74sEz4i8zEU6AMn7
 74pgfSyXSC9zUy6fZxoi3tcqMSJpbyvZfQ0JqheTgG9ASSdZ+OIwi+JfTmvwSHKYfWrTqkK+G
 daX0Nnvm6OdJZ34pXSI5TFGywFGXUl+QpXlzOwt0hSL48=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_000916_417731_7070C5CD 
X-CRM114-Status: GOOD (  14.28  )
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

> Gesendet: Samstag, 26. November 2022 um 23:49 Uhr
> Von: "Rob Herring" <robh@kernel.org>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead=
.org
> Betreff: Re: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/no=
r overlays
> > > > >> >These need rules to apply them to the base dtb(s). You just ne=
ed:
> > > > >> >
> > > > >> >full.dtb :=3D base.dtb overlay.dtb
> > > > >> >dtb-y +=3D full.dtb
> >
> > Hi,
> >
> > (removed most recipients to not spam all people with this)
> >
> > have now locally changed sd+emmc to overlays too and renamed to dtso..=
.
> > tried also this way to (arch/arm64/boot/dts/mediatek/Makefile):
> >
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3.dtb
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtbo
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> >
> > mt7986a-bananapi-bpi-r3-sd-nand.dtb :=3D mt7986a-bananapi-bpi-r3.dtb m=
t7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> > dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
> >
> > does not work:
> >
> > make[3]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt79=
86a-bananapi-bpi-r3-sd-nand.dtb', needed by 'arch/arm64/boot/dts/mediatek/=
'.  Stop.
> >
> > any thoughts? but this way i will need all possible combinations, i gu=
ess best way it to leave the overlays themselves.
>
> You missed my correction:
>
> full-dtbs :=3D base.dtb overlay.dtb
> dtb-y +=3D full.dtb

Thanks,

using dash instead of dot and dtbs extension in full target works

mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt79=
86a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb

but i guess this is not the right way for mainline as this will add 5 more=
 lines (10 in total for this single board)
to makefile to compile all 4 combinations.

i would send base dts and 4 overlays like above in next version if this is=
 the right way.

regards Frank

