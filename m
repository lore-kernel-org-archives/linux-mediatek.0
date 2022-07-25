Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A82C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edgunyjtUM379vg3Bw9QbusNXUwODwix7GBUlK2cBH4=; b=Ejhy1JpYxlGf+UJmzcX1Ifevq7
	N/74zAiJVRKPKZljHBDI0DBanyQtGFxL80zSgW2/EHONmALeNQkynOtAnk3jOqRb4NUH9xVQGec/4
	5HXVwpB5fxYbiIEGI0Bqep4S8M6Y6p4Zd8XW4TJn4qyazAz8VyKfgLoM/EoEdPpyVhQbjQmPuc0Aq
	PeX6P7aU8b64raAD4WLKu2BGykCnCt/Ebj7N16yvRyizQSmHGSnhE34UHTb+ol/XELaNEgd0KYH/H
	UUlTUv0xkKASav/RuGsGqBTkmSmAByDsZXQlgJ1/zxZOLEnybru9qZwfga21Uu/Njf2ssC45tSgH6
	EXWgrlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFts4-007Cqj-TP; Mon, 25 Jul 2022 08:55:24 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtrk-007CRy-02
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:55:05 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 75so18873267ybf.4
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edgunyjtUM379vg3Bw9QbusNXUwODwix7GBUlK2cBH4=;
        b=LAb3jJwXo2g1wMoTMaTk8qlGLk+BgqSTGQMYheh5JIlQkSBkMyLupvlRq+isJx3pGe
         6mK2Z47OXKdGrfS/+rGV0Pfig8Q30++HmZDcoK2OQoQCWqS4MXIvnPVqUXHKvZsb5ngR
         domi0dPdGdVLhUXtW4uS4OhEJm19M2vQCvhSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edgunyjtUM379vg3Bw9QbusNXUwODwix7GBUlK2cBH4=;
        b=GZ+EmQmr0L4LRWHJAARRDjUbcZ3if48J3/Qla3CMe1m2tsi/OocgWyjRRn12ks4R87
         EP4gOtCBcB1rjNeYzkrv9GGtN3JS2yzCMXGG+nxtqeS49zSS4hNjVf28cgiD/j39DIeb
         v8PT1oj/wUM+po+2KU8VfA582wUx4q1CNoPh2f67Kxl8fEvjmfQGxjyW7XCnHLoapgRt
         FGwIw+celOEyJcIoGW0ycAAsI5i+3c8HymXeR3mHykulKR71UzlzcS8MV4rstH0JkZvG
         AMUM5VdbfNuysk25ZSxsg213lWN7vHVsZSbukOOqqrV1ZwIcFKeI9Yvw6ChbMivZ/j0N
         qtFg==
X-Gm-Message-State: AJIora/+vonbCKcXFixt+GTYl/+OfJytBjcOst/EEnLbKyJ4igFExpb2
	dHB7ENT7lP84+MXljHs91CbAT+zLn/xiBKb8yqLaFA==
X-Google-Smtp-Source: AGRyM1s7JTPi63hLlXsZJp0NKHyjAYonLbIzzXNGyMHT8kVwt4FrTCIiemN3v706SuLB6YiD2mVG51cNjmaxho6Bf8A=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr8500898ybq.472.1658739292656; Mon, 25
 Jul 2022 01:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 16:54:41 +0800
Message-ID: <CAGXv+5FutJb_MRwSVgjV7tByBvfq3AFsSxs6ETUZaNzrfpywgg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: mediatek: cherry: Enable secondary
 SD/MMC controller
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_015504_070216_405A9835 
X-CRM114-Status: GOOD (  17.05  )
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
> As of now, all of the boards based on the cherry platform have a
> usable secondary SD/MMC controller, usually for SD cards: enable
> it to allow both booting from it and generally accessing external
> storage.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 2853f7f76c90..8859957c7b27 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -17,6 +17,7 @@ aliases {
>                 i2c5 = &i2c5;
>                 i2c7 = &i2c7;
>                 mmc0 = &mmc0;
> +               mmc1 = &mmc1;
>                 serial0 = &uart0;
>         };
>
> @@ -227,6 +228,24 @@ &mmc0 {
>         vqmmc-supply = <&mt6359_vufs_ldo_reg>;
>  };
>
> +&mmc1 {
> +       status = "okay";
> +
> +       bus-width = <4>;
> +       cap-sd-highspeed;
> +       cd-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
> +       max-frequency = <200000000>;
> +       no-mmc;
> +       no-sdio;
> +       pinctrl-names = "default", "state_uhs";
> +       pinctrl-0 = <&mmc1_pins_default>;
> +       pinctrl-1 = <&mmc1_pins_uhs>;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       vmmc-supply = <&mt_pmic_vmch_ldo_reg>;
> +       vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
> +};
> +
>  /* for CPU-L */
>  &mt6359_vcore_buck_reg {
>         regulator-always-on;
> @@ -575,6 +594,49 @@ pins-rst {
>                 };
>         };
>
> +       mmc1_pins_default: mmc1-default-pins {
> +               pins-cmd-dat {
> +                       pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
> +                                <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
> +                                <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
> +                                <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
> +                                <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
> +                       input-enable;
> +                       drive-strength = <8>;
> +                       bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +               };
> +
> +               pins-clk {
> +                       pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
> +                       drive-strength = <8>;
> +                       bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +               };
> +
> +               pins-insert {
> +                       pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       mmc1_pins_uhs: mmc1-uhs-pins {
> +               pins-cmd-dat {
> +                       pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
> +                                <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
> +                                <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
> +                                <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
> +                                <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
> +                       input-enable;
> +                       drive-strength = <8>;
> +                       bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +               };
> +
> +               pins-clk {
> +                       pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
> +                       drive-strength = <8>;
> +                       bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +               };

I wonder if pins-insert should be duplicated here. And there's no
difference between the standard and UHS pinconfigs. One would expect
higher drive strength on the UHS set, if two sets were required.
So maybe we should just have one set, and use that one for both
the default and uhs states.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> +       };
> +
>         nor_pins_default: nor-default-pins {
>                 pins-ck-io {
>                         pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
> --
> 2.35.1
>
>

