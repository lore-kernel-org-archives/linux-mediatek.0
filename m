Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC89CDE03E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l++ZOmowKHw8XyXDDkEXLL9vXkRtvvkj5VB0cxq2xZk=; b=yRLiFuGkDoxivhAIfrvVcZC2JJ
	SW0ug8NIQeI6KD8l7PSJU7kvuSJpqBkT4vqxDzei/Z/lhrvhJRQyUD6uEqc8srvRi26gUiQh19qO3
	iJ2F8SJ0T1Fl8Kr532z+yWPFKZlkp+Bmd00rTtModSYz4eKJDX1K+Wf2Wa3hoQRm8TNMbDSSa0zJp
	0emvNXd2jsEPL+Tn9nKHfEf4yf3QgBXtQiQLiLzZOBgjsWGJDwr/JO8pKYR602UriNW4SF1gOyxe7
	VB2FzKIX5p4MqjKjt5w8yHB6Gj1FhO5MaEjV5WYKBIhi89GiG60b56Z3KQfi98/GmsV9fuDr4wFcG
	9ApTuHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxWs-00000009XWB-1zuf;
	Thu, 26 Sep 2024 23:04:10 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxVf-00000009XM8-2i55
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 23:02:57 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e25cf3c7278so1282852276.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 16:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727391774; x=1727996574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l++ZOmowKHw8XyXDDkEXLL9vXkRtvvkj5VB0cxq2xZk=;
        b=jDuw+rApOAwZvytfAO5WN0dulYQXTgvQ9fPddKwbdEc6WJoqfhyc9gnIOiKV+34ADR
         X/bRDXXXFCbRN4Pv/BOBg+20iCfDHLdj5b/PQmgS8pJkHUHgY/qyuI3iADN1ToVK4A8G
         ssSUjirKkKNttl9Y7yBCjNg/SFW/LOeTDyIRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727391774; x=1727996574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l++ZOmowKHw8XyXDDkEXLL9vXkRtvvkj5VB0cxq2xZk=;
        b=IHYU9kc57Pop+0j2dgwoEop6O+e/wkEeE1CD9l/UzwS5JqgZg4zCwqOkJY7g0SQLQY
         ybnSVjBlqJi1cDqB334LnGiOgBAGQdx3+JxgU5THI5ULpveFbGAYju+V2O2ueiuTGl3p
         uGDT9bZAiC3RGlGJsTMtb6PSIn1NM2IlkQFROLgJCbcucKan86ZSiy7jGFyW4y9puKMR
         HUUILvTtGk+c5nqyesr62XlOXio+BWAq5EVqqoEs8JmEIObg0aZelortyuyj9+dkFOYA
         d/jF/zCBXFm+TszoCu66cTEHCqAX6p0cRndtpLiFCjZkbPWsP7/zLKAnuzmhAyYGeiWo
         dcCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Z+/1qfncw225XsRf80RdcULE6KmD5sPQS+b3YJ7QD+LOzACUWytspJ6xex3lvSP/1GaM2PElMNp8LBwXMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbKSkzOPfQOXV1zytWIH4TlhRESCd32YugOgR6mXubbALbn86R
	MwOggF3Tbx6aqgNKgT0tBb68p5WAm4EM+ETYb1z+fXPTcVuyQhje6ta/7BS8WOcRX3xf3i95w6v
	bbO72OUigLJ/ktU/OViroN2PwGhrbzdjEfMvg
X-Google-Smtp-Source: AGHT+IHvR0iPjqZka/TBZbcQc4sKK1GUE3B8UbLiK9wUGx6AXR3PAOEAsvGzErlfJJhebhQbh6Ajaz7zXKrEw/n/UGk=
X-Received: by 2002:a05:690c:6303:b0:6b0:52a6:6515 with SMTP id
 00721157ae682-6e2474d1f72mr12375437b3.6.1727391773882; Thu, 26 Sep 2024
 16:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240925080353.2362879-1-jakiela@google.com> <20240925080353.2362879-2-jakiela@google.com>
 <bbf023c7-f08b-4f9d-8770-08e63074fb4c@collabora.com>
In-Reply-To: <bbf023c7-f08b-4f9d-8770-08e63074fb4c@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 26 Sep 2024 16:02:27 -0700
Message-ID: <CAJMQK-g4BdJPPU59s4X3yuAU+Gy-hTm9bCnSHFfDEbtKv6Xr1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediate: Introduce MT8186
 Chinchou/Chinchou360 Chromebooks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	wenst@chromium.org, rafal@milecki.pl, nfraprado@collabora.com, 
	macpaul.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_160255_760566_352E4D92 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, Sep 26, 2024 at 2:27=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/09/24 10:03, Albert Jakie=C5=82a ha scritto:
> > The MT8186 Chinchou/Chinchou360, also known as the Asus Chromebook
> > CZ12/CZ11 Flip, is a clamshell or convertible device with touchscreen,
> > stylus and extra buttons.
> >
> > Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |   3 +
> >   .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
> >   .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
> >   .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
> >   .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 445 +++++++++++++++++=
+
> >   5 files changed, 528 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinch=
ou-sku0.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinch=
ou-sku1.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinch=
ou-sku16.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinch=
ou.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index 8fd7b2bb7a15..0db7770e8907 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -55,6 +55,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-kodama-=
sku32.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku0.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku1.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku16.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393216.dt=
b
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393217.dt=
b
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393218.dt=
b
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.=
dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
> > new file mode 100644
> > index 000000000000..29dd92318da1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt8186-corsola-chinchou.dtsi"
> > +
> > +/ {
> > +     model =3D "Google chinchou sku0 board";
> > +     compatible =3D "google,chinchou-sku0", "google,chinchou-sku2",
> > +                     "google,chinchou-sku4", "google,chinchou-sku5",
> > +                     "google,chinchou", "mediatek,mt8186";
> > +};
> > +
> > +&gpio_keys {
> > +     status =3D "disabled";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.=
dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
> > new file mode 100644
> > index 000000000000..8ba31f81d9ad
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt8186-corsola-chinchou.dtsi"
> > +
> > +/ {
> > +     model =3D "Google chinchou sku1/sku17 board";
> > +     compatible =3D "google,chinchou-sku1", "google,chinchou-sku17",
> > +                     "google,chinchou-sku3", "google,chinchou-sku6",
> > +                     "google,chinchou-sku7", "google,chinchou-sku20",
> > +                     "google,chinchou-sku22", "google,chinchou-sku23",
> > +                     "mediatek,mt8186";
> > +};
> > +
> > +&i2c1 {
> > +     i2c-scl-internal-delay-ns =3D <10000>;
> > +
> > +     touchscreen: touchscreen@41 {
> > +             compatible =3D "ilitek,ili2901";
> > +             reg =3D <0x41>;
> > +             interrupts-extended =3D <&pio 12 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&touchscreen_pins>;
> > +             reset-gpios =3D <&pio 60 GPIO_ACTIVE_LOW>;
> > +             vccio-supply =3D <&pp1800_tchscr_report_disable>;
> > +     };
> > +};
> > +
> > +&gpio_keys {
> > +     status =3D "disabled";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16=
.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
> > new file mode 100644
> > index 000000000000..d3378d7ad096
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt8186-corsola-chinchou.dtsi"
> > +
> > +/ {
> > +     model =3D "Google chinchou sku16/sku2147483647 board";
> > +     compatible =3D "google,chinchou-sku16", "google,chinchou-sku18",
> > +                     "google,chinchou-sku19", "google,chinchou-sku21",
> > +                     "google,chinchou-sku2147483647", "mediatek,mt8186=
";
> > +};
> > +
> > +&i2c1 {
> > +     i2c-scl-internal-delay-ns =3D <10000>;
> > +
> > +     touchscreen: touchscreen@41 {
> > +             compatible =3D "ilitek,ili2901";
> > +             reg =3D <0x41>;
> > +             interrupts-extended =3D <&pio 12 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&touchscreen_pins>;
> > +             reset-gpios =3D <&pio 60 GPIO_ACTIVE_LOW>;
> > +             vccio-supply =3D <&pp1800_tchscr_report_disable>;
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi =
b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> > new file mode 100644
> > index 000000000000..c77cc43f8442
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
>
> ..snip..
>
> > +
> > +&mmc1_pins_default {
> > +     pins-clk {
> > +             drive-strength =3D <MTK_DRIVE_8mA>;
>
> Please stop using the meaningless MTK_DRIVE_(x)mA macro.
>
> drive-strength =3D <8>; is enough :-)
>
> Cheers,
> Angelo
>
> > +     };
> > +
> > +     pins-cmd-dat {
> > +             drive-strength =3D <MTK_DRIVE_8mA>;
> > +     };
> > +};
> > +
> > +&mmc1_pins_uhs {
> > +     pins-clk {
> > +             drive-strength =3D <MTK_DRIVE_8mA>;
> > +     };
> > +
> > +     pins-cmd-dat {
> > +             drive-strength =3D <MTK_DRIVE_8mA>;
> > +     };
> > +};
> > +
> > +&sound {
> > +     status =3D "okay";
> > +
> > +     compatible =3D "mediatek,mt8186-mt6366-rt5650-sound";
>
> You don't need to change this compatible, as the only thing that changes =
in the
> actual driver are the dapm_routes. I implemented support for that nice da=
i-link
> (standard, kind of) graph so that we stop getting a thousand compatibles =
for no
> reason other than routing :-)
>
> This should work with (99.9% confident it will, but please test):
>
>         model =3D "mt8186_rt5650";
>         status =3D "okay";
>
> > +     mediatek,adsp =3D <&adsp>;
>
> This property is already set in the node that you're inheriting from
> mt8186-corsola.dtsi, please drop.
>
> > +
> > +     audio-routing =3D
> > +             "Headphone", "HPOL",
> > +             "Headphone", "HPOR",
> > +             "HDMI1", "TX";
> > +
> > +     hs-playback-dai-link {
> > +             codec {
> > +                     sound-dai =3D <&rt5650>;
> > +             };
> > +     };
> > +
> > +     hs-capture-dai-link {
> > +             codec {
> > +                     sound-dai =3D <&rt5650>;
> > +             };
> > +     };
> > +
> > +     spk-share-dai-link {
> > +     };
>
> Empty nodes are meaningless (and you're inheriting this dai link from
> mt8186-corsola.dtsi as well). Drop.
>
> > +
> > +     spk-hdmi-playback-dai-link {
> > +             codec {
> > +                     sound-dai =3D <&it6505dptx>;
> > +             };
> > +     };
> > +};
> > +
> > +&wifi_enable_pin {
> > +     pins-wifi-enable {
> > +             pinmux =3D <PINMUX_GPIO51__FUNC_GPIO51>;
> > +     };
> > +};
> > +
> > +&wifi_pwrseq {
> > +     reset-gpios =3D <&pio 51 GPIO_ACTIVE_LOW>;
> > +};
> > +
>
> ..snip..
>
> > +
> > +&pen_insert {
> > +     wakeup-event-action =3D <EV_ACT_ANY>;
>
> Why is this set to EV_ACT_ANY on Chinchou but not on the other Corsola de=
vices?
> Is there any specific reason?

Default it's set to EV_ACT_DEASSERTED. Some OEMs want to wake up on
both assert and deassert.

>
> Cheers,
> Angelo
>

