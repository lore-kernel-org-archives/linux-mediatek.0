Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCC1C388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 03:02:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1206206E3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 03:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUOra5tE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rlMBOoDW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1206206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KFGNle96QdWxDuNsmgjtVL9ovj3mGYaZZARg7MGpdU=; b=WUOra5tElWcJ4ueILVp37pBYY
	L825UACyMASnrXwlp+o1ijzMS8/erbtQh994gD7Skb1wFOdCbffF81I0KiWnnfWBX4P7VUN2IY5Dk
	OKUkNDUMsC1pvBV/e57noja0LAUIHD9Rfpth5xSbqSXWMPAsgHZSR/e33W9Fc4LpdmWR/1AtSHtuB
	BQNmLL8GXjwmbRVFklebWKav9JiJAB5YRwqsPNPnnKHeS+hYGWRi5HshqxJVJbCYVmnXmD/FY7ic8
	JBHuSiWG93iO5RtjuOpNnVt/i8xw2jOWay9Fqlt+NvGIvrgFOFNnb5N85YhiY81042L1CVqY82UOF
	E1+K1lXeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbxRS-0007p8-Ve; Mon, 09 Nov 2020 03:02:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbxRQ-0007oh-CP; Mon, 09 Nov 2020 03:02:01 +0000
X-UUID: a4537b99eecf4e639623d94ea7630204-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2XstU6zQ5xruNoxKqD7BXfAfzeXvLG0wUg8a6JYY32Y=; 
 b=rlMBOoDWWikaZ0nVTsQ6yw/XT0kRhina1/z9m7DpzriaE7j/Tf6hTDnW7nJ75BXgT7OqvO+AgOYsdLhKP4FD0VOQjca7GJy1FgfJEr52Om54ZaiRpdCB7PJH8H+n1HO5rK9PWQtOlGgu9s/v1db26NpCYq2/HCPVBGTgS5R/MHE=;
X-UUID: a4537b99eecf4e639623d94ea7630204-20201108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 573026750; Sun, 08 Nov 2020 19:01:49 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 19:01:47 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 11:01:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 11:01:44 +0800
Message-ID: <1604890904.8050.13.camel@mhfsdcap03>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Mon, 9 Nov 2020 11:01:44 +0800
In-Reply-To: <20201103225647.GA272422@bjorn-Precision-5520>
References: <20201103225647.GA272422@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C860E0C27E9739533019266E3FD11CD12FC6620D6BD7AE31B71BA164D54DB8992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_220200_663779_F26A2673 
X-CRM114-Status: GOOD (  28.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-03 at 16:56 -0600, Bjorn Helgaas wrote:
> Run "git log --oneline" and follow the convention, e.g.,
> 
>   dt-bindings: PCI: mediatek: ...
> 
thanks for your comment, I will update to

dt-bindings: PCI: mediatek: Update the Device tree bindings

> On Thu, Oct 29, 2020 at 04:15:10PM +0800, Chuanjia Liu wrote:
> > Split the PCIe node and add pciecfg node to fix MSI issue.
> 
> I assume "split" refers to the new yaml file?  It's not really obvious
> how the two files are connected.

In mt2712 and mt7622,old DTS format is one PCIe controller have two slot.
In new DTS, split two independent PCIe controller and a pciecfg node.
I once added the "mediatek,pcie-cfg = <&pciecfg>" in PCIe node,
but Rob suggested that search for the node by compatible.so I remove it.

> Could this be done in two patches?  One for the split and one for the
> MSI issue?

MSI issue is fixed when the PCIe node is separated. So I think this should be one patch.

> It'd be nice to say something more about the MSI issue.

The detailed description in patch 3/4, I will add description of the msi
issue in the next version of this patch.

Thanks again for your review.
> 
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++++
> >  .../devicetree/bindings/pci/mediatek-pcie.txt | 129 +++++++++++-------
> >  2 files changed, 118 insertions(+), 50 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > new file mode 100644
> > index 000000000000..d3ecbcd032a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/mediatek-pcie-cfg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek PCIECFG controller
> > +
> > +maintainers:
> > +  - Chuanjia Liu <chuanjia.liu@mediatek.com>
> > +  - Jianjun Wang <jianjun.wang@mediatek.com>
> > +
> > +description: |
> > +  The MediaTek PCIECFG controller controls some feature about
> > +  LTSSM, ASPM and so on.
> > +
> > +properties:
> > +  compatible:
> > +      items:
> > +        - enum:
> > +            - mediatek,generic-pciecfg
> > +        - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pciecfg: pciecfg@1a140000 {
> > +        compatible = "mediatek,generic-pciecfg", "syscon";
> > +        reg = <0x1a140000 0x1000>;
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> > index 7468d666763a..c14a2745de37 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> > @@ -8,7 +8,7 @@ Required properties:
> >  	"mediatek,mt7623-pcie"
> >  	"mediatek,mt7629-pcie"
> >  - device_type: Must be "pci"
> > -- reg: Base addresses and lengths of the PCIe subsys and root ports.
> > +- reg: Base addresses and lengths of the root ports.
> >  - reg-names: Names of the above areas to use during resource lookup.
> >  - #address-cells: Address representation for root ports (must be 3)
> >  - #size-cells: Size representation for root ports (must be 2)
> > @@ -143,56 +143,71 @@ Examples for MT7623:
> >  
> >  Examples for MT2712:
> >  
> > -	pcie: pcie@11700000 {
> > +	pcie1: pcie@112ff000 {
> >  		compatible = "mediatek,mt2712-pcie";
> >  		device_type = "pci";
> > -		reg = <0 0x11700000 0 0x1000>,
> > -		      <0 0x112ff000 0 0x1000>;
> > -		reg-names = "port0", "port1";
> > +		reg = <0 0x112ff000 0 0x1000>;
> > +		reg-names = "port1";
> >  		#address-cells = <3>;
> >  		#size-cells = <2>;
> > -		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
> > -			 <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
> > -			 <&pericfg CLK_PERI_PCIE0>,
> > +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-names = "pcie_irq";
> > +		clocks = <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
> >  			 <&pericfg CLK_PERI_PCIE1>;
> > -		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1";
> > -		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
> > -		phy-names = "pcie-phy0", "pcie-phy1";
> > +		clock-names = "sys_ck1", "ahb_ck1";
> > +		phys = <&u3port1 PHY_TYPE_PCIE>;
> > +		phy-names = "pcie-phy1";
> >  		bus-range = <0x00 0xff>;
> > -		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
> > +		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
> >  
> > -		pcie0: pcie@0,0 {
> > -			reg = <0x0000 0 0 0 0>;
> > +		slot1: pcie@1,0 {
> > +			reg = <0x0800 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> >  			#interrupt-cells = <1>;
> >  			ranges;
> >  			interrupt-map-mask = <0 0 0 7>;
> > -			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> > -					<0 0 0 2 &pcie_intc0 1>,
> > -					<0 0 0 3 &pcie_intc0 2>,
> > -					<0 0 0 4 &pcie_intc0 3>;
> > -			pcie_intc0: interrupt-controller {
> > +			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> > +					<0 0 0 2 &pcie_intc1 1>,
> > +					<0 0 0 3 &pcie_intc1 2>,
> > +					<0 0 0 4 &pcie_intc1 3>;
> > +			pcie_intc1: interrupt-controller {
> >  				interrupt-controller;
> >  				#address-cells = <0>;
> >  				#interrupt-cells = <1>;
> >  			};
> >  		};
> > +	};
> >  
> > -		pcie1: pcie@1,0 {
> > -			reg = <0x0800 0 0 0 0>;
> > +	pcie0: pcie@11700000 {
> > +		compatible = "mediatek,mt2712-pcie";
> > +		device_type = "pci";
> > +		reg = <0 0x11700000 0 0x1000>;
> > +		reg-names = "port0";
> > +		#address-cells = <3>;
> > +		#size-cells = <2>;
> > +		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-names = "pcie_irq";
> > +		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
> > +			 <&pericfg CLK_PERI_PCIE0>;
> > +		clock-names = "sys_ck0", "ahb_ck0";
> > +		phys = <&u3port0 PHY_TYPE_PCIE>;
> > +		phy-names = "pcie-phy0";
> > +		bus-range = <0x00 0xff>;
> > +		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
> > +
> > +		slot0: pcie@0,0 {
> > +			reg = <0x0000 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> >  			#interrupt-cells = <1>;
> >  			ranges;
> >  			interrupt-map-mask = <0 0 0 7>;
> > -			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> > -					<0 0 0 2 &pcie_intc1 1>,
> > -					<0 0 0 3 &pcie_intc1 2>,
> > -					<0 0 0 4 &pcie_intc1 3>;
> > -			pcie_intc1: interrupt-controller {
> > +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> > +					<0 0 0 2 &pcie_intc0 1>,
> > +					<0 0 0 3 &pcie_intc0 2>,
> > +					<0 0 0 4 &pcie_intc0 3>;
> > +			pcie_intc0: interrupt-controller {
> >  				interrupt-controller;
> >  				#address-cells = <0>;
> >  				#interrupt-cells = <1>;
> > @@ -202,39 +217,29 @@ Examples for MT2712:
> >  
> >  Examples for MT7622:
> >  
> > -	pcie: pcie@1a140000 {
> > +	pcie0: pcie@1a143000 {
> >  		compatible = "mediatek,mt7622-pcie";
> >  		device_type = "pci";
> > -		reg = <0 0x1a140000 0 0x1000>,
> > -		      <0 0x1a143000 0 0x1000>,
> > -		      <0 0x1a145000 0 0x1000>;
> > -		reg-names = "subsys", "port0", "port1";
> > +		reg = <0 0x1a143000 0 0x1000>;
> > +		reg-names = "port0";
> >  		#address-cells = <3>;
> >  		#size-cells = <2>;
> > -		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>,
> > -			     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-names = "pcie_irq";
> >  		clocks = <&pciesys CLK_PCIE_P0_MAC_EN>,
> > -			 <&pciesys CLK_PCIE_P1_MAC_EN>,
> >  			 <&pciesys CLK_PCIE_P0_AHB_EN>,
> > -			 <&pciesys CLK_PCIE_P1_AHB_EN>,
> >  			 <&pciesys CLK_PCIE_P0_AUX_EN>,
> > -			 <&pciesys CLK_PCIE_P1_AUX_EN>,
> >  			 <&pciesys CLK_PCIE_P0_AXI_EN>,
> > -			 <&pciesys CLK_PCIE_P1_AXI_EN>,
> >  			 <&pciesys CLK_PCIE_P0_OBFF_EN>,
> > -			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
> > -			 <&pciesys CLK_PCIE_P0_PIPE_EN>,
> > -			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
> > -		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1",
> > -			      "aux_ck0", "aux_ck1", "axi_ck0", "axi_ck1",
> > -			      "obff_ck0", "obff_ck1", "pipe_ck0", "pipe_ck1";
> > -		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
> > -		phy-names = "pcie-phy0", "pcie-phy1";
> > +			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
> > +		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
> > +			      "axi_ck0", "obff_ck0", "pipe_ck0";
> > +
> >  		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
> >  		bus-range = <0x00 0xff>;
> > -		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
> > +		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
> >  
> > -		pcie0: pcie@0,0 {
> > +		slot0: pcie@0,0 {
> >  			reg = <0x0000 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> > @@ -251,8 +256,32 @@ Examples for MT7622:
> >  				#interrupt-cells = <1>;
> >  			};
> >  		};
> > +	};
> > +
> > +	pcie1: pcie@1a145000 {
> > +		compatible = "mediatek,mt7622-pcie";
> > +		device_type = "pci";
> > +		reg = <0 0x1a145000 0 0x1000>;
> > +		reg-names = "port1";
> > +		#address-cells = <3>;
> > +		#size-cells = <2>;
> > +		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-names = "pcie_irq";
> > +		clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
> > +			 /* designer has connect RC1 with p0_ahb clock */
> > +			 <&pciesys CLK_PCIE_P0_AHB_EN>,
> > +			 <&pciesys CLK_PCIE_P1_AUX_EN>,
> > +			 <&pciesys CLK_PCIE_P1_AXI_EN>,
> > +			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
> > +			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
> > +		clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
> > +			      "axi_ck1", "obff_ck1", "pipe_ck1";
> > +
> > +		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
> > +		bus-range = <0x00 0xff>;
> > +		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
> >  
> > -		pcie1: pcie@1,0 {
> > +		slot1: pcie@1,0 {
> >  			reg = <0x0800 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> > -- 
> > 2.18.0
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
