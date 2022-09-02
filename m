Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B820EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 03:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbFnlhXDg72eWTDx+a0rxuRSm17IARkT6d/ukeMGhDU=; b=P0s9TXm8S1q4CyUBqqM1/sNbrX
	vXdnSXMIKA+dUO/5pXQ1pGjozcfaKwQKOkn7uOzAt0WU2agkn821Kr2kBovkvgD/dnrQhsht6eRjB
	3tiDiVswwVFgca2ru4ofx90h3cjnz+HGfzx5QDJYSnFkb+/VgAjO3GY7ZnD6tcVMIdvyKfhj927FQ
	Mks+yU9n7sB3ufP2mMcwyC10tRmCV42CopUT0N51kR4edjEfmp/FTi3Nncu37YVdpsTYFtug1N/hS
	jsnIrf7hlcrYMjQfIXEBdfj8HY6U6FU6/DCD06PPeti+1JbcKYrArYr1FxHOUiDNUIwjdd1N3FOLd
	BA0qT+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxQA-00HNHp-8i; Fri, 02 Sep 2022 03:32:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxQ7-00HNGS-0q; Fri, 02 Sep 2022 03:32:40 +0000
X-UUID: 5db1cbb8484e48df9766f1bc23ff6873-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EbFnlhXDg72eWTDx+a0rxuRSm17IARkT6d/ukeMGhDU=;
	b=QsBN6Rh7i+yimV7GRwPsygtcntdY/Uo6DlqqUcsK115rFsctNPGee4Co+5Pg3b6HPQTAj9mub2RO0psdy300RkKXO8ZoBnW6YfG/Scu9xnHX9TwIPwph75u5z3RuF7ZzRgCufM6RSKg6TvHRMM4zABSzeiuUP/3pE5Yu1Xfgg+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:520dc4f3-ad75-46d9-bd3d-0c8d43d50832,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:57f865d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5db1cbb8484e48df9766f1bc23ff6873-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1669032243; Thu, 01 Sep 2022 20:29:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 11:08:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 11:08:28 +0800
Message-ID: <63ee30f9febd94dbfd1d3f50825e9f5328465f78.camel@mediatek.com>
Subject: Re: [PATCH v5] arm64: dts: mt7986: add built-in Wi-Fi device nodes
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, Ryder Lee <ryder.Lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Date: Fri, 2 Sep 2022 11:08:27 +0800
In-Reply-To: <aac98d72-863d-eb7b-caab-73bb0fddeb83@gmail.com>
References: <20220901130552.26234-1-chui-hao.chiu@mediatek.com>
	 <aac98d72-863d-eb7b-caab-73bb0fddeb83@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_203239_099329_C3F7348B 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, 2022-09-01 at 16:31 +0200, Matthias Brugger wrote:
> 
> On 01/09/2022 15:05, Peter Chiu wrote:
> > This enables built-in 802.11ax Wi-Fi support.
> > 
> > Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> > Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > 
> 
> That won't work without the pinctrl yaml file updated. Please send
> both together 
> so that we can review them.
> 

Thanks for your kind reminder. I just sent the pinctrl yaml patch.

https://patchwork.kernel.org/project/linux-mediatek/patch/20220902024719.31943-1-chui-hao.chiu@mediatek.com/

Best Regards,
Peter Chiu
> Regards,
> Matthias
> 
> > ---
> > v2: add clocks and clock-names.
> > v3: rename wmac to wifi and change underscores to dash in node
> > names.
> > v4: rebase to the latest codebase.
> > v5: remove useless pins in wf_dbdc_pins node.
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 38
> > +++++++++++++++++++
> >   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 23 +++++++++++
> >   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 40
> > ++++++++++++++++++++
> >   3 files changed, 101 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > index 882277a52b69..afe37b702eef 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > @@ -115,6 +115,13 @@
> >   	status = "okay";
> >   };
> >   
> > +&wifi {
> > +	status = "okay";
> > +	pinctrl-names = "default", "dbdc";
> > +	pinctrl-0 = <&wf_2g_5g_pins>;
> > +	pinctrl-1 = <&wf_dbdc_pins>;
> > +};
> > +
> >   &pio {
> >   	uart1_pins: uart1-pins {
> >   		mux {
> > @@ -129,4 +136,35 @@
> >   			groups = "uart2";
> >   		};
> >   	};
> > +
> > +	wf_2g_5g_pins: wf-2g-5g-pins {
> > +		mux {
> > +			function = "wifi";
> > +			groups = "wf_2g", "wf_5g";
> > +		};
> > +		conf {
> > +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
> > "WF0_HB4",
> > +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
> > "WF0_HB6",
> > +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
> > "WF0_HB10",
> > +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
> > "WF1_HB1",
> > +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
> > "WF1_HB0",
> > +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
> > "WF1_HB8",
> > +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> > +			drive-strength = <4>;
> > +		};
> > +	};
> > +
> > +	wf_dbdc_pins: wf-dbdc-pins {
> > +		mux {
> > +			function = "wifi";
> > +			groups = "wf_dbdc";
> > +		};
> > +		conf {
> > +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
> > "WF0_HB4",
> > +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
> > "WF0_HB6",
> > +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
> > "WF0_HB10",
> > +			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> > +			drive-strength = <4>;
> > +		};
> > +	};
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > index e3a407d03551..890ded0efc51 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > @@ -7,6 +7,7 @@
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/clock/mt7986-clk.h>
> > +#include <dt-bindings/reset/mt7986-resets.h>
> >   
> >   / {
> >   	interrupt-parent = <&gic>;
> > @@ -70,6 +71,11 @@
> >   			reg = <0 0x43000000 0 0x30000>;
> >   			no-map;
> >   		};
> > +
> > +		wmcpu_emi: wmcpu-reserved@4fc00000 {
> > +			no-map;
> > +			reg = <0 0x4fc00000 0 0x00100000>;
> > +		};
> >   	};
> >   
> >   	timer {
> > @@ -261,6 +267,23 @@
> >   			#size-cells = <0>;
> >   			status = "disabled";
> >   		};
> > +
> > +		wifi: wifi@18000000 {
> > +			compatible = "mediatek,mt7986-wmac";
> > +			resets = <&watchdog
> > MT7986_TOPRGU_CONSYS_SW_RST>;
> > +			reset-names = "consys";
> > +			clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
> > +				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
> > +			clock-names = "mcu", "ap2conn";
> > +			reg = <0 0x18000000 0 0x1000000>,
> > +			      <0 0x10003000 0 0x1000>,
> > +			      <0 0x11d10000 0 0x1000>;
> > +			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> > +			memory-region = <&wmcpu_emi>;
> > +		};
> >   	};
> >   
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > index 0f49d5764ff3..3443013b5971 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > @@ -98,3 +98,43 @@
> >   		};
> >   	};
> >   };
> > +
> > +&wifi {
> > +	status = "okay";
> > +	pinctrl-names = "default", "dbdc";
> > +	pinctrl-0 = <&wf_2g_5g_pins>;
> > +	pinctrl-1 = <&wf_dbdc_pins>;
> > +};
> > +
> > +&pio {
> > +	wf_2g_5g_pins: wf-2g-5g-pins {
> > +		mux {
> > +			function = "wifi";
> > +			groups = "wf_2g", "wf_5g";
> > +		};
> > +		conf {
> > +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
> > "WF0_HB4",
> > +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
> > "WF0_HB6",
> > +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
> > "WF0_HB10",
> > +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
> > "WF1_HB1",
> > +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
> > "WF1_HB0",
> > +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
> > "WF1_HB8",
> > +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> > +			drive-strength = <4>;
> > +		};
> > +	};
> > +
> > +	wf_dbdc_pins: wf-dbdc-pins {
> > +		mux {
> > +			function = "wifi";
> > +			groups = "wf_dbdc";
> > +		};
> > +		conf {
> > +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
> > "WF0_HB4",
> > +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
> > "WF0_HB6",
> > +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
> > "WF0_HB10",
> > +			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> > +			drive-strength = <4>;
> > +		};
> > +	};
> > +};


