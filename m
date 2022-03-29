Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3387AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 05:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB7FPHLMINHbcW117QYYxreCQo34/AweCiXm/riLpnM=; b=gyB00t2iX5+BUW
	MOSWqdntYqzmUC5nKxuBlCimvuDRIhqSBwi0HGv63NFnQbrq1k8Gtj7HffHEXU+krtTVJPEsH0j8r
	LO5zVkVBeB3nD1Ww6wFJifdOxeecYpjFkjpYTBUS7WUxBIr9jrlwIun2AekBZTBvnr056Xgj915xY
	REyVj12TwxWcOMC1JtkLSLDAnKfY7QluPIiuL8OCU3DessqcROWx56PvxPp2bVio/Cozyr5yEkkFa
	o5FoAT4EmTzcoYnfH2I54jr9OTsEP7A8drqbk/vgF6Twrewx5W+TzPtd/gskn5XH1UNdElM/dSbCA
	nBaYd+7N1TXt5+8FgpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ4eF-00B7XV-IN; Tue, 29 Mar 2022 05:44:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ4eA-00B7WK-Sx; Tue, 29 Mar 2022 05:44:05 +0000
X-UUID: dc47bd3dce91493a8d30a957db14ff8c-20220328
X-UUID: dc47bd3dce91493a8d30a957db14ff8c-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 472198757; Mon, 28 Mar 2022 22:43:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 22:35:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Mar 2022 13:35:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 13:35:01 +0800
Message-ID: <cfb9fbab26a44792c12e01b85510337e9f093666.camel@mediatek.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: mt8192: Add PCIe node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 13:35:01 +0800
In-Reply-To: <6d7c622a-8685-c020-399e-3559a34b9ad8@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
 <6d7c622a-8685-c020-399e-3559a34b9ad8@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_224402_972594_D1383D4C 
X-CRM114-Status: GOOD (  19.06  )
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

On Thu, 2022-03-24 at 18:44 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add PCIe node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 38
> > ++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 82de1af3f6aa..3a7f93d8eeaa 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -884,6 +884,44 @@
> >   			};
> >   		};
> >   
> > +		pcie: pcie@11230000 {
> > +			compatible = "mediatek,mt8192-pcie";
> > +			device_type = "pci";
> > +			reg = <0 0x11230000 0 0x2000>;
> > +			reg-names = "pcie-mac";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			clocks = <&infracfg CLK_INFRA_PCIE_TL_26M>,
> > +				 <&infracfg CLK_INFRA_PCIE_TL_96M>,
> > +				 <&infracfg CLK_INFRA_PCIE_TL_32K>,
> > +				 <&infracfg CLK_INFRA_PCIE_PERI_26M>,
> > +				 <&infracfg CLK_INFRA_PCIE_TOP_H_133M>,
> > +				 <&infracfg CLK_INFRA_PCIE_PL_P_250M>;
> > +			clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
> > +				      "obff_ck0", "axi_ck0",
> > "pipe_ck0";
> 
> Also not mandated by the bindings nor the driver clock-names don't
> match the 
> binding. How comes? Shall we update the bindings to have more sound
> names?
> 
> Regards,
> Matthias
> 

Thanks for your reminder.

You're right. The driver clock-names are wrong.

I will correct those in next version.

Best regards,
Allen 

> > +			assigned-clocks = <&topckgen CLK_TOP_TL_SEL>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D6_D4>;
> > +			resets = <&infracfg_rst 2>,
> > +				 <&infracfg_rst 3>;
> > +			reset-names = "phy", "mac";
> > +			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			bus-range = <0x00 0xff>;
> > +			ranges = <0x82000000 0 0x12000000 0x0
> > 0x12000000 0 0x0800000>,
> > +				 <0x81000000 0 0x12800000 0x0
> > 0x12800000 0 0x0800000>;
> > +			#interrupt-cells = <1>;
> > +			interrupt-map-mask = <0 0 0 7>;
> > +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> > +					<0 0 0 2 &pcie_intc0 1>,
> > +					<0 0 0 3 &pcie_intc0 2>,
> > +					<0 0 0 4 &pcie_intc0 3>;
> > +
> > +			pcie_intc0: interrupt-controller {
> > +				interrupt-controller;
> > +				#address-cells = <0>;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> >   		nor_flash: spi@11234000 {
> >   			compatible = "mediatek,mt8192-nor";
> >   			reg = <0 0x11234000 0 0xe0>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
