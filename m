Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B0C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 16:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EF122268
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 16:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vl9m/CbJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hECM/ObL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EF122268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLy4BEOqlLfm6UcBHIdX6+awdpYxvkpM06tXIipcvZM=; b=vl9m/CbJQZXHJZnEwCO+JVv/C
	FOffX+yy7fJr3jPCLnOPQQFZqBTqCfV4Zat+7aooaXIO0JmlkdVULvT4tGBbK3+lGHQ0IPyaEWatK
	FZx4dSf+bIF15H69XwumCQS9GGTe4YBcBs+5M2H3oLuE12HIXax8BklQilZmEUh6l8QpgKh0aN39h
	R2N0UywLCJUBWdJ6PeR2yKW+zkXYISHaWcNzM52uwqwWNdPN4TdqdN2h9EpsKmrGByRVVfTpJ56/k
	p10VZkLRJ9MLwHhfkQQADBudYjCknN0TwYRgnb6tdCEtKMRY9rUTutR2qZwV4a1DO+T7XciHhj7z9
	bfTiGl/Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZcv2-0005Vt-Qj; Mon, 02 Nov 2020 16:42:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZctp-0004qZ-Gk; Mon, 02 Nov 2020 16:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BO7O+YN2tlCKdU4I/z4UPEv+3qihFtAtK3mMGXYcXO4=; b=hECM/ObLDA1cDg0NzP2pqhHkNe
 Wa1gbcVXdMOQHd5eNcPWq4iXuLXqlGxwpOb5hDroxD+2ca+8oyeOLHnUhoL2z3ahv3jLlTolHY+ts
 ZWd8q5ahN8Ak+S5vbz87iyiLOX79AC6iLr+JMSXGBdiqzXrcz9M9KojCx1WG+gF2QSJqRFl1J6Umc
 PljrwAkbJMPXkVwPcjpUDG7GcpRZEGIiErtf/ARgcqjLQtun6+8AmiZItdqJ82Pt4bu6uJctMSHpg
 USSgL4qwAHLVtD8woC8BhGJhTcDrsnd9Yrx/wijJeM676nR5tnSbh8f5X7H6o0Ip8AEm8QAyM5wJa
 DEQzEJag==;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZcYW-0005AM-HE; Mon, 02 Nov 2020 16:19:43 +0000
Received: by mail-ot1-f67.google.com with SMTP id n15so13093347otl.8;
 Mon, 02 Nov 2020 08:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BO7O+YN2tlCKdU4I/z4UPEv+3qihFtAtK3mMGXYcXO4=;
 b=me7NqfcV/H7OLNprcrt3A4zXLwQBa2l3Aa+trDhQIaaKdvQJoSizjNu9focEraB3YY
 JA4ZriJ0BLJXxGygT422e3qNSlPE/vPD1ctZvGi+Lb4gJWTYcf/QlX8rxH5OmUj70d+k
 qcAlV/1Ni8YSggWxVzvqL/1SZIRji7gDoPaFkU18KghqKmoel+Iq6ppIInn+UCyrnHkp
 SeWPYBRiJNdtC+oB3To+ayOxTgGo2LpOywJeriiMXtxEitgZGUr/3tY9YGGPR/X1TPDz
 /qoP+IcL1Pyjio8/LaZ2YNPyxXfPu6AgcUkPrZRD6f58ZF9y12fGMQ9T1dZbpg8k8gR7
 pzdw==
X-Gm-Message-State: AOAM532g0jfT9Jt76ITKaYQSG3uNDrHzZxu5S73kreIUozAslXzJw+03
 nIvSnUPj+YPrUDfY3YNi2Q==
X-Google-Smtp-Source: ABdhPJyR1X6GeJm+dCYy15tJ273TNlzVEyQm04Jgu9YdIUpqv/a6WrGerM/SK+srBl/K367/4mOVeg==
X-Received: by 2002:a05:6830:1e70:: with SMTP id
 m16mr12295679otr.51.1604333972544; 
 Mon, 02 Nov 2020 08:19:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k15sm3470621oor.11.2020.11.02.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:19:31 -0800 (PST)
Received: (nullmailer pid 3991041 invoked by uid 1000);
 Mon, 02 Nov 2020 16:19:31 -0000
Date: Mon, 2 Nov 2020 10:19:31 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
Message-ID: <20201102161931.GA3985668@bogus>
References: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
 <20201029081513.10562-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029081513.10562-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_161940_901228_870F83F3 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, Oct 29, 2020 at 04:15:10PM +0800, Chuanjia Liu wrote:
> Split the PCIe node and add pciecfg node to fix MSI issue.

I still think if you are changing the binding this much, then further 
work should be done removing the slot nodes.

> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 129 +++++++++++-------
>  2 files changed, 118 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> new file mode 100644
> index 000000000000..d3ecbcd032a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> @@ -0,0 +1,39 @@
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pciecfg: pciecfg@1a140000 {
> +        compatible = "mediatek,generic-pciecfg", "syscon";
> +        reg = <0x1a140000 0x1000>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> index 7468d666763a..c14a2745de37 100644
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
> @@ -143,56 +143,71 @@ Examples for MT7623:
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
>  
> -		pcie0: pcie@0,0 {
> -			reg = <0x0000 0 0 0 0>;
> +		slot1: pcie@1,0 {

Does the driver still work if this is devfn 0 instead of 1 (or swap 0 
and 1 slots)? I'll bet it does. 

The reason being is that AFAICT, the Mediatek PCI controller is 
Designware based. The registers at 0x70c and 0x73c are DWC 'port logic' 
registers. The DWC RC also has a quirk that it doesn't filter config 
accesses to only devfn 0 (see pci_dw_valid_device()), so your config 
accesses to the RP should work no matter what devfn you use. You'll have 
to get rid of the ports list and just get the mtk_pcie_port from 
bus->sysdata instead.

Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
