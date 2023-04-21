Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A01C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJKGDTicdDOydwAyS5XLugqVzczoGrGZVxyOPeyI0mE=; b=1Io2pSSsYnmspCAbj4VH/IfFYD
	GNv9DuaOkzLDNXMiVe3s3INFu/uGvKu8yeZbj4lKpF5MzYXNqbdxhgmspm7kX4Q+3f04PFUCch3N/
	PJQMQ6+ubnmzqTMftQHeh6Xdf4Iwb4sbinls+TgjAFmB6WmgsoVtXzym9eveE/37HX5/n0YBiP2v0
	W++Cv1lt6YScnPGasuHzTlCq1+wGq1h+lH2dRMzD3tbzF+XY00emVzas7Ab7z2/Z7HhtYBjpj8Hu+
	icdXWu9cHOHEzuVNSa2ZPURBeYy0rHr/chmk6FIBXTPzhMaq2qqQY5QNeWsGzHgHsC4iEuxfQe3OL
	X3IxOl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkiF-009tZ4-0E;
	Fri, 21 Apr 2023 06:57:43 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkiA-009tXY-2P
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 06:57:40 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-44058ece4f3so831829e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Apr 2023 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682060257; x=1684652257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJKGDTicdDOydwAyS5XLugqVzczoGrGZVxyOPeyI0mE=;
        b=Idit8eCqCgTG3r3YDXJ4riHvsH9dFKDnOm4WUrpndwWlD5IUcVzFvKa9odfDNhtPfP
         1aco9mVjUHcqvupq4gv2tRpyTSeCR91veQ0NNgA6NppySxMU22vOB4DF3UhsVTL5PeiF
         46bvAdmy4tRKYKlptuX6lbpjqLIh+0srq8WnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682060257; x=1684652257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJKGDTicdDOydwAyS5XLugqVzczoGrGZVxyOPeyI0mE=;
        b=J91059mBpeJ0W/A0wWlWjNHZakDXWZQABZ4r0SgBBiesfKWsCrKjSkdXUyjLmr84Ym
         osSAHa7UYzVUPnLP9W1rFCJwdr71r9w8P+Xoysi8ZXOx1A9tGq6gWDDsBJnbJCTgaE8p
         n0JGx17WDn8M26qgIdE9mAinDPJUWNG/emS4SuLVNI2quag5cZjsmqKLOjiayXk1nUug
         g4PKboXuxbWQd+vE6HUew8OfCUTU0pqeAyov4JVp2JqsqBkHJlCR1F2eX4gUTnGv4xCx
         K1azRvWH/BhaARgYZ1htN0eTmBO+++7/QpobmqdaydmfPYv+QuyWi+9PoPgMR+HsbZ9X
         rZHw==
X-Gm-Message-State: AAQBX9cVAsgbEE+8UZ56jeZm3qyXVnQM5d0j4OWuCyk1vB7Tbq1rfElk
	Ev+kzJJXJyzA6h5ehZqRDC5KhWXKEdmfYrIUhgukfsfjFiKRClevwKo=
X-Google-Smtp-Source: AKy350baBuLFoDL6dTLHo8N9DcJGnnvarEUOSLvi+u2GONsBq5/4u9NgF9Gejms6x5qeKN4B4rq7fak2/O9S3xQEQDE=
X-Received: by 2002:a1f:4349:0:b0:43f:cc0e:6eae with SMTP id
 q70-20020a1f4349000000b0043fcc0e6eaemr533384vka.10.1682060257462; Thu, 20 Apr
 2023 23:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com> <20230420094433.42794-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420094433.42794-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Apr 2023 14:57:26 +0800
Message-ID: <CAGXv+5GXuvw+o=JEjLP+hkKzL=stzmEHWZ18N2RJDbcWeioxnQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: cherry: Configure eDP and
 internal display
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_235738_823773_439C02B5 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the required nodes to enable the DisplayPort interface, connected
> to the Embedded DisplayPort port, where we have an internal display.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 918380697a9a..46f1c8091498 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -49,6 +49,18 @@ memory@40000000 {
>                 reg =3D <0 0x40000000 0 0x80000000>;
>         };
>
> +       pp3300_disp_x: regulator-pp3300-disp-x {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp3300_disp_x";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;

From the schematics:
                  vin-supply =3D <&pp3300_z2>;

Also, this is an RT9742. The datasheet says the typical enable time is
2.1ms. For a bit of margin, I'd say we could model it as 2.5ms? So:

                  regulator-enable-ramp-delay =3D <2500>;

ChenYu

> +               enable-active-high;
> +               gpio =3D <&pio 55 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_fixed_pins>;
> +               regulator-always-on;
> +       };
> +
>         /* system wide LDO 3.3V power rail */
>         pp3300_z5: regulator-pp3300-ldo-z5 {
>                 compatible =3D "regulator-fixed";
> @@ -290,6 +302,20 @@ port@1 {
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
> @@ -929,6 +955,12 @@ pins-cs {
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
> 2.40.0
>
>

