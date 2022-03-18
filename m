Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPdg5cXnIAyifJk7s/byvoq3jD6ZekPxfRLXlEfQIUg=; b=wmqRe6gWTkWgKY
	GXcFTFj+idrmnBuxAyWaIfg/0maStfnPQB43/4TQiIvpXo0AiZsVlH8kTiDr/Q93ZvyX7nAfQbh4c
	rhICjutyEk5fCFEhgyZOzP6FgwjXUWj0MJCEtoHwMXwiYgT1s3xQwWFBVqBdAVzhDRWKXS9bWxaoX
	DgOqrtCKenKVdGTHY2rSJeRSo7ZFzYMAsdUs4vuoUe0CjNjo7bg0zxjI3t29rEb4pJoahxiZCOyyY
	ClJp10TEdjxqI7Oa/dccu6SA7U4gUKQxu65IqW0FCgT8kyz3ugeJhVUL/0uh3LXXKC/ldDyjTHQBx
	NyFHprLjZvl40XUgS65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAWo-001Lrj-E8; Fri, 18 Mar 2022 11:12:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAWb-001LpQ-UK; Fri, 18 Mar 2022 11:12:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EC5731F45E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647601924;
 bh=AHxx3HJHAKwRLhKmfPdNJCDcWqUZd1j6fsxx13RQRng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HEExNe5UWQ76Ygt60cSdS31pkD7ajX866F5AmAGrVnXXYwyjwxbMfT44MRwUDQ1Bh
 xbVwZaokRZeURHfPgYLH6bIrSRTNw6NSq1JOLFsk5osbSZ1bucY39Fo4fp7jzM9WPx
 vRswXbqTWG16/gjhA+6B4J5tQih8IRBlY6Aw4PhHUHB0OlfXhihT8GrZpbuAahao9E
 2Naiv2CG+nxtokyODO4iMenBTdtpyciTJE40g9VJk3QxiaVdpOf74ViuS0xyKY0SvL
 Kn4SpwR8QQhZhnUsXBsB0rjg00ahdRJqOTpuKOdxfjsOdV4eqpKi+HYBwVS2nXrlz9
 RQfP3nB6NEi2w==
Message-ID: <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
Date: Fri, 18 Mar 2022 12:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318095417.2016-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_041206_152591_1278D53E 
X-CRM114-Status: GOOD (  15.03  )
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

Il 18/03/22 10:54, Jianjun Wang ha scritto:
> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> new file mode 100644
> index 000000000000..868bf976568b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PCIe PHY
> +
> +maintainers:
> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> +
> +description: |
> +  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-pcie-phy

Since I don't expect this driver to be only for MT8195, but to be extended to
support some more future MediaTek SoCs and, depending on the number of differences
in the possible future Gen4 PHYs, even different gen's, I propose to add a generic
compatible as const.

So you'll have something like:

- enum:
     - mediatek,mt8195-pcie-phy
- const: mediatek,pcie-gen3-phy

> +
> +  reg:
> +    maxItems: 1
> +

..snip..

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@11e80000 {
> +        compatible = "mediatek,mt8195-pcie-phy";

... which would reflect here as

compatible = "mediatek,mt8195-pcie-phy", "mediatek,pcie-gen3-phy"

> +        #phy-cells = <0>;
> +        reg = <0x11e80000 0x10000>;
> +        reg-names = "sif";
> +        nvmem-cells = <&pciephy_glb_intr>,
> +                      <&pciephy_tx_ln0_pmos>,
> +                      <&pciephy_tx_ln0_nmos>,
> +                      <&pciephy_rx_ln0>,
> +                      <&pciephy_tx_ln1_pmos>,
> +                      <&pciephy_tx_ln1_nmos>,
> +                      <&pciephy_rx_ln1>;
> +        nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
> +                           "tx_ln0_nmos", "rx_ln0",
> +                           "tx_ln1_pmos", "tx_ln1_nmos",
> +                           "rx_ln1";
> +        power-domains = <&spm 2>;
> +    };


Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
