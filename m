Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C09C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 12:01:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEDB2311C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 12:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEDB2311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KzfXNOWc+TASI6WDCHqKaSFoqTeYK4ykK342r83JOl4=; b=jJsL5MePmTxfvG3PQJfI8F6mu
	RHt9IALlKM5APYBev+r0G0/m0SH9tyXvNEXsTYvltG0Ngfc4VD4OPZY97S/cEU+ZCT3Gtun3/Dbc8
	9YrKtnW0JWfKuWgdymhIBLQZlOQMNryPvpX4qJQuEGUvw9whJHI7Xro21xUPYC9fDzFm99PgKR79y
	mAkAFSHpFbQ7dwsa4/+i6LqUaR85GO751DA1j+oTq6RszvEb05nL9CgnIkHlLCCue0pGyUbuYUhD4
	XKPAAPlxP6Fc/PgvFmV+ks68yGFGe0OA10C5uuDCU3E+5grU4tbz1ugiKfEytwU0hhKcFZnlpQzOi
	4i4BZ9YKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4N22-0002J2-FB; Tue, 26 Jan 2021 12:01:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4N1z-0002IR-3K; Tue, 26 Jan 2021 12:01:12 +0000
X-UUID: 3595520803f4494ebee13858c8342fcd-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oAYBDnd46n/nrsFHoThyvhzrrUWPsLR/Mvddequ82jM=; 
 b=IRyUMiZzSSbD8Gy5yyV+3fDyCqN1oCz8Q3WYXKvWdlhXcS+KwLnRS9eQUBkUbKGzdS6qy4ucLS3wt3WnZgSDrDnfk+ctFr2B0qXZ+wAbFJ+fjx7hZ8HGmmSMYyAQ0xJu5wP/jL1Z96NGIO62CejeUxl6cMIo4p3yIrQatRVHXc4=;
X-UUID: 3595520803f4494ebee13858c8342fcd-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1572407186; Tue, 26 Jan 2021 04:01:09 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 04:01:07 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Jan 2021 20:01:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 20:01:01 +0800
Message-ID: <1611662461.14672.22.camel@mhfsdcap03>
Subject: Re: [v7,1/7] dt-bindings: PCI: mediatek-gen3: Add YAML schema
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 26 Jan 2021 20:01:01 +0800
In-Reply-To: <20210125202220.GA905995@robh.at.kernel.org>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
 <20210113114001.5804-2-jianjun.wang@mediatek.com>
 <20210125202220.GA905995@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F1DA409755172DE8362284DDADA00A7EBF387AB58BF3F0CEECE433EDDC46C67A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_070111_347310_78AF15C9 
X-CRM114-Status: GOOD (  27.08  )
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, maz@kernel.org, linux-kernel@vger.kernel.org,
 anson.chuang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, Sj
 Huang <sj.huang@mediatek.com>, drinkcat@chromium.org,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Rex-BC.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, sin_jieyang@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-25 at 14:22 -0600, Rob Herring wrote:
> On Wed, Jan 13, 2021 at 07:39:55PM +0800, Jianjun Wang wrote:
> > Add YAML schemas documentation for Gen3 PCIe controller on
> > MediaTek SoCs.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 172 ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > new file mode 100644
> > index 000000000000..f133fb0184f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Gen3 PCIe controller on MediaTek SoCs
> > +
> > +maintainers:
> > +  - Jianjun Wang <jianjun.wang@mediatek.com>
> > +
> > +description: |+
> > +  PCIe Gen3 MAC controller for MediaTek SoCs, it supports Gen3 speed
> > +  and compatible with Gen2, Gen1 speed.
> > +
> > +  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
> > +  block diagram is as follows:
> > +
> > +                    +-----+
> > +                    | GIC |
> > +                    +-----+
> > +                       ^
> > +                       |
> > +                   port->irq
> > +                       |
> > +               +-+-+-+-+-+-+-+-+
> > +               |0|1|2|3|4|5|6|7| (PCIe intc)
> > +               +-+-+-+-+-+-+-+-+
> > +                ^ ^           ^
> > +                | |    ...    |
> > +        +-------+ +------+    +-----------+
> > +        |                |                |
> > +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> > +  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
> > +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> > +   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> > +   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
> > +   | |      |  |    | |      |  |    | |      |  |
> > +
> > +    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> > +
> > +  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
> > +  each set has its own address for MSI message, and supports 32 MSI vectors
> > +  to generate interrupt.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-bus.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8192-pcie
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 8
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> 
> Why the range? The SoC either has the reset lines or it doesn't.
> 
> > +
> > +  reset-names:
> > +    anyOf:
> > +      - const: mac
> > +      - const: phy
> 
> I don't think this should stay, but if so, better expressed like this:
> 
> minItems: 1
> maxItems: 2
> items:
>   enum: [ mac, phy ]

Hi Rob,

Thanks for your review, does this means that I should merge the resets
and reset-names together as the following property?

resets:
  minItems: 1
  maxItems: 2
  items:
    enum: [ mac, phy ]
> 
> 
> > +
> > +  clocks:
> > +    maxItems: 6
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pl_250m
> > +      - const: tl_26m
> > +      - const: tl_96m
> > +      - const: tl_32k
> > +      - const: peri_26m
> > +      - const: top_133m
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-parents:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  interrupt-controller:
> > +    description: Interrupt controller node for handling legacy PCI interrupts.
> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 0
> > +      '#interrupt-cells':
> > +        const: 1
> > +      interrupt-controller: true
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#interrupt-cells'
> > +      - interrupt-controller
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ranges
> > +  - clocks
> > +  - '#interrupt-cells'
> > +  - interrupt-controller
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        pcie: pcie@11230000 {
> > +            compatible = "mediatek,mt8192-pcie";
> > +            device_type = "pci";
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +            reg = <0x00 0x11230000 0x00 0x4000>;
> > +            reg-names = "pcie-mac";
> 
> Not documented. Drop.
I will add the property information for reg-names in the next version,
it's used by controller driver to get the register resource.

Thanks.
> 
> > +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            bus-range = <0x00 0xff>;
> > +            ranges = <0x82000000 0x00 0x12000000 0x00
> > +                      0x12000000 0x00 0x1000000>;
> > +            clocks = <&infracfg 44>,
> > +                     <&infracfg 40>,
> > +                     <&infracfg 43>,
> > +                     <&infracfg 97>,
> > +                     <&infracfg 99>,
> > +                     <&infracfg 111>;
> > +            clock-names = "pl_250m", "tl_26m", "tl_96m",
> > +                          "tl_32k", "peri_26m", "top_133m";
> > +            assigned-clocks = <&topckgen 50>;
> > +            assigned-clock-parents = <&topckgen 91>;
> > +
> > +            phys = <&pciephy>;
> > +            phy-names = "pcie-phy";
> > +            resets = <&infracfg_rst 0>;
> > +            reset-names = "phy";
> > +
> > +            #interrupt-cells = <1>;
> > +            interrupt-map-mask = <0 0 0 0x7>;
> > +            interrupt-map = <0 0 0 1 &pcie_intc 0>,
> > +                            <0 0 0 2 &pcie_intc 1>,
> > +                            <0 0 0 3 &pcie_intc 2>,
> > +                            <0 0 0 4 &pcie_intc 3>;
> > +            pcie_intc: interrupt-controller {
> > +                      #address-cells = <0>;
> > +                      #interrupt-cells = <1>;
> > +                      interrupt-controller;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.25.1
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
