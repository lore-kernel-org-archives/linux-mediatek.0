Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99CEC7115D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jun 2025 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXnVL91qAr27amWwcd40m8sFiTVa+yRW+gC2YjMHyzw=; b=VLMv+HmzcpxvCKTylrpmQIRA8T
	/1eju/D+QQxmNhGGiI+OX2LM9TNjOFcPYOeduABNDEHWlyRbUlb7gQR0RhdIwtu+8GPjCiPO70Vk+
	fXgDHZjxrfTdV8HDgIcC/Pe91oPFLbnj9yKjBhfZQ3BinCt4jcKGh+9HJSR5EVulYp9AG0e3H9Cuu
	AKJGeQ0JPRbG2eIpbGqkGZ1AP6qGKgNx7ePoC+i87GavAiAxkrt4JbZZ3/WID03t7D2974Ou7pw86
	aFL8jxqfWWLCAlv+K8cpMmb9PbPapeUwC3nYb+H/WL+oOmLmdKLSFUgKh3h/Hpyq9ysVyAf3EEoEm
	pOC2YCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZlM-0000000FRnq-0Ont;
	Fri, 20 Jun 2025 11:18:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ2b-0000000FLI7-3hHD;
	Fri, 20 Jun 2025 10:32:15 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uSYtp-0000000076t-3nSw;
	Fri, 20 Jun 2025 10:31:51 +0000
Date: Fri, 20 Jun 2025 12:31:41 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v5 01/13] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <aFU4jSUFjWJlJCWJ@pidgin.makrotopia.org>
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620083555.6886-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033213_923274_6961ABB9 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 20, 2025 at 10:35:32AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and 2 reg items.
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

Shouldn't interrupt-names only be required for MT7988 (and future SoCs)?
Like this at least one entry in interrupt-names is now always required.


