Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303F0C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 20:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXNfwThjPsAnC+Qyr1ykQ/RbKbz71i3w4p/TAFsNpnI=; b=AW/PTuYvMWv0z5SCrHfqASG0n9
	nTxNg05txzRcMvjyJbtsWCS6VNHUjnHVdxfa2p1YsENyb17SvVwKy2Q4jE1ZISI0KR3NRebwqYaA8
	IAcwk88XMkknM2RpOUVZD3p0FahfM8CrdkCgWf3yPJQKbVBxht8IKmnghGLK4dFrP62QP08wi+Rd0
	I3cEjb8lTjPJUvpL/k4Tk9b7r5jZUXmIjq6wO+E3nU7YMRp0lQuueOphLlJ9THNqBeSh4YTCvOy+z
	L9gAIBzwKUJgDH6Rt3IuVW9kw0uFFc+lRGoY6rHr0iJmnfDPb/lTj198ZMQgvOFCaOlNDv/LsoV2x
	NucVRi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxkp-00Bpbz-33;
	Fri, 21 Apr 2023 20:53:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxkl-00Bpaw-0y;
	Fri, 21 Apr 2023 20:53:13 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13317660327C;
	Fri, 21 Apr 2023 21:53:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682110387;
	bh=fnT9RDQavvIKBkmdeIY564q2m/UajYumE4RK3iuUElc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnIU0vlo5rtx9wiuXhFSN4epaUL3RfZISYxZuHDKXz0WogABPf3NvgRNS8FTcOf4C
	 y2jxn/0Ux3d8ERo0JuLzuvh9hbphi2cc1ItOkrfWRQUDqyQx15qKKrn2clT0iIcht7
	 BYxrPzWZnNtgqrBeTNgSdT4EuGo0LHcowv/VgWglY4iBppyjWYz8gcnykY0kHbJXJS
	 MsqJTDEkvDEQn+Qyh5x8XYNv6gcA4aoqN6TsbWtTY++h2P1ce4cwbqGgG5kFEXm4gM
	 D189oWQURbDxbOljpGo2Zm1whXenUSayDykvIHESNbY4T6W3TZ/MdIbHKlMemOeBo1
	 yRdnUjILMGwsw==
Date: Fri, 21 Apr 2023 16:53:01 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: cherry: Add platform thermal
 configuration
Message-ID: <5ede9421-54d6-4dda-91af-2acbf46c2d3e@notapiano>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GuEQMxYTKrnia1ipYHLt_B2h6By7EejE7MjCypfavnFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GuEQMxYTKrnia1ipYHLt_B2h6By7EejE7MjCypfavnFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_135311_701810_FCD43186 
X-CRM114-Status: GOOD (  21.53  )
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

On Fri, Apr 21, 2023 at 03:37:52PM +0800, Chen-Yu Tsai wrote:
> On Thu, Apr 20, 2023 at 5:45 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > This platform has three auxiliary NTC thermistors, connected to the
> > SoC's ADC pins. Enable the auxadc in order to be able to read the
> > ADC values, add a generic-adc-thermal LUT for each and finally assign
> > them to the SoC's thermal zones.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > index 8ac80a136c37..0820e9ba3829 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > @@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
> >                 regulator-boot-on;
> >         };
> >
> > +       /* Murata NCP03WF104F05RL */
> > +       tboard_thermistor1: thermal-sensor-t1 {
> > +               compatible = "generic-adc-thermal";
> > +               #thermal-sensor-cells = <0>;
> > +               io-channels = <&auxadc 0>;
> > +               io-channel-names = "sensor-channel";
> > +               temperature-lookup-table = <    (-10000) 1553
> > +                                               (-5000) 1485
> > +                                               0 1406
> > +                                               5000 1317
> > +                                               10000 1219
> > +                                               15000 1115
> > +                                               20000 1007
> > +                                               25000 900
> > +                                               30000 796
> > +                                               35000 697
> > +                                               40000 605
> > +                                               45000 523
> > +                                               50000 449
> > +                                               55000 384
> > +                                               60000 327
> > +                                               65000 279
> > +                                               70000 237
> > +                                               75000 202
> > +                                               80000 172
> > +                                               85000 147
> > +                                               90000 125
> > +                                               95000 107
> > +                                               100000 92
> > +                                               105000 79
> > +                                               110000 68
> > +                                               115000 59
> > +                                               120000 51
> > +                                               125000 44>;
> > +       };
> > +
> > +       tboard_thermistor2: thermal-sensor-t2 {
> > +               compatible = "generic-adc-thermal";
> > +               #thermal-sensor-cells = <0>;
> > +               io-channels = <&auxadc 1>;
> > +               io-channel-names = "sensor-channel";
> > +               temperature-lookup-table = <    (-10000) 1553
> > +                                               (-5000) 1485
> > +                                               0 1406
> > +                                               5000 1317
> > +                                               10000 1219
> > +                                               15000 1115
> > +                                               20000 1007
> > +                                               25000 900
> > +                                               30000 796
> > +                                               35000 697
> > +                                               40000 605
> > +                                               45000 523
> > +                                               50000 449
> > +                                               55000 384
> > +                                               60000 327
> > +                                               65000 279
> > +                                               70000 237
> > +                                               75000 202
> > +                                               80000 172
> > +                                               85000 147
> > +                                               90000 125
> > +                                               95000 107
> > +                                               100000 92
> > +                                               105000 79
> > +                                               110000 68
> > +                                               115000 59
> > +                                               120000 51
> > +                                               125000 44>;
> > +       };
> > +
> >         usb_vbus: regulator-5v0-usb-vbus {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "usb-vbus";
> > @@ -260,6 +331,10 @@ &gpu {
> >         mali-supply = <&mt6315_7_vbuck1>;
> >  };
> >
> > +&auxadc {
> > +       status = "okay";
> > +};
> > +
> >  &i2c0 {
> >         status = "okay";
> >
> > @@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
> >         };
> >  };
> >
> > +&thermal_zones {
> > +       soc_area_ntc {

Not sure if that's what's causing the issue, but the thermal zone name should
end with -thermal as per the binding. Also note that it needs to be under 20
characters otherwise it will fail to be registered with -22 like below.
(Also, node names shouldn't contain underscore)

Thanks,
Nícolas

> > +               polling-delay = <1000>;
> > +               polling-delay-passive = <250>;
> > +               thermal-sensors = <&tboard_thermistor1>;
> > +
> > +               trips {
> > +                       trip-crit {
> > +                               temperature = <95000>;
> > +                               hysteresis = <2000>;
> > +                               type = "critical";
> > +                       };
> > +               };
> > +       };
> > +
> > +       pmic_area_ntc {
> > +               polling-delay = <1000>;
> > +               polling-delay-passive = <0>;
> > +               thermal-sensors = <&tboard_thermistor2>;
> > +
> > +               trips {
> > +                       trip-crit {
> > +                               temperature = <95000>;
> > +                               hysteresis = <2000>;
> > +                               type = "critical";
> > +                       };
> > +               };
> > +       };
> 
> I'm still getting:
> 
> thermal_sys: Failed to find 'trips' node
> thermal_sys: Failed to find trip points for thermal-sensor-t1 id=0
> generic-adc-thermal thermal-sensor-t1: Thermal zone sensor register failed: -22
> generic-adc-thermal: probe of thermal-sensor-t1 failed with error -22
> thermal_sys: Failed to find 'trips' node
> thermal_sys: Failed to find trip points for thermal-sensor-t2 id=0
> generic-adc-thermal thermal-sensor-t2: Thermal zone sensor register failed: -22
> generic-adc-thermal: probe of thermal-sensor-t2 failed with error -22
> thermal_sys: Failed to find 'trips' node
> thermal_sys: Failed to find trip points for thermal-sensor-t3 id=0
> generic-adc-thermal thermal-sensor-t3: Thermal zone sensor register failed: -22
> generic-adc-thermal: probe of thermal-sensor-t3 failed with error -22
> 
> 
> 
> > +};
> > +
> >  &u3phy0 {
> >         status = "okay";
> >  };
> > --
> > 2.40.0
> >
> >

