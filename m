Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ii5vf4GHvhOWiCWNc+dHWF6TDqp0NB+00reNaPJ1zSk=; b=UIPAGL1lTGBs5z
	mdQ80U6G9K+zJOFbkUuI+KFqhAzC1cfL9CSXB6fAv3xVA1JHlrw6NcG+quk5r88rEQZOkiEcXxDP0
	6Lku4zhKATJIDlVpBsG+rS1SINLUGxcEd0rWCWM+Scm71bZ67RoIuN2p725CWxA4BbzfsihQEQX+0
	G9O/dTR0bnvFyMiDnoP3weXcnro10oXvZczRSF0FjcQH6j2SG1omkNDNjUO3ISgB/QsZYjJHrq+y8
	kW4Qt0V6lYa3rQySs3yLno2+M66sbbxHW2Fo+Hcab+8cJ+Nq5P+QBMti1Wax6J+iY4bPiV40i2uyS
	0fPOywthAvIuOuuQy9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqDf2-007MEI-Nx; Thu, 25 Nov 2021 12:15:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqDeo-007MCv-AX; Thu, 25 Nov 2021 12:15:21 +0000
X-UUID: 29d3ae0c6f4d4abd91755d88b0b39c7e-20211125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XNa56ptSVW/PBObhWFXTIZ22GAfC+uM5uwwEbvv6o/M=; 
 b=nHIEfA3DaVVfdCd8h/Bi4AlcPB95vpZffM6B2xWRkW+1JuIIw+E/dMIWJu5a0K5mRGOAfEz3a7paWQbhgQ5G91lvR/BUnlkltRdGSJfVGXPPWT9vnCkTl0sSrFcV8ceGaED+STcGxpgIMzjkN0sNwqz/Ff2Lm7GQewaAIO9FZeM=;
X-UUID: 29d3ae0c6f4d4abd91755d88b0b39c7e-20211125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 566345561; Thu, 25 Nov 2021 05:15:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 04:15:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 20:15:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 20:15:11 +0800
Message-ID: <926a0bb2ec2ad64ba579d38e761e1e97ba5bba3f.camel@mediatek.com>
Subject: Re: [PATCH v4 10/12] ARM: dts: Add PCIe support for Airoha EN7523
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-arm-kernel@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <john@phrozen.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 25 Nov 2021 20:15:11 +0800
In-Reply-To: <20211125110738.41028-11-nbd@nbd.name>
References: <20211125110738.41028-1-nbd@nbd.name>
 <20211125110738.41028-11-nbd@nbd.name>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_041519_796501_0ABE9CD9 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Felix,

On Thu, 2021-11-25 at 12:07 +0100, Felix Fietkau wrote:
> This uses the MediaTek MT7622 PCIe driver, since the PCIe IP block is
> nearly
> identical to the one in MT7622
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  arch/arm/boot/dts/en7523-evb.dts | 12 +++++++
>  arch/arm/boot/dts/en7523.dtsi    | 60
> ++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/en7523-evb.dts
> b/arch/arm/boot/dts/en7523-evb.dts
> index e8e5c034cee7..af1a8dd40a41 100644
> --- a/arch/arm/boot/dts/en7523-evb.dts
> +++ b/arch/arm/boot/dts/en7523-evb.dts
> @@ -25,3 +25,15 @@ memory@80000000 {
>  		reg = <0x80000000 0x20000000>;
>  	};
>  };
> +
> +&pcie {
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/en7523.dtsi
> b/arch/arm/boot/dts/en7523.dtsi
> index eabf3fdb3d52..d9bdb51614b5 100644
> --- a/arch/arm/boot/dts/en7523.dtsi
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -119,4 +119,64 @@ uart1: serial@1fbf0000 {
>  		clock-frequency = <1843200>;
>  		status = "okay";
>  	};
> +
> +	pcie: pcie@1a140000 {
> +		compatible = "airoha,en7523-pcie", "mediatek,mt7622-
> pcie";
> +		device_type = "pci";
> +		reg = <0x1fa91000 0x1000>,
> +		      <0x1fa92000 0x1000>;
> +		reg-names = "port0", "port1";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&scu EN7523_CLK_PCIE>,
> +			 <&scu EN7523_CLK_PCIE>;
> +		clock-names = "sys_ck0", "sys_ck1";
> +		bus-range = <0x00 0xff>;
> +		ranges = <0x82000000 0 0x20000000  0x20000000  0
> 0x10000000>;
> +		status = "disabled";
> +
> +		pcie0: pcie@0,0 {
> +			device_type = "pci";
> +			reg = <0x0000 0 0 0 0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			ranges;
> +			status = "disabled";
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +					<0 0 0 2 &pcie_intc0 1>,
> +					<0 0 0 3 &pcie_intc0 2>,
> +					<0 0 0 4 &pcie_intc0 3>;
> +			pcie_intc0: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		pcie1: pcie@1,0 {
> +			device_type = "pci";
> +			reg = <0x0800 0 0 0 0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			ranges;
> +			status = "disabled";
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> +					<0 0 0 2 &pcie_intc1 1>,
> +					<0 0 0 3 &pcie_intc1 2>,
> +					<0 0 0 4 &pcie_intc1 3>;
> +			pcie_intc1: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +	};

There are some known issues with this device node style, please split
the PCIe node into two independent nodes to comply with the hardware
design.

Here is the fix patch we sent before:

https://lore.kernel.org/linux-pci/20210823032800.1660-6-chuanjia.liu@mediatek.com/

Thanks.

>  };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
