Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC4C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/EkXHhpekudgYRSVvD2Wp54aMGgIOeanmC+1OUeyjw=; b=3I+SVHn/rrlSCc7HNDdIi+Obf8
	wyc6coY2fX9xkbovpjNYfdtKxYBYmfrKMvUHimCBtPo4sgVx0sm5rhCMLesghbxdiRe9FSu0+QGCx
	YcgR/2H3HCvGliVWU0n4/eoppaiOvIxiUnwsIgWjjtFdptfrIpMRswxWV0obptx4RNiLHZio5UGfo
	d61CFrRrfms4byStE4V4zC9LzjKTzmBbnyGw0/kKWS9S6rLgF8wc3KXOmYrqAqm+kEB/UPlgL/3Ua
	Kw74Jshxw/5wjgtUwB0Aq3zasRu3He3cmPJzslv0d3/Q7X4nBAJTNJzSshzquMYrFsXAm1qAWK+qI
	YzgkX4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklue-00AGtI-0P;
	Fri, 07 Apr 2023 13:13:56 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklub-00AGq1-1G
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:13:54 +0000
Received: by mail-yb1-xb33.google.com with SMTP id p15so48951063ybl.9
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873230; x=1683465230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/EkXHhpekudgYRSVvD2Wp54aMGgIOeanmC+1OUeyjw=;
        b=Lmi33RpPAeAf0TiyeOM6CEzn/jQzfV9SihWbM/WsNHUP6UpULDqWC0TZnWQGpF2olD
         uGLvtNPlIAmdsHfDkoW4BnfZs1flgjgkdPMh+gx9rppah0S/hajaOFAfaPHlGlGRhAUw
         UOQ3YRUabWENsRnhFMr6JaHXktYn7krBaTpR/rIyb31stu94zFYRgkVcv5YURQM7qhV2
         t5NFe73izFRSjn1s8XL99h3w8uZ/1NHm39yoKyHcmq+dmIhxY4/lGiv9tjtSjt2tHjLn
         kreZgT+O723mZsRmhFfP14yop6Zjt5IEqPDiY6sL0aLx1/UoxqcBfBFm8fgkNbAfCVNW
         zh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873230; x=1683465230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/EkXHhpekudgYRSVvD2Wp54aMGgIOeanmC+1OUeyjw=;
        b=C4k8U7db+vkiXUKl1ETwJO1l6MHD9yj/LKvq3dnoYOkaLYgokfO8ibV9VofShT0Le4
         DDSIRQXSHNlPQ0BsWRHo5ALs7Od+H+J5iKWdtBaQTiYBXv5Hl5qUozmUEFar1CvDCepf
         ZIEd8lHHJYoWhcmkMrWlfXenV9vNhA8lXsya+/u40AmfZtLWktkoadWQ1SAjf56rthCg
         9syR0uMThUm5JGkHkkedOCzuD0BL7D1HgaT7/4mgtj0fQv+uerXceOJmh/7FwBUsNifx
         vQuamT2M7RnJVDgcTwpSOI3EcKly+Q6+ueFtYYLaq9vze3Jr/nhw2uAGbqEEadZL7LHm
         JArA==
X-Gm-Message-State: AAQBX9fzxiXUANDyuHbN+J9fzixcug8mJnzKyPK0ENo/pAURn9VUQbD5
	BHXEBGSUxwo32ANczHB+rPtVwSTCQpFEIpaW52o1yg==
X-Google-Smtp-Source: AKy350akqDsJXu8LyrjpR3lx1Wv1xBy9qWRvVsjm6zQR79fUvbUwSsanR9UopPQcb5ZzGjYyfda/gmvkrWB1tttm4+o=
X-Received: by 2002:a25:6e85:0:b0:b78:1b26:a642 with SMTP id
 j127-20020a256e85000000b00b781b26a642mr1408026ybc.1.1680873230051; Fri, 07
 Apr 2023 06:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-9-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-9-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:13:39 +0200
Message-ID: <CAFGrd9oZW0xjoXXPgZoqwMbgT5ovnRbDr+mZMPO=D2oee7tuuw@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] arm64: dts: mediatek: add ethernet support for mt8365-evk
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061353_467212_F74610DC 
X-CRM114-Status: GOOD (  15.79  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> - Enable "vibr" and "vsim2" regulators to power the ethernet chip.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 57 +++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index 9760f181eb34..431078f8670e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -88,6 +88,28 @@ optee_reserved: optee@43200000 {
>         };
>  };
>
> +&ethernet {
> +       pinctrl-0 =3D <&ethernet_pins>;
> +       pinctrl-names =3D "default";
> +       phy-handle =3D <&eth_phy>;
> +       phy-mode =3D "rmii";
> +       /*
> +        * Ethernet and HDMI (DSI0) are sharing pins.
> +        * Only one can be enabled at a time and require the physical swi=
tch
> +        * SW2101 to be set on LAN position
> +        */
> +       status =3D "disabled";
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               eth_phy: ethernet-phy@0 {
> +                       reg =3D <0>;
> +               };
> +       };
> +};
> +
>  &i2c0 {
>         clock-frequency =3D <100000>;
>         pinctrl-0 =3D <&i2c0_pins>;
> @@ -137,12 +159,47 @@ &mt6357_pmic {
>         #interrupt-cells =3D <2>;
>  };
>
> +/* Needed by analog switch (multiplexer), HDMI and ethernet */
> +&mt6357_vibr_reg {
> +       regulator-always-on;
> +};
> +
>  /* Needed by MSDC1 */
>  &mt6357_vmc_reg {
>         regulator-always-on;
>  };
>
> +/* Needed by ethernet */
> +&mt6357_vsim2_reg {
> +       regulator-always-on;
> +};
> +
>  &pio {
> +       ethernet_pins: ethernet-pins {
> +               phy_reset_pins {
> +                       pinmux =3D <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPI=
O133>;
> +               };
> +
> +               rmii_pins {
> +                       pinmux =3D <MT8365_PIN_0_GPIO0__FUNC_EXT_TXD0>,
> +                                <MT8365_PIN_1_GPIO1__FUNC_EXT_TXD1>,
> +                                <MT8365_PIN_2_GPIO2__FUNC_EXT_TXD2>,
> +                                <MT8365_PIN_3_GPIO3__FUNC_EXT_TXD3>,
> +                                <MT8365_PIN_4_GPIO4__FUNC_EXT_TXC>,
> +                                <MT8365_PIN_5_GPIO5__FUNC_EXT_RXER>,
> +                                <MT8365_PIN_6_GPIO6__FUNC_EXT_RXC>,
> +                                <MT8365_PIN_7_GPIO7__FUNC_EXT_RXDV>,
> +                                <MT8365_PIN_8_GPIO8__FUNC_EXT_RXD0>,
> +                                <MT8365_PIN_9_GPIO9__FUNC_EXT_RXD1>,
> +                                <MT8365_PIN_10_GPIO10__FUNC_EXT_RXD2>,
> +                                <MT8365_PIN_11_GPIO11__FUNC_EXT_RXD3>,
> +                                <MT8365_PIN_12_GPIO12__FUNC_EXT_TXEN>,
> +                                <MT8365_PIN_13_GPIO13__FUNC_EXT_COL>,
> +                                <MT8365_PIN_14_GPIO14__FUNC_EXT_MDIO>,
> +                                <MT8365_PIN_15_GPIO15__FUNC_EXT_MDC>;
> +               };
> +       };
> +
>         gpio_keys: gpio-keys-pins {
>                 pins {
>                         pinmux =3D <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
>
> --
> 2.25.1
>

