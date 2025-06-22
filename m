Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74340C7115C
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Jun 2025 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To6WKTnG92ajj8g2vY426mdv0WJu07s175PyvmJMI+4=; b=kN2ki4wHvLuPEq6ZLadm4Bl4B8
	SDUnkSc6vWnTFSOdLnlKIo1AF9C/SD0nSBCxIu/wWUoI03kIz8rv4Fov2SQU8KDMv0ypvQ7+4nNzi
	1HCXF/wQ9ylWW5GQHsBq7GMkTZM0uvhWGTRvBhE3y6H3Hw2olDq6kdYk3WkYraI7z4MH45GWNfpCP
	Ne13faA+fDvcriOOyh/VBfnWSGTDTR0/wTX9cI6BJRhQRo4dVn22Q5swf7/FdWmDFC/6NH4XQMgxB
	tqwEyVq8cQ/m4Hz0VOFqm1FPfSHGeQnTT18iZIbvjqE7WCmrAL42qM/n6SfPNRY5Wns2kpw/iTNpJ
	Fb9XUOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTId6-00000000mS1-18kn;
	Sun, 22 Jun 2025 11:12:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTIap-00000000mLJ-0ID8;
	Sun, 22 Jun 2025 11:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 506684A52F;
	Sun, 22 Jun 2025 11:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C17C4CEE3;
	Sun, 22 Jun 2025 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750590634;
	bh=SquEoMF4Ojm91fEhjojZdEJetJ1zLr5YjCcUnaPIAHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1VXxJXWSSBzEIPtqVvf/hnqEgwCycIjmcxBEkg5X9IMdcf2wRjbtDg4/yeiXroI5
	 o/SC/iUfxuSrtSVYE5xpCjjwDpLo0AJ6Lt2Z0XnYBSE353H6IsmYM8JIB3THRnA8Jw
	 RDUQAm7sWFmh42e3/q8OBewyDiu1TJaEa1wfHgJ1L/HFw1Hpgz2/5mW1+dNOw01R0n
	 t9jfWOEHmAEn+E3rgOQhLudKl7nNBvkJZr6SHK+6latWMkC7jXRbGGpYiDAotho+Wt
	 ZVng5qgR9VwOKkXOgOCN/rSEE0Xk+93+8oSuA0UvqBhwPnAIIFwpy47JBTMt+8Vamm
	 pf4CJaCxun2jQ==
Date: Sun, 22 Jun 2025 13:10:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v5 01/13] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <jnrlk7lwob2qel453wy2igaravxt4lqgkzfl4hctybwk7qvmwm@pciwvmzkxatd>
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250620083555.6886-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_041035_153630_8C1748F8 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 20, 2025 at 10:35:32AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and 2 reg items.

Why?

> 
> MT7988 has 4 FE IRQs (currently only 2 are used) and the 4 IRQs for
> use with RSS/LRO later.
> 
> Add interrupt-names to make them accessible by name.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v5:
> - fix v4 logmessage and change description a bit describing how i get
>   the irq count.
> - update binding for 8 irqs with different names (rx,tx => fe0..fe3)
>   including the 2 reserved irqs which can be used later
> - change rx-ringX to pdmaX to be closer to hardware documentation
> 
> v4:
> - increase max interrupts to 6 because of adding RSS/LRO interrupts (4)
>   and dropping 2 reserved irqs (0+3) around rx+tx
> - dropped Robs RB due to this change
> - allow interrupt names
> - add interrupt-names without reserved IRQs on mt7988
>   this requires mtk driver patch:
>   https://patchwork.kernel.org/project/netdevbpf/patch/20250616080738.117993-2-linux@fw-web.de/
> 
> v2:
> - change reg to list of items
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 9e02fd80af83..9465b40683ad 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -28,7 +28,10 @@ properties:
>        - ralink,rt5350-eth
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: Register for accessing the MACs.
> +      - description: SoC internal SRAM used for DMA operations.

SRAM like mmio-sram?

> +    minItems: 1
>  
>    clocks:
>      minItems: 2
> @@ -40,7 +43,11 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 8
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 8

So now all variants get unspecified names? You need to define it. Or
just drop.

>  
>    power-domains:
>      maxItems: 1
> @@ -348,7 +355,19 @@ allOf:
>      then:
>        properties:
>          interrupts:
> -          minItems: 4
> +          minItems: 2

Why? Didn't you say it has 4?


> +
> +        interrupt-names:
> +          minItems: 2
> +          items:
> +            - const: fe0
> +            - const: fe1
> +            - const: fe2
> +            - const: fe3
> +            - const: pdma0
> +            - const: pdma1
> +            - const: pdma2
> +            - const: pdma3
>  
>          clocks:
>            minItems: 24
> @@ -381,8 +400,11 @@ allOf:
>              - const: xgp2
>              - const: xgp3
>  
> +        reg:
> +          minItems: 2


And all else? Why they got 2 reg and 8 interrupts now? All variants are
now affected/changed. We have been here: you need to write specific
bindings.

https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127

https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml#L39

Best regards,
Krzysztof


