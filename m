Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75187C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Jea6C5KfM/dgZJtekj/oatSJD9HGBA0dxvUKfTWnsY=; b=Q9iaRAszZClD2v
	xHK7YRc6JP7f1Tg+X8dP7F7wbqR6qJZx26KKSoUew2bj75th38C0CzIyeITD9GEsfmQZvNI/SFLW2
	SPle8afMiFenXkr6uQJ8OL/D2Y7Cd3e7HGeGuEkr50wqsbLBQ4DM1a0xFanXirdhCTbs29r2Z2xou
	5K6jJxyCHj7mXf7+tPsVHoHsz2vtXQd6zCmn2LHmhRel6b6FAuthCKk4ba4RPHQp2Z9WMiUab/qcF
	5Pmu88DTz7qMMW2SotLUwp/8LDNs6uGAMi2kIDg+kBuX0HlIu18RqIr/v1b7UrnOehMSifjlGpLSs
	OV8dKu8Oy2GPce+x9zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ6f5-009scD-Rz; Fri, 04 Mar 2022 12:03:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ6ep-009sXS-DK; Fri, 04 Mar 2022 12:03:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 64CE31F46649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395418;
 bh=XpAzJvb+GVH+2SCPpPI7qbwtiD8hua3WPwflOJsyPPY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gZtJuURO4W0mnhLtB38xAdJ3cdvMB7FrXPlaxb6oi6+JZKm9ojcJBjTFsEzjXukaZ
 67G97REeiCebwJQ9oe1vab/ndYVoWnzx/aiN5WEQxHp4MHarWxKBlqh7LU/61nmFqN
 UfSB3sXqrk1OdGwNt2bCofCtAhO6HZAboQo2xOmJJQnSeVOkcpHModeurFD+qGqffA
 EncxG+jNU7L/IT2JuU2HUs9HN7nGmbCpbggpoHJ2TOrFq8+QZONRSlId1IW57P+jLW
 zlTq2VOB9m+/zVz6AraDIneiDezqngfbo5BP4eJKQwvGLyl5k+kI10vNUoaOP0PfUq
 mNlRqDtadrmFg==
Message-ID: <386e5a59-8b06-58f5-90d0-2c5a5eaa614f@collabora.com>
Date: Fri, 4 Mar 2022 13:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2, 1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_040339_754305_246F87A4 
X-CRM114-Status: GOOD (  20.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   .../display/mediatek/mediatek,dsi.txt         | 62 --------------
>   .../display/mediatek/mediatek,dsi.yaml        | 85 +++++++++++++++++++
>   2 files changed, 85 insertions(+), 62 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> deleted file mode 100644
> index 36b01458f45c..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Mediatek DSI Device
> -===================
> -
> -The Mediatek DSI function block is a sink of the display subsystem and can
> -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> -channel output.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "engine", "digital", and "hs"
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be connected
> -  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
> -
> -Optional properties:
> -- resets: list of phandle + reset specifier pair, as described in [1].
> -
> -[1] Documentation/devicetree/bindings/reset/reset.txt
> -
> -MIPI TX Configuration Module
> -============================
> -
> -See phy/mediatek,dsi-phy.yaml
> -
> -Example:
> -
> -mipi_tx0: mipi-dphy@10215000 {
> -	compatible = "mediatek,mt8173-mipi-tx";
> -	reg = <0 0x10215000 0 0x1000>;
> -	clocks = <&clk26m>;
> -	clock-output-names = "mipi_tx0_pll";
> -	#clock-cells = <0>;
> -	#phy-cells = <0>;
> -	drive-strength-microamp = <4600>;
> -	nvmem-cells= <&mipi_tx_calibration>;
> -	nvmem-cell-names = "calibration-data";
> -};
> -
> -dsi0: dsi@1401b000 {
> -	compatible = "mediatek,mt8173-dsi";
> -	reg = <0 0x1401b000 0 0x1000>;
> -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> -		 <&mipi_tx0>;
> -	clock-names = "engine", "digital", "hs";
> -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> -	phys = <&mipi_tx0>;
> -	phy-names = "dphy";
> -
> -	port {
> -		dsi0_out: endpoint {
> -			remote-endpoint = <&panel_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> new file mode 100644
> index 000000000000..552a013786fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek DSI Controller Device Tree Bindings

Shouldn't this be "MediaTek"?

> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dsi
> +      - mediatek,mt8173-dsi
> +      - mediatek,mt8183-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Engine Clock
> +      - description: Digital Clock
> +      - description: Hs Clock

HS should be all capital letters.

> +
> +  clock-names:
> +    items:
> +      - const: engine
> +      - const: digital
> +      - const: hs
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy

Add #address-cells, #size-cells with const 2

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/mt8183-resets.h>
> +

Since all users are using two address and size cells:

     soc {
         #address-cells = <2>;
         #size-cells = <2>;

         dsi0: dsi@14014000 {
             compatible = "mediatek,mt8183-dsi";
             reg = <0 0x14014000 0 0x1000>;
                   .....etc.....
         };
     };

> +    dsi0: dsi@14014000 {
> +        compatible = "mediatek,mt8183-dsi";
> +        reg = <0x14014000 0x1000>;
> +        interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +        clocks = <&mmsys CLK_MM_DSI0_MM>,
> +            <&mmsys CLK_MM_DSI0_IF>,
> +            <&mipi_tx0>;
> +        clock-names = "engine", "digital", "hs";
> +        resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> +        phys = <&mipi_tx0>;
> +        phy-names = "dphy";
> +    };



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
