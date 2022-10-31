Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EFEC38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcgKNVkDs9J3APKT90R/OiSHQkbJw5TzvGXafv7uUBY=; b=M4t74w+6qOn8W0+b0tZ06RKvak
	v5Z3GUk5wk1pE/H6Lxkbr6I7XqOvNfletoIULMjEL8ariQGjvvEzz0XM6uMBNcC6GRDb1bSTiUU8M
	8LO2Ucs7se1avZFgK9gYzoDcNS5DHzE2nBuOwNA09X7NsNp+TtHGYW4ze6xiK4nLN0etruDSOJj6o
	3d5BdPp/nNXwMp8pWuelMwHTYtFFepDamcmG/p58dJ4DchBKTKmXnxAEpeD2hw561TC8HoKFo++hO
	+it4crXRV6d/3sOIpxogB1CAHHri8Hh76dUqOPeQSvYAg5R84YGOrMyF5Avc+x2ZMaVlI1rTddJcQ
	2HH7+yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUqm-00C3tm-J8; Mon, 31 Oct 2022 13:29:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUqZ-00C3oZ-Po; Mon, 31 Oct 2022 13:29:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 953686602040;
	Mon, 31 Oct 2022 13:28:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667222938;
	bh=9ps5B31edxR0GepExY4h3W2psR6P8vyTX43U+/2T3mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oo5AyVFdBpKrzCOAmHR088kRNw8TfdgZCNvEVkfw3Lk6w2lGN3SdSqrfjz+yv4Cc8
	 9Nb/97sRv1Jnr57Ai+w25rn7yvWYIUsZELHaR+0gy2ZCwPv4MaAxPml749f6iCe4uD
	 HxwRDpnhl/vvg0fJPAIak8vfi+7ocXJBXkv05NpvfapoVkiP+XnHZXFe4qNgSdwZ+/
	 IuUlp8c7geAKrPFzzbDX6ZIt0sUVCuTQHBrQLjytDFbTuluMGh2j8ZC1j3JT3P+PNn
	 7VWil59o3jMeG86tqF9uf/riOSb+ZJt0ufmjcQROPeLjNx1PElFyyIRBWX0aW2uTJG
	 Abbok2EoW8H/Q==
Message-ID: <9da05c64-87bb-39c7-6c23-e4918bd5024b@collabora.com>
Date: Mon, 31 Oct 2022 14:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221028094317.29270-1-tinghan.shen@mediatek.com>
 <20221028094317.29270-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028094317.29270-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_062900_047336_AAB4293D 
X-CRM114-Status: GOOD (  16.64  )
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

Il 28/10/22 11:43, Tinghan Shen ha scritto:
> From: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> In order to support mt8195 pcie node, update the yaml to support new
> properties of iommu and power-domain, and update the reset-names
> property to allow only one 'mac' name.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index c00be39af64e..a9013c10131a 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -70,14 +70,21 @@ properties:
>       minItems: 1
>       maxItems: 8
>   
> +  iommu-map:
> +    maxItems: 1
> +
> +  iommu-map-mask:
> +    const: 0
> +
>     resets:
>       minItems: 1
>       maxItems: 2
>   
>     reset-names:
> -    minItems: 1
> -    items:
> -      - const: phy
> +    oneOf:
> +      - items:
> +          - const: phy
> +          - const: mac
>         - const: mac

Sorry, this looks a bit messy.

I can propose two solutions, either:

reset-names:
   minItems: 1
   items:
     - const: mac
     - const: phy
... and change the order in mt8192.dtsi;

otherwise, something like
allOf:
   - if:
      properties:
        compatible:
          contains:
            - const: mediatek,mt8195-pcie
     ... invert reset-names

I think that the first solution makes a bit more sense though, as the
PHY reset may be moved in a PCIE-PHY specific driver instead of being
managed here in pci-mediatek-gen3.

Regards,
Angelo



