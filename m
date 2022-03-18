Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jagX5W1RAANpsNhVDnHH+9IIvcUG5Aoi6hMx8EGvQic=; b=PYlu1RcCLPJFTW
	zREj7WpNrv2zwx9fnT0bYfF0WUZln3Ej1BxZ8NDqC1hqCClFu2y7+cOyXGQe6+ez5K/rSXbKNlYX6
	R9xIblkqzWd0IrcMmOOT48/PHsqsBql+6U4nNhqmEW2gdZZLJKbnXk00q1LomuTaRSowYbPtoZGUE
	l7LpTrbdvjvT1ouU45+sPb/9v46PRpuju6bggPNKamNZGU+0TvlfIy2sw65CQnln1/ACYfoMOBe1D
	xgBWl3vmQABWC3zDZDBhSIB3OTXjbChpBRl+vS0RdgcGcTF0uOMpNpUkAgGc0TtPSamYxXDLv2kNq
	m6GLnFXzeCai95N6OguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAo5-001Ocq-RA; Fri, 18 Mar 2022 11:30:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAnq-001OWx-FG; Fri, 18 Mar 2022 11:29:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C12C91F45BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647602993;
 bh=hEq5CQBIYDpOSE8rYqrF9Pr2CGQ6yjPai9TP2Z1F2Ww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ix2SDlHuXaTogi0wYj6ufFFJZqPuqpM1n79MzBo8NDi4SOUeYE4KyPND+KBtoxNmE
 voxSeyzl2PdqfO6XlRk6356TZ+I1h2JCsTCb/QdIhj7JkUfcecDnrAwU5TkLMwVpzE
 GvAG4jN6U8A1zYZTaYmJkbgKyMOjNprrMBh9MnL/t/E583gZWGzzBms0Zu1ekJRBpS
 ieuH0seSPBh48BSLPxrU4d6o/7iXw3UL11WEedd7wEGoTvk9X04i3Ru3C1E0iEKENf
 0GCOFp+98JmOiFyIhYSe1iXg0GVQQhE1TGwOOmA+4FtAAokELo89Cp071lVVAp1Yz4
 EigmWM14xVyXg==
Message-ID: <fc5f0554-dc37-d514-039c-cfacbe407813@collabora.com>
Date: Fri, 18 Mar 2022 12:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V5 2/3] dt-bindings: spi: support hclk
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220318025027.31281-1-leilk.liu@mediatek.com>
 <20220318025027.31281-3-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318025027.31281-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_042954_724947_6A06132E 
X-CRM114-Status: GOOD (  13.28  )
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

Il 18/03/22 03:50, Leilk Liu ha scritto:
> this patch support hclk for AHB bus.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 7247a177466b..ecb4a5002cc1 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -53,16 +53,20 @@ properties:
>       maxItems: 1
>   
>     clocks:
> +    minItems: 3
>       items:
>         - description: clock used for the parent clock
>         - description: clock used for the muxes clock
>         - description: clock used for the clock gate
> +      - description: clock used for the AHB bus, this clock is optional
>   
>     clock-names:
> +    minItems: 3
>       items:
>         - const: parent-clk
>         - const: sel-clk
>         - const: spi-clk
> +      - const: hclk
>   
>     mediatek,pad-select:
>       $ref: /schemas/types.yaml#/definitions/uint32-array




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
