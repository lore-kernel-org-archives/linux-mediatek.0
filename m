Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B5CFB441
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leBRKW5Tq8Omlf06ng8jwZhTBDbTcNtpoHdbZw0Aqp4=; b=Zh+lgzIFeuMCTM
	3Fb4EfIhUmnTAR7PyIKqljrNQ7TQc7aHsBQZ2rYvzoeXtcgtRWSC2jkJjI/qiEc9VZwoz0y8mHSmg
	ycQeG4bUZwM4MHm54YH+CuH+rPJPPmbGCxtpIvfhutLklT9ReFUG13xB7sC5zX399fmrIx+uFPIJS
	sXSCpsz7LfehJkfyjxDfeQWViWXSW2QBJuDP4LWjFn4d7vNbHLsKpkTh3oOkfNNHHSLeEoUHtzE5y
	F8Vpo83DhGklPGGsXD0pAZ3I0KTnLBHJX1qmnQrzM/ef5lXh6n8KXzImbDclFGONg8pVOOMm1CuGn
	+DKQrZ6XIndxGj/WW1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxizw-00000001kDZ-0xFH;
	Mon, 07 Oct 2024 08:21:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxifl-00000001gbJ-2bAu;
	Mon, 07 Oct 2024 08:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728288051;
	bh=+5Ki3Qd+uQCkPFiAQomOVnbgyWWRRbTdJWTqhHlaVq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RjT9NDll8qfp1wjFx0DPdEJkWpdQKui1hxY2PaCaHV9TbAah1XFOEYX9ir6cPI6Z4
	 M8tcogeET2C6IzHyqoZvSiPruwky+1RM9m7ro8G48pudLC0J1At0IgME+MtjrjyDTv
	 meAqySur6PPaKEegLuzuEbVnFT4ixqkncq8YSc8va2dzuTnD48CY0+B/7iBH2zVKeH
	 CHPHmCkGngdEpKV5kgtZwh8WdYv5tCtWiiYTf41GO996NZejoo6SJKNuSSD/B4qeuE
	 sZ7vdTloIBTD3/YwSMxVcjUE8GqTiErPxKRGKl43YQypKKbDuMWTr/2mt3cEXMjbJ2
	 50uLKGa8rd/Xw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BF8B17E1083;
	Mon,  7 Oct 2024 10:00:50 +0200 (CEST)
Message-ID: <b41c51c4-775c-49ca-84fd-1137b61f42d5@collabora.com>
Date: Mon, 7 Oct 2024 10:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
To: Frank Wunderlich <linux@fw-web.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241006153447.41377-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_010053_873088_00B42DE9 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/10/24 17:34, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - fixed minItems to 4
> ---
>   .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..7380f72ea189 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -21,6 +21,7 @@ properties:
>             - mediatek,mt7620-mmc
>             - mediatek,mt7622-mmc
>             - mediatek,mt7986-mmc
> +          - mediatek,mt7988-mmc
>             - mediatek,mt8135-mmc
>             - mediatek,mt8173-mmc
>             - mediatek,mt8183-mmc
> @@ -263,6 +264,29 @@ allOf:
>               - const: bus_clk
>               - const: sys_cg
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7988-mmc

Are you really sure that you can't reuse the MT7986 compatible?

Cheers,
Angelo

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: Advanced eXtensible Interface
> +            - description: Advanced High-performance Bus clock
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: axi_cg
> +            - const: ahb_cg
> +
>     - if:
>         properties:
>           compatible:



