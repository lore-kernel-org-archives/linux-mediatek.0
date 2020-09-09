Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935A9C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:42:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A9E220EDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGTMRCrg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EeRJKmJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A9E220EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sFpRAddTteY5QJ6afZqMNE6LK359FxZK6catSDD4KSY=; b=PGTMRCrgsHjyaypdrQfd3EJMk
	XUkOnTkK+pQnzljnBMD3HiDHeplAj8o/kNy6gqmat9EN6iNlTMidalss66YKSuUHoMjJKcGEHkM/H
	wskhB5/SAmVkLzV8loovEXs5H5l9qzZR0s5tmIVNHsHFREe/o9Z5+2tccGTwXQa0s5Dc++I2K+mS7
	+U0pC63OiW7Z1C5R8uDgNxeLXG8hcTqOkHNM+l9gidmHeZr8rU+SmyANuYz4nJ7+LFPtRSKXx2eX2
	SUpw4W0QfSDIcRif1umqoiGSQz54pthqMHGRN0JGYM8bMIuPbhMHa/KRkdjxTYn9oNsM4YRAP8SJw
	PZszqLVLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqzc-0004Sz-OF; Wed, 09 Sep 2020 03:41:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqza-0004Rw-OH; Wed, 09 Sep 2020 03:41:55 +0000
X-UUID: 8a40d95d55ad462ab0a1c98ebc23a23e-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6lcDUUJ3EUb1H85xAqONvxRLfZqC0Vbzjm7Um2fmBTs=; 
 b=EeRJKmJ9Xe7aqQtyWyS+WEBOrBut4qvCsXtonRkneOxEiH/VsyzY2b48dQK60KaoOWFyK6Ge4oAQuD/CIl/1/x1O5gpNKTUVki5YKgIt3h5FnIWnOz14Rm1FhOWJpfjPX1GjjMEVzkxF3Q+GWuzrwiX1FhFuxTUzXpLrL63xV0s=;
X-UUID: 8a40d95d55ad462ab0a1c98ebc23a23e-20200908
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2070782671; Tue, 08 Sep 2020 19:41:48 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 20:41:45 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Sep 2020 11:41:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 11:41:42 +0800
Message-ID: <1599622791.2521.21.camel@mhfsdcap03>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 9 Sep 2020 11:39:51 +0800
In-Reply-To: <20200908202131.GB795070@bogus>
References: <20200907120852.12090-1-jianjun.wang@mediatek.com>
 <20200907120852.12090-2-jianjun.wang@mediatek.com>
 <20200908202131.GB795070@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1DFEC55F54D4F90A60C979E1F1B56298A0585A892D2B9744A0530C0E943229692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_234154_918404_53F31FF5 
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Sj Huang <sj.huang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 14:21 -0600, Rob Herring wrote:
> On Mon, Sep 07, 2020 at 08:08:50PM +0800, Jianjun Wang wrote:
> > Add YAML schemas documentation for Gen3 PCIe controller on
> > MediaTek SoCs.
> 
> dt-bindings: PCI: mediatek: ... for the subject.
> 
> > 
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > new file mode 100644
> > index 000000000000..108d29259c05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -0,0 +1,158 @@
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
> > +allOf:
> > +  - $ref: /schemas/pci/pci-bus.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,gen3-pcie
> > +      - const: mediatek,mt8192-pcie
> > +
> 
> > +  device_type:
> > +    const: pci
> > +
> > +  "#address-cells":
> > +    const: 3
> > +
> > +  "#size-cells":
> > +    const: 2
> 
> Can drop these 3. Already in pci-bus.yaml.
> 
> > +
> > +  reg:
> > +    items:
> > +      - description: Controller control and status registers.
> 
> Just 'maxItems: 1'. The description doesn't add any value.
> 
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pcie-mac
> 
> Don't really need a name here.
> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  bus-range:
> > +    description: Range of bus numbers associated with this controller.
> > +
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 8
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    anyOf:
> > +      - const: mac-rst
> > +      - const: phy-rst
> 
> Doesn't the PHY's reset belong in the PHY node?

There are some cases that we don't need the PHY driver, but for the
reason of power saving, the HW still remain the PHY's reset in infra
domain and it will be asserted before kernel stage, so we still need to
release this reset in the PCIe MAC driver.
> 
> > +
> > +  clocks:
> > +    maxItems: 5
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
> > +  phy-names:
> > +    const: pcie-phy
> 
> Not really a useful name and there's only one. Please drop.
> 
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> 
> > +  interrupt-map-mask:
> > +    description: Standard PCI IRQ mapping properties.
> > +
> > +  interrupt-map:
> > +    description: Standard PCI IRQ mapping properties.
> 
> Can drop these.
> 
> > +
> > +  legacy-interrupt-controller:
> 
> Just 'interrupt-controller'
> 
> And don't copy the same bug of using 'of_get_next_child'. You should get 
> the child node by name.
> 
> > +    description: Interrupt controller node for handling legacy PCI interrupts.
> > +    type: object
> > +    properties:
> > +      "#address-cells":
> > +        const: 0
> > +      "#interrupt-cells":
> > +        const: 1
> > +      interrupt-controller: true
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#interrupt-cells"
> > +      - interrupt-controller
> 
>        additionalProperties: false
> 
> > +
> > +required:
> > +  - compatible
> 
> > +  - device_type
> > +  - "#address-cells"
> > +  - "#size-cells"
> 
> Don't need these, pci-bus.yaml already requires them.
> 
> > +  - reg
> > +  - reg-names
> > +  - bus-range
> 
> If the range is 0-0xff, then this isn't really required.
> 
> > +  - interrupts
> > +  - ranges
> > +  - clocks
> > +  - '#interrupt-cells'
> > +  - interrupt-map
> > +  - interrupt-map-mask
> > +  - legacy-interrupt-controller
> > +
> > +additionalProperties: false
> 
> unevaluatedProperties: false
> 
> (Should be used when including a ref (pci-bus.yaml).)
> 
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
> > +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            bus-range = <0x00 0xff>;
> > +            ranges = <0x82000000 0x00 0x12000000 0x00 0x12000000 0x00 0x1000000>;
> > +            clocks = <&infracfg 40>,
> > +                     <&infracfg 43>,
> > +                     <&infracfg 97>,
> > +                     <&infracfg 99>,
> > +                     <&infracfg 111>;
> > +            assigned-clocks = <&topckgen 50>;
> > +            assigned-clock-parents = <&topckgen 91>;
> > +
> > +            phys = <&pciephy>;
> > +            phy-names = "pcie-phy";
> > +            resets = <&infracfg_rst 0>;
> > +            reset-names = "phy-rst";
> > +
> > +            #interrupt-cells = <1>;
> > +            interrupt-map-mask = <0 0 0 0x7>;
> > +            interrupt-map = <0 0 0 1 &pcie_intc 0>,
> > +                            <0 0 0 2 &pcie_intc 1>,
> > +                            <0 0 0 3 &pcie_intc 2>,
> > +                            <0 0 0 4 &pcie_intc 3>;
> > +            pcie_intc: legacy-interrupt-controller {
> > +                      #address-cells = <0>;
> > +                      #interrupt-cells = <1>;
> > +                      interrupt-controller;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.25.1
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
