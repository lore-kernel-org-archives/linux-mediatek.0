Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ED1C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnGwRhsQBkxYAnVmuKe5h12qgOtj1Xt3xoLVcSICx4c=; b=R78MrxhnLK+PlIa0ey+qids8dP
	Kh/NTT+HbGX1X6jE5nCjyZaNLc00F8l4BOSBNpDsK6P+rUcnEGiglXQmmHhmXhnlrF4ARXXaMVnWT
	C3K6Z1CuGSR4LuXjk4H+b7iuIe3KZ2ut4qam0/ea8L8fchqZbZOyKKMEMZQLq5m+NPGb10KBCyQsz
	alPmFD/42fw265VaPZjaaUZ6cHGZt6HF8HKJo9k9r7SFpVo22WrVpFgmwCygFWF5cJF0I7gW1Wh6o
	bZn8LBeJ/NqSFiMII5XQJOVgczj+HY1oxET1oJRshc/E/m6LiVFAGNC2xJIdQvVNIIsS3yJD3B4tg
	WZqqOZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tIH-00E1i0-DG; Sun, 19 Jun 2022 11:40:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tI5-00E1dR-TT; Sun, 19 Jun 2022 11:40:31 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCC3925E;
	Sun, 19 Jun 2022 13:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655638826;
	bh=F985BgbPk6OEp+5ogkDCv/89Z7ithnzpRugLwEVYEp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUHkgqIQ4eCmyE3s1Ug0PS5cPnbkHC1bVg5u4Kzwc9F7zsf4U4y7zVpSYYhXRdz3D
	 W0psvcSnd25rEngNNlURd57Ohq3pRoND2QH76OMOuuaz98Q82wDLZ7w4Q3fiJe8boX
	 fxZERRMUkJZzKAfXZlMeBapvfLj/GVg+N0MPpeyk=
Date: Sun, 19 Jun 2022 14:40:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH] dt-bindings: phy: make phy-cells description a text
Message-ID: <Yq8LHN+WGVpXDwiM@pendragon.ideasonboard.com>
References: <20220619113325.21396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220619113325.21396-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_044030_164409_B6DDD138 
X-CRM114-Status: GOOD (  16.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

Thank you for the patch.

On Sun, Jun 19, 2022 at 01:33:25PM +0200, Krzysztof Kozlowski wrote:
> The description field is a string, so using YAML inside phy-cells
> description is not actually helpful.

Does it hurt though ? For xlnx,zynqmp-psgtr.yaml I wrote it that way to
prepare for a future where it could be described using a YAML schema
(but such future may never come).

> Make it a proper text.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 14 ++++----
>  .../bindings/phy/mediatek,xsphy.yaml          | 10 +++---
>  .../bindings/phy/xlnx,zynqmp-psgtr.yaml       | 32 ++++++++-----------
>  3 files changed, 23 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 4b638c1d4221..bd0e4c4915ed 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -154,14 +154,12 @@ patternProperties:
>        "#phy-cells":
>          const: 1
>          description: |
> -          The cells contain the following arguments.
> -
> -          - description: The PHY type
> -              enum:
> -                - PHY_TYPE_USB2
> -                - PHY_TYPE_USB3
> -                - PHY_TYPE_PCIE
> -                - PHY_TYPE_SATA
> +          The cells contain the following arguments::
> +            - The PHY type::
> +              - PHY_TYPE_USB2
> +              - PHY_TYPE_USB3
> +              - PHY_TYPE_PCIE
> +              - PHY_TYPE_SATA
>  
>        nvmem-cells:
>          items:
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index 598fd2b95c29..7262b8e184e2 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -100,12 +100,10 @@ patternProperties:
>        "#phy-cells":
>          const: 1
>          description: |
> -          The cells contain the following arguments.
> -
> -          - description: The PHY type
> -              enum:
> -                - PHY_TYPE_USB2
> -                - PHY_TYPE_USB3
> +          The cells contain the following arguments::
> +            - The PHY type::
> +              - PHY_TYPE_USB2
> +              - PHY_TYPE_USB3
>  
>        # The following optional vendor properties are only for debug or HQA test
>        mediatek,eye-src:
> diff --git a/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml b/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
> index 79906519c652..7083eddb467c 100644
> --- a/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
> +++ b/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
> @@ -18,25 +18,19 @@ properties:
>    "#phy-cells":
>      const: 4
>      description: |
> -      The cells contain the following arguments.
> -
> -      - description: The GTR lane
> -        minimum: 0
> -        maximum: 3
> -      - description: The PHY type
> -        enum:
> -          - PHY_TYPE_DP
> -          - PHY_TYPE_PCIE
> -          - PHY_TYPE_SATA
> -          - PHY_TYPE_SGMII
> -          - PHY_TYPE_USB3
> -      - description: The PHY instance
> -        minimum: 0
> -        maximum: 1 # for DP, SATA or USB
> -        maximum: 3 # for PCIE or SGMII
> -      - description: The reference clock number
> -        minimum: 0
> -        maximum: 3
> +      The cells contain the following arguments::
> +        - The GTR lane (minimum:: 0, maximum:: 3)
> +        - The PHY type::
> +            - PHY_TYPE_DP
> +            - PHY_TYPE_PCIE
> +            - PHY_TYPE_SATA
> +            - PHY_TYPE_SGMII
> +            - PHY_TYPE_USB3
> +      - The PHY instance::
> +          minimum:: 0
> +          maximum:: 1 # for DP, SATA or USB
> +          maximum:: 3 # for PCIE or SGMII
> +      - The reference clock number (minimum:: 0, maximum:: 3)
>  
>    compatible:
>      enum:
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

