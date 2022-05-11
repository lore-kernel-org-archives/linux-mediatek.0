Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE22C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oO/EtrTKS+eytk43kBNRjI2xCyXkssNORxYHFxj5sbo=; b=ApsYRtZ4gDUY5U
	8WH6e0u3ax8bz9ZaxNKfWDPlDCagrZnSd5wQMyO2iX6JuVtuqP+W23CDxKP9hvBn7AAFScBsDBjJ8
	uUJXomBWwanaFry/0lOUUFJcF7WsWqKLHZl22SE4+bOA07RvLcw3m7NK+BT7/ygG2NOCCi71ID2Kt
	DX3tGraXu4WRVMUaFtXIGtljJq5p2KEF75pVy7bMsH3ZlAmgj3Y1YJimLokTi2nA5iofyoNHyU0Q2
	OsYC1+ewtltrTbdFTubfB2tJVaitoGNVaH+kKtjul6oIj9qj+JUqzYlOf4PNaA0AuFoSb3gNwFtu5
	+6OCIzRCtqz3xXMzzsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogpw-005iOY-B6; Wed, 11 May 2022 07:32:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogpt-005iNR-Jh; Wed, 11 May 2022 07:32:43 +0000
X-UUID: a2578c8906db490f81b1d45eb03642c2-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7c03d77d-cace-42a5-82a1-86b7f5582722, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:179265b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a2578c8906db490f81b1d45eb03642c2-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1439573899; Wed, 11 May 2022 00:32:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 00:24:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 15:24:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 15:24:33 +0800
Message-ID: <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <xinlei.lee@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 11 May 2022 15:24:33 +0800
In-Reply-To: <20220504091923.2219-2-rex-bc.chen@mediatek.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_003241_682245_42849C29 
X-CRM114-Status: GOOD (  24.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
>  .../display/mediatek/mediatek,dsi.yaml        | 115
> ++++++++++++++++++
>  2 files changed, 115 insertions(+), 62 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> deleted file mode 100644
> index 36b01458f45c..000000000000
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Mediatek DSI Device
> -===================
> -
> -The Mediatek DSI function block is a sink of the display subsystem
> and can
> -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for
> dual-
> -channel output.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's
> registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> details.
> -- clock-names: must contain "engine", "digital", and "hs"
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be
> connected
> -  to the input port of an attached DSI panel or DSI-to-eDP encoder
> chip.
> -
> -Optional properties:
> -- resets: list of phandle + reset specifier pair, as described in
> [1].
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
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> new file mode 100644
> index 000000000000..fa5bdf28668a
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DSI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +description: |
> +  The MediaTek DSI function block is a sink of the display subsystem
> and can
> +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> for dual-
> +  channel output.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dsi
> +      - mediatek,mt7623-dsi
> +      - mediatek,mt8167-dsi
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
> +      - description: HS Clock
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
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port should be connected to the input
> +      port of an attached DSI panel or DSI-to-eDP encoder chip.
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
> +  - port
> +
> +unevaluatedProperties: false
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
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsi0: dsi@14014000 {
> +            compatible = "mediatek,mt8183-dsi";
> +            reg = <0 0x14014000 0 0x1000>;
> +            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +            clocks = <&mmsys CLK_MM_DSI0_MM>,
> +                <&mmsys CLK_MM_DSI0_IF>,
> +                <&mipi_tx0>;
> +            clock-names = "engine", "digital", "hs";
> +            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> +            phys = <&mipi_tx0>;
> +            phy-names = "dphy";
> +            port {
> +                dsi0_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

Hello Rob and Krzysztof,

Can you give us some suggestions for this conversion patch?
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
