Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09210C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:32:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845E422206
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="deAjIWlT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 845E422206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUpDrXccZGK0dvMKC4WGMFfcpLr5pnCScVQ73GkSN+U=; b=deAjIWlTPVjyDwAlhDKQze7VA
	IgNoBnyosOELXePAfCXHvUZOn+NIkA+l51Nu0bjNw8mkF4NIVNDaqED8szJdSwYcB/gUYKqRCuRbT
	0SmLsUC7ihWu5AoRMncjimq+benE+MZuwQIE5IR2FUQWPXGDSXwQW9qFTFe8+QhPRHLFtidpDD1DD
	1vZPkTw05+W2l7Hb13IaWHXE3sg5fhyAgJnakA7kogqcNmnnGsDr5IrVAEU+MAbMnroOcHyM3RMQs
	SwTTHkPADMFaeqbJsLJN3n4wNy8Fqbf1JMNaQkWxASWzmsYtW98N8ZGJAtjlGdQeqGR7GrHlcv9G6
	WdckF0qxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKrlI-0006HH-5R; Tue, 22 Sep 2020 23:31:52 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKrlF-0006Fy-Lf; Tue, 22 Sep 2020 23:31:50 +0000
Received: by mail-io1-f68.google.com with SMTP id y74so21612755iof.12;
 Tue, 22 Sep 2020 16:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MRz4UUw7dkaI3ZUoYv1R8WPbP9pFD4GFdTxqltkzFqw=;
 b=eL0lmsyqimkwdA6JPcsUrc8KLsfCVKAZ9uVi8Dwa3mxbs6luv6Ub7uI4NSgh3dp1z3
 X/sf7M8O92H9B3bDt8rp7AEME5PkacdY5zFNOnVBQYGIfBTQODgtKlcIfHcLkzmNBDtR
 VeKSHpCp0j9Bxh6vS0uv9pew3pn7EgvPzJxmWVmEnDST/Y7YVbfqtgjZukfjHFBnbht2
 R3hhx9bTNLrdqGm5ATbp+eaGkHD5GimPsh+knr7w/JyitXy1WAZzp7902QgYlXsoesjQ
 cPk96wvEAL2dARMlwb37sl1NstRMQ5K+LSwVOu6JcW/Ok4UfePJvD58x2CebLlNW0p6w
 U2DQ==
X-Gm-Message-State: AOAM5333nzOz5slmW2qD1Ufe/NQmQ313ekbPMIFDdyRownyKtWS7Sq01
 1Hybvg93GzDtEQVkQlqfAA==
X-Google-Smtp-Source: ABdhPJw5g+58NxuvQvLOfMz3ydrfoARA19/bAbIcvGv3P4snMhQUjHUMlpM0r6cDbTyQOcHCXZkoFA==
X-Received: by 2002:a02:c789:: with SMTP id n9mr5936206jao.36.1600817508728;
 Tue, 22 Sep 2020 16:31:48 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m18sm3172106ili.85.2020.09.22.16.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 16:31:48 -0700 (PDT)
Received: (nullmailer pid 3473604 invoked by uid 1000);
 Tue, 22 Sep 2020 23:31:47 -0000
Date: Tue, 22 Sep 2020 17:31:47 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
Message-ID: <20200922233147.GA3448466@bogus>
References: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
 <20200914112659.7091-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914112659.7091-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_193149_715152_0C688F92 
X-CRM114-Status: GOOD (  24.34  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 07:26:56PM +0800, Chuanjia Liu wrote:
> Split the PCIe node and add pciecfg node to fix MSI issue.

What's the MSI issue?

This is not a compatible change. Please explain why that's okay.

> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  37 +++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 139 +++++++++++-------
>  2 files changed, 123 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> new file mode 100644
> index 000000000000..cd72973c99d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/mediatek-pcie-cfg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek PCIECFG controller
> +
> +maintainers:
> +  - Chuanjia Liu <chuanjia.liu@mediatek.com>
> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> +
> +description: |
> +  The MediaTek PCIECFG controller controls some feature about
> +  LTSSM, ASPM and so on.
> +
> +properties:
> +  compatible:
> +      items:
> +        - enum:
> +            - mediatek,generic-pciecfg
> +        - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

additionalProperties: false

> +
> +examples:
> +  - |
> +    pciecfg: pciecfg@1a140000 {
> +        compatible = "mediatek,generic-pciecfg", "syscon";
> +        reg = <0x1a140000 0x1000>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> index 7468d666763a..f849703dfb17 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> @@ -8,7 +8,7 @@ Required properties:
>  	"mediatek,mt7623-pcie"
>  	"mediatek,mt7629-pcie"
>  - device_type: Must be "pci"
> -- reg: Base addresses and lengths of the PCIe subsys and root ports.
> +- reg: Base addresses and lengths of the root ports.
>  - reg-names: Names of the above areas to use during resource lookup.
>  - #address-cells: Address representation for root ports (must be 3)
>  - #size-cells: Size representation for root ports (must be 2)
> @@ -19,10 +19,10 @@ Required properties:
>     - sys_ckN :transaction layer and data link layer clock
>    Required entries for MT2701/MT7623:
>     - free_ck :for reference clock of PCIe subsys
> -  Required entries for MT2712/MT7622:
> +  Required entries for MT2712/MT7622/MT7629:

Seems like a unrelated change.

>     - ahb_ckN :AHB slave interface operating clock for CSR access and RC
>  	      initiated MMIO access
> -  Required entries for MT7622:
> +  Required entries for MT7622/MT7629:
>     - axi_ckN :application layer MMIO channel operating clock
>     - aux_ckN :pe2_mac_bridge and pe2_mac_core operating clock when
>  	      pcie_mac_ck/pcie_pipe_ck is turned off
> @@ -47,7 +47,7 @@ Required properties for MT7623/MT2701:
>  - reset-names: Must be "pcie-rst0", "pcie-rst1", "pcie-rstN".. based on the
>    number of root ports.
>  
> -Required properties for MT2712/MT7622:
> +Required properties for MT2712/MT7622/MT7629:
>  -interrupts: A list of interrupt outputs of the controller, must have one
>  	     entry for each PCIe port
>  
> @@ -143,56 +143,73 @@ Examples for MT7623:
>  
>  Examples for MT2712:
>  
> -	pcie: pcie@11700000 {
> +	pcie1: pcie@112ff000 {
>  		compatible = "mediatek,mt2712-pcie";
>  		device_type = "pci";
> -		reg = <0 0x11700000 0 0x1000>,
> -		      <0 0x112ff000 0 0x1000>;
> -		reg-names = "port0", "port1";
> +		reg = <0 0x112ff000 0 0x1000>;
> +		reg-names = "port1";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
> -		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
> -			 <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
> -			 <&pericfg CLK_PERI_PCIE0>,
> +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "pcie_irq";
> +		clocks = <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
>  			 <&pericfg CLK_PERI_PCIE1>;
> -		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1";
> -		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
> -		phy-names = "pcie-phy0", "pcie-phy1";
> +		clock-names = "sys_ck1", "ahb_ck1";
> +		phys = <&u3port1 PHY_TYPE_PCIE>;
> +		phy-names = "pcie-phy1";
>  		bus-range = <0x00 0xff>;
> -		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
> +		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
> +		status = "disabled";

Don't show status in examples.

>  
> -		pcie0: pcie@0,0 {
> -			reg = <0x0000 0 0 0 0>;
> +		slot1: pcie@1,0 {

Since you are breaking everything, you don't really need these child 
nodes. Just move interrupt-map and interrupt-controller up to the parent 
like other PCI host bindings.

> +			reg = <0x0800 0 0 0 0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			#interrupt-cells = <1>;
>  			ranges;
>  			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> -					<0 0 0 2 &pcie_intc0 1>,
> -					<0 0 0 3 &pcie_intc0 2>,
> -					<0 0 0 4 &pcie_intc0 3>;
> -			pcie_intc0: interrupt-controller {
> +			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> +					<0 0 0 2 &pcie_intc1 1>,
> +					<0 0 0 3 &pcie_intc1 2>,
> +					<0 0 0 4 &pcie_intc1 3>;
> +			pcie_intc1: interrupt-controller {
>  				interrupt-controller;
>  				#address-cells = <0>;
>  				#interrupt-cells = <1>;
>  			};
>  		};
> +	};
>  
> -		pcie1: pcie@1,0 {
> -			reg = <0x0800 0 0 0 0>;
> +	pcie0: pcie@11700000 {
> +		compatible = "mediatek,mt2712-pcie";
> +		device_type = "pci";
> +		reg = <0 0x11700000 0 0x1000>;
> +		reg-names = "port0";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "pcie_irq";
> +		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
> +			 <&pericfg CLK_PERI_PCIE0>;
> +		clock-names = "sys_ck0", "ahb_ck0";
> +		phys = <&u3port0 PHY_TYPE_PCIE>;
> +		phy-names = "pcie-phy0";
> +		bus-range = <0x00 0xff>;
> +		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
> +		status = "disabled";
> +
> +		slot0: pcie@0,0 {
> +			reg = <0x0000 0 0 0 0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			#interrupt-cells = <1>;
>  			ranges;
>  			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> -					<0 0 0 2 &pcie_intc1 1>,
> -					<0 0 0 3 &pcie_intc1 2>,
> -					<0 0 0 4 &pcie_intc1 3>;
> -			pcie_intc1: interrupt-controller {
> +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +					<0 0 0 2 &pcie_intc0 1>,
> +					<0 0 0 3 &pcie_intc0 2>,
> +					<0 0 0 4 &pcie_intc0 3>;
> +			pcie_intc0: interrupt-controller {
>  				interrupt-controller;
>  				#address-cells = <0>;
>  				#interrupt-cells = <1>;
> @@ -202,39 +219,30 @@ Examples for MT2712:
>  
>  Examples for MT7622:
>  
> -	pcie: pcie@1a140000 {
> +	pcie0: pcie@1a143000 {
>  		compatible = "mediatek,mt7622-pcie";
>  		device_type = "pci";
> -		reg = <0 0x1a140000 0 0x1000>,
> -		      <0 0x1a143000 0 0x1000>,
> -		      <0 0x1a145000 0 0x1000>;
> -		reg-names = "subsys", "port0", "port1";
> +		reg = <0 0x1a143000 0 0x1000>;
> +		reg-names = "port0";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
> -		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "pcie_irq";
>  		clocks = <&pciesys CLK_PCIE_P0_MAC_EN>,
> -			 <&pciesys CLK_PCIE_P1_MAC_EN>,
>  			 <&pciesys CLK_PCIE_P0_AHB_EN>,
> -			 <&pciesys CLK_PCIE_P1_AHB_EN>,
>  			 <&pciesys CLK_PCIE_P0_AUX_EN>,
> -			 <&pciesys CLK_PCIE_P1_AUX_EN>,
>  			 <&pciesys CLK_PCIE_P0_AXI_EN>,
> -			 <&pciesys CLK_PCIE_P1_AXI_EN>,
>  			 <&pciesys CLK_PCIE_P0_OBFF_EN>,
> -			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
> -			 <&pciesys CLK_PCIE_P0_PIPE_EN>,
> -			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
> -		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1",
> -			      "aux_ck0", "aux_ck1", "axi_ck0", "axi_ck1",
> -			      "obff_ck0", "obff_ck1", "pipe_ck0", "pipe_ck1";
> -		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
> -		phy-names = "pcie-phy0", "pcie-phy1";
> +			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
> +		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
> +			      "axi_ck0", "obff_ck0", "pipe_ck0";
> +
>  		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
>  		bus-range = <0x00 0xff>;
> -		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
> +		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
> +		status = "disabled";
>  
> -		pcie0: pcie@0,0 {
> +		slot0: pcie@0,0 {
>  			reg = <0x0000 0 0 0 0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> @@ -251,8 +259,33 @@ Examples for MT7622:
>  				#interrupt-cells = <1>;
>  			};
>  		};
> +	};
> +
> +	pcie1: pcie@1a145000 {
> +		compatible = "mediatek,mt7622-pcie";
> +		device_type = "pci";
> +		reg = <0 0x1a145000 0 0x1000>;
> +		reg-names = "port1";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "pcie_irq";
> +		clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
> +			 /* designer has connect RC1 with p0_ahb clock */
> +			 <&pciesys CLK_PCIE_P0_AHB_EN>,
> +			 <&pciesys CLK_PCIE_P1_AUX_EN>,
> +			 <&pciesys CLK_PCIE_P1_AXI_EN>,
> +			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
> +			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
> +		clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
> +			      "axi_ck1", "obff_ck1", "pipe_ck1";
> +
> +		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
> +		bus-range = <0x00 0xff>;
> +		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
> +		status = "disabled";
>  
> -		pcie1: pcie@1,0 {
> +		slot1: pcie@1,0 {
>  			reg = <0x0800 0 0 0 0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
