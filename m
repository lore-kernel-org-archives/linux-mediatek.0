Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F5C43457
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF5B222E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDrC4b5c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="blrbvttm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF5B222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zj1zKw2ehMBFyLjPultetnYngaFB3pBjX3RsCIy2NkQ=; b=rDrC4b5chhfCUllC6lpMyvBPq
	CeujVNSwW11jYerRUe552Rg8CZIw9NUfERTSTTAMG6E04sI7EYlkHHXaukWVRB2t4SHTVL/FHvXfe
	tVn5PaLAOTD0uxy6gALoGoGfeQY0TkhwzuX9CtCblz5Ih7PA29LBzMDjlc2PYTmyuv4vkH55eLkc7
	jKxIKHFgyZpU6ID9ZK+RcMRoX056mdpDAVCKbgtkiadBxoQY6W4+IvQ8qauzvkgdIwyr5DrWLhIJx
	y9wy5JM7Av8DZhiDSPQUqhQRz2kj683Ipucoh7DEo9RB+1Q7ADksZjTEMyeP0pIzcimjSDMKh8jr4
	MRN7WSH2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUhSl-0002sd-AF; Tue, 20 Oct 2020 02:33:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUhSi-0002rz-5Y; Tue, 20 Oct 2020 02:33:21 +0000
X-UUID: e4b3fca0fdef423ab4af135dcc3b2d90-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gmfWcdc5kxyjaWDgNkAQC7M+cmu2N4Yawjob+dXhM8I=; 
 b=blrbvttm7yG+8L7hT0VbC9K2FBwaeIDQFYzZPWSuPKXaAgxjk6Nt7V4Q5fNxq2ODhyUs3h60rF71zZfY4GPVu1hR63B4ZP+8N7qeBlY7zdrScn6Y63bgCxOs2X6OFfnhMsx53CZgDGnyshbT8eYsuo1CcCQiwm+wuwdtJY7Lsh0=;
X-UUID: e4b3fca0fdef423ab4af135dcc3b2d90-20201019
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 782704306; Mon, 19 Oct 2020 18:33:17 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:33:15 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:33:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:33:12 +0800
Message-ID: <1603161192.29336.141.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:33:12 +0800
In-Reply-To: <20201016170444.GB1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
 <20201016170444.GB1562276@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2D5D0BED2485172574F17153A95E190EF36F32054A8710C7D5248D751DBD63DF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_223320_360417_1DF4FDA6 
X-CRM114-Status: GOOD (  28.23  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 12:04 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible
> > ---
> >  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
> >  2 files changed, 263 insertions(+), 162 deletions(-)
> >  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > new file mode 100755
> > index 000000000000..56ad8be69095
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > @@ -0,0 +1,263 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek T-PHY Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: |
> > +  The T-PHY controller supports physical layer functionality for a number of
> > +  controllers on MediaTek SoCs, includes USB2.0, USB3.0, PCIe and SATA.
[...]
> > +properties:
> > +  $nodename:
> > +     pattern: "^t-phy@[0-9a-f]+$"
> 
> Wrong indentation. Should be 1 less.
Yes, will fix it
> 
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2701-tphy
> > +              - mediatek,mt7623-tphy
> > +              - mediatek,mt7622-tphy
> > +              - mediatek,mt8516-tphy
> > +          - const: mediatek,generic-tphy-v1
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-tphy
> > +              - mediatek,mt7629-tphy
> > +              - mediatek,mt8183-tphy
> > +          - const: mediatek,generic-tphy-v2
> > +      - const: mediatek,mt2701-u3phy
> > +        deprecated: true
> > +      - const: mediatek,mt2712-u3phy
> > +        deprecated: true
> > +      - const: mediatek,mt8173-u3phy
> > +
> > +  reg:
> > +    description: |
> 
> Don't need '|' if there's no formatting to preserve.
Got it
> 
> > +      Register shared by multiple ports, exclude port's private register.
> > +      It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
> > +      T-PHY V2, such as mt2712.
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +      enum: [1, 2]
> > +
> > +  "#size-cells":
> > +      enum: [1, 2]
> 
> Wrong indent.
Will fix it and check it in other patches
> 
> > +
> > +  # Used with non-empty value if optional 'reg' is not provided.
> > +  # The format of the value is an arbitrary number of triplets of
> > +  # (child-bus-address, parent-bus-address, length).
> > +  ranges: true
> > +
> > +  mediatek,src-ref-clk-mhz:
> > +    description:
> > +      Frequency of reference clock for slew rate calibrate
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 26
> > +
> > +  mediatek,src-coef:
> > +    description:
> > +      Coefficient for slew rate calibrate, depends on SoC process
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 28
> > +
> > +# Required child node:
> > +patternProperties:
> > +  "^usb-phy@[0-9a-f]+$":
> > +    type: object
> > +    description: |
> > +      A sub-node is required for each port the controller provides.
> > +      Address range information including the usual 'reg' property
> > +      is used inside these nodes to describe the controller's topology.
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      clocks:
> > +        minItems: 1
> > +        maxItems: 2
> > +        items:
> > +          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
> > +          - description: Reference clock of analog phy
> > +        description: |
> > +          Uses both clocks if the clock of analog and digital phys are
> > +          separated, otherwise uses "ref" clock only if needed.
> > +
> > +      clock-names:
> > +        minItems: 1
> > +        maxItems: 2
> > +        items:
> > +          - const: ref
> > +          - const: da_ref
> > +
> > +      "#phy-cells":
> > +        const: 1
> > +        description: |
> > +          The cells contain the following arguments.
> > +
> > +          - description: The PHY type
> > +              enum:
> > +                - PHY_TYPE_USB2
> > +                - PHY_TYPE_USB3
> > +                - PHY_TYPE_PCIE
> > +                - PHY_TYPE_SATA
> > +
> > +      #The following optional vendor properties are only for debug or HQA test
> 
> space     ^
Ok, will add it
> 
> > +      mediatek,eye-src:
> > +        description:
> > +          The value of slew rate calibrate (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,eye-vrt:
> > +        description:
> > +          The selection of VRT reference voltage (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,eye-term:
> > +        description:
> > +          The selection of HS_TX TERM reference voltage (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,intr:
> > +        description:
> > +          The selection of internal resistor (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 31
> > +
> > +      mediatek,discth:
> > +        description:
> > +          The selection of disconnect threshold (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 15
> > +
> > +      mediatek,bc12:
> > +        description:
> > +          Specify the flag to enable BC1.2 if support it
> > +        type: boolean
> > +
> > +    required:
> > +      - reg
> > +      - "#phy-cells"
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    susb: usb@11271000 {
> 
> Drop unused labels.
Ok
> 
> > +        compatible = "mediatek,mt8173-mtu3";
> > +        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        phys = <&u2port0 PHY_TYPE_USB2>,
> > +               <&u3port0 PHY_TYPE_USB3>,
> > +               <&u2port1 PHY_TYPE_USB2>;
> > +        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +    };
> > +
> > +    u3phy: t-phy@11290000 {
> > +        compatible = "mediatek,mt8173-u3phy";
> > +        reg = <0x11290000 0x800>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +        status = "okay";
> 
> Don't show status in examples.
Ok, will remove it

Thanks a lot

> 
> > +
> > +        u2port0: usb-phy@11290800 {
> > +            reg = <0x11290800 0x100>;
> > +            clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>, <&clk48m>;
> > +            clock-names = "ref", "da_ref";
> > +            #phy-cells = <1>;
> > +            status = "okay";
> > +        };
[...]
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
