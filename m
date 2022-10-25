Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C256DC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlN3QSWUOtiCvIik0MWNIsDr5WtZqkxkxTJQYsKy3Sk=; b=CyyCFQn4RBofeNaLqKNVChqPW7
	dOYWfuNGPX+mvqMWqbv6Lp60B234ndsebB5ztflAyW0Rzm++4yMrDpEHuMb9O7SHJTSmWZ6u34J+E
	E5ey/hBIVFt+0ZzPA7UnLqWakD1I979Mj8vZjz2wJfLXNq7dG7j1Nu7QPgyG7NaEKEQTTqcsIowZe
	1SLQabGc5nr2xrRW9Po82E7qmwhQXodm8bQ3i9l+1ZBNYhcSqTi9dNn1KHdy1ieyRPof3/Uh4DkC7
	9cvzubmTuIHb6A+SeEeoxF6f+Ri3qUXGvKKdX1qBRCeeuqUH5dXYLLvzZPDVhlyzxb2/1paAvJ4rW
	lNVbkfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHq0-004x4B-8U; Tue, 25 Oct 2022 11:11:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHpn-004x1X-31; Tue, 25 Oct 2022 11:11:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C229D6602363;
	Tue, 25 Oct 2022 12:10:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666696259;
	bh=wUzXNP2554vw1kifpUJL6eaLTVMshR1MxYNA6by4EzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bQjtAhXTWZEzWSb+blobyNbH+w/nBH91kxBzhBQmcTrWeWOV2jNfxWEeVag77fRb+
	 I5XEZOTyi8Gt2beznmq2vcKlDrumy7kXeVEI5oVvSRkHZL3AS8IOUryl/zzntQKDSR
	 2rAjpdHTphT+7wir469slnKFVY1JuXILXbSDbWFr9grT3cygqMIkJWP0IaSz8+dMA2
	 o6SyxK9tqqLyHSltatqW8L24CmQqyFEelNPfQUR1OzA/SDSF2hm+BQ4IeOdCVnICbr
	 /JbuKdGABjIL2gFp7/ih7fFqCiPz848r6LouRDS2nAo3pxCYg6avUdxZFE2A+eI/Gq
	 aiCHa13yUt/ew==
Message-ID: <22728b06-f460-6dda-21fa-1d7a7ae3b903@collabora.com>
Date: Tue, 25 Oct 2022 13:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 2/2] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
References: <20221025072837.16591-1-linux@fw-web.de>
 <20221025072837.16591-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025072837.16591-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_041103_293090_F7E19C0E 
X-CRM114-Status: GOOD (  18.04  )
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

Il 25/10/22 09:28, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string and clock-definition for mt7986. It needs 4 clocks
> for PCIe, define them in binding.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - squashed patch 2+3 (compatible and clock definition)
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 98d3f0f1cd76..57d0e84253e9 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,6 +48,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - mediatek,mt7986-pcie
>                 - mediatek,mt8188-pcie
>                 - mediatek,mt8195-pcie
>             - const: mediatek,mt8192-pcie
> @@ -78,9 +79,11 @@ properties:
>         - const: mac
>   
>     clocks:
> +    minItems: 4
>       maxItems: 6

I'm not sure that this is really correct.
If you have a list of items (const or description, doesn't matter), you don't have
to specify maxItems, as it is implicitly equal to the number of items.
Also, specifying minItems means that you're "setting" one or more items as
optional.

It looks like you're specifying a specific and definite list of items for both
clocks and clock-names... and for all of the supported SoCs, so, I don't think
that having {min,max}Items globally specified on clocks, clock-names make any
kind of sense.

.....but I'd like for someone else to give an opinion on this as well.

Krzysztof, please?

Cheers,
Angelo

>   
>     clock-names:
> +    minItems: 4
>       maxItems: 6
>   
>     assigned-clocks:
> @@ -161,6 +164,20 @@ allOf:
>               - const: tl_32k
>               - const: peri_26m
>               - const: peri_mem
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7986-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: peri_26m
> +            - const: top_133m
>   
>   unevaluatedProperties: false
>   
> 


