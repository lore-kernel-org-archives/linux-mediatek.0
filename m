Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904CDC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C737C2084C
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3M9w8lzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C737C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2iiNM8GTwCR7N4MceoLSc46SIxwi+iD7DpBp2UKrD4=; b=3M9w8lzkUO4e0vfc0ZM25j6/m
	t60B/JcZ6ocWXWPet17vAC6avcqjDMDSnmEEIDT07bYtKn1t/2xt0k9TSuQqDLX7gQa6oWdyDDAnC
	5kWue2TuZjv4719EiBUpg4DwdvXLSPmndtv3jBsxkkyfbj93w9ttz0NnxTK+5L33sOeRMD1NeS1g9
	+M8ZmFZFBhlRH7cU+Cm2mfNJkbvHDWBp/q1MMVIu3a8F8/wgtFpxyzFBO23MDkfP2dTf8EzT8rl9j
	0J32QW9AnFOTAX8m4Ef8/c5h5Cq6NQh3TuyNjP4wVbTkLRwGBZ2GW5lBa+ZtlsTuSFa4FWApJwFmJ
	Cl7xi8tTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTT5Q-0002TN-OP; Fri, 16 Oct 2020 17:00:12 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTT5K-0002RZ-KT; Fri, 16 Oct 2020 17:00:07 +0000
Received: by mail-oo1-f67.google.com with SMTP id f26so766916oou.11;
 Fri, 16 Oct 2020 10:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=03V5eadrj0h1F2pFsncYCDBW4/1TS8rmfiq/2NLYUyU=;
 b=S63SOns7MTnIrDQ1yJKCCa+EgByrKB3zJ6ZypG/lc4nrCDyfjNZgZ86hwBKrXfpnDc
 JFJ+tkYIoyJksvz6P4zyt/o7mwJxiSRTN1lkom413ErcsXIbr4Ah3P9XKo3PXK3m72ui
 wxMWD8XGT+bpGZSVP/0CouT2AQUClauPpdQIz1DwsVQk8m3WWb2A2LaCFphZ4DPud2Mj
 YRRM02P92Fss0aujwteyS5vcWy/v3oHDbEsTwVoAPF4tto1tlrGzvYHbpfzd2BwUmNuL
 hJDX52Zx42e8lhLsNzVKPWQq/Eiy7R6ZzgMmarMIoQ4OTfIUatUlW80fHcJZUeIXox9Y
 pPrg==
X-Gm-Message-State: AOAM533Ms2OjMn+kAfazkZKNlw9DxAI2WVUQICBQDTMccCUSifv3+itF
 DcdmrQWJn4Th3NzFLzRmuQ==
X-Google-Smtp-Source: ABdhPJymBTUe6iAsdy5LQo71U6LggVYOT2y9eqtpe/ffg/4HjlPRuMq1hKnFJ9O3LOVeycHTFsJt0w==
X-Received: by 2002:a4a:972c:: with SMTP id u41mr3569279ooi.10.1602867605572; 
 Fri, 16 Oct 2020 10:00:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d64sm1181772oia.11.2020.10.16.10.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:00:04 -0700 (PDT)
Received: (nullmailer pid 1573907 invoked by uid 1000);
 Fri, 16 Oct 2020 17:00:03 -0000
Date: Fri, 16 Oct 2020 12:00:03 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
Message-ID: <20201016170003.GA1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130006_697973_1C71B1FF 
X-CRM114-Status: GOOD (  30.28  )
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

On Tue, Oct 13, 2020 at 04:52:00PM +0800, Chunfeng Yun wrote:
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify description and compatible definition suggested by Rob
> ---
>  .../bindings/phy/mediatek,xsphy.yaml          | 200 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
>  2 files changed, 200 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> new file mode 100644
> index 000000000000..86511f19277a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek XS-PHY Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The XS-PHY controller supports physical layer functionality for USB3.1
> +  GEN2 controller on MediaTek SoCs.
> +
> +  Banks layout of xsphy
> +  ----------------------------------
> +  port        offset    bank
> +  u2 port0    0x0000    MISC
> +              0x0100    FMREG
> +              0x0300    U2PHY_COM
> +  u2 port1    0x1000    MISC
> +              0x1100    FMREG
> +              0x1300    U2PHY_COM
> +  u2 port2    0x2000    MISC
> +              ...
> +  u31 common  0x3000    DIG_GLB
> +              0x3100    PHYA_GLB
> +  u31 port0   0x3400    DIG_LN_TOP
> +              0x3500    DIG_LN_TX0
> +              0x3600    DIG_LN_RX0
> +              0x3700    DIG_LN_DAIF
> +              0x3800    PHYA_LN
> +  u31 port1   0x3a00    DIG_LN_TOP
> +              0x3b00    DIG_LN_TX0
> +              0x3c00    DIG_LN_RX0
> +              0x3d00    DIG_LN_DAIF
> +              0x3e00    PHYA_LN
> +              ...
> +  DIG_GLB & PHYA_GLB are shared by U31 ports.
> +
> +properties:
> +  $nodename:
> +    pattern: "^xs-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt3611-xsphy
> +          - mediatek,mt3612-xsphy
> +      - const: mediatek,xsphy
> +
> +  reg:
> +    description: |
> +      Register shared by multiple U3 ports, exclude port's private register,
> +      if only U2 ports provided, shouldn't use the property.
> +    maxItems: 1
> +
> +  "#address-cells":
> +      enum: [1, 2]
> +
> +  "#size-cells":
> +      enum: [1, 2]
> +
> +  ranges: true
> +
> +  mediatek,src-ref-clk-mhz:
> +    description:
> +      Frequency of reference clock for slew rate calibrate
> +    $ref: /schemas/types.yaml#/definitions/uint32

Properties with a standard unit suffix don't need a type.

> +    default: 26
> +
> +  mediatek,src-coef:
> +    description:
> +      Coefficient for slew rate calibrate, depends on SoC process
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 17
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
> +        items:
> +          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
> +
> +      clock-names:
> +        items:
> +          - const: ref
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
> +
> +      #The following optional vendor properties are only for debug or HQA test
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
> +      mediatek,efuse-intr:
> +        description:
> +          The selection of Internal Resistor (U2/U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 63
> +
> +      mediatek,efuse-tx-imp:
> +        description:
> +          The selection of TX Impedance (U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 31
> +
> +      mediatek,efuse-rx-imp:
> +        description:
> +          The selection of RX Impedance (U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 31
> +
> +    required:
> +      - reg
> +      - clocks
> +      - clock-names
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
> +    #include <dt-bindings/phy/phy.h>
> +
> +    u3phy: xs-phy@11c40000 {
> +        compatible = "mediatek,mt3611-xsphy", "mediatek,xsphy";
> +        reg = <0x11c43000 0x0200>;
> +        mediatek,src-ref-clk-mhz = <26>;
> +        mediatek,src-coef = <17>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        u2port0: usb-phy@11c40000 {
> +            reg = <0x11c40000 0x0400>;
> +            clocks = <&clk48m>;
> +            clock-names = "ref";
> +            mediatek,eye-src = <4>;
> +            #phy-cells = <1>;
> +        };
> +
> +        u3port0: usb-phy@11c43000 {
> +            reg = <0x11c43400 0x0500>;
> +            clocks = <&clk26m>;
> +            clock-names = "ref";
> +            mediatek,efuse-intr = <28>;
> +            #phy-cells = <1>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> deleted file mode 100644
> index e7caefa0b9c2..000000000000
> --- a/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -MediaTek XS-PHY binding
> ---------------------------
> -
> -The XS-PHY controller supports physical layer functionality for USB3.1
> -GEN2 controller on MediaTek SoCs.
> -
> -Required properties (controller (parent) node):
> - - compatible	: should be "mediatek,<soc-model>-xsphy", "mediatek,xsphy",
> -		  soc-model is the name of SoC, such as mt3611 etc;
> -		  when using "mediatek,xsphy" compatible string, you need SoC specific
> -		  ones in addition, one of:
> -		  - "mediatek,mt3611-xsphy"
> -
> - - #address-cells, #size-cells : should use the same values as the root node
> - - ranges: must be present
> -
> -Optional properties (controller (parent) node):
> - - reg		: offset and length of register shared by multiple U3 ports,
> -		  exclude port's private register, if only U2 ports provided,
> -		  shouldn't use the property.
> - - mediatek,src-ref-clk-mhz	: u32, frequency of reference clock for slew rate
> -		  calibrate
> - - mediatek,src-coef	: u32, coefficient for slew rate calibrate, depends on
> -		  SoC process
> -
> -Required nodes	: a sub-node is required for each port the controller
> -		  provides. Address range information including the usual
> -		  'reg' property is used inside these nodes to describe
> -		  the controller's topology.
> -
> -Required properties (port (child) node):
> -- reg		: address and length of the register set for the port.
> -- clocks	: a list of phandle + clock-specifier pairs, one for each
> -		  entry in clock-names
> -- clock-names	: must contain
> -		  "ref": 48M reference clock for HighSpeed analog phy; and 26M
> -			reference clock for SuperSpeedPlus analog phy, sometimes is
> -			24M, 25M or 27M, depended on platform.
> -- #phy-cells	: should be 1
> -		  cell after port phandle is phy type from:
> -			- PHY_TYPE_USB2
> -			- PHY_TYPE_USB3
> -
> -The following optional properties are only for debug or HQA test
> -Optional properties (PHY_TYPE_USB2 port (child) node):
> -- mediatek,eye-src	: u32, the value of slew rate calibrate
> -- mediatek,eye-vrt	: u32, the selection of VRT reference voltage
> -- mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
> -- mediatek,efuse-intr	: u32, the selection of Internal Resistor
> -
> -Optional properties (PHY_TYPE_USB3 port (child) node):
> -- mediatek,efuse-intr	: u32, the selection of Internal Resistor
> -- mediatek,efuse-tx-imp	: u32, the selection of TX Impedance
> -- mediatek,efuse-rx-imp	: u32, the selection of RX Impedance
> -
> -Banks layout of xsphy
> --------------------------------------------------------------
> -port        offset    bank
> -u2 port0    0x0000    MISC
> -            0x0100    FMREG
> -            0x0300    U2PHY_COM
> -u2 port1    0x1000    MISC
> -            0x1100    FMREG
> -            0x1300    U2PHY_COM
> -u2 port2    0x2000    MISC
> -            ...
> -u31 common  0x3000    DIG_GLB
> -            0x3100    PHYA_GLB
> -u31 port0   0x3400    DIG_LN_TOP
> -            0x3500    DIG_LN_TX0
> -            0x3600    DIG_LN_RX0
> -            0x3700    DIG_LN_DAIF
> -            0x3800    PHYA_LN
> -u31 port1   0x3a00    DIG_LN_TOP
> -            0x3b00    DIG_LN_TX0
> -            0x3c00    DIG_LN_RX0
> -            0x3d00    DIG_LN_DAIF
> -            0x3e00    PHYA_LN
> -            ...
> -
> -DIG_GLB & PHYA_GLB are shared by U31 ports.
> -
> -Example:
> -
> -u3phy: usb-phy@11c40000 {
> -	compatible = "mediatek,mt3611-xsphy", "mediatek,xsphy";
> -	reg = <0 0x11c43000 0 0x0200>;
> -	mediatek,src-ref-clk-mhz = <26>;
> -	mediatek,src-coef = <17>;
> -	#address-cells = <2>;
> -	#size-cells = <2>;
> -	ranges;
> -
> -	u2port0: usb-phy@11c40000 {
> -		reg = <0 0x11c40000 0 0x0400>;
> -		clocks = <&clk48m>;
> -		clock-names = "ref";
> -		mediatek,eye-src = <4>;
> -		#phy-cells = <1>;
> -	};
> -
> -	u3port0: usb-phy@11c43000 {
> -		reg = <0 0x11c43400 0 0x0500>;
> -		clocks = <&clk26m>;
> -		clock-names = "ref";
> -		mediatek,efuse-intr = <28>;
> -		#phy-cells = <1>;
> -	};
> -};
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
