Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA2DC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:25:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8A12076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2P76b9uA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HAuDh/of"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8A12076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=USeyXPx4YwAvVasBoPX0H5pn9d98pBjzQvTKLKgNFb4=; b=2P76b9uAH6ApnsLaZUKESI1Kx
	e44FbilWT0m7KH5+80ahBsJFDli0bVTp1difUrcqEawJM8Ef1TF7sMv2u4nkUoxaJISga8MhUclad
	o2bYOSunM5rW6pVUrV8/jxgv5fUuSu2iecKt1oJxUa+PM7TJuSZTK5sSWlAZ/zi8k1OXkMjI0nlzW
	aMY5TbAUjT0xbiidOQ9li9IKk30lmlIHcPVfYUvbzydVxqt4mQYulLjUQs1a0mwsrI7vUuG+fN8YG
	bW+2cdaYS5MiBrQPawtkpk5+T9ybTtRX2Hr6QKIt00DHwmb2zGJOUaZb2JjxnlnX3ZFRHI2eljnls
	6ISk+fPJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHlfv-0006ix-R7; Mon, 14 Sep 2020 10:25:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHlft-0006iN-6h; Mon, 14 Sep 2020 10:25:30 +0000
X-UUID: 077380c816b240f5a57596fc8fc09509-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xEzcpucgYacwPxI4zW8BRzU1nv7ljitEBf6N+fXDGNU=; 
 b=HAuDh/ofVwcimDuhbMuCnCSNwRW31PaagkQpu1VUjWA+8YN6A+ZwhJK3ToQg1vm5rW4uqHW1/qmQwx/MkFXSy3LgIudrN+dm4kpuRxDHMDTJZ/v+7UhcuTDw4Jx9Yzci9bKOdRT0iMBc6c8NBY2DDscV6NmERq5Ky0Ge5jUusxc=;
X-UUID: 077380c816b240f5a57596fc8fc09509-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 425123306; Mon, 14 Sep 2020 02:25:25 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 03:25:23 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Sep 2020 18:25:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 18:25:13 +0800
Message-ID: <1600078992.2521.27.camel@mhfsdcap03>
Subject: Re: [v2,1/3] dt-bindings: PCI: mediatek: Add YAML schema
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 14 Sep 2020 18:23:12 +0800
In-Reply-To: <20200911224554.GB2905744@bogus>
References: <20200910034536.30860-1-jianjun.wang@mediatek.com>
 <20200910034536.30860-2-jianjun.wang@mediatek.com>
 <20200911224554.GB2905744@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CF3AAFAF8100D953018214FE70B22C96AE44896732AEC350BE3FCE945D1000F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_062529_444417_96875A70 
X-CRM114-Status: GOOD (  20.85  )
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
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, Philipp
 Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 16:45 -0600, Rob Herring wrote:
> On Thu, Sep 10, 2020 at 11:45:34AM +0800, Jianjun Wang wrote:
> > Add YAML schemas documentation for Gen3 PCIe controller on
> > MediaTek SoCs.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 130 ++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > new file mode 100644
> > index 000000000000..a2dfc0d15d2e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -0,0 +1,130 @@
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
> 
> Generic compatibles like this should only be a fallback string, not on 
> its own.
> 
> > +      - const: mediatek,mt8192-pcie
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  bus-range:
> > +    description: Range of bus numbers associated with this controller.
> 
> Drop this. Standard property.

Thanks for your review, I will drop it in the next version.
> 
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
> > +            pcie_intc: interrupt-controller {
> > +                      #address-cells = <0>;
> > +                      #interrupt-cells = <1>;
> > +                      interrupt-controller;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
