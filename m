Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640BFC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:24:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3F62336D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3F62336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hY8R1YwXoAo61BsbTqq9uYgk0Y/6i9O7w4mPO4fV3f8=; b=zuEFsNoqrB5hO3Fuznav8ig4+
	i4hIwNCtdnluXA2YtpRGcTXCHoaOXtYpUXP48MjH8u47P/kz1W7/aoIshXsCgaj2caFlS3MYOGkC5
	4ICyUgnNa8Tk6wlUvhQHFnIOKNMb8cC1jQ4AQDQxe9LPF4DeHSZiU1PWzr+xUWfVXyw1wx9ML0q7N
	7zW5ig4KN71IcIrykdIA6q8P1oRJjxWPOLb7YNpdFk+jK5Xc/Ztkw8vfufV0BeWN4Ak9Kr2+7SRbP
	PJ+xpOH17wLFQheo0c4UO+aEyjON8pz0m1JkMcWscq0bXyyk7GFg4HwYaQITSQ+vuN4ASZFqGnxc6
	XdGo2PzBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmNzw-0006AJ-S1; Mon, 07 Dec 2020 21:24:44 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmNzr-00068i-8r; Mon, 07 Dec 2020 21:24:40 +0000
Received: by mail-oo1-f67.google.com with SMTP id s1so299278oon.2;
 Mon, 07 Dec 2020 13:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GbKFyK+bj3scwp0qwbdvcfXsN5hUceuEsoUppfFf8iM=;
 b=m4psDFFq+2c7YTTJ5b83UCc1UzvfZ0xPHW02s29TbYkgcPhEBBM4KNcFhOa12EHYjV
 LhuX0Cne7SCSWY18NjhSosbY1fjtWMV2huC5xhn5bVbED0NNE4dGuSxXGVXLSUY0pD1a
 vQk6UIv1PHtWiTU+H32qsjuTsH8qGLCpceO5GGrKqwRKvmqkc2i23DqJxOH+bLJJv/6V
 CY3lnTQCnog3skdlD0C0KkXcwFTGLpi67vn3R3MdgBc63Hr8xrFmNKCQoBRj5sBBhTSR
 EGMXRNvfM1nEhDN8+qn3ZCYQ9reciosqi1cERvpfImL9aMtIrYBQOWsFELGYiJQp5cp7
 LeLw==
X-Gm-Message-State: AOAM531LNbOqkhtkiwdHujnyDbE+q2M1ckTk/CI+tQyodxrohqCH1/Rz
 ZmEV2hUIlF7rJorY0uRDrg==
X-Google-Smtp-Source: ABdhPJxSpRGeFf2aaF9i1HlopKWwPT+FJ2GXD1LT5HXaoNIqwCZ0kxh5jmO+CjFdYKBitYHCs2x5eg==
X-Received: by 2002:a4a:8f98:: with SMTP id c24mr14164872ooj.27.1607376278430; 
 Mon, 07 Dec 2020 13:24:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y35sm2909698otb.5.2020.12.07.13.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:24:37 -0800 (PST)
Received: (nullmailer pid 852485 invoked by uid 1000);
 Mon, 07 Dec 2020 21:24:36 -0000
Date: Mon, 7 Dec 2020 15:24:36 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: usb: convert mediatek, mtk-xhci.txt
 to YAML schema
Message-ID: <20201207212436.GA844756@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-9-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-9-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_162439_366372_50A4768D 
X-CRM114-Status: GOOD (  35.86  )
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
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 04:21:24PM +0800, Chunfeng Yun wrote:
> Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. fix yamllint warning
>   2. remove pinctrl* properties supported by default suggested by Rob
>   3. drop unused labels
>   4. modify description of mediatek,syscon-wakeup
>   5. remove type of imod-interval-ns
> 
> v2: new patch
> ---
>  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 -------------
>  .../bindings/usb/mediatek,mtk-xhci.yaml       | 171 ++++++++++++++++++
>  2 files changed, 171 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> deleted file mode 100644
> index 42d8814f903a..000000000000
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -MT8173 xHCI
> -
> -The device node for Mediatek SOC USB3.0 host controller
> -
> -There are two scenarios: the first one only supports xHCI driver;
> -the second one supports dual-role mode, and the host is based on xHCI
> -driver. Take account of backward compatibility, we divide bindings
> -into two parts.
> -
> -1st: only supports xHCI driver
> -------------------------------------------------------------------------
> -
> -Required properties:
> - - compatible : should be "mediatek,<soc-model>-xhci", "mediatek,mtk-xhci",
> -	soc-model is the name of SoC, such as mt8173, mt2712 etc, when using
> -	"mediatek,mtk-xhci" compatible string, you need SoC specific ones in
> -	addition, one of:
> -	- "mediatek,mt8173-xhci"
> - - reg : specifies physical base address and size of the registers
> - - reg-names: should be "mac" for xHCI MAC and "ippc" for IP port control
> - - interrupts : interrupt used by the controller
> - - power-domains : a phandle to USB power domain node to control USB's
> -	mtcmos
> - - vusb33-supply : regulator of USB avdd3.3v
> -
> - - clocks : a list of phandle + clock-specifier pairs, one for each
> -	entry in clock-names
> - - clock-names : must contain
> -	"sys_ck": controller clock used by normal mode,
> -	the following ones are optional:
> -	"ref_ck": reference clock used by low power mode etc,
> -	"mcu_ck": mcu_bus clock for register access,
> -	"dma_ck": dma_bus clock for data transfer by DMA,
> -	"xhci_ck": controller clock
> -
> - - phys : see usb-hcd.yaml in the current directory
> -
> -Optional properties:
> - - wakeup-source : enable USB remote wakeup;
> - - mediatek,syscon-wakeup : phandle to syscon used to access the register
> -	of the USB wakeup glue layer between xHCI and SPM; it depends on
> -	"wakeup-source", and has two arguments:
> -	- the first one : register base address of the glue layer in syscon;
> -	- the second one : hardware version of the glue layer
> -		- 1 : used by mt8173 etc
> -		- 2 : used by mt2712 etc
> - - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
> -	bit1 for u3port1, ... etc;
> - - vbus-supply : reference to the VBUS regulator;
> - - usb3-lpm-capable : supports USB3.0 LPM
> - - pinctrl-names : a pinctrl state named "default" must be defined
> - - pinctrl-0 : pin control group
> -	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> - - imod-interval-ns: default interrupt moderation interval is 5000ns
> -
> -additionally the properties from usb-hcd.yaml (in the current directory) are
> -supported.
> -
> -Example:
> -usb30: usb@11270000 {
> -	compatible = "mediatek,mt8173-xhci";
> -	reg = <0 0x11270000 0 0x1000>,
> -	      <0 0x11280700 0 0x0100>;
> -	reg-names = "mac", "ippc";
> -	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> -	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> -	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
> -		 <&pericfg CLK_PERI_USB0>,
> -		 <&pericfg CLK_PERI_USB1>;
> -	clock-names = "sys_ck", "ref_ck";
> -	phys = <&phy_port0 PHY_TYPE_USB3>,
> -	       <&phy_port1 PHY_TYPE_USB2>;
> -	vusb33-supply = <&mt6397_vusb_reg>;
> -	vbus-supply = <&usb_p1_vbus>;
> -	usb3-lpm-capable;
> -	mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> -	wakeup-source;
> -	imod-interval-ns = <10000>;
> -};
> -
> -2nd: dual-role mode with xHCI driver
> -------------------------------------------------------------------------
> -
> -In the case, xhci is added as subnode to mtu3. An example and the DT binding
> -details of mtu3 can be found in:
> -Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> -
> -Required properties:
> - - compatible : should be "mediatek,<soc-model>-xhci", "mediatek,mtk-xhci",
> -	soc-model is the name of SoC, such as mt8173, mt2712 etc, when using
> -	"mediatek,mtk-xhci" compatible string, you need SoC specific ones in
> -	addition, one of:
> -	- "mediatek,mt8173-xhci"
> - - reg : specifies physical base address and size of the registers
> - - reg-names: should be "mac" for xHCI MAC
> - - interrupts : interrupt used by the host controller
> - - power-domains : a phandle to USB power domain node to control USB's
> -	mtcmos
> - - vusb33-supply : regulator of USB avdd3.3v
> -
> - - clocks : a list of phandle + clock-specifier pairs, one for each
> -	entry in clock-names
> - - clock-names : must contain "sys_ck", and the following ones are optional:
> -	"ref_ck", "mcu_ck" and "dma_ck", "xhci_ck"
> -
> -Optional properties:
> - - vbus-supply : reference to the VBUS regulator;
> - - usb3-lpm-capable : supports USB3.0 LPM
> -
> -Example:
> -usb30: usb@11270000 {
> -	compatible = "mediatek,mt8173-xhci";
> -	reg = <0 0x11270000 0 0x1000>;
> -	reg-names = "mac";
> -	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> -	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> -	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
> -	clock-names = "sys_ck", "ref_ck";
> -	vusb33-supply = <&mt6397_vusb_reg>;
> -	usb3-lpm-capable;
> -};
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> new file mode 100644
> index 000000000000..4a36ad5c4d25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -0,0 +1,171 @@
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
> +  # common properties for both case 1 and case 2
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
> +      - const: ippc  # optional, only needed for case 1.
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
> +      - const: sys_ck  # required, the following ones are optional
> +      - const: ref_ck
> +      - const: mcu_ck
> +      - const: dma_ck
> +      - const: xhci_ck
> +
> +  phys:
> +    $ref: /usb/usb-hcd.yaml#

That's not right.

You need 'items' and list each entry.

> +    description: List of all the USB PHYs on this HCD
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
> +    description:
> +      Interrupt moderation interval value, it is 8 times as much as that
> +      defined in the xHCI spec on MTK's controller.
> +    default: 5000
> +
> +  # the following properties are only used for case 1
> +  wakeup-source:
> +    description: enable USB remote wakeup, see power/wakeup-source.txt
> +    type: boolean
> +
> +  mediatek,syscon-wakeup:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +    description: |
> +      A phandle to syscon used to access the register of the USB wakeup glue
> +      layer between xHCI and SPM, the field should always be 3 cells long.
> +
> +      items:

Indentation is wrong here. Should be 2 fewer spaces.

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

This $ref isn't right. You already referenced it at the top.

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
> +    usb@11270000 {
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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
