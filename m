Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2ADC71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 04:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh8L7SPw4RViz9VA1sF9ySvJTG7C06Vhgexpn6PD42w=; b=OH4IzwphwZW/38HSKw+6HyD6u+
	gMaYxzx+8ujtBJdp0qAvDGUCDgMzHdBGZS9/0rM8ws+pazXlNLbMMQcUhjykIQxM6nWEq8zDqbpYZ
	FvUVxvSNZHnmiJ0DeaPo8v+kKn42OxR88SjU4ZumbB+gYB/nf2F9sh1zPifrdikhCg95TqKJuQWvl
	YX2H10ogHKn3vU9HOlKAuaCUoXKYuZueuHMCB61RJBMb3J9GZ/j8bR7StNVZxkUWMxpz3BCW7eBRo
	cWCZQ9fq47naGg4NYq840tLY4K4+TEU/8G+035jE7aptMjtMhijFS5926HppwdJFXpTZ8n7RfXdcK
	e6Bz5Lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaTz7-008qUK-2t;
	Mon, 28 Aug 2023 04:36:17 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaTz5-008qTO-0A
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 04:36:16 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-48d0c7bfc49so1810944e0c.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Aug 2023 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693197371; x=1693802171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh8L7SPw4RViz9VA1sF9ySvJTG7C06Vhgexpn6PD42w=;
        b=L/uZO4Gd3rjoW8dAVPF8qpTF14OjQc/iyfqEvuSjsN+vpmLaz2qz9kgrH/gJgSaHcx
         a7qqgKWxqUd2UNVJ8CajAhS3p1JFPLDBSD1t+c//3GJXE+W9iXqUWGwES4VRDvAVl1Pk
         oW81fzl2yq9uKzE2pqV22LqM6coCNGimOnZ7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693197371; x=1693802171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8L7SPw4RViz9VA1sF9ySvJTG7C06Vhgexpn6PD42w=;
        b=VG5DCtOGYdKrjZcmsZuQOr/sgqcMXTEqhMdYeN+raNLLTYS71ix6G04YftInHJFgz2
         fcf9xyHwZtZsD00FyJDBBbwzTQ0/JgfRmn+4NS8Ihy5jFOQGAioj+Z3fgkKLy020byeS
         IjpBEMwvbYdvw5jsJjk9QUG2xXLfz39+hDv8UbD5lc2q6ydVx3gyTgtCgdAkGoVCdhne
         e6Y1tK1Bn7hyQ7OAJ9XTP4aLh866PsEgpeMR/qXIFrQiNP+o0QsgnmmrzWhBN35Sy595
         SRWh9p4hI20G+onv7ENgkW59O3y6vPlMfPy6BjRY50Uybry8f8C87mbsC4wMkCC1k7ph
         JrGA==
X-Gm-Message-State: AOJu0YzA9L7gwLP/X6rTNzS5nZEMD5A5qhumqjoeY0npmlxXWz16HIPi
	BVFIbCHt5M21FZgVRZmNXZROk0ctMPvM83OZDfov+g==
X-Google-Smtp-Source: AGHT+IHLoDWbp+A1vm+E06DTMTE8I9Noq3kCRigkWJtma4Wg5EkCXXdSuBcCU5DRQCse7QXtHEqJ0euy3T5dp2nQ+sA=
X-Received: by 2002:a1f:c886:0:b0:490:1723:a491 with SMTP id
 y128-20020a1fc886000000b004901723a491mr1909681vkf.5.1693197371386; Sun, 27
 Aug 2023 21:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230825114623.16884-1-macpaul.lin@mediatek.com> <20230825114623.16884-3-macpaul.lin@mediatek.com>
In-Reply-To: <20230825114623.16884-3-macpaul.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Aug 2023 12:36:00 +0800
Message-ID: <CAGXv+5FTuY=ZHB3-2Woit5amRZ=RxByGMq=LQp-es8tWEhAQUA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360 related nodes
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_213615_121710_F6CE4633 
X-CRM114-Status: GOOD (  19.59  )
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

On Fri, Aug 25, 2023 at 7:46=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.c=
om> wrote:
>
> MT6360 is the secondary PMIC for MT8195.
> It supports USB Type-C and PD functions.
> Add MT6360 related common nodes which is used for MT8195 platform, includ=
es
>  - charger
>  - ADC
>  - LED
>  - regulators
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6360.dtsi | 112 +++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6360.dtsi
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6360.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6360.dtsi
> new file mode 100644
> index 000000000000..e841f4e5a54b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6360.dtsi
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 MediaTek Inc.
> + */
> +
> +#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +
> +&mt6360 {
> +       interrupt-controller;
> +       interrupt-parent =3D <&pio>;
> +       interrupt-names =3D "IRQB";
> +
> +       charger {
> +               compatible =3D "mediatek,mt6360-chg";
> +               richtek,vinovp-microvolt =3D <14500000>;
> +
> +               otg_vbus_regulator: usb-otg-vbus-regulator {
> +                       regulator-compatible =3D "usb-otg-vbus";
> +                       regulator-name =3D "usb-otg-vbus";
> +                       regulator-min-microvolt =3D <4425000>;
> +                       regulator-max-microvolt =3D <5825000>;
> +               };
> +       };
> +
> +       adc {
> +               compatible =3D "mediatek,mt6360-adc";
> +               #io-channel-cells =3D <1>;
> +       };
> +
> +       led {
> +               compatible =3D "mediatek,mt6360-led";
> +       };
> +
> +       regulator {
> +               compatible =3D "mediatek,mt6360-regulator";
> +               LDO_VIN3-supply =3D <&mt6360_buck2>;
> +
> +               mt6360_buck1: buck1 {
> +                       regulator-compatible =3D "BUCK1";
> +                       regulator-name =3D "mt6360,buck1";

Normally there's no need to provide a default name. Any used regulator
should have been named to match the power rail name from the board's
schematics.

> +                       regulator-min-microvolt =3D <300000>;
> +                       regulator-max-microvolt =3D <1300000>;

These values correspond to the regulator's range. They make no sense as
regulator constraints. The min/max values are supposed to be the most
restrictive set of voltages of the regulator consumers. If what is fed
by this regulator can only take 0.7V ~ 1.1V, then it should save 0.7V
and 1.1V here. If the regulator is unused, then there are no constraints,
and these can be left out.

Just leave them out of the file.

Both comments apply to all the regulators.

ChenYu

> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP
> +                                                  MT6360_OPMODE_ULP>;
> +               };
> +
> +               mt6360_buck2: buck2 {
> +                       regulator-compatible =3D "BUCK2";
> +                       regulator-name =3D "mt6360,buck2";
> +                       regulator-min-microvolt =3D <300000>;
> +                       regulator-max-microvolt =3D <1300000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP
> +                                                  MT6360_OPMODE_ULP>;
> +               };
> +
> +               mt6360_ldo1: ldo1 {
> +                       regulator-compatible =3D "LDO1";
> +                       regulator-name =3D "mt6360,ldo1";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <3600000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +
> +               mt6360_ldo2: ldo2 {
> +                       regulator-compatible =3D "LDO2";
> +                       regulator-name =3D "mt6360,ldo2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <3600000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +
> +               mt6360_ldo3: ldo3 {
> +                       regulator-compatible =3D "LDO3";
> +                       regulator-name =3D "mt6360,ldo3";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <3600000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +
> +               mt6360_ldo5: ldo5 {
> +                       regulator-compatible =3D "LDO5";
> +                       regulator-name =3D "mt6360,ldo5";
> +                       regulator-min-microvolt =3D <2700000>;
> +                       regulator-max-microvolt =3D <3600000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +
> +               mt6360_ldo6: ldo6 {
> +                       regulator-compatible =3D "LDO6";
> +                       regulator-name =3D "mt6360,ldo6";
> +                       regulator-min-microvolt =3D <500000>;
> +                       regulator-max-microvolt =3D <2100000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +
> +               mt6360_ldo7: ldo7 {
> +                       regulator-compatible =3D "LDO7";
> +                       regulator-name =3D "mt6360,ldo7";
> +                       regulator-min-microvolt =3D <500000>;
> +                       regulator-max-microvolt =3D <2100000>;
> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NORMAL
> +                                                  MT6360_OPMODE_LP>;
> +               };
> +       };
> +};
> --
> 2.18.0
>
>

