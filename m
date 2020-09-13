Return-Path: <SRS0=V4X5=CW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC0C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 03:06:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D68C320709
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 03:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EAUVYVz9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e9Zf+NBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68C320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yz4Re4F6FS6DyU+cplNhDL6woOnrxks5zRVpZEIX7FU=; b=EAUVYVz9Ei83RfGvbMC3CD80g
	fiEmbPH0tW3aLsKUFKBqOVRH1efAQfz1QtR52UeCSnvLYIntu/43KRqMYhz3OTNP/26f4u9RGhQiW
	npEclk+v+oJ03PbJDZEchSsNTEnHsc9SGZ+EQusyhTtbvI9U95tpuobuJmXlPbnsnyJKhsgZ6SeSd
	KSact1xsnOv4v47J8TZB26LC6wssc20dcqeQwKGqhzcBn1kG2thoX9E//cCMeSiB0a1zqsyYh+IRD
	nbjVSC+S9qWavprGbztcMw7hJkYo6XcyC6o0JlUS0xnNI1KD0QYs0k3t9GUovUhZWQudi65NZWGEN
	i6Pafs3bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHILm-0006cH-SJ; Sun, 13 Sep 2020 03:06:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHILj-0006be-8S; Sun, 13 Sep 2020 03:06:45 +0000
X-UUID: e23fe1e1238246fbb1b7e7a4130c14e0-20200912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NwIK9pmWDw8n2NhaZLDMiaMs84qVaaRjufGgH4tn2mU=; 
 b=e9Zf+NBq3/cLU+mpdQTwGmm3jtD3AHFd6xsLkTymLHeWrA6zM3HJVSWRaVq4+pWN+PCGmC2PuWchK+CtaimDYTuu8DrufLX0Pdpc/EilS1w615JwoZVUD1Rg2Ggzvh/s5HMlRmfgvj6WVjryKDjEjKQPgV7O2AD8WBRPlCXoduU=;
X-UUID: e23fe1e1238246fbb1b7e7a4130c14e0-20200912
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 12018367; Sat, 12 Sep 2020 19:06:41 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Sep 2020 19:56:38 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Sep 2020 10:56:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Sep 2020 10:56:37 +0800
Message-ID: <1599965676.7466.35.camel@mhfsdcap03>
Subject: Re: [PATCH v5 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sun, 13 Sep 2020 10:54:36 +0800
In-Reply-To: <20200911225024.GB2960430@bogus>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
 <20200910061115.909-2-chuanjia.liu@mediatek.com>
 <20200911225024.GB2960430@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCBCCB16731868D242FD5AA8DF4E970B1DADE979873D0CDC402F740BDDA4B1C82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_230643_562323_BBD8893B 
X-CRM114-Status: GOOD (  26.26  )
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
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 16:50 -0600, Rob Herring wrote:
> On Thu, Sep 10, 2020 at 02:11:12PM +0800, Chuanjia Liu wrote:
> > Split the PCIe node and add pciecfg node to fix MSI issue.
> > 
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  38 +++++
> >  .../devicetree/bindings/pci/mediatek-pcie.txt | 144 +++++++++++-------
> >  2 files changed, 129 insertions(+), 53 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > new file mode 100644
> > index 000000000000..4d2835ab4858
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > @@ -0,0 +1,38 @@
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
> > +            - mediatek,mt7622-pciecfg
> > +            - mediatek,mt7629-pciecfg
> > +        - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    pciecfg: pciecfg@1a140000 {
> > +        compatible = "mediatek,mt7622-pciecfg", "syscon";
> > +        reg = <0 0x1a140000 0 0x1000>;
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> > index 7468d666763a..31e261933685 100644
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
> > @@ -19,10 +19,10 @@ Required properties:
> >     - sys_ckN :transaction layer and data link layer clock
> >    Required entries for MT2701/MT7623:
> >     - free_ck :for reference clock of PCIe subsys
> > -  Required entries for MT2712/MT7622:
> > +  Required entries for MT2712/MT7622/MT7629:
> >     - ahb_ckN :AHB slave interface operating clock for CSR access and RC
> >  	      initiated MMIO access
> > -  Required entries for MT7622:
> > +  Required entries for MT7622/MT7629:
> >     - axi_ckN :application layer MMIO channel operating clock
> >     - aux_ckN :pe2_mac_bridge and pe2_mac_core operating clock when
> >  	      pcie_mac_ck/pcie_pipe_ck is turned off
> > @@ -47,10 +47,13 @@ Required properties for MT7623/MT2701:
> >  - reset-names: Must be "pcie-rst0", "pcie-rst1", "pcie-rstN".. based on the
> >    number of root ports.
> >  
> > -Required properties for MT2712/MT7622:
> > +Required properties for MT2712/MT7622/MT7629:
> >  -interrupts: A list of interrupt outputs of the controller, must have one
> >  	     entry for each PCIe port
> >  
> > +Required properties for MT7622/MT7629:
> > +- mediatek,pcie-subsys: Should be a phandle of the pciecfg node.
> > +
> 
> You don't need this. You can search for the node by compatible.
> 
> Plus it doesn't match the example.

Thanks for you comment, I will change it in the next version.

regards,
Chuanjia
> 
> >  In addition, the device tree node must have sub-nodes describing each
> >  PCIe port interface, having the following mandatory properties:
> >  
> > @@ -143,56 +146,73 @@ Examples for MT7623:
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
> > +		status = "disabled";
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
> > +		status = "disabled";
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
> > @@ -202,39 +222,31 @@ Examples for MT2712:
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
> > +		mediatek,pcie-cfg = <&pciecfg>;
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
> > +		status = "disabled";
> >  
> > -		pcie0: pcie@0,0 {
> > +		slot0: pcie@0,0 {
> >  			reg = <0x0000 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> > @@ -251,8 +263,34 @@ Examples for MT7622:
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
> > +		mediatek,pcie-cfg = <&pciecfg>;
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
> > +		status = "disabled";
> >  
> > -		pcie1: pcie@1,0 {
> > +		slot1: pcie@1,0 {
> >  			reg = <0x0800 0 0 0 0>;
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
