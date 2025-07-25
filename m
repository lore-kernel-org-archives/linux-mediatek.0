Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1471C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=; b=CBPkpKa+PvHSNwLeD+NZhlt20t
	PenKLQ1k13zsH+oT2D47yzeeJA0Nh+7Yaudn63/y+Yxd8YX+VA7G5/0r6jA5CeZxPfQ+5JUo77Q+y
	uuCNRq4yAYAg0dkqvXEko5rrzFEWd6/LOU3+bhSJSWkCKlejaoLhKvbbZorkMUxDjVo5frz6UZASw
	foP8eRw3xjI5Awm4yoLozbtsL9nGGCJNHc9G6wSXrryF7/8FpPdHf6kclxHjpcBZ03UseIj6jWItY
	DUfPMSlniuRmYfcNi45HBoz1SWjgCs+gCqFFDHuOqlprfARyz64X3WA2p2Ue4tAtnGuZzvi17EPKV
	oomFOp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGM1-00000009gaZ-3wZz;
	Fri, 25 Jul 2025 11:12:45 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFVH-00000009ZHU-2vzs
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 10:18:16 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-88150e9fba7so912077241.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753438694; x=1754043494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=nPRh12hUhS2qgQYEdrJIlTGg48wnc3YxPAq8/npR4UjG6p2VRvZDVDgp+MOGqTF8ft
         dMi11hW/TxETMLUC696zdHCX5NrLxynmjXIYWeXiyU80pxBNMO0Ox8xqnf2n52aszatg
         toGmzQ6qr1FtK7+3gBcPJ1nnoxQMtKrHNJTAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438694; x=1754043494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=MIoAveYvIRcKifk//eEAwQhSoIfTKWHL9QqVbPWOPyBRIUUVhr8xR5sKhty/Vxxt7M
         yFeEsxi1t4MKCmE+vSBE0TicJrPWDHmv7uuvTUG0b/rS3naTOZzeoTilW7d5uguN+b+y
         nGqZcjIdxnvgYBrzJAeTKr7ODaC5PN9sNrkr/0sC9Gu/6e40f8wIXipK9b2XfYh5d9lR
         v3QFL4gH7GBDoaEuZEbP+8K8CINa3SxwWai7vN1nd3ix2Sbwq34RgyLbIFznDGcNHb1x
         CxzKrysDXofQyja76MQeSPICD2OTt20f1xSTQGoeaWmzO61UmLgP0tr9pNK2mFaIOcFI
         lXmg==
X-Gm-Message-State: AOJu0Yz3V19r5QCn9M1Z73y5pQiVTbTZARNoeDDXhAaSMwsWs6YY0yK+
	7HI9xJsMFkGSkSDEWy9PPKxmpPfezZhjFSiyhacridprMvSpMtCLabYXHSrTPyJwjAhb9tA/Ceh
	y0gM=
X-Gm-Gg: ASbGnct6r5RfaWzLj+ghdxznDEMaoacDZ/0Zuft1DZgNXNQ4GuqP/LN/56+xVDsGm67
	ERPGXEJi89mB0QWqhg9Zd+UA9m4qKkD3FDUp78cCva1TWc/2rRK/k6VloU5q4aIb9yaDXSwJxWY
	hGRNyeD7K/fYb/2bkwBZU0m19I8YNwJINGM4x3LQLClIM+LkR3bq7YGEA+pDwhfGNLwNVptZAm5
	ecz8MjRFzDKtYwwzK675PPZr0s61U5aaahsVMR037ZGQhwT1erLIRMOON2OPX42aY4HPRgW5QoK
	j14rfcOoou0sG5Y5iN+Bvp73pJnV5K1BXRdzqvcUyqPkoNbJat9gQlCUFPOB/lr6ihV0JJsYBOt
	SAsgnjGq9l5zSfaRgen+G9ekkQCkNzmOmR1AoEPy6URXvAdXBPi8gMJMHLA==
X-Google-Smtp-Source: AGHT+IEkDMI3o5Z7mHFRXoIHl/+vHlCZPfRVrbpFV2V5F6YruTLR2zEvifQVHcGq78jEipI+jCcArQ==
X-Received: by 2002:a05:6102:548c:b0:4fa:3547:2d38 with SMTP id ada2fe7eead31-4fa3547343cmr2150664137.10.1753438693979;
        Fri, 25 Jul 2025 03:18:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa354daa71sm445447137.4.2025.07.25.03.18.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:18:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4efbfe9c7a5so1913653137.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 03:18:13 -0700 (PDT)
X-Received: by 2002:a05:6102:1623:b0:4fa:dd4:6877 with SMTP id
 ada2fe7eead31-4fa2eb0ce5dmr2502816137.4.1753438693359; Fri, 25 Jul 2025
 03:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:17:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
X-Gm-Features: Ac12FXzF0-E5XCOaIf5MFeMvqjYMvWSzSdwqzh1uEwhsUpfXPcd-rqBecXNopmU
Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_031815_763941_16EEDAE4 
X-CRM114-Status: GOOD (  12.55  )
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

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm6=
4/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>  };
>
>  &pio {
> -       gpio_keys_default: gpiodefault {
> -               pins_cmd_dat {
> +       gpio_keys_default: gpio-keys-pins {
> +               pins-cmd-dat {
>                         pinmux =3D <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>                                  <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>                         bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>                 };
>         };
>
> -       i2c0_pins_a: i2c0 {
> +       i2c0_pins_a: i2c0-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>                                  <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>                 };
>         };
>
> -       i2c2_pins_a: i2c2 {
> +       i2c2_pins_a: i2c2-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>                                  <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>                 };
>         };
>
> -       tca6416_pins: pinmux_tca6416_pins {
> -               gpio_mux_rst_n_pin {
> +       tca6416_pins: tca6416-pins {
> +               pins-mux-rstn {
>                         pinmux =3D <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>                         output-high;
>                 };
>
> -               gpio_mux_int_n_pin {
> +               pins-mux-intn {
>                         pinmux =3D <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       ethernet_pins_default: ethernet {
> -               pins_ethernet {
> +       ethernet_pins_default: ethernet-pins {
> +               pins-eth {
>                         pinmux =3D <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>                                  <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>                                  <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
> --
> 2.50.1
>
>

