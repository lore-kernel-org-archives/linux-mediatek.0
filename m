Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB04C10DC1
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEhBHN8VbNTSZ80HrOax/U+nyc8vUjuAU0nMFJkgYg0=; b=bFUwDt1RcZXpT0LhZp1C5ALB81
	bHS++fpRGX0SEkaMlBYIWxYboVVyudtn2dPF9kOdcynukiVi59d6F0un+xj2cVoTF+Vx09K6VCFVZ
	69YlA+dpxT4UuuYntAvij5Rg39sXZDfzE/7pqzIiP9PxZzKnARB+IJ5tVh6s3vjCDq8KIeW53HDil
	Paj1g4pwDpfTgX/wE30/94jxNZVVVBp5FzFXpCacA1rmuBzKomzbk1+L07fpjl5pileJEXD/4UuOG
	Yjm30t0wciyJ97pH1dRyNLkE9naCDozVS7+ABab9UKdie35hRmBVkZRsyTnqbbcvgca3dHyTBNMHW
	K5hJu/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9F4D-00EzZD-3C;
	Sat, 02 Dec 2023 01:45:13 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9F4A-00EzYb-0y
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Dec 2023 01:45:11 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d817ccaa6dso812111a34.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 17:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701481508; x=1702086308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEhBHN8VbNTSZ80HrOax/U+nyc8vUjuAU0nMFJkgYg0=;
        b=d1B9H4YY8JvoeM6Yvycvfm5HzmVdVlgBdpIGw11p6Mb717BWKYYx8Rs6Q+8UNcrM5E
         QBVlliDoGnoG2h/fBqkV+BByZkpKr6LPXXCMIBLa4eA1JgCdKPBHU4LsVGxLBJ5TVMCo
         wql90W25//ZWPhgwwpFYAz6mwXpFNHqcRgleQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701481508; x=1702086308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEhBHN8VbNTSZ80HrOax/U+nyc8vUjuAU0nMFJkgYg0=;
        b=D6nIcXcDz2KuX3N6WcFvSowWhScW6mUhLLg4S9NNXyFPpVOqOx110vymyPThIorLJF
         Q79B95bG+nkgvAQ1Dn0laoRn3kDGWN1wcH950XuB1WycDq0wxNFxHWh9P77sfd7RIuc4
         2KXt2Km/9wq9i/j8yJ6zLgwVd7fjOnCLgkxKjmKdwI98FxZEC0Yo2nfYhHZU3DHlDHgl
         NWTWgbgb6lNV0ZkrzLwrjL1Wjxy2FQMUGTjy5pk8MELSnMaMD56XTOhtvwLjdSTHiD+k
         HIhKw2M2Es8cPqN0sNtjB3ZReeLnjYZS3j97ZsqmP/3xUSq9qxsAkYxjrhNBd8Hs/rhJ
         v4lQ==
X-Gm-Message-State: AOJu0YzWlritG76xRq7ZAD2w/aAjslE95Na1Iw5UEDkBZT3ANh5ijZJ6
	QwanppEy0UvKKn96u8yyE7JLqlxMu7wgfgotS/HztA==
X-Google-Smtp-Source: AGHT+IHm6JkQcChFtigJpby7DNcj+ghLGqdLy7xAZomgEUCmwUBtA96uNNJnkhGNGGUMwe4XdXtWmX53OPnA/nRo31I=
X-Received: by 2002:a05:6830:1696:b0:6d8:5534:61f9 with SMTP id
 k22-20020a056830169600b006d8553461f9mr541143otr.35.1701481508614; Fri, 01 Dec
 2023 17:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20231201070719.1229447-1-wenst@chromium.org> <20231201070719.1229447-7-wenst@chromium.org>
In-Reply-To: <20231201070719.1229447-7-wenst@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 1 Dec 2023 17:44:42 -0800
Message-ID: <CAJMQK-iPT6p1izqQCHmJD2+E_RmnDKQfxsgMetnKtwNgLUmx1A@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_174510_383839_8723C9E0 
X-CRM114-Status: GOOD (  24.79  )
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

On Fri, Dec 1, 2023 at 5:39=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
>
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
>
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
>
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
>
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reorder SKU numbers in descending order.
> - Fixed pinconfig node names
> - Moved pinctrl-* properties after interrupts-*
> - Switched to interrupts-extended for external components
> - Marked ADSP as explicitly disabled, with a comment explaining that it
>   stalls the system
> - Renamed "touchpad" to "trackpad"
> - Dropped bogus "no-laneswap" property from it6505 node
> - Moved "realtek,jd-src" property to after all the regulator supplies
> - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> - Renamed "vgpu" regulator name to allow coupling, with a comment
>   containing the name used in the design
> - Renamed "cr50" node name to "tpm"
> - Moved trackpad_pins reference up to i2c2; workaround for second source
>   component resource sharing.
> - Fix copyright year
> - Fixed touchscreen supply name
>
>  arch/arm64/boot/dts/mediatek/Makefile         |    4 +
>  .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
>  .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
>  .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
>  .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 +++++++++++++++++
>  7 files changed, 2007 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dt=
si
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool=
-sku327681.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool=
-sku327683.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacrue=
l-sku262144.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacrue=
l-sku262148.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index e6e7592a3645..442af61b1305 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile

<snip>

> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327=
683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.d=
ts
> new file mode 100644
> index 000000000000..2e4d8df978c1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +#include "mt8186-corsola-tentacool-sku327681.dts"
> +
> +/ {
> +       compatible =3D "google,tentacruel-sku327683", "google,tentacruel"=
, "mediatek,mt8186";
> +};
> +
> +/* This variant replaces only the touchpad controller. */
> +&i2c2 {
> +       /delete-node/ touchpad@15;

corsola.dtsi has this node named trackpad@15.

> +
> +       touchpad@15 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&trackpad_pin>;
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x15>;
> +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +               hid-descr-addr =3D <0x0001>;
> +               vdd-supply =3D <&pp3300_s3>;
> +               wakeup-source;
> +       };
> +};

<snip>

> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku26=
2148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148=
.dts
> new file mode 100644
> index 000000000000..7841046084dc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dt=
s
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +#include "mt8186-corsola-tentacruel-sku262144.dts"
> +
> +/ {
> +       compatible =3D "google,tentacruel-sku262151", "google,tentacruel-=
sku262150",
> +                    "google,tentacruel-sku262149", "google,tentacruel-sk=
u262148",
> +                    "google,tentacruel", "mediatek,mt8186";
> +};
> +
> +/* This variant replaces only the touchpad controller. */
> +&i2c2 {
> +       /delete-node/ touchpad@15;
> +

ditto.

> +       touchpad@15 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&trackpad_pin>;
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x15>;
> +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +               hid-descr-addr =3D <0x0001>;
> +               vdd-supply =3D <&pp3300_s3>;
> +               wakeup-source;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> new file mode 100644
> index 000000000000..c5446b18783d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -0,0 +1,1719 @@

<snip>

> +
> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       /*
> +        * Trackpad pin put here to work around second source components
> +        * sharing the pinmux
> +        */
> +       pinctrl-0 =3D <&i2c2_pins>, <&trackpad_pin>;
> +       clock-frequency =3D <400000>;
> +       i2c-scl-internal-delay-ns =3D <10000>;
> +       status =3D "okay";
> +
> +       trackpad@15 {
> +               compatible =3D "elan,ekth3000";
> +               reg =3D <0x15>;
> +               interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +               vcc-supply =3D <&pp3300_s3>;
> +               wakeup-source;
> +       };
> +};
> +

<snip>

