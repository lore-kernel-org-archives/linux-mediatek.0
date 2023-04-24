Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9311C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+4jOM/f9b4JhLtBToA6gnoTrIKE0Inz7GSYYH9hvps=; b=kEaJnGK6xtSULs2mGDsm2X4Gk0
	SWOhyC6gD2TNOqXrb2KTFpNsv+nG7N4VffFuqghz7kiC0rh0WrW3bzFyK8QBJbn9rjUon5C7Pouxy
	vhE4rZsQa07rR8rAXKPxVMbAJQEzhD8xVLk1Ef+qEZg8TmRtiQQ2Yilh+6DqRj84yoYXOQE4F82qi
	lDnKCEiyRImhTNfQyw+oZVDE/xVlv11UQBHiI7y5qJ12+SxlJfj72cpnp1tmx3QomVnLB9kPDvP/N
	QK09FzmTJ46q5/pFym2j1IGNeh3H8LYpiVI82cOBXOEd7C2ofWFyBC9oJUDx5mtkJPgZhWNvNJdJ4
	ZgAUT0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqmf-00Fb47-1h;
	Mon, 24 Apr 2023 07:38:49 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqma-00Fb1i-33
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 07:38:46 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-42e668a2c5eso961740137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682321917; x=1684913917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+4jOM/f9b4JhLtBToA6gnoTrIKE0Inz7GSYYH9hvps=;
        b=MlxFoi8wfFCMMlCElQUmQ4fG7KGfDuE0bNFG+6Dt3SSfwV6nhDJyeTUIcsSBUvkLzy
         LZm5dTvwVpmnPCePy6RtL+4EH8nFUx4B7lzJi6fl0Qa58f44ootrF6U1m8pZfoD93zxw
         Ah7IjFpPJq5NjybtHvAclq9Wyq5A7SUsu8Zrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682321917; x=1684913917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+4jOM/f9b4JhLtBToA6gnoTrIKE0Inz7GSYYH9hvps=;
        b=hpXwYT0UKkRlKACnBGbqSJzcOpw17L+7c9Hh+4zJklYQpfHTXpyJWHvE4J7Wziz1LK
         q0igWmsOiMLcJsJ2haaSf6xc+uviza4SYrINU9z6plKKL3vaVwM6t2OCL4XFuv0vrwkI
         /br9gbzCjVLHOrZoC5wu8qjEOvyr/zbQgE2tmtXhqZV8Nx1a5gBeBO0icpZjDFFY4vrB
         8q7mNqCpbH24aXa4fk57wAtRHQ6a1MzzmyisToqjE15RIzB/i2LMLH3qOusGirIMgJ3w
         LBxmDK1tm4hf+scmjsfX7Zt4fCMdP0oO+zN0btPHeP2ZSEG21UBxvbqBpaUBPiBvppPo
         abGA==
X-Gm-Message-State: AAQBX9eqV2Mx7+kdViXs9Pj5aT/MDgCtkXJvavUZMpHSUFN8kYpsdixS
	TrRcT9pTDzKDT1j8j5JEk7WTZll8V7pSxzMavxNhvQ==
X-Google-Smtp-Source: AKy350bp2mW5PudrRDEQA1sSdHF+rhXS2JyG6H9jfqdQRz9LGDjuEOsvxsuBu7xDrMWIYkAEesbrEYR9hwxGGdehnFo=
X-Received: by 2002:a67:ff03:0:b0:42f:e944:7ea7 with SMTP id
 v3-20020a67ff03000000b0042fe9447ea7mr5013129vsp.6.1682321916777; Mon, 24 Apr
 2023 00:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GuEQMxYTKrnia1ipYHLt_B2h6By7EejE7MjCypfavnFg@mail.gmail.com>
 <5ede9421-54d6-4dda-91af-2acbf46c2d3e@notapiano> <097d60ba-5604-a2c9-c6d2-121db2d55e36@collabora.com>
In-Reply-To: <097d60ba-5604-a2c9-c6d2-121db2d55e36@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 15:38:25 +0800
Message-ID: <CAGXv+5G9Qh2ftB0NG4Km3wHQCgyxHK+Ae17QWJrv8V9VJaBH4A@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: cherry: Add platform thermal configuration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_003844_992268_052C9272 
X-CRM114-Status: GOOD (  25.31  )
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

On Mon, Apr 24, 2023 at 2:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/04/23 22:53, N=C3=ADcolas F. R. A. Prado ha scritto:
> > On Fri, Apr 21, 2023 at 03:37:52PM +0800, Chen-Yu Tsai wrote:
> >> On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>>
> >>> This platform has three auxiliary NTC thermistors, connected to the
> >>> SoC's ADC pins. Enable the auxadc in order to be able to read the
> >>> ADC values, add a generic-adc-thermal LUT for each and finally assign
> >>> them to the SoC's thermal zones.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >>> ---
> >>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 +++++++++++++++=
+++
> >>>   1 file changed, 105 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >>> index 8ac80a136c37..0820e9ba3829 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >>> @@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
> >>>                  regulator-boot-on;
> >>>          };
> >>>
> >>> +       /* Murata NCP03WF104F05RL */
> >>> +       tboard_thermistor1: thermal-sensor-t1 {
> >>> +               compatible =3D "generic-adc-thermal";
> >>> +               #thermal-sensor-cells =3D <0>;
> >>> +               io-channels =3D <&auxadc 0>;
> >>> +               io-channel-names =3D "sensor-channel";
> >>> +               temperature-lookup-table =3D <    (-10000) 1553
> >>> +                                               (-5000) 1485
> >>> +                                               0 1406
> >>> +                                               5000 1317
> >>> +                                               10000 1219
> >>> +                                               15000 1115
> >>> +                                               20000 1007
> >>> +                                               25000 900
> >>> +                                               30000 796
> >>> +                                               35000 697
> >>> +                                               40000 605
> >>> +                                               45000 523
> >>> +                                               50000 449
> >>> +                                               55000 384
> >>> +                                               60000 327
> >>> +                                               65000 279
> >>> +                                               70000 237
> >>> +                                               75000 202
> >>> +                                               80000 172
> >>> +                                               85000 147
> >>> +                                               90000 125
> >>> +                                               95000 107
> >>> +                                               100000 92
> >>> +                                               105000 79
> >>> +                                               110000 68
> >>> +                                               115000 59
> >>> +                                               120000 51
> >>> +                                               125000 44>;
> >>> +       };
> >>> +
> >>> +       tboard_thermistor2: thermal-sensor-t2 {
> >>> +               compatible =3D "generic-adc-thermal";
> >>> +               #thermal-sensor-cells =3D <0>;
> >>> +               io-channels =3D <&auxadc 1>;
> >>> +               io-channel-names =3D "sensor-channel";
> >>> +               temperature-lookup-table =3D <    (-10000) 1553
> >>> +                                               (-5000) 1485
> >>> +                                               0 1406
> >>> +                                               5000 1317
> >>> +                                               10000 1219
> >>> +                                               15000 1115
> >>> +                                               20000 1007
> >>> +                                               25000 900
> >>> +                                               30000 796
> >>> +                                               35000 697
> >>> +                                               40000 605
> >>> +                                               45000 523
> >>> +                                               50000 449
> >>> +                                               55000 384
> >>> +                                               60000 327
> >>> +                                               65000 279
> >>> +                                               70000 237
> >>> +                                               75000 202
> >>> +                                               80000 172
> >>> +                                               85000 147
> >>> +                                               90000 125
> >>> +                                               95000 107
> >>> +                                               100000 92
> >>> +                                               105000 79
> >>> +                                               110000 68
> >>> +                                               115000 59
> >>> +                                               120000 51
> >>> +                                               125000 44>;
> >>> +       };
> >>> +
> >>>          usb_vbus: regulator-5v0-usb-vbus {
> >>>                  compatible =3D "regulator-fixed";
> >>>                  regulator-name =3D "usb-vbus";
> >>> @@ -260,6 +331,10 @@ &gpu {
> >>>          mali-supply =3D <&mt6315_7_vbuck1>;
> >>>   };
> >>>
> >>> +&auxadc {
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>>   &i2c0 {
> >>>          status =3D "okay";
> >>>
> >>> @@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
> >>>          };
> >>>   };
> >>>
> >>> +&thermal_zones {
> >>> +       soc_area_ntc {
> >
> > Not sure if that's what's causing the issue, but the thermal zone name =
should
> > end with -thermal as per the binding. Also note that it needs to be und=
er 20
> > characters otherwise it will fail to be registered with -22 like below.
> > (Also, node names shouldn't contain underscore)
> >
> > Thanks,
> > N=C3=ADcolas
> >
> >>> +               polling-delay =3D <1000>;
> >>> +               polling-delay-passive =3D <250>;
> >>> +               thermal-sensors =3D <&tboard_thermistor1>;
> >>> +
> >>> +               trips {
> >>> +                       trip-crit {
> >>> +                               temperature =3D <95000>;
> >>> +                               hysteresis =3D <2000>;
> >>> +                               type =3D "critical";
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +
> >>> +       pmic_area_ntc {
> >>> +               polling-delay =3D <1000>;
> >>> +               polling-delay-passive =3D <0>;
> >>> +               thermal-sensors =3D <&tboard_thermistor2>;
> >>> +
> >>> +               trips {
> >>> +                       trip-crit {
> >>> +                               temperature =3D <95000>;
> >>> +                               hysteresis =3D <2000>;
> >>> +                               type =3D "critical";
> >>> +                       };
> >>> +               };
> >>> +       };
> >>
> >> I'm still getting:
> >>
> >> thermal_sys: Failed to find 'trips' node
> >> thermal_sys: Failed to find trip points for thermal-sensor-t1 id=3D0
> >> generic-adc-thermal thermal-sensor-t1: Thermal zone sensor register fa=
iled: -22
> >> generic-adc-thermal: probe of thermal-sensor-t1 failed with error -22
> >> thermal_sys: Failed to find 'trips' node
> >> thermal_sys: Failed to find trip points for thermal-sensor-t2 id=3D0
> >> generic-adc-thermal thermal-sensor-t2: Thermal zone sensor register fa=
iled: -22
> >> generic-adc-thermal: probe of thermal-sensor-t2 failed with error -22
> >> thermal_sys: Failed to find 'trips' node
> >> thermal_sys: Failed to find trip points for thermal-sensor-t3 id=3D0
> >> generic-adc-thermal thermal-sensor-t3: Thermal zone sensor register fa=
iled: -22
> >> generic-adc-thermal: probe of thermal-sensor-t3 failed with error -22
> >>
>
> I think you have something wrong locally - there's no thermal-sensor-t3 i=
n this
> devicetree...

I seem to have run a stale kernel image. Rebuilt the kernel and everything
seems to work OK now.

BTW, I think the design went for a lower trip point. At least the hardware
thermal protection IC on the Acer device trips at 85 degrees C, instead of
95 degrees C. Maybe that's accounting for the fact that these are external
thermal sensors and have some latency and temperature difference. The PMIC
specifies 85 degrees C maximum ambient air temperature. The SoC doesn't
specify.

Either way this is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

