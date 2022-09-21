Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD9C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0L9+eR75Qih9B7js8i6qvLYG82sOJdIDqqwTjLBiIQ=; b=PQeBy73doNZ+/pxuoapbcaeFVY
	m0XNX9y+dlzZbIM5vyJ8FS5NMgtQKLrBcinp2hJde//Y9Ikty70nm/vb+pPdsjP/p8UPcG5e8Kh0j
	vlrzdbY3ZVjKdFcxD7HHJfp5WHhWMEgCD/92XyOZVLU1GP1CnlIRakhE6wwsRrxYY/F+ps77avI4Y
	XZNqDbLYB/Jt/vWDITkaptSZIWzaQHNkWfn/OJUCyD4PPwbJSRi40/jSFRnvclF4FeEdRssZb2T/p
	edqN89PmSFRaN1daj7NSrht520Emo0QxInoy4XV9Mer2fX3HEhJ3oO/yymdDDv7U1DZjGR6g58QEJ
	xcVXiKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0b6-00BYSR-14; Wed, 21 Sep 2022 14:21:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0av-00BYQW-4D
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 14:20:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id bj12so13918659ejb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=+0L9+eR75Qih9B7js8i6qvLYG82sOJdIDqqwTjLBiIQ=;
        b=gBI8Il0wjJ4k9W8uDcY2WywCdYlFRc1TCFvzuNI+feU6F5t0q+zxJE36hFlqju4hy2
         K3hEiABSToSDcSynJH5Bz+GzyxT7TlJu8jRLKvTtesUiy/sbNFIpXCBFAWVDhjLJIIJH
         GxCFpmeZ/71CS5p5Hm1xwpER1PCxCjh4/NqMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+0L9+eR75Qih9B7js8i6qvLYG82sOJdIDqqwTjLBiIQ=;
        b=ZCaTjKeClyqV0uETp2zHiqwvLkL41ebUGHA8rAhejdLK+GK6tl2fTnDelvQeJX36tO
         GWF5CAHvfQXSZNqIGGH6lAV4wMTz7Z2ul1kLfyhsc19AdAgA3MBjzRFFcPb+y/CPkfdv
         CcH55BP8IBM6MhO1R0lt7CL2XOpYe2dtTJnuDDDWXKpjWmo9/4M6JzX3veSHCNynM0uM
         jvftHVA9X4wMv58HyrJGrUOtvNx4o2y0bm3MjNRX2Jb+mflffD0PJKoPa9gTSdSDejiR
         UWxT7uhQ+78L3mi+nyZImAfrD5YvV2PXS64ivQRs2Lha6rLBRIbjkjrh9BH13jsb83GM
         dkSA==
X-Gm-Message-State: ACrzQf0dI8fuzojXDgBkeRSJEIevRisN5WyaVygS9PfsuBqYXffjKwb2
	T9kFb7PM8lt90DdNI135FUqMh8/4v2WBbNEX93JPgQ==
X-Google-Smtp-Source: AMsMyM5/L+7UhSWc2DAc+lhVwYvbNwvoBs8veYUQz8kxwfOWmWK0C/jE27btL5ZxCDIBgKX69XN3rLhPSpA/NJMdfzU=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr5468821ejc.323.1663770054748; Wed, 21
 Sep 2022 07:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220908171153.670762-1-nfraprado@collabora.com> <20220908171153.670762-2-nfraprado@collabora.com>
In-Reply-To: <20220908171153.670762-2-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 21 Sep 2022 22:20:43 +0800
Message-ID: <CAGXv+5FErSBT-t6vz_2naApuPoC4PympWft-9Gd_MMPUTN+CsQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: asurada: Add display regulators
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_072057_175159_9A3177AC 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Sep 9, 2022 at 1:12 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add the regulators present on the Asurada platform that are used to
> power the internal and external displays.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
>  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index 4b314435f8fd..1d99e470ea1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -23,6 +23,42 @@ memory@40000000 {
>                 reg =3D <0 0x40000000 0 0x80000000>;
>         };
>
> +       pp1000_dpbrdg: regulator-1v0-dpbrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp1000_dpbrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp1000_dpbrdg_en_pins>;
> +               regulator-min-microvolt =3D <1000000>;
> +               regulator-max-microvolt =3D <1000000>;

This is fed by a rail called PP1350_VS2, which is from the MT6359 PMIC.
And this regulator is a proper LDO.

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 19 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       pp1000_mipibrdg: regulator-1v0-mipibrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp1000_mipibrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp1000_mipibrdg_en_pins>;
> +               regulator-min-microvolt =3D <1000000>;
> +               regulator-max-microvolt =3D <1000000>;

This is fed by a rail called PP1350_VS2, which is from the MT6359 PMIC.
And this regulator is a proper LDO.

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 129 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       pp1800_dpbrdg: regulator-1v8-dpbrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp1800_dpbrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp1800_dpbrdg_en_pins>;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;

This regulator is only a power switch. Please drop the min/max properties.
This is fed by a rail called PP1800_VIO18_U, which is from an LDO on the
MT6359 PMIC.

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 126 GPIO_ACTIVE_HIGH>;
> +       };
> +
>         /* system wide LDO 1.8V power rail */
>         pp1800_ldo_g: regulator-1v8-g {
>                 compatible =3D "regulator-fixed";
> @@ -34,6 +70,30 @@ pp1800_ldo_g: regulator-1v8-g {
>                 vin-supply =3D <&pp3300_g>;
>         };
>
> +       pp1800_mipibrdg: regulator-1v8-mipibrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp1800_mipibrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp1800_mipibrdg_en_pins>;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;

This regulator is only a power switch. Please drop the min/max properties.
This is fed by a rail called PP1800_VIO18_U, which is from an LDO on the
MT6359 PMIC.

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 128 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       pp3300_dpbrdg: regulator-3v3-dpbrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp3300_dpbrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp3300_dpbrdg_en_pins>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;

This regulator is only a power switch. Please drop the min/max properties.
This is fed by a rail called PP3300_G, which is already described below.

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 26 GPIO_ACTIVE_HIGH>;
> +       };
> +
>         /* system wide switching 3.3V power rail */
>         pp3300_g: regulator-3v3-g {
>                 compatible =3D "regulator-fixed";
> @@ -56,6 +116,18 @@ pp3300_ldo_z: regulator-3v3-z {
>                 vin-supply =3D <&ppvar_sys>;
>         };
>
> +       pp3300_mipibrdg: regulator-3v3-mipibrdg {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp3300_mipibrdg";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pp3300_mipibrdg_en_pins>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;

This regulator is only a power switch. Please drop the min/max properties.
This is fed by a rail called PP3300_G, which is already described above.

ChenYu

> +               enable-active-high;
> +               regulator-boot-on;
> +               gpio =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> +       };
> +
>         /* separately switched 3.3V power rail */
>         pp3300_u: regulator-3v3-u {
>                 compatible =3D "regulator-fixed";
> @@ -719,6 +791,48 @@ pins-wifi-kill {
>                 };
>         };
>
> +       pp1000_dpbrdg_en_pins: pp1000-dpbrdg-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO19__FUNC_GPIO19>;
> +                       output-low;
> +               };
> +       };
> +
> +       pp1000_mipibrdg_en_pins: pp1000-mipibrdg-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO129__FUNC_GPIO129>;
> +                       output-low;
> +               };
> +       };
> +
> +       pp1800_dpbrdg_en_pins: pp1800-dpbrdg-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO126__FUNC_GPIO126>;
> +                       output-low;
> +               };
> +       };
> +
> +       pp1800_mipibrdg_en_pins: pp1800-mipibrd-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO128__FUNC_GPIO128>;
> +                       output-low;
> +               };
> +       };
> +
> +       pp3300_dpbrdg_en_pins: pp3300-dpbrdg-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO26__FUNC_GPIO26>;
> +                       output-low;
> +               };
> +       };
> +
> +       pp3300_mipibrdg_en_pins: pp3300-mipibrdg-en-pins {
> +               pins-en {
> +                       pinmux =3D <PINMUX_GPIO127__FUNC_GPIO127>;
> +                       output-low;
> +               };
> +       };
> +
>         pp3300_wlan_pins: pp3300-wlan-pins {
>                 pins-pcie-en-pp3300-wlan {
>                         pinmux =3D <PINMUX_GPIO143__FUNC_GPIO143>;
> --
> 2.37.3
>

