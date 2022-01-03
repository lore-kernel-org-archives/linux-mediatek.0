Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfMoBHc3JDxdljqlgZMLcjWneJTSB1LcATT2tDb/2j8=; b=CRGtDn/rZQDaMh
	iRRMLuFHeAibnp5EBAGDHwu2fr8Wgn8wKeCUEvUXSXhyrVO0KYsvHThDHMj8p7c+URVDmHpMXkgIB
	1cGIl/YwnmcQ9s5nQdcfcI9ETnZE/f38OIuMx0QkxSxBpd0JZWm1euHgb1xe2qdny/h4ut4baOqVI
	1xEZe3AiI7wD7xJ948vWWnhdERFcnt1gAMkf+vBfImuYQFG/Q6zD20aW+Phe2kifl290tifpG9XpL
	IAGER47OsOBm8bQsByDFNfxlsB4Oe4AINfoEHr/UUyNSRDEwiS0oAX3Ri531UQBhMykyOuw3wXgz7
	A2MSQH5nmf3nvO+NG0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4GdH-008RkB-Kh; Mon, 03 Jan 2022 06:15:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Gd5-008RjO-Ew; Mon, 03 Jan 2022 06:15:36 +0000
X-UUID: d81cbaec1a744a8da50f866b18ead8f5-20220102
X-UUID: d81cbaec1a744a8da50f866b18ead8f5-20220102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1594506819; Sun, 02 Jan 2022 23:15:30 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 22:08:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 14:08:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 14:08:15 +0800
Message-ID: <63e17e727d8290a5ebd8c4c5cd8f2383fc1164cc.camel@mediatek.com>
Subject: Re: [PATCH v16 2/7] arm64: dts: mt8183: add svs device information
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 3 Jan 2022 14:08:15 +0800
In-Reply-To: <20cf2c1e-d55b-5780-8c6e-4d8beaca5a65@gmail.com>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-3-roger.lu@mediatek.com>
 <20cf2c1e-d55b-5780-8c6e-4d8beaca5a65@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_221535_542351_CCC53ADE 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Matthias,

On Thu, 2021-12-30 at 13:54 +0100, Matthias Brugger wrote:
> 
> On 28/04/2021 08:54, Roger Lu wrote:
> > add compitable/reg/irq/clock/efuse setting in svs node
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 80519a145f13..441d617ece43 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -657,6 +657,18 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		svs: svs@1100b000 {
> > +			compatible = "mediatek,mt8183-svs";
> > +			reg = <0 0x1100b000 0 0x1000>;
> > +			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&infracfg CLK_INFRA_THERM>;
> > +			clock-names = "main";
> > +			nvmem-cells = <&svs_calibration>,
> > +				      <&thermal_calibration>;
> > +			nvmem-cell-names = "svs-calibration-data",
> > +					   "t-calibration-data";
> > +		};
> > +
> >   		pwm0: pwm@1100e000 {
> >   			compatible = "mediatek,mt8183-disp-pwm";
> >   			reg = <0 0x1100e000 0 0x1000>;
> > @@ -941,9 +953,15 @@
> >   			reg = <0 0x11f10000 0 0x1000>;
> >   			#address-cells = <1>;
> >   			#size-cells = <1>;
> 
> Please add a new line between the different calibartion data, to improve 
> readability.

No problem and thanks for the review.

> Regards,
> Matthias
> 
> > +			thermal_calibration: calib@180 {
> > +				reg = <0x180 0xc>;
> > +			};
> >   			mipi_tx_calibration: calib@190 {
> >   				reg = <0x190 0xc>;
> >   			};
> > +			svs_calibration: calib@580 {
> > +				reg = <0x580 0x64>;
> > +			};
> >   		};
> >   
> >   		u3phy: usb-phy@11f40000 {
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
