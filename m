Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E366BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbGMPo3tGq+YirHQo7N71fQRLGFMALJjCkoQPoPiIHU=; b=nL6XmURbb89JSSFdKFnMz5Zdne
	npAFS/Q/jorWOWTFIKTB1oevzXxCRC1TAHw4QEC9lNAJnsB99N2+oL8j0Wh0kh0n2Xb8HcDHT8lqf
	RJpHrza8fej2banOu01U2tGqPfOI5SN8FOvT/haOGUG/ittU2JAkQmO8p34uzWOvue1UNFxWc3IYj
	41xduptnVIjHLJ+xm9dGtXwHpdUETbFZOVH6OZzSdXWUrx+ONyKWNVIF6Ql+Qm3cBbjY5jC+zrDp3
	iPlH1bzhyKqA18SKUqqY2Q6V4SqJNVn+QaG5+Y4bzzmDXPh84p84HhgQEtabUAPZlz2whjwTsXA3x
	58tnKkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZAH-005vKE-1H;
	Thu, 17 Aug 2023 09:19:37 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZAE-005vJb-3A
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 09:19:36 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7919342c456so1515593241.2
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692263973; x=1692868773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbGMPo3tGq+YirHQo7N71fQRLGFMALJjCkoQPoPiIHU=;
        b=Qm4ciNzlc9FRYwftkqfSAyfAJyKqfzBRh+ndFYouevcnVSonb3hkzyvNI/TpnCr7df
         YQVULPS4tC7BQPr/r0pwsUCTYp2OeYVOwQStWnaMlrdJ2CswwHkpGf3RWEeQRg7YL1c9
         NM0YInO7/bmGJBXYmx4HfUeLSpeUf0aNlJcHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692263973; x=1692868773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbGMPo3tGq+YirHQo7N71fQRLGFMALJjCkoQPoPiIHU=;
        b=PMkHtyPlTbCRjM7S33cm7kY2EKCy2twA0vaTqA+FeD5L0+ubBkqzdKSjQ16MIJKnfw
         wc+W7Q1z7HRYbe1NRACfeI+Sf/Q31rVRhViXoOdkFhoYQ/wQej8wT4H+LffUTEpt8S92
         +PYfilkJYO5sD5ollSJQ21b6HwxeQTZvRABnmHeDLnDl/UbGhu79wampY9P6EivgaB41
         miWsDsD/anzPnjRfUO1hSdyhJygBwHQACclyqZO7f1g99aTGPDbDBEsOucf6Fz5wkjXr
         nKciatv2BpxfbWxIvt+Sd2vF6V+jYCO3syZs96CHqFH/mKartRUYT/bKQVyL1OWanqAj
         QSyg==
X-Gm-Message-State: AOJu0YxecI4m6o4U4rxRtdmpzY3noVb4GIgwFo3x7JmJmZdAL3xaclBP
	2OkdugA7NpXmsWueWkN0Nc/FyOzJZzEBsUKadBC7Iw==
X-Google-Smtp-Source: AGHT+IHwlHp84D6NTZQKO4FRUFD+68Z2Jmt2OGg+nN3JshwrNkRkLgGjAWC0Nkmq381j0LC9zkZDtC2kGHPxE51tmPw=
X-Received: by 2002:a67:ce0e:0:b0:443:7eba:e22c with SMTP id
 s14-20020a67ce0e000000b004437ebae22cmr3050838vsl.8.1692263973474; Thu, 17 Aug
 2023 02:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230816190427.2137768-1-nfraprado@collabora.com>
In-Reply-To: <20230816190427.2137768-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Aug 2023 17:19:22 +0800
Message-ID: <CAGXv+5EnbovYSfw=_wSKyKTSbDQYu6UW8u8L5bm9PKjN1dVGyQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: cherry: Configure eDP and
 internal display
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_021935_038400_7B001A1C 
X-CRM114-Status: GOOD (  18.28  )
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

On Thu, Aug 17, 2023 at 3:04=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> Add the required nodes to enable the DisplayPort interface, connected
> to the Embedded DisplayPort port, where we have an internal display.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> [nfraprado: removed always-on, added vin-supply and enable delay]
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> The MediaTek DRM changes needed for MT8195 have already been queued for
> v6.6 [1], so this DT patch is the last missing piece needed to get
> a working display on MT8195 Tomato.
>
> [1] https://lore.kernel.org/all/20230813152726.14802-1-chunkuang.hu@kerne=
l.org/
>
> Changes in v3:
> - Split from "MT8195 Acer Tomato - devicetrees Part 3" series

The platform thermal patch from that series hasn't been merged either?

> - Removed regulator-always-on as it's no longer needed
> - Added missing vin-supply and regulator-enable-delay
>
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 37a3e9de90ff..dd5b89b73190 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -47,6 +47,19 @@ memory@40000000 {
>                 reg =3D <0 0x40000000 0 0x80000000>;
>         };
>
> +       pp3300_disp_x: regulator-pp3300-disp-x {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp3300_disp_x";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-enable-ramp-delay =3D <2500>;
> +               enable-active-high;
> +               gpio =3D <&pio 55 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_fixed_pins>;
> +               vin-supply =3D <&pp3300_z2>;
> +       };
> +
>         /* system wide LDO 3.3V power rail */
>         pp3300_z5: regulator-pp3300-ldo-z5 {
>                 compatible =3D "regulator-fixed";
> @@ -217,6 +230,20 @@ port@1 {
>                         reg =3D <1>;
>                         edp_out: endpoint {
>                                 data-lanes =3D <0 1 2 3>;
> +                               remote-endpoint =3D <&panel_in>;
> +                       };
> +               };
> +       };
> +
> +       aux-bus {
> +               panel {
> +                       compatible =3D "edp-panel";
> +                       power-supply =3D <&pp3300_disp_x>;
> +                       backlight =3D <&backlight_lcd0>;
> +                       port {
> +                               panel_in: endpoint {
> +                                       remote-endpoint =3D <&edp_out>;
> +                               };
>                         };
>                 };
>         };
> @@ -881,6 +908,12 @@ pins-bus {
>                 };
>         };
>
> +       panel_fixed_pins: panel-pwr-default-pins {
> +               pins-vreg-en {
> +                       pinmux =3D <PINMUX_GPIO55__FUNC_GPIO55>;
> +               };
> +       };
> +
>         pio_default: pio-default-pins {
>                 pins-wifi-enable {
>                         pinmux =3D <PINMUX_GPIO58__FUNC_GPIO58>;
> --
> 2.41.0
>

