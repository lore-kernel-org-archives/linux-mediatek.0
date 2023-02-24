Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FA5C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIErPNQ+4RoTAfxtc85oSdGiGvNY8d2XkblliVRlj88=; b=xsJAqK0/FylmSP0dvAGKoztqXp
	AXbSYEvbem3YWBsmC0f8REfkwwPOenvMb8vaSuuXk3Pg16T6vQE1CPNk6SVxgXZIX0yWWVPrmShWU
	VJFbWtwUnsGCRm7hnNHlyOMrZeAVXKX3yQHLqZvjruH6v3Jt3XejAQ13vnkB7iGZFeyZXVuaozwqo
	LMOEgW8ImXR6rtGAHgW9sc2qVJ1peJerFEkR4lSjrDOBPbqFUbhsNw3lzN76uabPUH5B7p2g+CuIC
	0312iZkRtD2uzWRlMI8Q6X7nTIiQIMonGz1EW3MaNZRq13a19QbSmjxjDOh00hwJvNpc9fpSC6pEi
	lXbGpmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUFV-001fsq-Fq; Fri, 24 Feb 2023 09:20:17 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUFS-001fqU-1Z
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:20:15 +0000
Received: by mail-vs1-xe34.google.com with SMTP id d7so14834923vsj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIErPNQ+4RoTAfxtc85oSdGiGvNY8d2XkblliVRlj88=;
        b=EsI3t1aKn2uzy3PhReMsj8zr61m1aWNI3Jz88PBVgpknHdWQYwDZpuIXUzjLx4i3Gg
         tAJ+H5isQMGJBnLvGprO+qOkHkolourLmBAuf3jyjbjVTR60xA44119U3YqbjTiv8SKv
         R0xAxsZFmysFWhi4Z6FWtgJCpbVhmqxgn0vU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIErPNQ+4RoTAfxtc85oSdGiGvNY8d2XkblliVRlj88=;
        b=t8rccwEct3l5Q6L5nMtzo921kwddAGu+KLc4iBbtLm01OdOd+EvWjk2rXShgWQilTh
         eYVY9mJTX+LgVfogjTnzBy+Jpa+0g9DhUtndoTb96arNKQTSfnM3wh+CVKRU6cDdwMN1
         L9VZE2C15jf3hXn+XDCvASQgdYBmb9R8uty3ff4yY87yuXuKDr9E3rBR5od6DcU2RsHr
         hap3Hak+5Z7Bg8ubdWUdtj/uhgLU/QQ/1up86Ci7bISoUmBwkA2NdxdJw5Msig2Vzuev
         AOJcuQUHKsKa6FKtJHAqq1SHlCxDNCulJhBHmCO1FASaozRiGgT5yHMmgalNIL71Ugy4
         U9Dg==
X-Gm-Message-State: AO0yUKVM8mYHnFtRL5eeaYs+J4oCqHpfWcozgFWJYzTXk70JZuU7TF2e
	7sKoD6veJqhTjeJuI37dzU2wduJ4o1Z4YEky/B92hA==
X-Google-Smtp-Source: AK7set/4I7NL/6Fx/a0lveJQyrNy6DQ6pD3eAfVaTlWQEZeaGIbAFetGOErsZ6Sbu6SQVD0aUWpjuLbzx6uZl1JQPAE=
X-Received: by 2002:a05:6102:1592:b0:412:5424:e58e with SMTP id
 g18-20020a056102159200b004125424e58emr2324416vsv.0.1677230403544; Fri, 24 Feb
 2023 01:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com> <20230223145426.193590-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223145426.193590-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:19:52 +0800
Message-ID: <CAGXv+5E5T3hWs1M2D8QL2SGXYfsevaEw7gzK8XgD2ns2Cx_G9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] arm64: dts: mediatek: cherry: Add platform thermal configuration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_012014_122037_C0CB6081 
X-CRM114-Status: GOOD (  17.11  )
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

On Thu, Feb 23, 2023 at 10:55 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This platform has three auxiliary NTC thermistors, connected to the
> SoC's ADC pins. Enable the auxadc in order to be able to read the
> ADC values, add a generic-adc-thermal LUT for each and finally assign
> them to the SoC's thermal zones.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 24669093fbed..ae2052a7160d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -104,6 +104,108 @@ ppvar_sys: regulator-ppvar-sys {
>                 regulator-boot-on;
>         };
>
> +       tboard_thermistor1: thermal-sensor-t1 {
> +               compatible = "generic-adc-thermal";
> +               #thermal-sensor-cells = <0>;
> +               io-channels = <&auxadc 0>;
> +               io-channel-names = "sensor-channel";
> +               temperature-lookup-table = <    (-5000) 4241
> +                                               0 4063
> +                                               5000 3856
> +                                               10000 3621
> +                                               15000 3364
> +                                               20000 3091
> +                                               25000 2810
> +                                               30000 2526
> +                                               35000 2247
> +                                               40000 1982
> +                                               45000 1734
> +                                               50000 1507
> +                                               55000 1305
> +                                               60000 1122
> +                                               65000 964
> +                                               70000 827
> +                                               75000 710
> +                                               80000 606
> +                                               85000 519
> +                                               90000 445
> +                                               95000 382
> +                                               100000 330
> +                                               105000 284
> +                                               110000 245
> +                                               115000 213
> +                                               120000 183
> +                                               125000 161>;
> +       };
> +
> +       tboard_thermistor2: thermal-sensor-t2 {
> +               compatible = "generic-adc-thermal";
> +               #thermal-sensor-cells = <0>;
> +               io-channels = <&auxadc 0>;
> +               io-channel-names = "sensor-channel";
> +               temperature-lookup-table = <    (-5000) 4241
> +                                               0 4063
> +                                               5000 3856
> +                                               10000 3621
> +                                               15000 3364
> +                                               20000 3091
> +                                               25000 2810
> +                                               30000 2526
> +                                               35000 2247
> +                                               40000 1982
> +                                               45000 1734
> +                                               50000 1507
> +                                               55000 1305
> +                                               60000 1122
> +                                               65000 964
> +                                               70000 827
> +                                               75000 710
> +                                               80000 606
> +                                               85000 519
> +                                               90000 445
> +                                               95000 382
> +                                               100000 330
> +                                               105000 284
> +                                               110000 245
> +                                               115000 213
> +                                               120000 183
> +                                               125000 161>;
> +       };
> +
> +       tboard_thermistor3: thermal-sensor-t3 {
> +               compatible = "generic-adc-thermal";
> +               #thermal-sensor-cells = <0>;
> +               io-channels = <&auxadc 0>;
> +               io-channel-names = "sensor-channel";
> +               temperature-lookup-table = <    (-5000) 4241
> +                                               0 4063
> +                                               5000 3856
> +                                               10000 3621
> +                                               15000 3364
> +                                               20000 3091
> +                                               25000 2810
> +                                               30000 2526
> +                                               35000 2247
> +                                               40000 1982
> +                                               45000 1734
> +                                               50000 1507
> +                                               55000 1305
> +                                               60000 1122
> +                                               65000 964
> +                                               70000 827
> +                                               75000 710
> +                                               80000 606
> +                                               85000 519
> +                                               90000 445
> +                                               95000 382
> +                                               100000 330
> +                                               105000 284
> +                                               110000 245
> +                                               115000 213
> +                                               120000 183
> +                                               125000 161>;
> +       };
> +
>         usb_vbus: regulator-5v0-usb-vbus {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb-vbus";
> @@ -243,6 +345,10 @@ &gpu {
>         mali-supply = <&mt6315_7_vbuck1>;
>  };
>
> +&auxadc {
> +       status = "okay";
> +};
> +
>  &i2c0 {
>         status = "okay";
>
> @@ -1074,6 +1180,24 @@ mt6315_7_vbuck1: vbuck1 {
>         };
>  };
>
> +&thermal_zones {
> +       ap_ntc1 {
> +               polling-delay = <1000>;
> +               polling-delay-passive = <0>;
> +               thermal-sensors = <&tboard_thermistor1>;

Without trip points, this doesn't satisfy the bindings, nor does the
driver probe.

> +       };
> +       ap_ntc2 {
> +               polling-delay = <1000>;
> +               polling-delay-passive = <0>;
> +               thermal-sensors = <&tboard_thermistor2>;
> +       };
> +       ap_ntc3 {
> +               polling-delay = <1000>;
> +               polling-delay-passive = <0>;
> +               thermal-sensors = <&tboard_thermistor3>;
> +       };
> +};
> +
>  &u3phy0 {
>         status = "okay";
>  };
> --
> 2.39.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

