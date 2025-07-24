Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2B1C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=; b=AqoVIG2Z4zzbpQ
	Dt6iuumWDFrO6tXiewga0Y1CNBlG3F8FVl1rwpYaAi0GSVN1tw3rqd8xAdiBeWFqLLtlqBt2tQ6Dd
	+OlHkD6tPa+CVZhzPNzcL8frdv3XsT8qCdHz8ekC+tGV6s7ai9bOjrvoWwom2MZYrpkstQRLQvyZX
	5/C/d6B481AWSuuV2/WH5QdY8WfJUGLLwluECq7L5bdaqJR0R/O2ypEcODGodWyCKVIWv4W6jdJsp
	NbhqXgS+WO0RwmKFVi/O2vWO/4qYlcP1pxlFmaAlJ62YQe17UwfnPDdJSWi/KUjgqnlFIp9f94TwP
	K6tzhOnMk5p2/bUbbZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetaT-00000007GRZ-12L6;
	Thu, 24 Jul 2025 10:54:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesLN-000000073dd-21oR
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:34:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-556373661aaso685070e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753349668; x=1753954468; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=QTGRy9ENFX8w2iI2r7AiRaTfiqVVOYAEk6fJHYVqGAqxUW+ykr3bs+OaLzRc13Z2Ru
         0+/qO4226eq6Q9iXcgMOrbnY+j08/uehjKMpcXsKR77doPR+pUZgbJRiUXGcB2ButvKt
         Jms/7qYbU+VZzO8OOUc5C6RceUdYNDrtl/34c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349668; x=1753954468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=F0LASP0ZuOzjfZK/5RqWfp5RGjj+7YZdcWdRi8oI5wylgcx5cyaSHWZbkrDVPbytiU
         WEGUHECuaWWM25nuyY44LwiTIqOqMg+9DtdG4kSoAwl86AhU/qVQzAAdkhXRFDeQkFED
         FWRJ/Tw6WWhXf3PofvbgbUQjFNrPYlnIdkTPdQRNr2cO7zsxQ5A/2jCbFetpfhb3fva4
         GvNhDrWSj4s1ZddPxK8nH6bOKYAaljq/aCrhLosn6oUgFk1sptkK5eAJIuVWyln1mn1f
         B1VjGjAPvwbu8/TorvGiAdhIUzB/hVvuOyxlGWBy7hphaZsNj1Vk/h+ei3lRCXuULtna
         RteA==
X-Gm-Message-State: AOJu0Yx3ZbPB8AMzqXm95peqmk39EmbFlyKjTT0/LVJgz7L2zlR3uT0z
	ge46R0WmRtV8FWenJ3xlSRlxnINz9wE3bSAwvwFTYkkkce5Z1Y4Hk8J8z0VBkBKUBIGhf9zypkS
	jD+vvgWrVlLwwI6b6n0dMIjZf4UqcF/WQBMJZ80A1
X-Gm-Gg: ASbGncuYN0jGnNcLu6zKBcVu+uMYvg/hVelzQ3csm3TRDgXeIU3hfCurw2uO/+PDxG3
	fZwVxx+ynfyVtrrpqvAqA3/Ry4cCH/VR2aQpzMDS2uiOlU0h7f73zCs+44nZtzSdI/OT71uvdQ7
	rNIndJjJnmwCyT+VroXjnGB7djyz095l4T5Y33JszsyNDwHQz1InxWTYfl0VWrnk58OMUaEUwGp
	XEtkf6ffhfwRiHwiXbv1ps7qk9Ggb+8fSs=
X-Google-Smtp-Source: AGHT+IGbQGAzYrZuGKb7ZyVDVB2IA3/m7/1T14ShQ1gB/s052YEW14kETsBT1/6F7qIVfTgZAU3RoBMdAKdnokA3DJc=
X-Received: by 2002:a05:6512:2391:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55a513bf799mr2287118e87.31.1753349667560; Thu, 24 Jul 2025
 02:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:34:15 +0800
X-Gm-Features: Ac12FXx-dC7GqsweL9em8IYbzr7gdu7h7TRc-hJouMaDYtIUw_U2Osb1ZV53HA8
Message-ID: <CAGXv+5ECM53Q4ndZ49Xa71mamy=GhGqdOMQYXydH6cEeT=0EgA@mail.gmail.com>
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_023429_525576_1F9E17CD 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
>
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.

This is just an artifact of the lineage. Kukui the original design
was a tablet with MIPI DSI panels. Then the Jacuzzi clamshell design
with eDP panels was derived from that.

If we really don't like the duplication, maybe we could introduce
a `mt8183-kukui-tablet.dtsi` file for the bits that are specific
to the tablet design.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>  5 files changed, 83 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>         };
>  };
>
> -&dsi0 {
> -       status =3D "okay";
> -       /delete-node/panel@0;
> -};
> -
>  &dsi_out {
>         remote-endpoint =3D <&anx7625_in>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>         };
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>
>  &dsi0 {
>         status =3D "okay";
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       panel: panel@0 {
> -               /* compatible will be set in board dts */
> -               reg =3D <0>;
> -               enable-gpios =3D <&pio 45 0>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&panel_pins_default>;
> -               avdd-supply =3D <&ppvarn_lcd>;
> -               avee-supply =3D <&ppvarp_lcd>;
> -               pp1800-supply =3D <&pp1800_lcd>;
> -               backlight =3D <&backlight_lcd0>;
> -               rotation =3D <270>;
> -               port {
> -                       panel_in: endpoint {
> -                               remote-endpoint =3D <&dsi_out>;
> -                       };
> -               };
> -       };
> -};
> -
> -&dsi_out {
> -       remote-endpoint =3D <&panel_in>;
>  };
>
>  &gic {
> --
> 2.50.1
>

