Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC58C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:21:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620B32137B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KN0Uq18+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620B32137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TijgG2ucl+efhR8mXUDJDg9vPelluHiteJNrnxDouhs=; b=KN0Uq18+IqRlfFSpooDSpbyZm
	WAVXnP2YhyN5hUh88KqpdOBXUloBpzBq53ZaNPRMF1kTZYBKq7U8PCBrv6uoiE6rniApyUoKZjwIp
	n3nNb3AxzK/uJZRJacuielP4B6TkIWJ1ErRvKvN1QSvPwiij4uc7QaBpuvN+B0wWayHrQSOHeiF+7
	RVtsTwSQN/ofF9iBA6idoHQKkLULtnoekoeerp3eBQHPltD84a9SgbkhUPEE9sUs07MT6JvcTWUrW
	YRStv6ZulnsoDLTz4Igc3aZdsnnAjJYL2kemFstKV0cxjRnV5HWE7aWYEdtMy67ckpkmcJtWBB2Ns
	zZCnaoKNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFk7V-00020O-ON; Tue, 08 Sep 2020 20:21:37 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFk7T-0001zS-F4; Tue, 08 Sep 2020 20:21:36 +0000
Received: by mail-io1-f68.google.com with SMTP id m17so789976ioo.1;
 Tue, 08 Sep 2020 13:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mm/0h/U4Hk8WZoslYbu06tgoMG60luGtcEO7empM/LM=;
 b=pHgbXb7QRqu5Vx4sN0MQVAqY6/XKYtzBYKlCEb6WTgWntODvqORCXzAKKk/1N/2979
 aPkhrRSDD7q/k8TtPjr/+2/tAclig0LkORxU6PRPpzFB9F0XENU/Jg3ezMwoNPpr1wBh
 gVl/pELP5jW/g/PdVvnUpw8uiTqn0yLTClZY3zAd10FuMfi9LztAOR26UlayLQqg4+/R
 eDD54Mf39uJCwjheamyhj2bG+ZyH3pz4wIWbZuucblsFxO1cPHgMEHLOFaX1E2r2u1Lr
 85uvPWWC5vUZQslk57K9LUd6dOeoGNMEIPyyRurNG+AlnSCWH5oxzvpBH57iAkaTWbCZ
 vQkQ==
X-Gm-Message-State: AOAM532hCZ4tQe+ODbjUGqsdqyuebx55i8mybFdjCHMdg5Wfc5tslYyj
 Ca8n3BOve1xVu1Kwg5QZTQ==
X-Google-Smtp-Source: ABdhPJzUbzrN+RY+vhi1RmrWGIbRcEKWdSSpIQ2B/z7XSscUwOM2o8va4ubaqnTUUjSxZudsonpogg==
X-Received: by 2002:a5e:820d:: with SMTP id l13mr566194iom.3.1599596494661;
 Tue, 08 Sep 2020 13:21:34 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id c12sm143227ilm.17.2020.09.08.13.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:21:34 -0700 (PDT)
Received: (nullmailer pid 843613 invoked by uid 1000);
 Tue, 08 Sep 2020 20:21:31 -0000
Date: Tue, 8 Sep 2020 14:21:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
Message-ID: <20200908202131.GB795070@bogus>
References: <20200907120852.12090-1-jianjun.wang@mediatek.com>
 <20200907120852.12090-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907120852.12090-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_162135_516428_476A9A25 
X-CRM114-Status: GOOD (  23.00  )
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
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 08:08:50PM +0800, Jianjun Wang wrote:
> Add YAML schemas documentation for Gen3 PCIe controller on
> MediaTek SoCs.

dt-bindings: PCI: mediatek: ... for the subject.

> 
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> new file mode 100644
> index 000000000000..108d29259c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -0,0 +1,158 @@
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
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,gen3-pcie
> +      - const: mediatek,mt8192-pcie
> +

> +  device_type:
> +    const: pci
> +
> +  "#address-cells":
> +    const: 3
> +
> +  "#size-cells":
> +    const: 2

Can drop these 3. Already in pci-bus.yaml.

> +
> +  reg:
> +    items:
> +      - description: Controller control and status registers.

Just 'maxItems: 1'. The description doesn't add any value.

> +
> +  reg-names:
> +    items:
> +      - const: pcie-mac

Don't really need a name here.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  bus-range:
> +    description: Range of bus numbers associated with this controller.
> +
> +  ranges:
> +    minItems: 1
> +    maxItems: 8
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    anyOf:
> +      - const: mac-rst
> +      - const: phy-rst

Doesn't the PHY's reset belong in the PHY node?

> +
> +  clocks:
> +    maxItems: 5
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
> +  phy-names:
> +    const: pcie-phy

Not really a useful name and there's only one. Please drop.

> +
> +  '#interrupt-cells':
> +    const: 1
> +

> +  interrupt-map-mask:
> +    description: Standard PCI IRQ mapping properties.
> +
> +  interrupt-map:
> +    description: Standard PCI IRQ mapping properties.

Can drop these.

> +
> +  legacy-interrupt-controller:

Just 'interrupt-controller'

And don't copy the same bug of using 'of_get_next_child'. You should get 
the child node by name.

> +    description: Interrupt controller node for handling legacy PCI interrupts.
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 0
> +      "#interrupt-cells":
> +        const: 1
> +      interrupt-controller: true
> +
> +    required:
> +      - "#address-cells"
> +      - "#interrupt-cells"
> +      - interrupt-controller

       additionalProperties: false

> +
> +required:
> +  - compatible

> +  - device_type
> +  - "#address-cells"
> +  - "#size-cells"

Don't need these, pci-bus.yaml already requires them.

> +  - reg
> +  - reg-names
> +  - bus-range

If the range is 0-0xff, then this isn't really required.

> +  - interrupts
> +  - ranges
> +  - clocks
> +  - '#interrupt-cells'
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - legacy-interrupt-controller
> +
> +additionalProperties: false

unevaluatedProperties: false

(Should be used when including a ref (pci-bus.yaml).)

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
> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +            bus-range = <0x00 0xff>;
> +            ranges = <0x82000000 0x00 0x12000000 0x00 0x12000000 0x00 0x1000000>;
> +            clocks = <&infracfg 40>,
> +                     <&infracfg 43>,
> +                     <&infracfg 97>,
> +                     <&infracfg 99>,
> +                     <&infracfg 111>;
> +            assigned-clocks = <&topckgen 50>;
> +            assigned-clock-parents = <&topckgen 91>;
> +
> +            phys = <&pciephy>;
> +            phy-names = "pcie-phy";
> +            resets = <&infracfg_rst 0>;
> +            reset-names = "phy-rst";
> +
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0x7>;
> +            interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +                            <0 0 0 2 &pcie_intc 1>,
> +                            <0 0 0 3 &pcie_intc 2>,
> +                            <0 0 0 4 &pcie_intc 3>;
> +            pcie_intc: legacy-interrupt-controller {
> +                      #address-cells = <0>;
> +                      #interrupt-cells = <1>;
> +                      interrupt-controller;
> +            };
> +        };
> +    };
> -- 
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
