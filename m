Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07334C10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph5kj+CB4Z19pC87CegKA1+VbaBTTld+37TSG/MkZUc=; b=e6MayN8TOYoAyhDyHI9wCrUBTz
	cnb87nMyw5/pzZWzQq4kBJot0/ohg3iUS5n84wtGfhJJNrTrsQE9YaLTm/l2U/Z40ZrRC/U1vkBEg
	W+Kyhrx544wPfclbpN8WQkt8uoB1WRS50KKQE0IZo6HgAlgnRCyI01dL+CM4kxBRfXefqqPNyfZGc
	QoB2HqSFkj6km7MrHnUv1WbXZu7xEOuZLBJJPEQklHti/unsDyNVDvvE7T+chkWWCpA9S7Q1Jr/1t
	r4F6pngF/ehGTG6PwfCHk5Vp8jMAteH3l1ixzTRWSAUXonwjf4PB9wxaYm9LFQe6e0JrU0Pl+IbMi
	PqqIyNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCU4-00CdTf-1x;
	Thu, 07 Dec 2023 11:24:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCTz-00CdNU-1v
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 11:23:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50c02628291so555185e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 03:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701948231; x=1702553031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph5kj+CB4Z19pC87CegKA1+VbaBTTld+37TSG/MkZUc=;
        b=Wz/XWxhLWH+lGr776N+JDv5BzRpQRHTlZfvumGoqsb+PPbtvlbJ2KKsy8wy7yxmH7s
         jsVMgKsZnvX5xmSdhcsv3ciaSSTcXRWgh71G2pmd5TKfwdCCnpupxVLXfWlXnielzNoo
         q/VuPEPbZbimyFly8zC6S19Ye1TGbrVM3+W48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701948231; x=1702553031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph5kj+CB4Z19pC87CegKA1+VbaBTTld+37TSG/MkZUc=;
        b=Eyt3tbrZB2eM8beVLZjcY0N7UY/EXTGR4JkxiegY2WNgRomjLGmUtOU1IwmGaDRdln
         /aiZcvUZYwu7yvJF0CR1nqeLhJDa5iBrmU4MgqhIFe7rDr6Xf/9LMCzf7/y4EEib0vhD
         2wpfoDUSfujzvDRC8N+CZj1nApaDfjq8h5LVdbUOPns9qS4RzHdbQYnusaAfn89YcD9V
         kLA73NOfmEewdwd90UXQiojaAGoOl98/0lCH3M+XDG7WAKc6/ONInkgu1kccPmMnURh6
         t43oYOfn481kkcn27JaVhdUstitgjNhPxkPYwhxqJbRkhBm1oCsOWnjtTf4OJjscY+kl
         KCWw==
X-Gm-Message-State: AOJu0YxB5ysaB7/dlLHqA/u9ji/Y9j4j/rfg1pNn+uSJcm6gZtd4i/lY
	Y2dy0iIQRq91QOQXHAJ26nersLiJCE26rISKuqJ6VQ==
X-Google-Smtp-Source: AGHT+IHclxuTPTJWnavxmvpXLOkyqPEuff5nsJJ87iLlDKdpMh0vrT4jehgeEHVRghL54AwZI3RH4RhOGKteKLxNTww=
X-Received: by 2002:a05:6512:b9a:b0:50b:fafd:300d with SMTP id
 b26-20020a0565120b9a00b0050bfafd300dmr1561293lfv.125.1701948231217; Thu, 07
 Dec 2023 03:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20231204084012.2281292-1-wenst@chromium.org> <20231204084012.2281292-7-wenst@chromium.org>
 <ab7988af-e7f9-433d-b35e-138f79ce82c0@collabora.com> <CAGXv+5EyHXWgbvtxx-skzi6FNEnZD8QEHQ2Wq224anY+QKUrew@mail.gmail.com>
In-Reply-To: <CAGXv+5EyHXWgbvtxx-skzi6FNEnZD8QEHQ2Wq224anY+QKUrew@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 7 Dec 2023 20:23:40 +0900
Message-ID: <CAGXv+5H9dkYOUEDEYtDOzH9ma3wxuGMLfWy+9pE2swTFdNxOnQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_032355_666260_0202CFBD 
X-CRM114-Status: GOOD (  33.11  )
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

On Thu, Dec 7, 2023 at 2:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Mon, Dec 4, 2023 at 11:27=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> > > Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> > > Krabby design.
> > >
> > > Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> > > convertible device with touchscreen and stylus.
> > >
> > > Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a lapto=
p
> > > device. It does not have a touchscreen or stylus.
> > >
> > > The two devices both have two variants. The difference is a second
> > > source touchpad controller that shares the same address as the origin=
al,
> > > but is incompatible.
> > >
> > > The extra SKU IDs for the Tentacruel devices map to different sensor
> > > components attached to the Embedded Controller. These are not visible
> > > to the main processor.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Changes since v2:
> > > - Picked up Conor's ack
> > > - Rename touchpad to trackpad
> > > - Drop pinctrl properties from trackpad in tentacruel/tentacool secon=
d
> > >    source trackpad
> > >
> > > Changes since v1:
> > > - Reorder SKU numbers in descending order.
> > > - Fixed pinconfig node names
> > > - Moved pinctrl-* properties after interrupts-*
> > > - Switched to interrupts-extended for external components
> > > - Marked ADSP as explicitly disabled, with a comment explaining that =
it
> > >    stalls the system
> > > - Renamed "touchpad" to "trackpad"
> > > - Dropped bogus "no-laneswap" property from it6505 node
> > > - Moved "realtek,jd-src" property to after all the regulator supplies
> > > - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> > > - Renamed "vgpu" regulator name to allow coupling, with a comment
> > >    containing the name used in the design
> > > - Renamed "cr50" node name to "tpm"
> > > - Moved trackpad_pins reference up to i2c2; workaround for second sou=
rce
> > >    component resource sharing.
> > > - Fix copyright year
> > > - Fixed touchscreen supply name
> > >
> > >   arch/arm64/boot/dts/mediatek/Makefile         |    4 +
> > >   .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
> > >   .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
> > >   .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
> > >   .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
> > >   .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
> > >   .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 ++++++++++++++=
+++
> > >   7 files changed, 2003 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krab=
by.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tent=
acool-sku327681.dts
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tent=
acool-sku327683.dts
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tent=
acruel-sku262144.dts
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tent=
acruel-sku262148.dts
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/=
dts/mediatek/Makefile
> > > index e6e7592a3645..442af61b1305 100644
> > > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > > @@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-koda=
ma-sku32.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku0.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacool-sku327681.=
dtb
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacool-sku327683.=
dtb
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacruel-sku262144=
.dtb
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-tentacruel-sku262148=
.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-evb.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> > >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r5-sku2.dtb
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi =
b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
> > > new file mode 100644
> > > index 000000000000..9b2b64525961
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
> > > @@ -0,0 +1,129 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright 2022 Google LLC
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "mt8186-corsola.dtsi"
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +     aliases {
> > > +             i2c4 =3D &i2c4;
> > > +     };
> > > +};
> > > +
> > > +&dsi_out {
> > > +     remote-endpoint =3D <&ps8640_in>;
> > > +};
> > > +
> > > +&i2c0 {
> > > +     clock-frequency =3D <400000>;
> > > +
> > > +     ps8640: edp-bridge@8 {
> > > +             compatible =3D "parade,ps8640";
> > > +             reg =3D <0x8>;
> > > +             powerdown-gpios =3D <&pio 96 GPIO_ACTIVE_LOW>;
> > > +             reset-gpios =3D <&pio 98 GPIO_ACTIVE_LOW>;
> > > +             pinctrl-names =3D "default";
> > > +             pinctrl-0 =3D <&ps8640_pins>;
> > > +             vdd12-supply =3D <&mt6366_vrf12_reg>;
> > > +             vdd33-supply =3D <&mt6366_vcn33_reg>;
> > > +
> > > +             ports {
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg =3D <0>;
> > > +
> > > +                             ps8640_in: endpoint {
> > > +                                     remote-endpoint =3D <&dsi_out>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@1 {
> > > +                             reg =3D <1>;
> > > +
> > > +                             ps8640_out: endpoint {
> > > +                                     remote-endpoint =3D <&panel_in>=
;
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             aux-bus {
> > > +                     panel {
> > > +                             compatible =3D "edp-panel";
> > > +                             power-supply =3D <&pp3300_disp_x>;
> > > +                             backlight =3D <&backlight_lcd0>;
> > > +
> > > +                             port {
> > > +                                     panel_in: endpoint {
> > > +                                             remote-endpoint =3D <&p=
s8640_out>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&i2c1 {
> > > +     i2c-scl-internal-delay-ns =3D <10000>;
> > > +
> > > +     touchscreen: touchscreen@10 {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x10>;
> > > +             interrupts-extended =3D <&pio 12 IRQ_TYPE_LEVEL_LOW>;
> > > +             pinctrl-names =3D "default";
> > > +             pinctrl-0 =3D <&touchscreen_pins>;
> > > +             post-power-on-delay-ms =3D <10>;
> > > +             hid-descr-addr =3D <0x0001>;
> > > +             vdd-supply =3D <&pp3300_s3>;
> > > +     };
> > > +};
> > > +
> > > +&i2c4 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&i2c4_pins>;
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "okay";
> > > +
> > > +     proximity@28 {
> > > +             compatible =3D "semtech,sx9324";
> > > +             reg =3D <0x28>;
> > > +             interrupts-extended =3D <&pio 5 IRQ_TYPE_LEVEL_LOW>;
> > > +             pinctrl-names =3D "default";
> > > +             pinctrl-0 =3D <&sar_sensor_pins>;
> > > +             vdd-supply =3D <&mt6366_vio18_reg>;
> > > +             svdd-supply =3D <&mt6366_vio18_reg>;
> > > +             #io-channel-cells =3D <1>;
> >
> >  From the newest DTS coding style document:
> >
> > The following order of properties in device nodes is preferred:
> >
> > 1. compatible
> > 2. reg
> > 3. ranges
> > 4. Standard/common properties (defined by common bindings, e.g. without
> >     vendor-prefixes)
> > 5. Vendor-specific properties
> > 6. status (if applicable)
> > 7. Child nodes, where each node is preceded with a blank line
> >
> > The "status" property is by default "okay", thus it can be omitted.
> >
> > The above-described ordering follows this approach:
> >
> > 1. Most important properties start the node: compatible then bus addres=
sing to
> >     match unit address.
> > 2. Each node will have common properties in similar place.
> > 3. Status is the last information to annotate that device node is or is=
 not
> >     finished (board resources are needed).
>
> Wishing for a checking tool now. :p
>
> > #io-channel-cells goes after `reg` (same for the other instances) :-)
>
> Ack (though it looks weird).
>
> > > +     };
> > > +};
> > > +
> > > +&pio {
> > > +     i2c4_pins: i2c4-pins {
> > > +             pins-bus {
> > > +                     pinmux =3D <PINMUX_GPIO136__FUNC_SDA4>,
> > > +                              <PINMUX_GPIO135__FUNC_SCL4>;
> > > +                     bias-disable;
> > > +                     drive-strength =3D <4>;
> > > +                     input-enable;
> > > +             };
> > > +     };
> > > +
> > > +     ps8640_pins: ps8640-pins {
> > > +             pins-pwrdn-rst {
> > > +                     pinmux =3D <PINMUX_GPIO96__FUNC_GPIO96>,
> > > +                              <PINMUX_GPIO98__FUNC_GPIO98>;
> > > +                     output-low;
> > > +             };
> > > +     };
> > > +
> > > +     sar_sensor_pins: sar-sensor-pins {
> > > +             pins-irq {
> > > +                     pinmux =3D <PINMUX_GPIO5__FUNC_GPIO5>;
> > > +                     input-enable;
> > > +                     bias-pull-up;
> > > +             };
> > > +     };
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sk=
u327681.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku3276=
81.dts
> > > new file mode 100644
> > > index 000000000000..9bb64353ca65
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681=
.dts
> > > @@ -0,0 +1,57 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright 2022 Google LLC
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "mt8186-corsola-krabby.dtsi"
> > > +
> > > +/ {
> > > +     model =3D "Google Tentacool board";
> > > +     compatible =3D "google,tentacruel-sku327681", "google,tentacrue=
l", "mediatek,mt8186";
> > > +     chassis-type =3D "laptop";
> > > +};
> > > +
> > > +/* Tentacool omits the pen. */
> > > +&gpio_keys {
> > > +     status =3D "disabled";
> > > +};
> > > +
> > > +/* Tentacool omits the touchscreen; nothing else is on i2c1. */
> > > +&i2c1 {
> > > +     status =3D "disabled";
> > > +};
> > > +
> > > +&keyboard_controller {
> > > +     function-row-physmap =3D <
> > > +             MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> > > +             MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> > > +             MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> > > +             MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> > > +             MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> > > +             MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> > > +             MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> > > +             MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> > > +             MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> > > +             MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> > > +     >;
> > > +
> > > +     linux,keymap =3D <
> > > +             MATRIX_KEY(0x00, 0x02, KEY_BACK)
> > > +             MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> > > +             MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> > > +             MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> > > +             MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> > > +             MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> > > +             MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> > > +             MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> > > +             MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> > > +             MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> > > +             CROS_STD_MAIN_KEYMAP
> > > +     >;
> > > +};
> > > +
> > > +/* Tentacool omits the touchscreen. */
> > > +&touchscreen {
> > > +     status =3D "disabled";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sk=
u327683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku3276=
83.dts
> > > new file mode 100644
> > > index 000000000000..c3ae6f9616c8
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683=
.dts
> > > @@ -0,0 +1,24 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright 2023 Google LLC
> > > + */
> > > +
> > > +#include "mt8186-corsola-tentacool-sku327681.dts"
> > > +
> > > +/ {
> > > +     compatible =3D "google,tentacruel-sku327683", "google,tentacrue=
l", "mediatek,mt8186";
> > > +};
> > > +
> > > +/* This variant replaces only the trackpad controller. */
> > > +&i2c2 {
> > > +     /delete-node/ trackpad@15;
> >
> > Why are you deleting the trackpad@15 node?
> >
> > You can simply override the compatible, or actually omit the compatible=
 string
> > in the *.dtsi file, and set just that in each board *.dts.
> >
> > dtsi:
> >         trackpad_a: trackpad@15 {
> >                 /* Compatible is set in each board dts */
> >                 reg, interrupts, others
> >         }
> >
> > dts:
> >
> > &trackpad_a {
> >         compatible =3D "elan,ekth3000";
> > };
>
> The original trackpad@15 comes from the base design and is used for all
> models other than the ones with the conflicting component. Hence I believ=
e
> it should live in the base .dtsi.
>
> The delete-node makes it much less likely to have any lingering propertie=
s.
> These are not nodes that just differ in compatible strings like DSI panel=
s.
> They have incompatible bindings. For example, elan,ekth3000 uses "vcc-sup=
ply",
> while "hid-over-i2c" uses "vdd-supply".
>
> And going back to my previous argument, the base design used one specific
> model which is carried over to all the other models.
>
> Suppose I add a phandle to the original trackpad, and do
>
>     /delete-node/ &trackpad;
>
> Would that be better?
>
> > other dts:
> >
> > &trackpad_a {
> >         compatible =3D "hid-over-i2c";
> > };
> >
> > > +
> > > +     trackpad@15 {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x15>;
> > > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > > +             hid-descr-addr =3D <0x0001>;
> > > +             vdd-supply =3D <&pp3300_s3>;
> > > +             wakeup-source;
> > > +     };
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-s=
ku262144.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku26=
2144.dts
> > > new file mode 100644
> > > index 000000000000..26d3451a5e47
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku26214=
4.dts
> > > @@ -0,0 +1,44 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright 2022 Google LLC
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "mt8186-corsola-krabby.dtsi"
> > > +
> > > +/ {
> > > +     model =3D "Google Tentacruel board";
> > > +     compatible =3D "google,tentacruel-sku262147", "google,tentacrue=
l-sku262146",
> > > +                  "google,tentacruel-sku262145", "google,tentacruel-=
sku262144",
> > > +                  "google,tentacruel", "mediatek,mt8186";
> > > +     chassis-type =3D "convertible";
> > > +};
> > > +
> > > +&keyboard_controller {
> > > +     function-row-physmap =3D <
> > > +             MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> > > +             MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> > > +             MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> > > +             MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> > > +             MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> > > +             MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> > > +             MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> > > +             MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> > > +             MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> > > +             MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> > > +     >;
> > > +
> > > +     linux,keymap =3D <
> > > +             MATRIX_KEY(0x00, 0x02, KEY_BACK)
> > > +             MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> > > +             MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> > > +             MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> > > +             MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> > > +             MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> > > +             MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> > > +             MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> > > +             MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> > > +             MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> > > +             CROS_STD_MAIN_KEYMAP
> > > +     >;
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-s=
ku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku26=
2148.dts
> > > new file mode 100644
> > > index 000000000000..447b57b12b41
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku26214=
8.dts
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright 2023 Google LLC
> > > + */
> > > +
> > > +#include "mt8186-corsola-tentacruel-sku262144.dts"
> > > +
> > > +/ {
> > > +     compatible =3D "google,tentacruel-sku262151", "google,tentacrue=
l-sku262150",
> > > +                  "google,tentacruel-sku262149", "google,tentacruel-=
sku262148",
> > > +                  "google,tentacruel", "mediatek,mt8186";
> > > +};
> > > +
> > > +/* This variant replaces only the trackpad controller. */
> > > +&i2c2 {
> > > +     /delete-node/ trackpad@15;
> > > +
> > > +     trackpad@15 {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x15>;
> > > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > > +             hid-descr-addr =3D <0x0001>;
> > > +             vdd-supply =3D <&pp3300_s3>;
> > > +             wakeup-source;
> > > +     };
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > > new file mode 100644
> > > index 000000000000..8726b2916ef1
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > > @@ -0,0 +1,1719 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2022 MediaTek Inc.
> > > + */
> > > +/dts-v1/;
> > > +#include "mt8186.dtsi"
> > > +#include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/input/gpio-keys.h>
> > > +#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
> > > +
> > > +/ {
> > > +     aliases {
> > > +             i2c0 =3D &i2c0;
> > > +             i2c1 =3D &i2c1;
> > > +             i2c2 =3D &i2c2;
> > > +             i2c3 =3D &i2c3;
> > > +             i2c5 =3D &i2c5;
> > > +             mmc0 =3D &mmc0;
> > > +             mmc1 =3D &mmc1;
> > > +             serial0 =3D &uart0;
> > > +     };
> > > +
> > > +     chosen {
> > > +             stdout-path =3D "serial0:115200n8";
> > > +     };
> > > +
> > > +     memory@40000000 {
> > > +             device_type =3D "memory";
> > > +             /* The size should be filled in by the bootloader. */
> > > +             reg =3D <0 0x40000000 0 0>;
> > > +     };
> > > +
> > > +     backlight_lcd0: backlight-lcd0 {
> > > +             compatible =3D "pwm-backlight";
> > > +             pwms =3D <&pwm0 0 500000>;
> > > +             power-supply =3D <&ppvar_sys>;
> > > +             enable-gpios =3D <&pio 152 0>;
> > > +             brightness-levels =3D <0 1023>;
> > > +             num-interpolated-steps =3D <1023>;
> > > +             default-brightness-level =3D <576>;
> > > +     };
> > > +
> > > +     btsco: bt-sco {
> >
> > Do you really need the phandle to bt-sco?
>
> No. But the sound node probably should be referencing it and the dmic
> node via DT instead of hardcoding the DAI and codec names in the machine
> driver.
>
> Anyway, will remove the label for now.
>
> > Also, this node describes a codec, so: "bt-sco-codec" please!
>
> Ack.
>
> > > +             compatible =3D "linux,bt-sco";
> > > +             #sound-dai-cells =3D <0>;
> > > +     };
> > > +
> > > +     dmic_codec: dmic-codec {
> >
> > This phandle is unused...
>
> Removed.
>
> > ..snip..
> >
> > > +
> > > +&adsp {
> > > +     memory-region =3D <&adsp_dma_mem>, <&adsp_mem>;
> > > +     status =3D "disabled"; /* causes stall */
> >
> > This is a firmware issue: once the correct firmware is uploaded to linu=
x-firmware
> > the dsp node can get enabled... so it we make sure that this happens be=
fore this
> > devicetree gets picked, we can avoid a second commit enabling audio.
> >
> > After all, since we *want to* use the Xtensa DSP for audio, without it =
booted
> > sound won't work *anyway*.... so having the firmware in place can also =
be seen
> > as a direct dependency of the entire audio functionality.
> >
> > P.S.: The FW that is distributed with ChromeOS works just fine!
>
> I'll give that a try.

I have:

sof-audio-of-mt8186 10680000.adsp: Firmware info: version 2:0:0-5494c
sof-audio-of-mt8186 10680000.adsp: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
sof-audio-of-mt8186 10680000.adsp: unknown sof_ext_man header type 3 size 0=
x30
sof-audio-of-mt8186 10680000.adsp: Firmware info: version 2:0:0-5494c

and it's still hanging.

And FTR, I think sound is also blocked on the it6505 audio support series.

ChenYu



> > > +};
> > > +
> > > +&afe {
> > > +     i2s0-share =3D "I2S1";
> > > +     i2s3-share =3D "I2S2";
> > > +     status =3D "okay";
> > > +};
> > > +
> >
> > ..snip..
> >
> > > +&i2c2 {
> > > +     pinctrl-names =3D "default";
> > > +     /*
> > > +      * Trackpad pin put here to work around second source component=
s
> > > +      * sharing the pinmux in steelix designs.
> > > +      */
> > > +     pinctrl-0 =3D <&i2c2_pins>, <&trackpad_pin>;
> >
> > There's no choice for now... even if this is not beautiful to see... bu=
t it's still
> > ok for me because we can revisit this later when the HW Prober mechanis=
m will be
> > upstreamed.
>
> Yup. Working on that.
>
> > > +     clock-frequency =3D <400000>;
> > > +     i2c-scl-internal-delay-ns =3D <10000>;
> > > +     status =3D "okay";
> > > +
> > > +     trackpad@15 {
> > > +             compatible =3D "elan,ekth3000";
> > > +             reg =3D <0x15>;
> > > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > > +             vcc-supply =3D <&pp3300_s3>;
> > > +             wakeup-source;
> > > +     };
> > > +};
> > > +
> >
> > Thanks,
> > Angelo
>
> Thanks for the review again.
>
> ChenYu

