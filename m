Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77135C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Xhtx23mJ5N3LR2tRtKUn4mfUZsUb9U6VLaK4OmUmtE=; b=39lq/7798U+qqAxCNUhrBi0r8f
	azkqdQQ+ZCw2JF31nitJkoG0Q9IuTrWBq4QdolXva3Wh64fU7GEXrcrHySSiXeDStLTv52QyfP4ar
	uCO1CF+0QzbdjTXHqaUkQbysCM5uiAVM48ECBYRpIwu9YIcPICYI9EfCciLowgtHnqhM6sK7QNBk+
	iBWXYd2krE+RBZ0Lr0b8egNYoTEatVhwQ/alDdZrOF8GG8E9M1agtY9UHLN6YcRIOep1SJuo5Eute
	8RPLU543WemclvNWsBPW9h+/RFycMltZ+wGHM/XCjoufWLG/b/Y395OCi7xCdjBh2F1R73Zqas/Z7
	IyuRUtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmqM-000Z7w-2I;
	Thu, 14 Dec 2023 14:37:42 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmqJ-000Z4z-0L
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 14:37:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso9470262e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702564655; x=1703169455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xhtx23mJ5N3LR2tRtKUn4mfUZsUb9U6VLaK4OmUmtE=;
        b=Us9+Y43zhVgL+e+qgh4BmmEOIGPYuk1x95gF99srQcuwbKPguOJJ8GuNA5ZTKTr/P3
         9fat1IdI8CRJs+j2jBfHXRrSneXVm3TojyjTAFmxmPEz5WWc/hxb/iY4qbSsUtflyUv/
         lR0sbUHKNvltmf37PX14xfLNzSF9lF/zFCTXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564655; x=1703169455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Xhtx23mJ5N3LR2tRtKUn4mfUZsUb9U6VLaK4OmUmtE=;
        b=cRX4XXTqrhabdiwL1D/ki+SgylQWCqigwMhDfCfvUCofNK9LV1mkohksv+qNxkBndU
         Gi/tTCICrS3ynJf8nY9W1YR3NjgU7fGgRP8D0Eh43aRksbmbS4c8ooHGnguThQhW/+qj
         csGKg4TcahKCxHyn4xwHhS7gaQbAl/yUU5XcBkiprBYWCIyH2QgXq33PuExHvuB6zg3B
         bF3WpWdga2mCiRFGgF+imSV/2HLyuaH/eOJTyc/ZH0ofhapse8orUCjzFR2a8IZ07MlI
         7kWpfhWKuFfqCuC+yxxIap0zf4dxwkUcBDKfKL3PmPcHeRC56K583KTVK+jcjGvWrZew
         r5oA==
X-Gm-Message-State: AOJu0YzlKjcbWcREZXFAUbF9rKn7W3XwNAd2gDFP2kPGYSM6bHyRyj7L
	jkOLpW5Rjvt+OZGR9vUBtA70jJqkp233fZNnSK56VQ==
X-Google-Smtp-Source: AGHT+IFXSSEus+BmIetfepbm7BLOicCRSLtaFbzuvuE/X4fB/O7LdlcqSkPxpdR3TTY9mP0lV6tpNGPrhpYwo39paxw=
X-Received: by 2002:a05:6512:3b84:b0:50d:1c59:632e with SMTP id
 g4-20020a0565123b8400b0050d1c59632emr2840456lfv.260.1702564654989; Thu, 14
 Dec 2023 06:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20231213150435.4134390-1-wenst@chromium.org> <20231213150435.4134390-7-wenst@chromium.org>
 <13c8ccbc-0eef-43f5-ae37-29ec64d1606b@collabora.com>
In-Reply-To: <13c8ccbc-0eef-43f5-ae37-29ec64d1606b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Dec 2023 23:37:23 +0900
Message-ID: <CAGXv+5HO+TW6H9kLv62Dp7cihHW7fs99gzUBMWvAEnzdrNY7mg@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Eugen Hristev <eugen.hristev@collabora.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_063739_200047_8EC4B557 
X-CRM114-Status: GOOD (  36.83  )
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

On Thu, Dec 14, 2023 at 7:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/12/23 16:04, Chen-Yu Tsai ha scritto:
> > Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> > Krabby design.
> >
> > Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> > convertible device with touchscreen and stylus.
> >
> > Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> > device. It does not have a touchscreen or stylus.
> >
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original=
,
> > but is incompatible.
> >
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes since v3:
> > - Reorder some properties to conform better to the newly proposed DT
> >    style guidelines
> > - Drop unused labels
> > - Rename bt-sco node name to bt-sco-codec
> > - Drop i2s*-share properties from afe node
> > - Drop aud_gpio_tdm_{on,off} pinctrl nodes
> > - Replace interrupts with interrupts-extended in tpm node
> > - Enable adsp device
> >
> > Changes since v2:
> > - Picked up Conor's ack
> > - Rename touchpad to trackpad
> > - Drop pinctrl properties from trackpad in tentacruel/tentacool second
> >    source trackpad
> >
> > Changes since v1:
> > - Reorder SKU numbers in descending order.
> > - Fixed pinconfig node names
> > - Moved pinctrl-* properties after interrupts-*
> > - Switched to interrupts-extended for external components
> > - Marked ADSP as explicitly disabled, with a comment explaining that it
> >    stalls the system
> > - Renamed "touchpad" to "trackpad"
> > - Dropped bogus "no-laneswap" property from it6505 node
> > - Moved "realtek,jd-src" property to after all the regulator supplies
> > - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> > - Renamed "vgpu" regulator name to allow coupling, with a comment
> >    containing the name used in the design
> > - Renamed "cr50" node name to "tpm"
> > - Moved trackpad_pins reference up to i2c2; workaround for second sourc=
e
> >    component resource sharing.
> > - Fix copyright year
> > - Fixed touchscreen supply name
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |    4 +
> >   .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
> >   .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
> >   .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
> >   .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
> >   .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
> >   .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1707 ++++++++++++++++=
+
> >   7 files changed, 1991 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby=
.dtsi
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ool-sku327681.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ool-sku327683.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ruel-sku262144.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ruel-sku262148.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index e6e7592a3645..442af61b1305 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-kodama=
-sku32.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacool-sku327681.dt=
b
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacool-sku327683.dt=
b
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacruel-sku262144.d=
tb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacruel-sku262148.d=
tb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r5-sku2.dtb
>
> ..snip..
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku=
262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku2621=
48.dts
> > new file mode 100644
> > index 000000000000..447b57b12b41
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.=
dts
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +#include "mt8186-corsola-tentacruel-sku262144.dts"
> > +
> > +/ {
> > +     compatible =3D "google,tentacruel-sku262151", "google,tentacruel-=
sku262150",
> > +                  "google,tentacruel-sku262149", "google,tentacruel-sk=
u262148",
> > +                  "google,tentacruel", "mediatek,mt8186";
> > +};
> > +
> > +/* This variant replaces only the trackpad controller. */
> > +&i2c2 {
> > +     /delete-node/ trackpad@15;
> > +
> > +     trackpad@15 {
> > +             compatible =3D "hid-over-i2c";
> > +             reg =3D <0x15>;
> > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +             hid-descr-addr =3D <0x0001>;
> > +             vdd-supply =3D <&pp3300_s3>;
> > +             wakeup-source;
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8186-corsola.dtsi
> > new file mode 100644
> > index 000000000000..adbeb0c765d3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > @@ -0,0 +1,1707 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include "mt8186.dtsi"
> > +#include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/input/gpio-keys.h>
> > +#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
> > +
>
> ..snip..
>
> > +
> > +&i2c2 {
> > +     pinctrl-names =3D "default";
> > +     /*
> > +      * Trackpad pin put here to work around second source components
> > +      * sharing the pinmux in steelix designs.
> > +      */
> > +     pinctrl-0 =3D <&i2c2_pins>, <&trackpad_pin>;
> > +     clock-frequency =3D <400000>;
> > +     i2c-scl-internal-delay-ns =3D <10000>;
> > +     status =3D "okay";
> > +
> > +     trackpad@15 {
> > +             compatible =3D "elan,ekth3000";
>
> You forgot to change this one.
>
> Remove compatible from this node and stop using /delete-node/ in device s=
pecific
> devicetrees.

I believe I already replied to the previous version why we can't and should=
n't
do that.

"elan,ekth3000" and "hid-over-i2c" have incompatible bindings, specifically
the former uses "vcc-supply" while the latter uses "vdd-supply".

One has to track down if a property is a "sharable" property or not,
then put it in the correct place, otherwise getting DT binding validation
errors.

To me it seems cleaner to just delete the node wholesale to not have any
remnants of the original node, i.e. start from a clean slate. Trying to
"share" common properties is asking for a headache.

This feels more like a preference thing. I also asked if deleting the node
through the label would be cleaner, but you didn't reply.

Also, "elan,ekth3000" is the one that was designed and tested on the Corsol=
a
reference design, so I think it rightfully belongs there. The Tentacruel
SKU replaced it with another part, so the original part should be disabled,
or in this case, deleted, because otherwise there would be a conflict.


Regards
ChenYu



> > +             reg =3D <0x15>;
> > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +             vcc-supply =3D <&pp3300_s3>;
> > +             wakeup-source;
> > +     };
> > +};
>
>
> corsola.dtsi (here):
>
> &i2c2 {
>         pinctrl-names =3D "default";
>         /*
>          * Trackpad pin put here to work around second source components
>          * sharing the pinmux in steelix designs.
>          */
>         pinctrl-0 =3D <&i2c2_pins>, <&trackpad_pin>;
>         clock-frequency =3D <400000>;
>         i2c-scl-internal-delay-ns =3D <10000>;
>         status =3D "okay";
>
>         trackpad_i2c2_15: trackpad@15 {
>                 /*
>                  * Those are common properties for i2c2 trackpad on Corso=
la boards.
>                  * The compatible string is declared in device specific d=
evicetrees
>                  */
>                 reg =3D <0x15>;
>                 interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
>                 vcc-supply =3D <&pp3300_s3>;
>                 wakeup-source;
>                 status =3D "disabled";
>         };
> };
>
> corsola-some-device.dts:
>
> &trackpad_i2c2_15 {
>         compatible =3D "hid-over-i2c";
>         hid-descr-addr =3D <0x0001>;
>         status =3D "okay";
> };
>
> corsola-some-other-device.dts:
>
> &trackpad_i2c2_15 {
>         compatible =3D "elan,ekth3000";
>         status =3D "okay";
> };
>
> ....everything else looks good.
>
> Cheers,
> Angelo

