Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8338C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA412084C
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Xu9EeS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA412084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyyOuKYGwzs/webB12S4FqYHpw9vMG0McOc3gd/LFaQ=; b=0Xu9EeS9NXzR40LiAbTPOucci
	Qc76iSSVl7OC/K9yfg4w3S8g1ebhKGOJkz4GIQpOr0gXYfGwfTMJiQ42j+igQ+2QYYeZguHSAVpkF
	oe3XDCKm348WImcLOzx7ObDpFMWsRlEclM4LVOX4V6bm1WS7uo4AfUYyXwMe3bB7hD+f/ct29bAh2
	LslKTUdD0kdq41QRYclRfwqXyBC/vVw5ZtwCZxZsuQP9InvxTsCNSzj1HqXJ8nNl1sXwZGBGKoQyy
	axRgU64I6xrR7ah+eAySazdKC/a/h/1/CL+ZPtveaAJJaFx/H7+qWoX97rBV9qr3dQCh9KvaBznB0
	11Czt7UCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTT9x-00037P-89; Fri, 16 Oct 2020 17:04:53 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTT9r-00035i-Ap; Fri, 16 Oct 2020 17:04:48 +0000
Received: by mail-oi1-f194.google.com with SMTP id l85so3155609oih.10;
 Fri, 16 Oct 2020 10:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tQqiChz7v5ei85yc7v3LbvEIQtUAb+D6i7zp8opDie8=;
 b=ufDXNpcLsTvYVTWzLqKstnt4DO+imZQ8jxVfAKYGdPh2NEQf39U6mwBZ+oiC8sUzIa
 TxkpDbepHnc50qqywrS7NicvMZhA5yDEi92cs7nxI09Xlq026QTGdisLCgxvJ1PY5+Ef
 Ot00SOPETtXpw2+r87oIx7jG5EULFE4MUs13G5KJJRLcRk8ZVXplyBmNGfo3H26m4iFw
 YEfNtnHLys0ElshdHBnV/Rsr5rukDGKJbFkjUBruO8QUBvQBczamtL1B4XwKxBK1oHZW
 A3/B3dLsF5Vc+7e1z7nIL3KqKcd0HDE0VWdnKZiy5IbD0pUDRnVIx9lqm9UnaDhTNioF
 VYIQ==
X-Gm-Message-State: AOAM531gtNKWoMPVndtNd/aVrHqOLuYTW13cLwZuYl67FyVO6DQTFtBJ
 ji+Va7msBHJ1y2PTGBuRyA==
X-Google-Smtp-Source: ABdhPJzGF3708P7Yx6YTdnCUvmE3VC3S94Q+mOyrXH1xFJn3ktwMHUnlLnW8j3N3ZRmBnckGoYVWBQ==
X-Received: by 2002:aca:7210:: with SMTP id p16mr3222070oic.77.1602867886406; 
 Fri, 16 Oct 2020 10:04:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k6sm1129141otp.33.2020.10.16.10.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:04:45 -0700 (PDT)
Received: (nullmailer pid 1579813 invoked by uid 1000);
 Fri, 16 Oct 2020 17:04:44 -0000
Date: Fri, 16 Oct 2020 12:04:44 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
Message-ID: <20201016170444.GB1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130447_378987_2BB5EEC8 
X-CRM114-Status: GOOD (  35.71  )
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify description and compatible
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 263 insertions(+), 162 deletions(-)
>  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> new file mode 100755
> index 000000000000..56ad8be69095
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -0,0 +1,263 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek T-PHY Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The T-PHY controller supports physical layer functionality for a number of
> +  controllers on MediaTek SoCs, includes USB2.0, USB3.0, PCIe and SATA.
> +
> +  Layout differences of banks between T-PHY V1 (mt8173/mt2701) and
> +  T-PHY V2 (mt2712) when works on USB mode:
> +  -----------------------------------
> +  Version 1:
> +  port        offset    bank
> +  shared      0x0000    SPLLC
> +              0x0100    FMREG
> +  u2 port0    0x0800    U2PHY_COM
> +  u3 port0    0x0900    U3PHYD
> +              0x0a00    U3PHYD_BANK2
> +              0x0b00    U3PHYA
> +              0x0c00    U3PHYA_DA
> +  u2 port1    0x1000    U2PHY_COM
> +  u3 port1    0x1100    U3PHYD
> +              0x1200    U3PHYD_BANK2
> +              0x1300    U3PHYA
> +              0x1400    U3PHYA_DA
> +  u2 port2    0x1800    U2PHY_COM
> +              ...
> +
> +  Version 2:
> +  port        offset    bank
> +  u2 port0    0x0000    MISC
> +              0x0100    FMREG
> +              0x0300    U2PHY_COM
> +  u3 port0    0x0700    SPLLC
> +              0x0800    CHIP
> +              0x0900    U3PHYD
> +              0x0a00    U3PHYD_BANK2
> +              0x0b00    U3PHYA
> +              0x0c00    U3PHYA_DA
> +  u2 port1    0x1000    MISC
> +              0x1100    FMREG
> +              0x1300    U2PHY_COM
> +  u3 port1    0x1700    SPLLC
> +              0x1800    CHIP
> +              0x1900    U3PHYD
> +              0x1a00    U3PHYD_BANK2
> +              0x1b00    U3PHYA
> +              0x1c00    U3PHYA_DA
> +  u2 port2    0x2000    MISC
> +              ...
> +
> +  SPLLC shared by u3 ports and FMREG shared by u2 ports on V1 are put back
> +  into each port; a new bank MISC for u2 ports and CHIP for u3 ports are
> +  added on V2.
> +
> +properties:
> +  $nodename:
> +     pattern: "^t-phy@[0-9a-f]+$"

Wrong indentation. Should be 1 less.

> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-tphy
> +              - mediatek,mt7623-tphy
> +              - mediatek,mt7622-tphy
> +              - mediatek,mt8516-tphy
> +          - const: mediatek,generic-tphy-v1
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-tphy
> +              - mediatek,mt7629-tphy
> +              - mediatek,mt8183-tphy
> +          - const: mediatek,generic-tphy-v2
> +      - const: mediatek,mt2701-u3phy
> +        deprecated: true
> +      - const: mediatek,mt2712-u3phy
> +        deprecated: true
> +      - const: mediatek,mt8173-u3phy
> +
> +  reg:
> +    description: |

Don't need '|' if there's no formatting to preserve.

> +      Register shared by multiple ports, exclude port's private register.
> +      It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
> +      T-PHY V2, such as mt2712.
> +    maxItems: 1
> +
> +  "#address-cells":
> +      enum: [1, 2]
> +
> +  "#size-cells":
> +      enum: [1, 2]

Wrong indent.

> +
> +  # Used with non-empty value if optional 'reg' is not provided.
> +  # The format of the value is an arbitrary number of triplets of
> +  # (child-bus-address, parent-bus-address, length).
> +  ranges: true
> +
> +  mediatek,src-ref-clk-mhz:
> +    description:
> +      Frequency of reference clock for slew rate calibrate
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 26
> +
> +  mediatek,src-coef:
> +    description:
> +      Coefficient for slew rate calibrate, depends on SoC process
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 28
> +
> +# Required child node:
> +patternProperties:
> +  "^usb-phy@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      A sub-node is required for each port the controller provides.
> +      Address range information including the usual 'reg' property
> +      is used inside these nodes to describe the controller's topology.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
> +          - description: Reference clock of analog phy
> +        description: |
> +          Uses both clocks if the clock of analog and digital phys are
> +          separated, otherwise uses "ref" clock only if needed.
> +
> +      clock-names:
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          - const: ref
> +          - const: da_ref
> +
> +      "#phy-cells":
> +        const: 1
> +        description: |
> +          The cells contain the following arguments.
> +
> +          - description: The PHY type
> +              enum:
> +                - PHY_TYPE_USB2
> +                - PHY_TYPE_USB3
> +                - PHY_TYPE_PCIE
> +                - PHY_TYPE_SATA
> +
> +      #The following optional vendor properties are only for debug or HQA test

space     ^

> +      mediatek,eye-src:
> +        description:
> +          The value of slew rate calibrate (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,eye-vrt:
> +        description:
> +          The selection of VRT reference voltage (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,eye-term:
> +        description:
> +          The selection of HS_TX TERM reference voltage (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,intr:
> +        description:
> +          The selection of internal resistor (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 31
> +
> +      mediatek,discth:
> +        description:
> +          The selection of disconnect threshold (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 15
> +
> +      mediatek,bc12:
> +        description:
> +          Specify the flag to enable BC1.2 if support it
> +        type: boolean
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/phy/phy.h>
> +    susb: usb@11271000 {

Drop unused labels.

> +        compatible = "mediatek,mt8173-mtu3";
> +        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
> +        reg-names = "mac", "ippc";
> +        phys = <&u2port0 PHY_TYPE_USB2>,
> +               <&u3port0 PHY_TYPE_USB3>,
> +               <&u2port1 PHY_TYPE_USB2>;
> +        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +    };
> +
> +    u3phy: t-phy@11290000 {
> +        compatible = "mediatek,mt8173-u3phy";
> +        reg = <0x11290000 0x800>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        status = "okay";

Don't show status in examples.

> +
> +        u2port0: usb-phy@11290800 {
> +            reg = <0x11290800 0x100>;
> +            clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>, <&clk48m>;
> +            clock-names = "ref", "da_ref";
> +            #phy-cells = <1>;
> +            status = "okay";
> +        };
> +
> +        u3port0: usb-phy@11290900 {
> +            reg = <0x11290900 0x700>;
> +            clocks = <&clk26m>;
> +            clock-names = "ref";
> +            #phy-cells = <1>;
> +            status = "okay";
> +        };
> +
> +        u2port1: usb-phy@11291000 {
> +            reg = <0x11291000 0x100>;
> +            #phy-cells = <1>;
> +            status = "okay";
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> deleted file mode 100644
> index dd75b676b71d..000000000000
> --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> +++ /dev/null
> @@ -1,162 +0,0 @@
> -MediaTek T-PHY binding
> ---------------------------
> -
> -T-phy controller supports physical layer functionality for a number of
> -controllers on MediaTek SoCs, such as, USB2.0, USB3.0, PCIe, and SATA.
> -
> -Required properties (controller (parent) node):
> - - compatible	: should be one of
> -		  "mediatek,generic-tphy-v1"
> -		  "mediatek,generic-tphy-v2"
> -		  "mediatek,mt2701-u3phy" (deprecated)
> -		  "mediatek,mt2712-u3phy" (deprecated)
> -		  "mediatek,mt8173-u3phy";
> -		  make use of "mediatek,generic-tphy-v1" on mt2701 instead and
> -		  "mediatek,generic-tphy-v2" on mt2712 instead.
> -
> -- #address-cells:	the number of cells used to represent physical
> -		base addresses.
> -- #size-cells:	the number of cells used to represent the size of an address.
> -- ranges:	the address mapping relationship to the parent, defined with
> -		- empty value: if optional 'reg' is used.
> -		- non-empty value: if optional 'reg' is not used. should set
> -			the child's base address to 0, the physical address
> -			within parent's address space, and the length of
> -			the address map.
> -
> -Required nodes	: a sub-node is required for each port the controller
> -		  provides. Address range information including the usual
> -		  'reg' property is used inside these nodes to describe
> -		  the controller's topology.
> -
> -Optional properties (controller (parent) node):
> - - reg		: offset and length of register shared by multiple ports,
> -		  exclude port's private register. It is needed on mt2701
> -		  and mt8173, but not on mt2712.
> - - mediatek,src-ref-clk-mhz	: frequency of reference clock for slew rate
> -		  calibrate
> - - mediatek,src-coef	: coefficient for slew rate calibrate, depends on
> -		  SoC process
> -
> -Required properties (port (child) node):
> -- reg		: address and length of the register set for the port.
> -- #phy-cells	: should be 1 (See second example)
> -		  cell after port phandle is phy type from:
> -			- PHY_TYPE_USB2
> -			- PHY_TYPE_USB3
> -			- PHY_TYPE_PCIE
> -			- PHY_TYPE_SATA
> -
> -Optional properties (PHY_TYPE_USB2 port (child) node):
> -- clocks	: a list of phandle + clock-specifier pairs, one for each
> -		  entry in clock-names
> -- clock-names	: may contain
> -		  "ref": 48M reference clock for HighSpeed (digital) phy; and 26M
> -			reference clock for SuperSpeed (digital) phy, sometimes is
> -			24M, 25M or 27M, depended on platform.
> -		  "da_ref": the reference clock of analog phy, used if the clocks
> -			of analog and digital phys are separated, otherwise uses
> -			"ref" clock only if needed.
> -
> -- mediatek,eye-src	: u32, the value of slew rate calibrate
> -- mediatek,eye-vrt	: u32, the selection of VRT reference voltage
> -- mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
> -- mediatek,bc12	: bool, enable BC12 of u2phy if support it
> -- mediatek,discth	: u32, the selection of disconnect threshold
> -- mediatek,intr	: u32, the selection of internal R (resistance)
> -
> -Example:
> -
> -u3phy: usb-phy@11290000 {
> -	compatible = "mediatek,mt8173-u3phy";
> -	reg = <0 0x11290000 0 0x800>;
> -	#address-cells = <2>;
> -	#size-cells = <2>;
> -	ranges;
> -
> -	u2port0: usb-phy@11290800 {
> -		reg = <0 0x11290800 0 0x100>;
> -		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
> -		clock-names = "ref";
> -		#phy-cells = <1>;
> -	};
> -
> -	u3port0: usb-phy@11290900 {
> -		reg = <0 0x11290800 0 0x700>;
> -		clocks = <&clk26m>;
> -		clock-names = "ref";
> -		#phy-cells = <1>;
> -	};
> -
> -	u2port1: usb-phy@11291000 {
> -		reg = <0 0x11291000 0 0x100>;
> -		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
> -		clock-names = "ref";
> -		#phy-cells = <1>;
> -	};
> -};
> -
> -Specifying phy control of devices
> ----------------------------------
> -
> -Device nodes should specify the configuration required in their "phys"
> -property, containing a phandle to the phy port node and a device type;
> -phy-names for each port are optional.
> -
> -Example:
> -
> -#include <dt-bindings/phy/phy.h>
> -
> -usb30: usb@11270000 {
> -	...
> -	phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
> -	phy-names = "usb2-0", "usb3-0";
> -	...
> -};
> -
> -
> -Layout differences of banks between mt8173/mt2701 and mt2712
> --------------------------------------------------------------
> -mt8173 and mt2701:
> -port        offset    bank
> -shared      0x0000    SPLLC
> -            0x0100    FMREG
> -u2 port0    0x0800    U2PHY_COM
> -u3 port0    0x0900    U3PHYD
> -            0x0a00    U3PHYD_BANK2
> -            0x0b00    U3PHYA
> -            0x0c00    U3PHYA_DA
> -u2 port1    0x1000    U2PHY_COM
> -u3 port1    0x1100    U3PHYD
> -            0x1200    U3PHYD_BANK2
> -            0x1300    U3PHYA
> -            0x1400    U3PHYA_DA
> -u2 port2    0x1800    U2PHY_COM
> -            ...
> -
> -mt2712:
> -port        offset    bank
> -u2 port0    0x0000    MISC
> -            0x0100    FMREG
> -            0x0300    U2PHY_COM
> -u3 port0    0x0700    SPLLC
> -            0x0800    CHIP
> -            0x0900    U3PHYD
> -            0x0a00    U3PHYD_BANK2
> -            0x0b00    U3PHYA
> -            0x0c00    U3PHYA_DA
> -u2 port1    0x1000    MISC
> -            0x1100    FMREG
> -            0x1300    U2PHY_COM
> -u3 port1    0x1700    SPLLC
> -            0x1800    CHIP
> -            0x1900    U3PHYD
> -            0x1a00    U3PHYD_BANK2
> -            0x1b00    U3PHYA
> -            0x1c00    U3PHYA_DA
> -u2 port2    0x2000    MISC
> -            ...
> -
> -    SPLLC shared by u3 ports and FMREG shared by u2 ports on
> -mt8173/mt2701 are put back into each port; a new bank MISC for
> -u2 ports and CHIP for u3 ports are added on mt2712.
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
