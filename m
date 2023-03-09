Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB44C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 04:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjxqdJHTwKdoqofrVIRX/uslVfOrecmuG0zXjEDMDnE=; b=EbkYGhRXKP2sbJNCezjrMQOoeg
	YDMI/kM1WUYqTXJLtD80kaH5QRKbtHNfATg2ObIuUajPD1uNFXH/Q5ykRfZ6hyeXy2T8t4foBaUzP
	H2pgeRI8VFRTjDL+T8jTngrFDusnsJq9IzIAE3P9BFepUiTOGWYYyuq2CQKbZ7GJtbr3Y5nqhjpvz
	RpdTQe36AwCCMRjDEnPj2WqdZE38PAIcecfTWhdBXkvci/QdnonvYQ/Vg2nvmT5S+75YyF3iwxlg+
	+mu2Cf96x4SIKw5YVUc0u/0t5fjn9W5vKNAI0ITPeb4w7mf1SJg57yYGn9uQyovqYFijGwWRQlYBh
	A1nHvyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8Jt-007rPE-6o; Thu, 09 Mar 2023 04:56:01 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8Jp-007rOJ-Is
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 04:55:59 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id d20so556917vsf.11
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 20:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678337756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjxqdJHTwKdoqofrVIRX/uslVfOrecmuG0zXjEDMDnE=;
        b=bxbeMG5QYKOQm/zYzvv3/3Hk/JY6JiPYXffsKvdoDYkgJEyLsd5luHWpeBPUeaNVoP
         WI1TBhtSF9SQptos3NJfV1IUazfU2qfANWkdP0qVdaC65vDfQ7EvdHVplXw/nbVz0LqW
         nYySeNJ1BUgFQnIdSq/Z+V4ppkz0S4K7nvdeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678337756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjxqdJHTwKdoqofrVIRX/uslVfOrecmuG0zXjEDMDnE=;
        b=J7iorRGuaBnFIkYFIqykDD3SKf+HkkgvPr4LC5HKvUjmusPksAoTmxYZbbwaPCa5MU
         oCZR2u8eHwHDcu0CFkKyQ+9UIDRuzzmgDODMn+CVL4Bx9Jn3A4uBtmwxBrQipo+gXKKt
         nFQL559wuoCTw/t8VwUUxjNkbU3TdhASzq9KqYT/eLyCqzsF2nAivRmrelx1LenkNuEO
         kqNfBRmGoGaPSLGf3maExV5JToboSH0ufzBUZvgvVkhXTh/R+yGKyiuaFzmlY63YbuYT
         mNp9tCAJycR/3aUzk3HFJqxqqyK7AiX4/BUyU9lYpf9HdX48YpXJe2pccfPPr9GplVQ9
         VKfw==
X-Gm-Message-State: AO0yUKV1H9QJHrpkJQNJdjSa/fQ7CrvLtn6l0IHMsM1XSx4yEfVGcNOK
	2tVqm+i0qT6b2gEqbz7aJWRHEu4rq7zAjhLW8SzLZg==
X-Google-Smtp-Source: AK7set+BT4xEcKY+/uoaOL8KeVBJ3JdWu5Hu+B9F1sIYsvzfRdV29zePdKUttsi2e9i5g7od5M+1fBV0aszBSpO4YhA=
X-Received: by 2002:a05:6102:5599:b0:421:c4a3:b607 with SMTP id
 dc25-20020a056102559900b00421c4a3b607mr14816559vsb.3.1678337756090; Wed, 08
 Mar 2023 20:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com> <20230223145426.193590-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223145426.193590-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Mar 2023 12:55:45 +0800
Message-ID: <CAGXv+5FAcySm3fC1oV9R7FYP0N1z95BaMHXGFJvhi0jDTbSXtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] arm64: dts: mediatek: cherry: Add platform thermal configuration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_205557_666807_4BC13259 
X-CRM114-Status: GOOD (  18.66  )
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

On Thu, Feb 23, 2023 at 10:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This platform has three auxiliary NTC thermistors, connected to the
> SoC's ADC pins. Enable the auxadc in order to be able to read the
> ADC values, add a generic-adc-thermal LUT for each and finally assign
> them to the SoC's thermal zones.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 24669093fbed..ae2052a7160d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -104,6 +104,108 @@ ppvar_sys: regulator-ppvar-sys {
>                 regulator-boot-on;
>         };
>
> +       tboard_thermistor1: thermal-sensor-t1 {
> +               compatible =3D "generic-adc-thermal";
> +               #thermal-sensor-cells =3D <0>;
> +               io-channels =3D <&auxadc 0>;
> +               io-channel-names =3D "sensor-channel";
> +               temperature-lookup-table =3D <    (-5000) 4241
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
> +               compatible =3D "generic-adc-thermal";
> +               #thermal-sensor-cells =3D <0>;
> +               io-channels =3D <&auxadc 0>;

You are reusing the same channel for all three sensors. That doesn't
make a lot of sense.

Furthermore, the design only has two thermistors, connected to the first
two ADC channels. The first one is located near the SoC; the second one
is near the PMIC.

ChenYu

> +               io-channel-names =3D "sensor-channel";
> +               temperature-lookup-table =3D <    (-5000) 4241
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
> +               compatible =3D "generic-adc-thermal";
> +               #thermal-sensor-cells =3D <0>;
> +               io-channels =3D <&auxadc 0>;
> +               io-channel-names =3D "sensor-channel";
> +               temperature-lookup-table =3D <    (-5000) 4241
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
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "usb-vbus";
> @@ -243,6 +345,10 @@ &gpu {
>         mali-supply =3D <&mt6315_7_vbuck1>;
>  };
>
> +&auxadc {
> +       status =3D "okay";
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> @@ -1074,6 +1180,24 @@ mt6315_7_vbuck1: vbuck1 {
>         };
>  };
>
> +&thermal_zones {
> +       ap_ntc1 {
> +               polling-delay =3D <1000>;
> +               polling-delay-passive =3D <0>;
> +               thermal-sensors =3D <&tboard_thermistor1>;
> +       };
> +       ap_ntc2 {
> +               polling-delay =3D <1000>;
> +               polling-delay-passive =3D <0>;
> +               thermal-sensors =3D <&tboard_thermistor2>;
> +       };
> +       ap_ntc3 {
> +               polling-delay =3D <1000>;
> +               polling-delay-passive =3D <0>;
> +               thermal-sensors =3D <&tboard_thermistor3>;
> +       };
> +};
> +
>  &u3phy0 {
>         status =3D "okay";
>  };
> --
> 2.39.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

