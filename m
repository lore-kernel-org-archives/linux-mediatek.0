Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06906C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0syhQ4FzCWigP5oJO4Kq1BAVvU372cUxnkG2YAyqM58=; b=kg3Gw/OvAUCn+pbrOzxriohG7C
	nGb2NlSumRCns81oRyixO1BIe31l3/SVp0KPCKZN1khYOZspV7m6WlCLte/hwbj+zFX9gPQZzD8ap
	pi4XTQYgQjJGh3ouL8N4IT56I56uMGQ4HD45Sb1C9/j6R0HYFHygevyA61nrGq/IiDnzfCsGxZwVY
	VpoHSH6eukzjKjxHjWsZoFBOs5JQ/dk8DMBMqbSMjP4MsRrFAiEXyw5pkR7KiFC7Rwfs79wyaJGtC
	mo6Lax5+emkXOuxFSCqkWcciRaArCjFZy1dSzm6G/Qdx3vG+AhZNqoEYHleSh0uT9F3e2qv2M1ZTG
	N54+CzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9zzL-002vkY-0o;
	Mon, 04 Dec 2023 03:51:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9zzG-002vi5-2l
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 03:51:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bf898c43cso328762e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 19:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701661864; x=1702266664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0syhQ4FzCWigP5oJO4Kq1BAVvU372cUxnkG2YAyqM58=;
        b=GB9vrnRyzPfyzl+cYnMoIrSxaONfUlmI+Quc90s3MZ9VsrjkYLMAOqmT+J68ga/YEi
         uDRX9ypJW5g75D7y0OzzooXoVpiknUutyw0sjgQMDg3g1K5TjoVSH8XMtuYkMwXJh8O8
         fHjJe6ItHuGsYlr5CyqXiewZQF9bKJIKn7wUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701661864; x=1702266664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0syhQ4FzCWigP5oJO4Kq1BAVvU372cUxnkG2YAyqM58=;
        b=rzeL65Mwq2QPrV5QtCw0/dTf+EHct7fpAJFVhRmOm6d0u+B9sXuut9rSJ0yjcwi5h0
         YXrZjp5e0xuY0bjHdZVRrlTw3BldxSH4tRCF6cQd+3xiZUsAF8Gnx8kLaCGlwtI7T3pg
         FI3gpFxtcP4nA7D26r8DiB8gylLTt/zRSYMDku75Z4yXqfb/V8WPa4Sj2HFLYi/agGb3
         hSelyxqF6psEhAIV1aew/BAc30FWcCnIO76sZZqT+8D6xK1q2o7SmXhgo9OiFYDrvDBd
         qMiKGDReS6XilysgElmT9mCA+LyHz88uHHxWP9RgvaYEZCO2YM7xzycmRyP1G6albkPA
         q4FQ==
X-Gm-Message-State: AOJu0YzkYuh7kaO8PCYw7xlvJ+kbJ8TOwnGUa4sNMZBiTdXnpMKwP7oS
	HdBK+PsDFZbLBqEmy7dVBGqtTUUE9RgmHWtTgOdoHw==
X-Google-Smtp-Source: AGHT+IFKsYDE6bCvMKPPAMA2dIf+GqREU669Z4KrunuaczAMtywnMiPr/oN9gXqxZlapAE/ft8JzDvA8aoYuNQ0xm+Y=
X-Received: by 2002:ac2:48ae:0:b0:50b:f8e6:3786 with SMTP id
 u14-20020ac248ae000000b0050bf8e63786mr174325lfg.103.1701661864266; Sun, 03
 Dec 2023 19:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20231201070719.1229447-1-wenst@chromium.org> <20231201070719.1229447-7-wenst@chromium.org>
 <CAJMQK-iPT6p1izqQCHmJD2+E_RmnDKQfxsgMetnKtwNgLUmx1A@mail.gmail.com>
In-Reply-To: <CAJMQK-iPT6p1izqQCHmJD2+E_RmnDKQfxsgMetnKtwNgLUmx1A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 11:50:53 +0800
Message-ID: <CAGXv+5EpgGhBGWupsQ9oFSyMr-QTma1O38XOPYj2fZ5mpOYYhg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_195114_892691_81710A3D 
X-CRM114-Status: GOOD (  30.53  )
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

On Sat, Dec 2, 2023 at 9:45=E2=80=AFAM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> On Fri, Dec 1, 2023 at 5:39=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
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
> > ---
> > Changes since v1:
> > - Reorder SKU numbers in descending order.
> > - Fixed pinconfig node names
> > - Moved pinctrl-* properties after interrupts-*
> > - Switched to interrupts-extended for external components
> > - Marked ADSP as explicitly disabled, with a comment explaining that it
> >   stalls the system
> > - Renamed "touchpad" to "trackpad"
> > - Dropped bogus "no-laneswap" property from it6505 node
> > - Moved "realtek,jd-src" property to after all the regulator supplies
> > - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> > - Renamed "vgpu" regulator name to allow coupling, with a comment
> >   containing the name used in the design
> > - Renamed "cr50" node name to "tpm"
> > - Moved trackpad_pins reference up to i2c2; workaround for second sourc=
e
> >   component resource sharing.
> > - Fix copyright year
> > - Fixed touchscreen supply name
> >
> >  arch/arm64/boot/dts/mediatek/Makefile         |    4 +
> >  .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
> >  .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
> >  .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
> >  .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
> >  .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
> >  .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 +++++++++++++++++
> >  7 files changed, 2007 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.=
dtsi
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentaco=
ol-sku327681.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentaco=
ol-sku327683.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacr=
uel-sku262144.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacr=
uel-sku262148.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index e6e7592a3645..442af61b1305 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
>
> <snip>
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku3=
27683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683=
.dts
> > new file mode 100644
> > index 000000000000..2e4d8df978c1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.d=
ts
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +#include "mt8186-corsola-tentacool-sku327681.dts"
> > +
> > +/ {
> > +       compatible =3D "google,tentacruel-sku327683", "google,tentacrue=
l", "mediatek,mt8186";
> > +};
> > +
> > +/* This variant replaces only the touchpad controller. */
> > +&i2c2 {
> > +       /delete-node/ touchpad@15;
>
> corsola.dtsi has this node named trackpad@15.

Thanks for spotting the error. Fixed in the next version.

> > +
> > +       touchpad@15 {
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&trackpad_pin>;

Pinctrl also dropped in the next version.

Same for mt8186-corsola-tentacruel-sku262148.dts.


Thanks
ChenYu

> > +               compatible =3D "hid-over-i2c";
> > +               reg =3D <0x15>;
> > +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +               hid-descr-addr =3D <0x0001>;
> > +               vdd-supply =3D <&pp3300_s3>;
> > +               wakeup-source;
> > +       };
> > +};
>
> <snip>
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku=
262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku2621=
48.dts
> > new file mode 100644
> > index 000000000000..7841046084dc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.=
dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +
> > +#include "mt8186-corsola-tentacruel-sku262144.dts"
> > +
> > +/ {
> > +       compatible =3D "google,tentacruel-sku262151", "google,tentacrue=
l-sku262150",
> > +                    "google,tentacruel-sku262149", "google,tentacruel-=
sku262148",
> > +                    "google,tentacruel", "mediatek,mt8186";
> > +};
> > +
> > +/* This variant replaces only the touchpad controller. */
> > +&i2c2 {
> > +       /delete-node/ touchpad@15;
> > +
>
> ditto.
>
> > +       touchpad@15 {
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&trackpad_pin>;
> > +               compatible =3D "hid-over-i2c";
> > +               reg =3D <0x15>;
> > +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +               hid-descr-addr =3D <0x0001>;
> > +               vdd-supply =3D <&pp3300_s3>;
> > +               wakeup-source;
> > +       };
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8186-corsola.dtsi
> > new file mode 100644
> > index 000000000000..c5446b18783d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > @@ -0,0 +1,1719 @@
>
> <snip>
>
> > +
> > +&i2c2 {
> > +       pinctrl-names =3D "default";
> > +       /*
> > +        * Trackpad pin put here to work around second source component=
s
> > +        * sharing the pinmux
> > +        */
> > +       pinctrl-0 =3D <&i2c2_pins>, <&trackpad_pin>;
> > +       clock-frequency =3D <400000>;
> > +       i2c-scl-internal-delay-ns =3D <10000>;
> > +       status =3D "okay";
> > +
> > +       trackpad@15 {
> > +               compatible =3D "elan,ekth3000";
> > +               reg =3D <0x15>;
> > +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +               vcc-supply =3D <&pp3300_s3>;
> > +               wakeup-source;
> > +       };
> > +};
> > +
>
> <snip>

