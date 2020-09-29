Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCCEC4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 18:08:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA92F21548
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 18:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdXWD3Lo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA92F21548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EWNSPuodafTTFtJeolhPw/sY0nkdebhbnOWyYkoXycA=; b=SdXWD3LolUI+oHWScc6j7zvHn
	6zHAg1WmQsU5tC9zIHPaYepGcKGs2JBbu3syP1OixXKKGfSAynhgR1jjDrzEpO9WkHY7ti2IiIDk+
	RyV0M7Wn4lVUwzzKymAHAMolmB8ht7x1Z5JB9m1w5lZmbo0f8jYZFkpOfFciOPPNsE+YWQEAq1ylf
	fXQJFdUUVhhu5uj75yETlTLSI7iNrxajJu+h4+twAIlaktBO0M0DTFvDZMKCKGJ5oGpKGjHdiOCjH
	uyeNFdvOr92Eoq/NYCFgI7jIM3+ecE6Knuirrs6qA9nQDKg98sAoTEYgyEJYdYg3Kf0uctUQf64+c
	hIj33ugFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNK34-00014L-8x; Tue, 29 Sep 2020 18:08:22 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNK2z-00013I-HN; Tue, 29 Sep 2020 18:08:18 +0000
Received: by mail-oi1-f195.google.com with SMTP id x69so6466888oia.8;
 Tue, 29 Sep 2020 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sU+G8HZjDOP5MRdUHbCt+p6p/tXjsZfEXILLEXLTGKk=;
 b=bCBa5l1pv1msyjHYZ1hx2RW+PIXQN/qnL8y9t3CS3c3RcdobvjjsC42D6l44pIjsxi
 VqAr0s2WW9JgkE12a+YoC8qiVbyGWM8Wcuocd6tr7/XLdSNWTKjjr91TwKuBFeTgTLbR
 8oF77V3r8P3996lI8dm9Wx44W3Fmk8IUffRbt9yJVSfQ4Rz0jd+zsn7NPPw6V/kikuT1
 UcJRl4tga+npXPSeHZ8x0X8wV02xEn4cZ4lAjW5uK9sx9QvexXwXVWLEVnIDXvmDhJhq
 H2KRdjtBlx75LaXUURh2MeoMO4ypcBnM5YP4HLfDyyDHpl3l0IDBprTu//5OioHRnonJ
 AXTg==
X-Gm-Message-State: AOAM530+XiJT2leZidjMiORzzDJ3a6IRK9DfA2c/06jmCNGb06EXsteE
 S1qMr/p8SoPmNzjgG8PtRA==
X-Google-Smtp-Source: ABdhPJz56B8S1F50AdUm8skiSUxwaNOgLIFcS5ICv5Jn5u0GiuSyXnNAj4hFIR8xLsNWCl8z8U7x2g==
X-Received: by 2002:aca:f5cb:: with SMTP id t194mr3210736oih.144.1601402896731; 
 Tue, 29 Sep 2020 11:08:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v20sm1150556oiv.47.2020.09.29.11.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:08:16 -0700 (PDT)
Received: (nullmailer pid 882710 invoked by uid 1000);
 Tue, 29 Sep 2020 18:08:15 -0000
Date: Tue, 29 Sep 2020 13:08:15 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: convert phy-mtk-xsphy.txt to YAML
 schema
Message-ID: <20200929180815.GA865690@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_140817_592704_E79E6B06 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 CK Hu <ck.hu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 03:55:05PM +0800, Chunfeng Yun wrote:
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,xsphy.yaml          | 203 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
>  2 files changed, 203 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> new file mode 100644
> index 000000000000..0aaa10640b5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -0,0 +1,203 @@
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
> +properties:
> +  $nodename:
> +    pattern: "^xs-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt3611-xsphy
> +          - enum:
> +              - mediatek,xsphy
> +      - items:
> +          - const: mediatek,xsphy

mediatek,xsphy alone should not be valid.

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
> +#Banks layout of xsphy
> +#-------------------------------------------------------------

Move this to top-level 'description'.

> +#port        offset    bank
> +#u2 port0    0x0000    MISC
> +#            0x0100    FMREG
> +#            0x0300    U2PHY_COM
> +#u2 port1    0x1000    MISC
> +#            0x1100    FMREG
> +#            0x1300    U2PHY_COM
> +#u2 port2    0x2000    MISC
> +#            ...
> +#u31 common  0x3000    DIG_GLB
> +#            0x3100    PHYA_GLB
> +#u31 port0   0x3400    DIG_LN_TOP
> +#            0x3500    DIG_LN_TX0
> +#            0x3600    DIG_LN_RX0
> +#            0x3700    DIG_LN_DAIF
> +#            0x3800    PHYA_LN
> +#u31 port1   0x3a00    DIG_LN_TOP
> +#            0x3b00    DIG_LN_TX0
> +#            0x3c00    DIG_LN_RX0
> +#            0x3d00    DIG_LN_DAIF
> +#            0x3e00    PHYA_LN
> +#            ...
> +#DIG_GLB & PHYA_GLB are shared by U31 ports.
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
