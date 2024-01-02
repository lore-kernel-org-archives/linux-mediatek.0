Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F24C47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cKlcr9TDXVMFehMkzlKiGxOSc5Va79SEC/vL9WVI28=; b=34h/Wa7J0x42LDfVdMIQnIqXT5
	VWAD0+2GA85sycC0X+ZN8SYe22TYKfanQPmnwcyrMnJ8ubIbRUUIO4uSJvYsu1pEqxV2GmBWWqtlc
	1CV2UQLfjoCL/ADkazhqwepGSpCAije6qxCUIAiNh5IUgv1Tn753TNmRPFXJXLfuAXvHZocqt9YDv
	/SNe/tdNHQjiZ+H5H+KetXdfNDLV70CcyTyI6cwfxha98fT9Nc4Dj0ba9xqU98ES05dawaCrDL15+
	NKw05h7bj0MichC6egnAEd9eQqWubAxTTr5HKNDTyPPLvKWo58dHh8zF9tyDseN5HCKqlj0DUsBsR
	J+TpKQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbyG-007aRm-02;
	Tue, 02 Jan 2024 10:26:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbyC-007aQz-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 10:26:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ccba761783so72816531fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 02:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704191158; x=1704795958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cKlcr9TDXVMFehMkzlKiGxOSc5Va79SEC/vL9WVI28=;
        b=VorNGVd6q/ujoCkCfK5TQN6RvrZK20WyPS0Vl3i/zEG6faaCVgaA6pWqWKYLGC2v6Z
         +nOyGB89hgBAGU7iwAVAsXSkcXY7z7wBNn5gknrEgfP+15gumpCD/ukNldDTbv/SCTmL
         /pwlwD4FrkODUxKws5vHJ5dFJMsn5JohcmZII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191158; x=1704795958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cKlcr9TDXVMFehMkzlKiGxOSc5Va79SEC/vL9WVI28=;
        b=uD7/fHrx2kpCZbBq4EKOAA0b39JhzC2Ptc24IwjZbf0DnO2hy/4hc8zyBkSFW5nVAj
         pT43Y/kFovmmjYz7ATGqkgP6w80Ukn/dqY6mDxksydY+JWx/Sr8bYkny+bhvI0K5bXqs
         sBu3z8rMUvV4Yymgi7tZhifgJsXGUp5yG7PK8K0elV0T5JDB/vluFVHYW03IC+185J5Q
         YxgizL32xVxW5QqYun492N4psoO4S/JKcFByTFSUN8/QQRIjYjVLkSXX9La4Yld2rZ7O
         LzCaSOnWA6L1ShPH9ldhHCeoqUJCFVl5EpqBxF3Y1/On++ib4y2N+Mx7BsaG9gMGw46e
         gNqg==
X-Gm-Message-State: AOJu0Yy0vt0Nd71CKpCYFY6eBsk85Kz+i+dwatBDZtdrm38TLolNOURa
	fE5XOT7tvVRJQOpA27+UGLF3KVaeifwBWrt3dlyucUjCStKf
X-Google-Smtp-Source: AGHT+IEGSX35g6EPnerKa8KwPEvruyC+Q2TuN1yb8rNK9FEIB+XeyMq/8mUvO/5tVQzkmn1erUK1+fV7WllsmOUyyCA=
X-Received: by 2002:a2e:9d9a:0:b0:2cb:30f4:a342 with SMTP id
 c26-20020a2e9d9a000000b002cb30f4a342mr6642927ljj.23.1704191158118; Tue, 02
 Jan 2024 02:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20231213150435.4134390-1-wenst@chromium.org> <20231213150435.4134390-7-wenst@chromium.org>
 <19c98266-0a8e-4e99-8766-cdf31a3a97b6@collabora.com>
In-Reply-To: <19c98266-0a8e-4e99-8766-cdf31a3a97b6@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Jan 2024 18:25:46 +0800
Message-ID: <CAGXv+5E7yzwgEnSUaS3YerK_kcO853AJsq=gBbkWruh86mXbgQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_022600_639164_743CD399 
X-CRM114-Status: GOOD (  28.14  )
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

Hi,

On Mon, Jan 1, 2024 at 10:09=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> Hello Chen-Yu,
>
> There is still some nonconformity with the bindings, please see below:
>
> On 12/13/23 17:04, Chen-Yu Tsai wrote:
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
> >   style guidelines
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
> >   source trackpad
> >
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
> > ---
>
> [snip]
>
> > +
> > +&i2c3 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c3_pins>;
> > +     clock-frequency =3D <100000>;
> > +     status =3D "okay";
> > +
> > +     it6505dptx: dp-bridge@5c {
> > +             compatible =3D "ite,it6505";
>
> dp-bridge@5c: '#address-cells', '#size-cells', '#sound-dai-cells' do not =
match any
> of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/bridge/ite=
,it6505.yaml#

Will add a patch to update the bindings.

> > +             reg =3D <0x5c>;
> > +             interrupts-extended =3D <&pio 8 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&it6505_pins>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
>
> /soc/i2c@1100f000/dp-bridge@5c: unnecessary #address-cells/#size-cells wi=
thout
> "ranges" or child "reg" property

Dropped.

> > +             #sound-dai-cells =3D <0>;
> > +             ovdd-supply =3D <&mt6366_vsim2_reg>;
> > +             pwr18-supply =3D <&pp1800_dpbrdg_dx>;
> > +             reset-gpios =3D <&pio 177 GPIO_ACTIVE_HIGH>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             it6505_in: endpoint {
> > +                                     link-frequencies =3D /bits/ 64 <1=
50000000>;
> > +                                     remote-endpoint =3D <&dpi_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
>
> [snip]
>
> > +&spi1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spi1_pins>;
> > +     mediatek,pad-select =3D <0>;
> > +     status =3D "okay";
> > +
> > +     cros_ec: ec@0 {
> > +             compatible =3D "google,cros-ec-spi";
> > +             reg =3D <0>;
> > +             interrupts-extended =3D <&pio 13 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&ec_ap_int>;
> > +             spi-max-frequency =3D <1000000>;
> > +
> > +             i2c_tunnel: i2c-tunnel {
> > +                     compatible =3D "google,cros-ec-i2c-tunnel";
> > +                     google,remote-bus =3D <1>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             typec {
> > +                     compatible =3D "google,cros-ec-typec";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     usb_c0: connector@0 {
> > +                             compatible =3D "usb-c-connector";
> > +                             reg =3D <0>;
> > +                             label =3D "left";
> > +                             power-role =3D "dual";
> > +                             data-role =3D "host";
> > +                             try-power-role =3D "source";
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> typec:connector@0:ports: 'port@0' is a required property
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +
> > +                                             typec_port0: endpoint { }=
;
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     usb_c1: connector@1 {
> > +                             compatible =3D "usb-c-connector";
> > +                             reg =3D <1>;
> > +                             label =3D "right";
> > +                             power-role =3D "dual";
> > +                             data-role =3D "host";
> > +                             try-power-role =3D "source";
> > +
> > +                             ports {
> connector@1: Unevaluated properties are not allowed ('ports' was unexpect=
ed)
>         from schema $id: http://devicetree.org/schemas/connector/usb-conn=
ector.yaml#

Not sure why this is happening. Maybe because the sub-schema validation
failed?

In any case, I will drop the whole ports section. This can be re-added once
all the type-C mux stuff has been sorted out.

> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@1 {
> connector@0: ports: 'port@0' is a required property
> > +                                             reg =3D <1>;
> > +
> > +                                             typec_port1: endpoint { }=
;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
>
> [snip]
>
> > +
> > +&usb_host1 {
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <2>;
>
>  usb@11281000: usb@11280000:#address-cells:0:0: 1 was expected
>         from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.=
yaml#
> usb@11281000: usb@11280000:#size-cells:0:0: 0 was expected

Dropped.

> > +     vbus-supply =3D <&usb_p1_vbus>;
> > +     status =3D "okay";
> > +};
> > +
> > +&watchdog {
> > +     mediatek,reset-by-toprgu;
> > +};
> > +
> > +#include <arm/cros-ec-keyboard.dtsi>
> > +#include <arm/cros-ec-sbs.dtsi>
>
>
> Eugen

Thanks for the review. Since the merge window is just around the corner,
I will send a new version later this month.

ChenYu

