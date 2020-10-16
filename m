Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC45C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4219E20897
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OItwIqLk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4219E20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QAMWBcjqqpb7HuiAlRwF9r9O/Uewz490iw3+zk5/AIY=; b=OItwIqLkx8TiRtcyKkYRBsihZ
	ii5ufoyINIaqbNec9SG+a2YxCIpfqaCRnyQItftVkZzg6o70BmcLk5YhduOBgoDepu1reuO3lFSIS
	ysAlYO1dHADyTf42ZN0wE6Mc72BXzVtBxHMJ2FeaBE7xw8HpTNwTEpZVcAoN+RdFrxW8ZPJf90Iho
	GrIG1dKf1HIDDA1mZ3vrqu84yoktXn2nW3ddz3aiKoqMEcIDkhO2hAC99yBIkmhxoX1nTQPEF7y6k
	0l/i09W8lw3q1Af5DLPcklkH1ghI2ulLHIoqr2uIUFXSoj3iB+55ifaXqH8zYXh2pVkzUjBKSFu9b
	n2rNySxxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTJU-00054k-HT; Fri, 16 Oct 2020 17:14:44 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTJM-00051P-3C; Fri, 16 Oct 2020 17:14:37 +0000
Received: by mail-oo1-f66.google.com with SMTP id f19so784092oot.4;
 Fri, 16 Oct 2020 10:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cx3kdixfNY15+bkDWSXUmy0pMm0MYx3AfrDukLSG/n8=;
 b=XSNmK0odjnnwy7dZsTZ47RDNTsQ6FwQ5TbFHCgiTNwtej64YHSaKXQ1WIaUTuNb9IG
 PPw/q3Z04NrWv+EA1LNeKre/nCJZfoUTOK+uLz13Fd6US89XyOWVNH2JGMSY9NgH1StO
 B3/WuungI4dqpqu1em+wCQ7zOMHe9O+OJrf20ygxrZgi5SLv/pYIYZE6FVg59Gd9W1Aw
 8bOhWjrwrE+edf4Kq9/VcNd/UfebCuaoR8ff8OTEIh2Hi0bQuF06sNHlv/E4mzqv77S1
 rEKBtqHk3MwzRSBl+xc7jGirKRf9PIMmma8E1x835ml7ZJE+FLc0bM7IKSVTlmfUQT0s
 FhJw==
X-Gm-Message-State: AOAM532eCwnofowEIXDoMll5Sp7ARignDXfpYFOF0xQTO6M18Qqoxb6N
 4YbXaFluJNFRkT4t4rEjWA==
X-Google-Smtp-Source: ABdhPJyUYYpCf4fr775G5Nt5ObMp6uVb0vD24ss0jYA4zBxq25ZZHmkPUKeKvbIi12WGaFegdiIIeg==
X-Received: by 2002:a4a:5182:: with SMTP id s124mr3543501ooa.88.1602868474952; 
 Fri, 16 Oct 2020 10:14:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m18sm1277107ooj.6.2020.10.16.10.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:14:34 -0700 (PDT)
Received: (nullmailer pid 1593243 invoked by uid 1000);
 Fri, 16 Oct 2020 17:14:33 -0000
Date: Fri, 16 Oct 2020 12:14:33 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: usb: convert mediatek,mtk-xhci.txt
 to YAML schema
Message-ID: <20201016171433.GA1585924@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_131436_147072_61ED9458 
X-CRM114-Status: GOOD (  27.95  )
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

On Tue, Oct 13, 2020 at 04:52:05PM +0800, Chunfeng Yun wrote:
> Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> 

There's some refactoring of usb-hcd.yaml and XHCI schema under review 
and this may need some refactoring on top of it.

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 ------------
>  .../bindings/usb/mediatek,mtk-xhci.yaml       | 180 ++++++++++++++++++
>  2 files changed, 180 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml


> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> new file mode 100644
> index 000000000000..ea696c8f1269
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -0,0 +1,180 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek USB3 xHCI Device Tree Bindings
> +
> +maintainers:
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +allOf:
> +  - $ref: "usb-hcd.yaml"
> +
> +description: |
> +  There are two scenarios:
> +  case 1: only supports xHCI driver;
> +  case 2: supports dual-role mode, and the host is based on xHCI driver.
> +
> +properties:
> +  #common properties for both case 1 and case 2
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt2712-xhci
> +          - mediatek,mt7622-xhci
> +          - mediatek,mt7629-xhci
> +          - mediatek,mt8173-xhci
> +          - mediatek,mt8183-xhci
> +      - const: mediatek,mtk-xhci
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: the registers of xHCI MAC
> +      - description: the registers of IP Port Control
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mac
> +      - const: ippc  #optional, only needed for case 1.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle to USB power domain node to control USB's MTCMOS
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      - description: Controller clock used by normal mode
> +      - description: Reference clock used by low power mode etc
> +      - description: Mcu bus clock for register access
> +      - description: DMA bus clock for data transfer
> +      - description: controller clock
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      - const: sys_ck  #required, the following ones are optional
> +      - const: ref_ck
> +      - const: mcu_ck
> +      - const: dma_ck
> +      - const: xhci_ck
> +
> +  phys:
> +    $ref: /usb/usb-hcd.yaml#

That doesn't look right...

> +
> +  vusb33-supply:
> +    description: Regulator of USB AVDD3.3v
> +
> +  vbus-supply:
> +    description: Regulator of USB VBUS5v
> +
> +  usb3-lpm-capable:
> +    description: supports USB3.0 LPM
> +    type: boolean
> +
> +  imod-interval-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Interrupt moderation interval value, it is 8 times as much as that
> +      defined in the xHCI spec on MTK's controller.
> +    default: 5000
> +
> +  #the following properties are only used for case 1
> +  pinctrl-0:
> +    description: A phandle to the default pinctrl state.
> +
> +  pinctrl-names:
> +    description: A pinctrl state named "default" must be defined.
> +      See pinctrl/pinctrl-bindings.txt
> +    const: default

Don't need pinctrl-* properties. They are always allowed.

> +
> +  wakeup-source:
> +    description: enable USB remote wakeup, see power/wakeup-source.txt
> +    type: boolean
> +
> +  mediatek,syscon-wakeup:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +    description: |
> +      A phandle to syscon used to access the register of the USB wakeup glue
> +      layer between xHCI and SPM, the field should always be a multiple of
> +      3 cells long.

A multiple of 3? How would there be more than 3 cells?

> +
> +      items:
> +        - description:
> +            The first cell represents a phandle to syscon
> +        - description:
> +            The second cell represents the register base address of the glue
> +            layer in syscon
> +        - description:
> +            The third cell represents the hardware version of the glue layer,
> +            1 is used by mt8173 etc, 2 is used by mt2712 etc
> +          enum: [1, 2]
> +
> +  mediatek,u3p-dis-msk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The mask to disable u3ports, bit0 for u3port0,
> +      bit1 for u3port1, ... etc
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^[a-f]+@[0-9a-f]+$":
> +    $ref: /usb/usb-hcd.yaml#
> +    type: object
> +    description: The hard wired USB devices.
> +
> +dependencies:
> +  wakeup-source: [ 'mediatek,syscon-wakeup' ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    usb3: usb@11270000 {
> +        compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
> +        reg = <0x11270000 0x1000>, <0x11280700 0x0100>;
> +        reg-names = "mac", "ippc";
> +        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> +        clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
> +        clock-names = "sys_ck", "ref_ck";
> +        phys = <&u3port0 PHY_TYPE_USB3>, <&u2port1 PHY_TYPE_USB2>;
> +        vusb33-supply = <&mt6397_vusb_reg>;
> +        vbus-supply = <&usb_p1_vbus>;
> +        imod-interval-ns = <10000>;
> +        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> +        wakeup-source;
> +        usb3-lpm-capable;
> +    };
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
