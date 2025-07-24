Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7381C87FC5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=; b=0q0wjSZ+TOasC2
	dIffImx8mWPiZzR+ui9nXPZjULPHLCllNJS1pg2/UPVuW+l2EmMiqCEVwBTQT1o5vzRJ7Y9nOwU9I
	FG3SasULT3wBYdbwQhH1myTzE80cIt1nXUEYCqJ09neA1GhnYK6HiXAH99iJurFA1y8X864VUPVeG
	lXEC4AT8+57EOHuJWGk266nhAfsWoXwd94QPPGIaXqgxUvE3b58ekJHFqzmZEs0mlF+u3K1P60eHW
	tWrBE0F3jg31MEHeCW5YE1okH+QIj9rfOCxBWZfTWzwFsxoMQoAMAnHcXfjP5ZXW1Q5HIKALHrkqy
	p+3lM3d6M4OFsEhKx6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMU-00000007YKV-417V;
	Thu, 24 Jul 2025 13:51:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesZZ-000000076pK-0LA5
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:49:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553b5165cf5so936572e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753350547; x=1753955347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
        b=nUbu2/mK0vAXBCOZRH/Py/PDimtwsSWEaHDlgT7vp5jhxjMq7LYCmjcHTwdLS0Vef5
         F28g+Yffl1k+f6LwuhWH0fRMxFz7bIBygF/KvQ33yFfaMYYejkOgaAmGBjFc0Z20isy2
         Zwdz/TX9RzoEgkJPF/aq/jvshYgZIts8sbcLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350547; x=1753955347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
        b=lTeA87W52jNGWf7vxGYTBk72iwGJ94MawY5Vqr1v7dqoiVagy6+x4uTUNsIzVWzWlj
         SpHk3/f056SCo435WL3YaJIJqqAb5PGLelQEHoqyLfDCyBLnnHngbAccpsE7ktpkLRRs
         PPM/BQPwrlRfyzy5tHUev7ihEAmCXfPmjNezY82xzA6vb8w723NluKHM2Atfztd/RvOY
         zLOj/8eWbWm0t8+Vdw95qYVjFKpRhTzpx9MVtxrsKiAs07bUyCWYPT7wrzaK12QY7b75
         LAhsPV7mhgnsY4dVZNCoGDODMF6ghFKUfwFo6OBmvrzs+laWSO9i3hO8nO2NxZX7AbVf
         /pSw==
X-Gm-Message-State: AOJu0YxamHWlbqLNibbfYkNbLrgDBASonRqE52uY5g6JqlNFwIe5zkBn
	8hDp66L+rRaRFO7SptG0UNA9bXMO6Naci22LS3/HPxpnq9exZzBGZTnKUrDRAxxqLToI3hQ01Ww
	uyEw2W9wkavVPaYp0gXDUikc5avC9KTHcqTz3yntp
X-Gm-Gg: ASbGncvlL5I0uI5PKsokhoG0cD/sGHJuo1ZPXo5X5tL5JT36HYjage790HwNkxj5D/y
	1RatA27Ritg1KMXFTrE3Id0XEe6OedhfqNLsZnaIEjhGs03EscqojS0yl9NzZUdw4+u7KP5aOTc
	4J7vfdD17r8iL0KHiQJ5GdpK29SZCfoGVmRyD2XimR18q4/wmdoI/+MC/+emU4n4MTqw1ld3bEq
	OnXGrndv35Vdm/VWIKbzt1I6Wtp1xuJFrU=
X-Google-Smtp-Source: AGHT+IGzfXywNqkl7ab0cE9pUdYYCcgre/IBfX1N5nV04X+BJ3rA6VLZb3GDp2uT00oIYqG6uR1IPA8f6Im9wahsv0o=
X-Received: by 2002:a05:6512:3084:b0:558:f694:a65e with SMTP id
 2adb3069b0e04-55a513b2e09mr1933097e87.34.1753350547115; Thu, 24 Jul 2025
 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:48:56 +0800
X-Gm-Features: Ac12FXyvTWPQD4hmzcW0ijsxU85GUvKBlnETlBmcYtQk6_oa7dGsCrwzhdueCNE
Message-ID: <CAGXv+5FvqKNB5Ufx65p5QnueKgEYwNW20tahVPg-kG5N3t+WGQ@mail.gmail.com>
Subject: Re: [PATCH 28/38] arm64: dts: mediatek: mt8173: Fix pinctrl node
 names and cleanup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_024909_143168_8D3C6703 
X-CRM114-Status: GOOD (  18.33  )
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
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> While at it, also cleanup all of the MTK_DRIVE_(x)mA by changing
> that to just the (x) number.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++++++---------
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 ++++----
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 ++--
>  4 files changed, 128 insertions(+), 132 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index dfc5c2f0ddef..1004eb8ea52c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -5,6 +5,14 @@
>
>  #include "mt8173-elm.dtsi"
>
> +&hdmi_mux_pins {
> +       pins-mux {
> +               pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> +               bias-pull-up;
> +               output-high;
> +       };
> +};
> +

Should probably mention that a duplicate path reference was fixed.

>  &i2c0 {
>         clock-frequency =3D <200000>;
>  };
> @@ -67,26 +75,16 @@ trackpad2: trackpad@2c {
>         };
>  };
>
> -&mmc1 {
> -       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
> -};
> -
> -&pio {
> -       hdmi_mux_pins: hdmi_mux_pins {
> -               pins2 {
> -                       pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> -                       bias-pull-up;
> -                       output-high;
> -               };
> +&mmc1_pins_default {
> +       pins-wp {
> +               pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> +               input-enable;
> +               bias-pull-up;
>         };
> +};
>
> -       mmc1_pins_default: mmc1default {
> -               pins_wp {
> -                       pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> -                       input-enable;
> -                       bias-pull-up;
> -               };
> -       };
> +&mmc1 {
> +       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
>  };
>
>  &touchscreen {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173-elm.dtsi
> index 0d995b342d46..9ec930058b92 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

[...]

> -       bt_wake_pins: bt_wake_pins {
> -               pins1 {
> +       bt_wake_pins: bt-pins {

Nit: I think the original name is better, because IIRC this is
using the RX pin as a GPIO interrupt to wake the system from suspend.

> +               pins-wake {
>                         pinmux =3D <MT8173_PIN_119_KPROW0__FUNC_GPIO119>;
>                         bias-pull-up;
>                 };
>         };
>

[...]

>
> -               pins_ds {
> +               pins-ds {
>                         pinmux =3D <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_D=
SL>;
>                         drive-strength =3D <MTK_DRIVE_10mA>;

Missed one here.

>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };

[...]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boo=
t/dts/mediatek/mt8173-evb.dts
> index 9fffed0ef4bf..51118a4149d8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts

[...]

> @@ -245,20 +245,29 @@ pins_cmd_dat {
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_clk {
> +               pins-clk {
>                         pinmux =3D <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_C=
LK>;
>                         drive-strength =3D <2>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_rst {
> +               pins-rst {
>                         pinmux =3D <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_=
RSTB>;
>                         bias-pull-up;
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1 {
> -               pins_cmd_dat {
> +       spi_pins_a: spi0-pins {
> +               pins-bus {
> +                       pinmux =3D <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>=
,
> +                               <MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
> +                               <MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
> +                               <MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
> +               };
> +       };
> +
> +       mmc1_pins_uhs: mmc1-uhs-pins {

Wrong order?

> +               pins-cmd-dat {
>                         pinmux =3D <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_=
DAT0>,
>                                  <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DA=
T1>,
>                                  <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DA=
T2>,

[...]

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

