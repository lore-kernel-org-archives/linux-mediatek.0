Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33067CCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj8jvxKEX8iiGvjDp+IibDYFnluQcdot53aXUrKanc0=; b=Ijz+PhdvmNn/ARKiffza/S+dTq
	iQSKvrmxZJWutvKe/Ck6SWdYaGW9DXvYKQYPMAKw1GqiXMY0NchA+O63o820C2Ra+aVJMfEiE0wRJ
	8h7fDQtC7GQhYMvyq4OxBQtGvASxhrJ4PxD/AwK79OrLgvDwkHLDrPoPHPPEJcOBmVdDzfydPoBtb
	mpensYU1ZOb8G1WcEPKED4gUhcj/vMOTpBr1c+UZo8nj/cfiXVsVnN20TdF3PNKsOlWe8nXp9suBu
	LwCpu0t92rquW+Qm15CFNgpKObCpUI/xJxP9RcGgbua7+3+tBzuH1tk0OBZJ8yPhuwzd3IPafBeKR
	CDmKvL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuxV-007uxx-RV; Mon, 25 Jul 2022 10:05:05 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFux6-007uaN-7R
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:04:42 +0000
Received: by mail-yb1-xb32.google.com with SMTP id r3so19163526ybr.6
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fj8jvxKEX8iiGvjDp+IibDYFnluQcdot53aXUrKanc0=;
        b=ihR+osbfovGu1DrmKYkfjiu3gA7GGAis+L5caXfSadLesTIoliafD6AXKLa+rStWTM
         3sGztJhxjeieBRZXxzZBMGErTG5AVIEQiGasLdCHpRuPPIK3bL9cK1nu6VW00y44dPNN
         8zf9ki36BuNNsX1OIFBqBcrb6DrK9sgjpk/VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fj8jvxKEX8iiGvjDp+IibDYFnluQcdot53aXUrKanc0=;
        b=UfzkcHrxmNXb5bU5kE1KJBt7ioZf8O9x/YMPcGONsHJ+7WQ2nxWdAS4Qx7kFBF/rMF
         s/TVAIuRK14is4ztw4dIBWgG5yeHzbdi0SFX5rTuUrjsp8tf/gUaVejP6i36c2yWQihd
         u+xwLfiHV/YOcyZRPNOcCrCn3v0kz8tz9YsGEk9eYUr/l8MB9pqHZDrEjFCGuGp5eHd/
         VyM1wc37iUmOnNRg3mEJelrpFZkpDGjHEBa3t07jruyhILmNgwz0qsaT/AfXMDDJzWfh
         KOnI88oGJvFfvssFx6pnuor89gyZZgZt6jWMmkG0tYxu204ThKcbg7kSyWiVByzFt/X/
         r0Gg==
X-Gm-Message-State: AJIora9KWpx3+mbsaQFQcNMdHb5R7GAls78nV7YYlpLa9+yUvGNNa6RU
	IUEgLdUkRXlacIuAT/5HESner/zm1t06LAVejLmRKPcpq/zS/w==
X-Google-Smtp-Source: AGRyM1vwO1tEitj2Z7M3sTrasfs3Au36Gr9ZYDzY4HnZeNjRVAFADoS/fXYlDdnQ9/93C7H57l0UQw/Vsp3CIV3gx2Y=
X-Received: by 2002:a25:640c:0:b0:670:91a0:57e3 with SMTP id
 y12-20020a25640c000000b0067091a057e3mr8735202ybb.204.1658743479242; Mon, 25
 Jul 2022 03:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 18:04:28 +0800
Message-ID: <CAGXv+5GuhXog_EjuxP_ej6768fdnwS9=__d-RWAn0aaK_NxY2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: mediatek: cherry: Wire up the ChromeOS
 EC and GSC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_030440_328057_93FACEC6 
X-CRM114-Status: GOOD (  19.69  )
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

On Thu, Jul 21, 2022 at 10:51 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Wire up the ChromeOS Embedded Controller on SPI0 and its communication
> channel via SCP RPMSG along with all of the offered functionality,
> including Keyboard, Smart Battery Metrics (SBS), PWM controller, I2C
> tunnel, regulators and Type-C connector management.
>
> While at it, also add support for the Cr50 Google Security Chip (GSC)
> found on this platform on I2C3 to support TPM and also use it as an
> entropy source for the kernel.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index feebbe367e93..87ac2b4f9814 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -149,6 +149,14 @@ &i2c3 {
>         clock-frequency = <400000>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c3_pins>;
> +
> +       cr50@50 {

tpm?

Also I think the CR50 should be a separate patch. It is not related
to the EC.

> +               compatible = "google,cr50";
> +               reg = <0x50>;
> +               interrupts-extended = <&pio 88 IRQ_TYPE_EDGE_FALLING>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&cr50_int>;
> +       };
>  };
>
>  &i2c4 {
> @@ -426,6 +434,21 @@ &pio {
>                 "AP_SPI_FLASH_MOSI",
>                 "AP_SPI_FLASH_MISO";
>
> +       cr50_int: cr50-irq-default-pins {
> +               pins-gsc-ap-int-odl {
> +                       pinmux = <PINMUX_GPIO88__FUNC_GPIO88>;
> +                       input-enable;
> +               };
> +       };
> +
> +       cros_ec_int: cros-ec-irq-default-pins {
> +               pins-ec-ap-int-odl {
> +                       pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
> +                       bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +                       input-enable;
> +               };
> +       };
> +
>         i2c0_pins: i2c0-default-pins {
>                 pins-bus {
>                         pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> @@ -669,6 +692,11 @@ &scp {
>         memory-region = <&scp_mem>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&scp_pins>;
> +
> +       cros-ec-rpmsg {
> +               compatible = "google,cros-ec-rpmsg";
> +               mediatek,rpmsg-name = "cros-ec-rpmsg";
> +       };
>  };
>
>  &spi0 {
> @@ -677,6 +705,68 @@ &spi0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&spi0_pins>;
>         mediatek,pad-select = <0>;
> +
> +       cros_ec: ec@0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               compatible = "google,cros-ec-spi";
> +               reg = <0>;
> +               interrupts-extended = <&pio 4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&cros_ec_int>;
> +               spi-max-frequency = <3000000>;
> +
> +               cros_ec_pwm: ec-pwm {
> +                       compatible = "google,cros-ec-pwm";
> +                       #pwm-cells = <1>;
> +               };

This only serves the keyboard backlight LED. However, we have a better
interface for that, described in

    Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

I think we should go with that one.


ChenYu

> +
> +               i2c_tunnel: i2c-tunnel {
> +                       compatible = "google,cros-ec-i2c-tunnel";
> +                       google,remote-bus = <0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               mt_pmic_vmc_ldo_reg: regulator@0 {
> +                       compatible = "google,cros-ec-regulator";
> +                       reg = <0>;
> +                       regulator-name = "mt_pmic_vmc_ldo";
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <3600000>;
> +               };
> +
> +               mt_pmic_vmch_ldo_reg: regulator@1 {
> +                       compatible = "google,cros-ec-regulator";
> +                       reg = <1>;
> +                       regulator-name = "mt_pmic_vmch_ldo";
> +                       regulator-min-microvolt = <2700000>;
> +                       regulator-max-microvolt = <3600000>;
> +               };
> +
> +               typec {
> +                       compatible = "google,cros-ec-typec";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       usb_c0: connector@0 {
> +                               compatible = "usb-c-connector";
> +                               reg = <0>;
> +                               power-role = "dual";
> +                               data-role = "host";
> +                               try-power-role = "source";
> +                       };
> +
> +                       usb_c1: connector@1 {
> +                               compatible = "usb-c-connector";
> +                               reg = <1>;
> +                               power-role = "dual";
> +                               data-role = "host";
> +                               try-power-role = "source";
> +                       };
> +               };
> +       };
>  };
>
>  &u3phy0 {
> @@ -728,3 +818,6 @@ &xhci3 {
>         vusb33-supply = <&mt6359_vusb_ldo_reg>;
>         vbus-supply = <&usb_vbus>;
>  };
> +
> +#include <arm/cros-ec-keyboard.dtsi>
> +#include <arm/cros-ec-sbs.dtsi>
> --
> 2.35.1
>
>

