Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D30D606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5XpHfDM;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ghMx/3dg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z8qg3U6Qej1tpAsWPfwFQnfSv2z3+luuDln9nLU+vFA=; b=b5XpHfDMV4L2TX
	rFjThFhcAE3gVnipcJHnuO7IrMJXPVnXYiIdHxqzJf0oKxzErB/53Ml2RFrr22jbpjx6y3GDTnHv1
	NimnfktIfyY773HdFoamH/WxE8P//HWHAk7aBWgmcslcaP2vsCVxxFOJ2F2JtfwCxjqWowGBX9Q/Q
	06sE6/pUyO3aBl9I1uHRJeVHd4LjYeIdhUL1t3ZaMo1DAIWnpZ58B42oW5tHOqvqiFaZGH7GezUX/
	H2E7Ubd+SOGYlP/ZZWW1g6NPcYd1txbtO0iZpRLNe9f3VV5hmmNNKM4krTsv3moeAR+d93C5In9JA
	vzTvt9tQuRbbmGfuo2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSj8-00000003GWP-4273;
	Mon, 23 Nov 2026 12:00:54 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSj5-00000003GVN-0B74
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 12:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795435247; x=1795694447;
	bh=z8qg3U6Qej1tpAsWPfwFQnfSv2z3+luuDln9nLU+vFA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ghMx/3dg2zSJoKg0v4LkFmgAUSKTrtj4meQAd2seNAMRVfXTtmg1YxOln2MsOhJlr
	 pZGQa6rX0m2gnWgBQZr0GnHkW51Uh6dus3KW6oDJP1LHR5h+om9Rnq2NCkdIBWOE/8
	 VeloCQFtp7ed9geyWVbdZ9wDa7ruV5BigJpoA5oILwc4s2/bH/mjKPF2MQxfRiih+2
	 n9PswQ7IuYeiLNfRF/i8581MXOhqX3quSCwkCxG9hDeLDxcAcZ74+t/dX+fZ0Hc4Rv
	 RoKM1I4noQ3HNHsVbUzMsOek23H/M+TLbuaMJS46Ptt+q8hkAoAChVm7bXXc2eY1+k
	 kse3Sh7kLUc8g==
Date: Mon, 23 Nov 2026 12:00:40 +0000
To: Alexander Letuchiy <asalde.le1@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
Message-ID: <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com> <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 9176670b887ca86ce9dd7243954764b2d1874340
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_040052_153234_C7B118BD 
X-CRM114-Status: GOOD (  20.91  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, November 23rd, 2026 at 1:20 PM, Alexander Letuchiy <asalde.le1@g=
mail.com> wrote:

> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
> console on UART0 and the volume down key on the SoC keypad. The power
> and volume up keys are connected to the MT6363 PMIC, which isn't
> supported yet.
>=20
> The DT only describes the memory that Linux itself uses, which is the
> ramoops region. The bootloader updates the /memory node and adds the
> firmware carveouts to /reserved-memory, so their addresses are not
> hardcoded here. This DT must not be booted with a bootloader that does
> not do this, as Linux would then use memory owned by the firmware.
>=20
> The ramoops zone sizes place the console zone at the offset where the
> bootloader expects to find it.
>=20
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>  .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++=
++++++
>  2 files changed, 88 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index a86fb313b1a9..d73489149ab5 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-sony-xperia-m5.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6895-xiaomi-xaga.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-cudy-wr3000-v1.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/a=
rm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
> new file mode 100644
> index 000000000000..7bfe0d438803
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +
> +#include "mt6895.dtsi"
> +
> +/ {
> +=09model =3D "Xiaomi Poco X4 GT";
> +=09compatible =3D "xiaomi,xaga", "mediatek,mt6895";
> +=09chassis-type =3D "handset";
> +
> +=09aliases {
> +=09=09serial0 =3D &uart0;
> +=09};
> +
> +=09chosen {
> +=09=09stdout-path =3D "serial0:921600n8";
> +=09};
> +
> +=09memory@40000000 {
> +=09=09device_type =3D "memory";
> +=09=09/* The size will be filled in by the bootloader */
> +=09=09reg =3D <0x0 0x40000000 0 0>;
> +=09};
> +
> +=09reserved-memory {
> +=09=09ranges;
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <2>;
> +
> +=09=09/* The firmware carveouts are added by the bootloader. */
> +
> +=09=09ramoops@48090000 {
> +=09=09=09compatible =3D "ramoops";
> +=09=09=09reg =3D <0 0x48090000 0 0xe0000>;
> +=09=09=09no-map;
> +=09=09=09console-size =3D <0x40000>;
> +=09=09=09ftrace-size =3D <0x10000>;
> +=09=09=09pmsg-size =3D <0x10000>;
> +=09=09=09record-size =3D <0x10000>;
> +=09=09};
> +=09};
> +};
> +
> +&keypad {
> +=09debounce-delay-ms =3D <32>;
> +=09keypad,num-columns =3D <1>;
> +=09keypad,num-rows =3D <1>;
> +=09linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
> +=09pinctrl-0 =3D <&keypad_pins>;
> +=09pinctrl-names =3D "default";
> +
> +=09status =3D "okay";
> +};

Nit: vendor,property should go after pinctrl.

debounce-delay-ms
pinctrl-0
pinctrl-names
keypad,*
linux,keymap

status

P.S. scripts/dtc/dt-check-style --mode stricter can be handy.

Best regards,
Roman

