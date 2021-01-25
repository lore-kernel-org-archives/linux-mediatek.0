Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F40C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 20:22:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2EEA2255F
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 20:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2EEA2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dLOv9+AhXakr4LFRLpe3Kg/ChzXhJOR7/O6MxPIDf0A=; b=E1g9pXNrdXN0COOq7n914UuiE
	zMnX9sj0SSppLgYzosRdGPaEfnbD1Wj/wcB67zoCUvTcXhZKwAOJMOoIGB1uA80PVj69exnXKgKv9
	sxIQPJX5hWxuZO+5BYPPM+pHUoNV1zgu8HaYPXqzWd90cBUt7Bu2YaW+PHzmRg/h/TLqfl5SWV/51
	0ZlX83n+3gEDfq6jSgq1kaBxYNW6x8hNzOoD5ww+N2xvo8SKzaqIvTsA3CDhJVUNX9I1bsFmsdQXx
	ezdH1ETAS2Gh3Nhryggs5k2eDAbK9qq/wTKDfD/3DGtOInub56Nh1l3iHqNeX2n/e1CaUQdvWz9Au
	XgRnYI6yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l48NX-00020B-D0; Mon, 25 Jan 2021 20:22:27 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l48NV-0001zU-2d; Mon, 25 Jan 2021 20:22:26 +0000
Received: by mail-oi1-f180.google.com with SMTP id j25so10740514oii.0;
 Mon, 25 Jan 2021 12:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=flH03nsBpe00qQdsxJOcf2ps7GrLZPGe76i1E36MC1w=;
 b=AOvmJzIIMsKWbEU2qCt05FN3C5mtKwCNOHh5n49cjq1sBqg/J8r35EMA/QZhbTE5uV
 s2ZtNaGhUT4eKZuWAegpxqXc7jRnY+VkI9zFOqJkAFK6/5jL/Jr3qWzjKJ4BM7ACtMwE
 z23D9YsMxfy2MqELYfIIf5j+89TnlmiY76HDDAlBeVUbcn0paJiyCHOYLOgr25drYqbm
 /7U1VZwv0aQLOrcCzdiyHGiAFdJlKusSqLOAFoTm1fC6hsm5jN2BgCPIh/VELKiFf3oq
 JpaBRNRhgXbWIyTAN1ZaO8UNxUXqlT3K6lGgPZ8y1KmuRufSfkTE3rMEslRH88guDhPm
 OHgA==
X-Gm-Message-State: AOAM531OSGVtl2u6AeIwfm1CmmFRcx61zyIvDMPmoGUtjZWN+/rzHauS
 g+aeiJKfB5xlSpMEPTpmeQ==
X-Google-Smtp-Source: ABdhPJw8JJtpG3VCKMiMILQJceIiVEob/sgewfQC9q50O2WEX+Mur0PRRcu7fqAgtWlD3ee1xKkv4Q==
X-Received: by 2002:aca:c48b:: with SMTP id u133mr1195539oif.105.1611606143985; 
 Mon, 25 Jan 2021 12:22:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l5sm3761987oth.41.2021.01.25.12.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:22:22 -0800 (PST)
Received: (nullmailer pid 912195 invoked by uid 1000);
 Mon, 25 Jan 2021 20:22:20 -0000
Date: Mon, 25 Jan 2021 14:22:20 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v7,1/7] dt-bindings: PCI: mediatek-gen3: Add YAML schema
Message-ID: <20210125202220.GA905995@robh.at.kernel.org>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
 <20210113114001.5804-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113114001.5804-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_152225_139795_D7E5FFED 
X-CRM114-Status: GOOD (  22.04  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, linux-kernel@vger.kernel.org, anson.chuang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 07:39:55PM +0800, Jianjun Wang wrote:
> Add YAML schemas documentation for Gen3 PCIe controller on
> MediaTek SoCs.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> new file mode 100644
> index 000000000000..f133fb0184f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Gen3 PCIe controller on MediaTek SoCs
> +
> +maintainers:
> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> +
> +description: |+
> +  PCIe Gen3 MAC controller for MediaTek SoCs, it supports Gen3 speed
> +  and compatible with Gen2, Gen1 speed.
> +
> +  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
> +  block diagram is as follows:
> +
> +                    +-----+
> +                    | GIC |
> +                    +-----+
> +                       ^
> +                       |
> +                   port->irq
> +                       |
> +               +-+-+-+-+-+-+-+-+
> +               |0|1|2|3|4|5|6|7| (PCIe intc)
> +               +-+-+-+-+-+-+-+-+
> +                ^ ^           ^
> +                | |    ...    |
> +        +-------+ +------+    +-----------+
> +        |                |                |
> +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> +  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
> +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> +   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> +   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
> +   | |      |  |    | |      |  |    | |      |  |
> +
> +    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> +
> +  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
> +  each set has its own address for MSI message, and supports 32 MSI vectors
> +  to generate interrupt.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8192-pcie
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 1
> +    maxItems: 8
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2

Why the range? The SoC either has the reset lines or it doesn't.

> +
> +  reset-names:
> +    anyOf:
> +      - const: mac
> +      - const: phy

I don't think this should stay, but if so, better expressed like this:

minItems: 1
maxItems: 2
items:
  enum: [ mac, phy ]


> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: pl_250m
> +      - const: tl_26m
> +      - const: tl_96m
> +      - const: tl_32k
> +      - const: peri_26m
> +      - const: top_133m
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupt-controller:
> +    description: Interrupt controller node for handling legacy PCI interrupts.
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 0
> +      '#interrupt-cells':
> +        const: 1
> +      interrupt-controller: true
> +
> +    required:
> +      - '#address-cells'
> +      - '#interrupt-cells'
> +      - interrupt-controller
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ranges
> +  - clocks
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie: pcie@11230000 {
> +            compatible = "mediatek,mt8192-pcie";
> +            device_type = "pci";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            reg = <0x00 0x11230000 0x00 0x4000>;
> +            reg-names = "pcie-mac";

Not documented. Drop.

> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +            bus-range = <0x00 0xff>;
> +            ranges = <0x82000000 0x00 0x12000000 0x00
> +                      0x12000000 0x00 0x1000000>;
> +            clocks = <&infracfg 44>,
> +                     <&infracfg 40>,
> +                     <&infracfg 43>,
> +                     <&infracfg 97>,
> +                     <&infracfg 99>,
> +                     <&infracfg 111>;
> +            clock-names = "pl_250m", "tl_26m", "tl_96m",
> +                          "tl_32k", "peri_26m", "top_133m";
> +            assigned-clocks = <&topckgen 50>;
> +            assigned-clock-parents = <&topckgen 91>;
> +
> +            phys = <&pciephy>;
> +            phy-names = "pcie-phy";
> +            resets = <&infracfg_rst 0>;
> +            reset-names = "phy";
> +
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0x7>;
> +            interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +                            <0 0 0 2 &pcie_intc 1>,
> +                            <0 0 0 3 &pcie_intc 2>,
> +                            <0 0 0 4 &pcie_intc 3>;
> +            pcie_intc: interrupt-controller {
> +                      #address-cells = <0>;
> +                      #interrupt-cells = <1>;
> +                      interrupt-controller;
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
