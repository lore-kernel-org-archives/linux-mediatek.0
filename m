Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F054C43217
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Nov 2022 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vjEM5R3OiuUK1f1gVYnNuA2lKaOY1/hxTSWOYWhPUA=; b=ZOr+vZ6lqcsYG4oWuGNgcdseID
	yX/Vlqg07sZeZexaBelZwHavVlo3bdlzqN3fDi1UjmyM/KPqHIve99iv6VoTEqjKDPFNO2B0wktfN
	IwzCGF4DtE5FBvoDh5giYEg1BvWhkemUP6ggbJhDvEPPEmoBMr9TzHrnebgZ3aoUsN+1NS9GS+yFi
	rNH5YvdiwYBKiWrQWcXM9HOEbLLAnouhlJxFuc9iH3Kc5JiSOoz32wW1QFV5MiJidzJ/K8jnvM3XZ
	/6gAY8XTUg1JuxtAUV5D0HKmh27qgnj6Z5BnfxF5sSy3Hj3pBrRnehexAkYv5mcRFNBTfxqUMra80
	AueO8YRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz3zl-008VLP-AT; Sat, 26 Nov 2022 22:50:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz3zf-008VHm-TE
	for linux-mediatek@lists.infradead.org; Sat, 26 Nov 2022 22:49:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1D95B80990
	for <linux-mediatek@lists.infradead.org>; Sat, 26 Nov 2022 22:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724C1C433D7
	for <linux-mediatek@lists.infradead.org>; Sat, 26 Nov 2022 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669502991;
	bh=AxE382fya1Oc7GLsokn+BoSFPu2l9zFAbBTNjY3G25k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EvfxhAcHyKv8NSexbBfx9Szro28Zn8rMl4W4zAdssx5UgPKPUdjjRgM5LBkJwE6B/
	 ykgiPxjjbuv/ETPbjwsi69shpCBR9996TXeNhe0MFLds0ZjtlTLKYEma9dQL0Cs+g4
	 K2jEoi6Guvly5kk/GNODxKky256FSXxGy1V/KJASKULs3IXdFOj61I9nWc1ncP54mL
	 Q9D9MoHsOf989GSW3oJBBijJj0D8Wz/zOEgC1XXdgt0ZCzE5n4BalZK3GqBJ7pNyHu
	 XIFzv4+LhsE/zSXr+7o6LKCHeHGIWyK2hTyApeZJBGOK9ot6Of+TwNU2pBESy0X0/s
	 xcIK6C7vjrPIg==
Received: by mail-vs1-f47.google.com with SMTP id c184so7313113vsc.3
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Nov 2022 14:49:51 -0800 (PST)
X-Gm-Message-State: ANoB5pnnPVb7Y3IwT3z80z8Lkf83RUyR+G7nd69j4+KJyimDK3Mt5o0l
	DTt+gFBG4xxMAXfkhbETptii4snE5Lo4kx7Ymg==
X-Google-Smtp-Source: AA0mqf5TkJE7uR/T0WvgT6C5oPPis3ThIDJO9BaBtx7OcSp+sWmux4ATWIeOsskhfaCrAVjJ0GfjLaCF9BzTe1q9lYY=
X-Received: by 2002:a67:f74e:0:b0:3aa:3766:7a23 with SMTP id
 w14-20020a67f74e000000b003aa37667a23mr14850863vso.53.1669502990333; Sat, 26
 Nov 2022 14:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20221118190126.100895-1-linux@fw-web.de> <20221118190126.100895-12-linux@fw-web.de>
 <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
 <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de> <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
 <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de> <20221120161251.GA3133853-robh@kernel.org>
 <trinity-51c09159-9b2d-44a6-8e9d-3457482a2add-1669474784280@3c-app-gmx-bs18>
In-Reply-To: <trinity-51c09159-9b2d-44a6-8e9d-3457482a2add-1669474784280@3c-app-gmx-bs18>
From: Rob Herring <robh@kernel.org>
Date: Sat, 26 Nov 2022 16:49:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com>
Message-ID: <CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com>
Subject: Re: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_144956_276759_1EC8CA4E 
X-CRM114-Status: GOOD (  14.33  )
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

On Sat, Nov 26, 2022 at 9:00 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> > Gesendet: Sonntag, 20. November 2022 um 17:12 Uhr
> > Von: "Rob Herring" <robh@kernel.org>
>
> > > Or should these overlays only duplicated and either include sd dts or emmc dts (but this creates again redundant code)?
> > > >> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
> > > >> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > > >> >> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> > > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> > > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> > > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> > > >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> > > >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> > > >> >
> > > >> >These need rules to apply them to the base dtb(s). You just need:
> > > >> >
> > > >> >full.dtb := base.dtb overlay.dtb
> > > >> >dtb-y += full.dtb
>
> Hi,
>
> (removed most recipients to not spam all people with this)
>
> have now locally changed sd+emmc to overlays too and renamed to dtso...
> tried also this way to (arch/arm64/boot/dts/mediatek/Makefile):
>
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
>
> mt7986a-bananapi-bpi-r3-sd-nand.dtb := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
>
> does not work:
>
> make[3]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb', needed by 'arch/arm64/boot/dts/mediatek/'.  Stop.
>
> any thoughts? but this way i will need all possible combinations, i guess best way it to leave the overlays themselves.

You missed my correction:

full-dtbs := base.dtb overlay.dtb
dtb-y += full.dtb

Rob

