Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC52C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 05:12:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0812A613B5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 05:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0812A613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dSmXNYnCDXDhYw1d/7D+vj4owScdPVWBvOB8+xIF5fg=; b=kTuiOehjW5g8AXM3If6+Pjy2k
	uB4LxCNNNpQApk+JxgJfdPxJrRWIhNPQKZYTw54mZ08xVbbf+uZjRwwXL2YnieRtOpnxd1c08E+cI
	mLqP97xLQ5ATDBZ8QHBkKP7A1RV8yg3pRD1gnVYBLY8S6PoaWOC9IuWt89DsCp+U/jp72ogGZbWHN
	Qy3jCbyroFzATbPwz3zpRw46v8xDbnsQ0Q4Y3iU+01pw1mDXYGXKAlPk1zYo+t6w310kuHtBvwwkp
	7gKGRsBvFJWhfj3zB7I/OUewUwg644gZLFVRTGS0YJqWgyTgx9+E7wQvGAzgxFg7Oe7I2Rz6qysBz
	iJEhTtTEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leWJ4-003DfK-0w; Thu, 06 May 2021 05:12:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leWIr-003Dcb-1x; Thu, 06 May 2021 05:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=GCNKDKTbKe0DL6QViifjAcHqLVE5WHHmvfm15Wnjq68=; b=XbrYpJ9MJLAoHiOV1VlkL/1Sft
 iGw2N/z6fZs+OsnG8Q0WlEbUzn3yyaXMZUBtHplqYIj7nf858peO0phJ0SU2kevCX9E6Hwo115vdN
 Xi7+q+Hbr6qktOSPTnp3d21nX5EIygDOFxm1OnMdesYRoogLUYq0hPGyCXtfGoykYkIabAW1mj3pX
 ZBAEaXLb2PAURjT2OAJZBXY5JDQVFGrQxibmc0Iz/SQoJXTEwWnkrdSQIFMxFrpIvN2G4ekFXdPI0
 f1TYZS5+t1CYid+zL8htEpsDfdqJncHMr77DoocXeP9beG6hFs9sLrTfb50j0J4+4hBXFdUYOlGOT
 9vvPBryQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leWIm-005bsl-HH; Thu, 06 May 2021 05:11:58 +0000
X-UUID: aed79ecded9f467d81fe8d37eed57f78-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GCNKDKTbKe0DL6QViifjAcHqLVE5WHHmvfm15Wnjq68=; 
 b=btlYBP/a1yUxC+VlWy6TA7S1BU1rjc+ip11uRRaw5iwHF03pwf1d90BOs1GgFTH+fxj/K0ieIgklg4sWg5hzIH6nRo/8l+q1v9gZI8AR3tg3WGfavXACY5d4IKSK/XYIa63+7YnEImrvCJOiOdkIBLLFT02cB4hidw5aC72yWcg=;
X-UUID: aed79ecded9f467d81fe8d37eed57f78-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 404940293; Wed, 05 May 2021 22:11:53 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 22:11:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 13:11:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 May 2021 13:11:44 +0800
Message-ID: <7ae074f1f80d6c874e5db12d2650e301d8e4a080.camel@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8183-kukui: Enable thermal Tboard
From: Michael Kao <michael.kao@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <Ben.Tseng@mediatek.com>
CC: <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Linux PM <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Devicetree List
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Thu, 6 May 2021 13:11:44 +0800
In-Reply-To: <CAJMQK-gXfR2Ca-Ay5fwcRgQ4F6h4xXVt1bbAL+3LFwgotwYREA@mail.gmail.com>
References: <20210409071158.2346-1-michael.kao@mediatek.com>
 <CAJMQK-gXfR2Ca-Ay5fwcRgQ4F6h4xXVt1bbAL+3LFwgotwYREA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 364551A4171664A9486A254729F726B04D8DD073D523B4A856147DA05543CF1C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_221156_596047_E2475E3C 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maintainers,

Gentle pin for this patch.

Thanks

On Fri, 2021-04-09 at 15:16 +0800, Hsin-Yi Wang wrote:
> On Fri, Apr 9, 2021 at 3:12 PM Michael Kao <michael.kao@mediatek.com>
> wrote:
> > 
> > Add Tboard thermal sensor settings.
> > 
> > pull-up voltage: 1800 mv
> > pull-up resistor: 75K
> > 
> > Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
> > AuxIn = Vsense * 4096 / 1500
> > 
> > TEST=boot kukui
> >      check /sys/class/thermal/thermal_zone*/type
> >      check /sys/class/thermal/thermal_zone*/temp
> 
> the TEST lines can be removed.
> 
> > 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> 
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> This removes following error:
> [   10.882325] generic-adc-thermal thermal-sensor1: Thermal zone
> sensor register failed: -19
> [   10.911912] generic-adc-thermal thermal-sensor2: Thermal zone
> sensor register failed: -19
> 
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  2 +-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index bf2ad1294dd3..202acb542b12 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -801,6 +801,20 @@
> >         status = "okay";
> >  };
> > 
> > +&thermal_zones {
> > +       Tboard1 {
> > +               polling-delay = <1000>; /* milliseconds */
> > +               polling-delay-passive = <0>; /* milliseconds */
> > +               thermal-sensors = <&tboard_thermistor1>;
> > +       };
> > +
> > +       Tboard2 {
> > +               polling-delay = <1000>; /* milliseconds */
> > +               polling-delay-passive = <0>; /* milliseconds */
> > +               thermal-sensors = <&tboard_thermistor2>;
> > +       };
> > +};
> > +
> >  &u3phy {
> >         status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 1ad0a1d55d53..f0719dbef249 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -673,7 +673,7 @@
> >                         nvmem-cell-names = "calibration-data";
> >                 };
> > 
> > -               thermal-zones {
> > +               thermal_zones: thermal-zones {
> >                         cpu_thermal: cpu_thermal {
> >                                 polling-delay-passive = <100>;
> >                                 polling-delay = <500>;
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
