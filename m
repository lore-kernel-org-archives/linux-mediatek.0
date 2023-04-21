Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E60C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVNW4QtM4eTYVeGO7r8lt2e44dC/9lAoYvvcxGHxL4k=; b=fKG5GxUMjqavC+Fsgp8IL3AHuv
	CvwnbLvPKx1HIlT3qWR0bIvYnC1kRqGYGjhRPoVpPHOFV/J/YNIfA5DNuUvCMgrfIAmva1VXjnyiQ
	aqLsWKBrjZXoX+RGpMcwbD75iBe7wyJkNU+JcavGCyQQvdx0DXZfibTXRhruNJOOac6MkUBz393dE
	WKWdLS3/2NO/8XsMnrKZArHv/MLqtd6eJGG+e+k2FmwSpUfaiihmY45qqQPxsFebIPUvVmK/znh/Z
	gjwPGOitXF7WbXgd5VY95XZ3rt+y1TQqcnItnpJ/51u6RVAsZp+LU9iCFqqIo+adq3QA/LTH44vbJ
	NYPiOwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplLL-009zKV-1f;
	Fri, 21 Apr 2023 07:38:07 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pplLI-009zJe-2n
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 07:38:06 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-771d9ec5aa5so5629264241.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682062684; x=1684654684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVNW4QtM4eTYVeGO7r8lt2e44dC/9lAoYvvcxGHxL4k=;
        b=Jee43CIGNJgbOBrV5pWsmi+0WPPMRJW5I1mjdMBMB268AsQiiDgXfUTx6oDl9GQaRh
         WNVJg2vLzv+wRwbBMmwNilPBHGp5ui6+jcAMWwbuIfhei4Uvx3cBv2Rm1d3UNmw0to9D
         PT+M5UqLbnfUE/tTkY4u2CX7GIy7TZVRWkc84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062684; x=1684654684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVNW4QtM4eTYVeGO7r8lt2e44dC/9lAoYvvcxGHxL4k=;
        b=QAThDeUNPpRLDNVnYzpq2h7Sgmtfj2QZOnjXnHHqDahtl8x2yHTe26abJIfvE/IVVZ
         sZklb//6XwGQLMZAsls/kZLZXIJ5mHbXUZFP4oVUoHBQ/EiLoHA5VCy7tsAC+0iWzwlw
         PWBdi5J33ozVL4qsnnPEtqLsdRPc02LDA5/YVwI1pQBoU06GdbdLHdb+VixnPC6ZKpiE
         mPj2VotUmVeBBYZMXKxV7bWNi/dMb8VEW7STDhljvvjhmhvE0OckrEp9ycQlRTh0MoTv
         GHZ9eGf++oaKb+4kA69iZixO8ph9JWkJ0ho1h/meSqNlyCP8lQ+it4LSYc38DI19nbQN
         hbOA==
X-Gm-Message-State: AAQBX9evBqx+f2HhWZi0zTmoykSk3iWEutUg192me0dUNmeJYhBmh0Pw
	P9yQfdRKB5k2odU2eoIm+PMH9biU4XdbYHP/6QaooA==
X-Google-Smtp-Source: AKy350agsBRG1USF1qYsYNGubTVbRzycwG/Aa/FdFtPpGxXj4pmd4WA8jiiMmMO66I2WyjRV+oR4zhbDbgYoI3GSimo=
X-Received: by 2002:a1f:3d93:0:b0:446:b3d7:5fee with SMTP id
 k141-20020a1f3d93000000b00446b3d75feemr699665vka.0.1682062683846; Fri, 21 Apr
 2023 00:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com> <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Apr 2023 15:37:52 +0800
Message-ID: <CAGXv+5GuEQMxYTKrnia1ipYHLt_B2h6By7EejE7MjCypfavnFg@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: cherry: Add platform thermal configuration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_003804_925457_D3B29195 
X-CRM114-Status: GOOD (  15.66  )
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
> This platform has three auxiliary NTC thermistors, connected to the
> SoC's ADC pins. Enable the auxadc in order to be able to read the
> ADC values, add a generic-adc-thermal LUT for each and finally assign
> them to the SoC's thermal zones.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 8ac80a136c37..0820e9ba3829 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
>                 regulator-boot-on;
>         };
>
> +       /* Murata NCP03WF104F05RL */
> +       tboard_thermistor1: thermal-sensor-t1 {
> +               compatible =3D "generic-adc-thermal";
> +               #thermal-sensor-cells =3D <0>;
> +               io-channels =3D <&auxadc 0>;
> +               io-channel-names =3D "sensor-channel";
> +               temperature-lookup-table =3D <    (-10000) 1553
> +                                               (-5000) 1485
> +                                               0 1406
> +                                               5000 1317
> +                                               10000 1219
> +                                               15000 1115
> +                                               20000 1007
> +                                               25000 900
> +                                               30000 796
> +                                               35000 697
> +                                               40000 605
> +                                               45000 523
> +                                               50000 449
> +                                               55000 384
> +                                               60000 327
> +                                               65000 279
> +                                               70000 237
> +                                               75000 202
> +                                               80000 172
> +                                               85000 147
> +                                               90000 125
> +                                               95000 107
> +                                               100000 92
> +                                               105000 79
> +                                               110000 68
> +                                               115000 59
> +                                               120000 51
> +                                               125000 44>;
> +       };
> +
> +       tboard_thermistor2: thermal-sensor-t2 {
> +               compatible =3D "generic-adc-thermal";
> +               #thermal-sensor-cells =3D <0>;
> +               io-channels =3D <&auxadc 1>;
> +               io-channel-names =3D "sensor-channel";
> +               temperature-lookup-table =3D <    (-10000) 1553
> +                                               (-5000) 1485
> +                                               0 1406
> +                                               5000 1317
> +                                               10000 1219
> +                                               15000 1115
> +                                               20000 1007
> +                                               25000 900
> +                                               30000 796
> +                                               35000 697
> +                                               40000 605
> +                                               45000 523
> +                                               50000 449
> +                                               55000 384
> +                                               60000 327
> +                                               65000 279
> +                                               70000 237
> +                                               75000 202
> +                                               80000 172
> +                                               85000 147
> +                                               90000 125
> +                                               95000 107
> +                                               100000 92
> +                                               105000 79
> +                                               110000 68
> +                                               115000 59
> +                                               120000 51
> +                                               125000 44>;
> +       };
> +
>         usb_vbus: regulator-5v0-usb-vbus {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "usb-vbus";
> @@ -260,6 +331,10 @@ &gpu {
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
> @@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
>         };
>  };
>
> +&thermal_zones {
> +       soc_area_ntc {
> +               polling-delay =3D <1000>;
> +               polling-delay-passive =3D <250>;
> +               thermal-sensors =3D <&tboard_thermistor1>;
> +
> +               trips {
> +                       trip-crit {
> +                               temperature =3D <95000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "critical";
> +                       };
> +               };
> +       };
> +
> +       pmic_area_ntc {
> +               polling-delay =3D <1000>;
> +               polling-delay-passive =3D <0>;
> +               thermal-sensors =3D <&tboard_thermistor2>;
> +
> +               trips {
> +                       trip-crit {
> +                               temperature =3D <95000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "critical";
> +                       };
> +               };
> +       };

I'm still getting:

thermal_sys: Failed to find 'trips' node
thermal_sys: Failed to find trip points for thermal-sensor-t1 id=3D0
generic-adc-thermal thermal-sensor-t1: Thermal zone sensor register failed:=
 -22
generic-adc-thermal: probe of thermal-sensor-t1 failed with error -22
thermal_sys: Failed to find 'trips' node
thermal_sys: Failed to find trip points for thermal-sensor-t2 id=3D0
generic-adc-thermal thermal-sensor-t2: Thermal zone sensor register failed:=
 -22
generic-adc-thermal: probe of thermal-sensor-t2 failed with error -22
thermal_sys: Failed to find 'trips' node
thermal_sys: Failed to find trip points for thermal-sensor-t3 id=3D0
generic-adc-thermal thermal-sensor-t3: Thermal zone sensor register failed:=
 -22
generic-adc-thermal: probe of thermal-sensor-t3 failed with error -22



> +};
> +
>  &u3phy0 {
>         status =3D "okay";
>  };
> --
> 2.40.0
>
>

