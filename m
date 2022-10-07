Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20E7C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 05:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNq4dcrPynbjDUY9NBAK0cAjdzUU7wUb0WdhYznSYVQ=; b=Yguc9CkPN8+4LYB88tIbF8SVeZ
	lcRZoGhvZSfmY4y96h/PoQvwW5TagXjvOZSD0Zy2foOxZ06Rh+cBA1aVgzABIf7bCwPp1toFFN5FY
	eMgm/nwNxZUuO/U3SGhJApvd+d/fugsIhuxvHCrc8MAyPIEI9Mf0D6POKwSYjkVFZawyXTSnyUUbG
	IcDBvJmSdCyI5l45dxZ0AhRssB2NnzrSsbKYVEhpBr1HosG4KrjIBCm4QkIaIBQJEP+xXMf6h9wp8
	cVzulf9Coq/j7VB2XB+2qQKQZCEDqHBXYSYoOblsZZw5DoeF2Ag/P8zhgDLaBtH2uhLIS+p3s8LVS
	CM01HIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogfxy-007N4G-23; Fri, 07 Oct 2022 05:32:10 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogfxn-007N1d-O9
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 05:32:02 +0000
Received: by mail-vk1-xa35.google.com with SMTP id y129so1777339vkg.8
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNq4dcrPynbjDUY9NBAK0cAjdzUU7wUb0WdhYznSYVQ=;
        b=WUNskmoKUQucRJduGseQ3VKsAWVYCrmyme7UroKDBlcUl6wHhhdNsJfFgEvuNaVpdX
         RlQkG55xusHzVkcl0ZASciIKWVmRWq0mEUpRjAZiDY85ouyvF6+Yfbwp8koEA99LH28B
         FI/xQnypWhbM2L0Xcd8f0A+jST3g7Whrh8oRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNq4dcrPynbjDUY9NBAK0cAjdzUU7wUb0WdhYznSYVQ=;
        b=ZFnTSWr5Gh1pdT9joRAQTL2QbMm9oZcIiQbBc1KuwMkseaGtcnMR1v5PM+Te/7lLI7
         6AWWSqKt9CSUG6tWYCoTglc4T8BullBmWdvZmqAmupIrj1zxqdFJZ8e37REUolmdWvLY
         J3ua2SFj8GEiShL64c+cwmHPYsunvxPWyoSYL0k9KdT1ax6aNGmvWICyghKJEpqkrhp7
         frdR7MsbGl2zMcDA6Qj6VYd/XMAkdWxWMoqRGRvfA+r3vHyxSNzCJpIzUxPNBFWoyvDt
         oavKqx3/Z4/aSrPhtvc7ooSCOylV6SP3SFU3QkEH8FG3djl0sA4oAJUhSHykFc++X00T
         bfeQ==
X-Gm-Message-State: ACrzQf26Bo0XGMCMIRat1sY3JHDYKsdkyHyv6aGaDKsPEG2QXH50wA9x
	VdvG89VFvOEdmNhiA5nVIaWCmcd9Vg1mfgpsNoPjXQ==
X-Google-Smtp-Source: AMsMyM5JBgPDE4c1thYDVfNOz5HCCFIE7+5xlX7JfJPYpElINrVos0va5CgZHtsdqTUdT8hD3ImU3phN3RJdyZBLaGw=
X-Received: by 2002:a1f:9cc5:0:b0:3a2:bd20:8fc6 with SMTP id
 f188-20020a1f9cc5000000b003a2bd208fc6mr1835693vke.22.1665120715519; Thu, 06
 Oct 2022 22:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221006212528.103790-1-nfraprado@collabora.com> <20221006212528.103790-5-nfraprado@collabora.com>
In-Reply-To: <20221006212528.103790-5-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Oct 2022 13:31:43 +0800
Message-ID: <CAGXv+5Fz1f2tzxJzYZDtSiXA5H84aF9Uz1vC-dF=ALkNUA3uKQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: asurada: Enable audio support
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_223159_798210_EBB5A872 
X-CRM114-Status: GOOD (  17.52  )
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

On Fri, Oct 7, 2022 at 5:25 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Enable audio support for the Asurada platform. This consists of the
> machine sound card, the rt1015p codec for the speakers, the rt5682 codec
> for the headset, and the dmic codec for the internal microphone.

It should be noted that there's a new revision of Hayato and Spherion
that switch to using the RT5682S codec. These are mt8192-hayato-rev5-sku2.d=
ts
and mt8192-spherion-rev4.dts in the downstream kernel.

ChenYu


> HDMI audio support is left out for now since the DisplayPort chip
> required isn't enabled yet.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added this commit
>
>  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 282 ++++++++++++++++++
>  1 file changed, 282 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index ace44827de17..dac2d4f5e670 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -33,6 +33,12 @@ backlight_lcd0: backlight-lcd0 {
>                 default-brightness-level =3D <576>;
>         };
>
> +       dmic_codec: dmic-codec {
> +               compatible =3D "dmic-codec";
> +               num-channels =3D <2>;
> +               wakeup-delay-ms =3D <50>;
> +       };
> +
>         pp1000_dpbrdg: regulator-1v0-dpbrdg {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "pp1000_dpbrdg";
> @@ -196,6 +202,79 @@ wifi_restricted_dma_region: wifi@c0000000 {
>                         reg =3D <0 0xc0000000 0 0x4000000>;
>                 };
>         };
> +
> +       rt1015p: rt1015p {
> +               compatible =3D "realtek,rt1015p";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rt1015p_pins>;
> +               sdb-gpios =3D <&pio 147 GPIO_ACTIVE_HIGH>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +
> +       sound: mt8192-sound {
> +               compatible =3D "mediatek,mt8192_mt6359_rt1015p_rt5682";
> +               mediatek,platform =3D <&afe>;
> +               pinctrl-names =3D "aud_clk_mosi_off",
> +                               "aud_clk_mosi_on",
> +                               "aud_dat_mosi_off",
> +                               "aud_dat_mosi_on",
> +                               "aud_dat_miso_off",
> +                               "aud_dat_miso_on",
> +                               "vow_dat_miso_off",
> +                               "vow_dat_miso_on",
> +                               "vow_clk_miso_off",
> +                               "vow_clk_miso_on",
> +                               "aud_nle_mosi_off",
> +                               "aud_nle_mosi_on",
> +                               "aud_dat_miso2_off",
> +                               "aud_dat_miso2_on",
> +                               "aud_gpio_i2s3_off",
> +                               "aud_gpio_i2s3_on",
> +                               "aud_gpio_i2s8_off",
> +                               "aud_gpio_i2s8_on",
> +                               "aud_gpio_i2s9_off",
> +                               "aud_gpio_i2s9_on",
> +                               "aud_dat_mosi_ch34_off",
> +                               "aud_dat_mosi_ch34_on",
> +                               "aud_dat_miso_ch34_off",
> +                               "aud_dat_miso_ch34_on",
> +                               "aud_gpio_tdm_off",
> +                               "aud_gpio_tdm_on";
> +               pinctrl-0 =3D <&aud_clk_mosi_off_pins>;
> +               pinctrl-1 =3D <&aud_clk_mosi_on_pins>;
> +               pinctrl-2 =3D <&aud_dat_mosi_off_pins>;
> +               pinctrl-3 =3D <&aud_dat_mosi_on_pins>;
> +               pinctrl-4 =3D <&aud_dat_miso_off_pins>;
> +               pinctrl-5 =3D <&aud_dat_miso_on_pins>;
> +               pinctrl-6 =3D <&vow_dat_miso_off_pins>;
> +               pinctrl-7 =3D <&vow_dat_miso_on_pins>;
> +               pinctrl-8 =3D <&vow_clk_miso_off_pins>;
> +               pinctrl-9 =3D <&vow_clk_miso_on_pins>;
> +               pinctrl-10 =3D <&aud_nle_mosi_off_pins>;
> +               pinctrl-11 =3D <&aud_nle_mosi_on_pins>;
> +               pinctrl-12 =3D <&aud_dat_miso2_off_pins>;
> +               pinctrl-13 =3D <&aud_dat_miso2_on_pins>;
> +               pinctrl-14 =3D <&aud_gpio_i2s3_off_pins>;
> +               pinctrl-15 =3D <&aud_gpio_i2s3_on_pins>;
> +               pinctrl-16 =3D <&aud_gpio_i2s8_off_pins>;
> +               pinctrl-17 =3D <&aud_gpio_i2s8_on_pins>;
> +               pinctrl-18 =3D <&aud_gpio_i2s9_off_pins>;
> +               pinctrl-19 =3D <&aud_gpio_i2s9_on_pins>;
> +               pinctrl-20 =3D <&aud_dat_mosi_ch34_off_pins>;
> +               pinctrl-21 =3D <&aud_dat_mosi_ch34_on_pins>;
> +               pinctrl-22 =3D <&aud_dat_miso_ch34_off_pins>;
> +               pinctrl-23 =3D <&aud_dat_miso_ch34_on_pins>;
> +               pinctrl-24 =3D <&aud_gpio_tdm_off_pins>;
> +               pinctrl-25 =3D <&aud_gpio_tdm_on_pins>;
> +
> +               headset-codec {
> +                   sound-dai =3D <&rt5682>;
> +               };
> +
> +               speaker-codecs {
> +                   sound-dai =3D <&rt1015p>;
> +               };
> +       };
>  };
>
>  &dsi0 {
> @@ -227,6 +306,19 @@ &i2c1 {
>         clock-frequency =3D <400000>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&i2c1_pins>;
> +
> +       rt5682: rt5682@1a {
> +               compatible =3D "realtek,rt5682i";
> +               reg =3D <0x1a>;
> +               interrupts-extended =3D <&pio 18 IRQ_TYPE_LEVEL_LOW>;
> +               realtek,jd-src =3D <1>;
> +               realtek,btndet-delay =3D <16>;
> +               #sound-dai-cells =3D <0>;
> +
> +               AVDD-supply =3D <&mt6359_vio18_ldo_reg>;
> +               MICVDD-supply =3D <&pp3300_g>;
> +               VBAT-supply =3D <&pp3300_ldo_z>;
> +       };
>  };
>
>  &i2c2 {
> @@ -660,6 +752,165 @@ pins-in {
>                 };
>         };
>
> +       aud_clk_mosi_off_pins: aud-clk-mosi-off-pins {
> +               pins-mosi-off {
> +                       pinmux =3D <PINMUX_GPIO214__FUNC_GPIO214>,
> +                                <PINMUX_GPIO215__FUNC_GPIO215>;
> +               };
> +       };
> +
> +       aud_clk_mosi_on_pins: aud-clk-mosi-on-pins {
> +               pins-mosi-on {
> +                       pinmux =3D <PINMUX_GPIO214__FUNC_AUD_CLK_MOSI>,
> +                                <PINMUX_GPIO215__FUNC_AUD_SYNC_MOSI>;
> +                       drive-strength =3D <10>;
> +               };
> +       };
> +
> +       aud_dat_miso_ch34_off_pins: aud-dat-miso-ch34-off-pins {
> +               pins-miso-off {
> +                       pinmux =3D <PINMUX_GPIO199__FUNC_GPIO199>;
> +               };
> +       };
> +
> +       aud_dat_miso_ch34_on_pins: aud-dat-miso-ch34-on-pins {
> +               pins-miso-on {
> +                       pinmux =3D <PINMUX_GPIO199__FUNC_AUD_DAT_MISO2>;
> +               };
> +       };
> +
> +       aud_dat_miso_off_pins: aud-dat-miso-off-pins {
> +               pins-miso-off {
> +                       pinmux =3D <PINMUX_GPIO218__FUNC_GPIO218>,
> +                                <PINMUX_GPIO219__FUNC_GPIO219>;
> +               };
> +       };
> +
> +       aud_dat_miso_on_pins: aud-dat-miso-on-pins {
> +               pins-miso-on {
> +                       pinmux =3D <PINMUX_GPIO218__FUNC_AUD_DAT_MISO0>,
> +                                <PINMUX_GPIO219__FUNC_AUD_DAT_MISO1>;
> +                       drive-strength =3D <10>;
> +               };
> +       };
> +
> +       aud_dat_miso2_off_pins: aud-dat-miso2-off-pins {
> +               pins-miso-off {
> +                       pinmux =3D <PINMUX_GPIO199__FUNC_GPIO199>;
> +               };
> +       };
> +
> +       aud_dat_miso2_on_pins: aud-dat-miso2-on-pins {
> +               pins-miso-on {
> +                       pinmux =3D <PINMUX_GPIO199__FUNC_AUD_DAT_MISO2>;
> +               };
> +       };
> +
> +       aud_dat_mosi_ch34_off_pins: aud-dat-mosi-ch34-off-pins {
> +               pins-mosi-off {
> +                       pinmux =3D <PINMUX_GPIO196__FUNC_GPIO196>;
> +               };
> +       };
> +
> +       aud_dat_mosi_ch34_on_pins: aud-dat-mosi-ch34-on-pins {
> +               pins-mosi-on {
> +                       pinmux =3D <PINMUX_GPIO196__FUNC_AUD_DAT_MOSI2>;
> +               };
> +       };
> +
> +       aud_dat_mosi_off_pins: aud-dat-mosi-off-pins {
> +               pins-mosi-off {
> +                       pinmux =3D <PINMUX_GPIO216__FUNC_GPIO216>,
> +                                <PINMUX_GPIO217__FUNC_GPIO217>;
> +               };
> +       };
> +
> +       aud_dat_mosi_on_pins: aud-dat-mosi-on-pins {
> +               pins-mosi-on {
> +                       pinmux =3D <PINMUX_GPIO216__FUNC_AUD_DAT_MOSI0>,
> +                                <PINMUX_GPIO217__FUNC_AUD_DAT_MOSI1>;
> +                       drive-strength =3D <10>;
> +               };
> +       };
> +
> +       aud_gpio_i2s3_off_pins: aud-gpio-i2s3-off-pins {
> +               pins-i2s3-off {
> +                       pinmux =3D <PINMUX_GPIO32__FUNC_GPIO32>,
> +                                <PINMUX_GPIO33__FUNC_GPIO33>,
> +                                <PINMUX_GPIO35__FUNC_GPIO35>;
> +               };
> +       };
> +
> +       aud_gpio_i2s3_on_pins: aud-gpio-i2s3-on-pins {
> +               pins-i2s3-on {
> +                       pinmux =3D <PINMUX_GPIO32__FUNC_I2S3_BCK>,
> +                                <PINMUX_GPIO33__FUNC_I2S3_LRCK>,
> +                                <PINMUX_GPIO35__FUNC_I2S3_DO>;
> +               };
> +       };
> +
> +       aud_gpio_i2s8_off_pins: aud-gpio-i2s8-off-pins {
> +               pins-i2s8-off {
> +                       pinmux =3D <PINMUX_GPIO10__FUNC_GPIO10>,
> +                                <PINMUX_GPIO11__FUNC_GPIO11>,
> +                                <PINMUX_GPIO12__FUNC_GPIO12>,
> +                                <PINMUX_GPIO13__FUNC_GPIO13>;
> +               };
> +       };
> +
> +       aud_gpio_i2s8_on_pins: aud-gpio-i2s8-on-pins {
> +               pins-i2s8-on {
> +                       pinmux =3D <PINMUX_GPIO10__FUNC_I2S8_MCK>,
> +                                <PINMUX_GPIO11__FUNC_I2S8_BCK>,
> +                                <PINMUX_GPIO12__FUNC_I2S8_LRCK>,
> +                                <PINMUX_GPIO13__FUNC_I2S8_DI>;
> +               };
> +       };
> +
> +       aud_gpio_i2s9_off_pins: aud-gpio-i2s9-off-pins {
> +               pins-i2s9-off {
> +                       pinmux =3D <PINMUX_GPIO29__FUNC_GPIO29>;
> +               };
> +       };
> +
> +       aud_gpio_i2s9_on_pins: aud-gpio-i2s9-on-pins {
> +               pins-i2s9-on {
> +                       pinmux =3D <PINMUX_GPIO29__FUNC_I2S9_DO>;
> +               };
> +       };
> +
> +       aud_gpio_tdm_off_pins: aud-gpio-tdm-off-pins {
> +               pins-tdm-off {
> +                       pinmux =3D <PINMUX_GPIO0__FUNC_GPIO0>,
> +                                <PINMUX_GPIO1__FUNC_GPIO1>,
> +                                <PINMUX_GPIO2__FUNC_GPIO2>,
> +                                <PINMUX_GPIO3__FUNC_GPIO3>;
> +               };
> +       };
> +
> +       aud_gpio_tdm_on_pins: aud-gpio-tdm-on-pins {
> +               pins-tdm-on {
> +                       pinmux =3D <PINMUX_GPIO0__FUNC_TDM_LRCK>,
> +                                <PINMUX_GPIO1__FUNC_TDM_BCK>,
> +                                <PINMUX_GPIO2__FUNC_TDM_MCK>,
> +                                <PINMUX_GPIO3__FUNC_TDM_DATA0>;
> +               };
> +       };
> +
> +       aud_nle_mosi_off_pins: aud-nle-mosi-off-pins {
> +               pins-nle-mosi-off {
> +                       pinmux =3D <PINMUX_GPIO197__FUNC_GPIO197>,
> +                                <PINMUX_GPIO198__FUNC_GPIO198>;
> +               };
> +       };
> +
> +       aud_nle_mosi_on_pins: aud-nle-mosi-on-pins {
> +               pins-nle-mosi-on {
> +                       pinmux =3D <PINMUX_GPIO197__FUNC_AUD_NLE_MOSI1>,
> +                                <PINMUX_GPIO198__FUNC_AUD_NLE_MOSI0>;
> +               };
> +       };
> +
>         cr50_int: cr50-irq-default-pins {
>                 pins-gsc-ap-int-odl {
>                         pinmux =3D <PINMUX_GPIO171__FUNC_GPIO171>;
> @@ -932,6 +1183,13 @@ pins-inhibit {
>                 };
>         };
>
> +       rt1015p_pins: rt1015p-default-pins {
> +               pins {
> +                       pinmux =3D <PINMUX_GPIO147__FUNC_GPIO147>;
> +                       output-low;
> +               };
> +       };
> +
>         scp_pins: scp-pins {
>                 pins-vreq-vao {
>                         pinmux =3D <PINMUX_GPIO195__FUNC_SCP_VREQ_VAO>;
> @@ -987,6 +1245,30 @@ pins-report-sw {
>                         output-low;
>                 };
>         };
> +
> +       vow_clk_miso_off_pins: vow-clk-miso-off-pins {
> +               pins-miso-off {
> +                       pinmux =3D <PINMUX_GPIO219__FUNC_GPIO219>;
> +               };
> +       };
> +
> +       vow_clk_miso_on_pins: vow-clk-miso-on-pins {
> +               pins-miso-on {
> +                       pinmux =3D <PINMUX_GPIO219__FUNC_VOW_CLK_MISO>;
> +               };
> +       };
> +
> +       vow_dat_miso_off_pins: vow-dat-miso-off-pins {
> +               pins-miso-off {
> +                       pinmux =3D <PINMUX_GPIO218__FUNC_GPIO218>;
> +               };
> +       };
> +
> +       vow_dat_miso_on_pins: vow-dat-miso-on-pins {
> +               pins-miso-on {
> +                       pinmux =3D <PINMUX_GPIO218__FUNC_VOW_DAT_MISO>;
> +               };
> +       };
>  };
>
>  &pmic {
> --
> 2.37.3
>

