Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE1AC3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2VJWHRifEiKGRApncgX7oEiPpK9ubdZKSTgq0xJ+2o=; b=OUKBs0matcKc2JKgpIzqW76j+h
	dbntbBqAgYHJRi3fXVpdivchLkG98ZyHJodqrjCVxyBb7PQ/6N5IEiVGmz6xYn3WNv+tskRnU9HMS
	39wqYz29GEKRqkvbRfxdg96Raqm116vrCNZ6UkFckqPX4bhrlyoQfVgBKmOnRFpwXTHbls2Ss9vjQ
	Jv/Zhx1n6GdpStE1GKY9qb8f9RvZQhacuo+Zvt/iI6JIlZ6Hs4fRe854y3qDsTXL4zPuUGS7pu4nl
	HVj6c+dkWg2i3duoNmYqyf7c1CLveQCTcHv24yh8di1QJnOWMf9TUkDmwgBsn7L3Hhp2gVNc7tUas
	E//7/9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYigL-0000000EOlb-3eao;
	Tue, 30 Jul 2024 08:58:09 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYig0-0000000EOd1-1clF;
	Tue, 30 Jul 2024 08:57:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BA8E40005;
	Tue, 30 Jul 2024 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1722329861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2VJWHRifEiKGRApncgX7oEiPpK9ubdZKSTgq0xJ+2o=;
	b=fCxrDxVUm1f+Zwa3unaOLYjwweb9sg9AwmaoF6WdWlhzV13ieQUJElK0NCDx7Os2TYO/Oz
	DUEP0VH2IYYw4Q6jNwSrfcyFRfFyc2ir2NvmDFyzNrtQMRFmVXJGTj61pxw0RclYcsLgED
	XHmrds4xWupsH3ThdGAB2fB6fDB9uD0ozEpojfc9HpRNPXsJzf6nwG6brZzOwnvEgnApJ9
	1rwbRYkCIA2GUrAKtI30zPDRduL1sqQ0cA1gVDvhHB0YwiEPXKkd3URPfhs+xkWa28p9Bm
	JDmURk/6rlul3wRL9dsfF0w6PnXFc4/HwaxJo66XOK3eZU4atQgUGQTOsRHjuw==
Message-ID: <3d0e39a3-02e9-42b4-ad49-7c1778bfa874@arinc9.com>
Date: Tue, 30 Jul 2024 11:57:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: Add
 airoha,en7581-switch
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
References: <cover.1722325265.git.lorenzo@kernel.org>
 <63f5d56a0d8c81d70f720c9ad2ca3861c7ce85e8.1722325265.git.lorenzo@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <63f5d56a0d8c81d70f720c9ad2ca3861c7ce85e8.1722325265.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_015748_639460_D1CC67AD 
X-CRM114-Status: GOOD (  11.91  )
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

On 30/07/2024 10:46, Lorenzo Bianconi wrote:
> Add documentation for the built-in switch which can be found in the
> Airoha EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 7e405ad96eb2..aa89bc89eb45 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -92,6 +92,10 @@ properties:
>             Built-in switch of the MT7988 SoC
>           const: mediatek,mt7988-switch
>   
> +      - description:
> +          Built-in switch of the Airoha EN7581 SoC
> +        const: airoha,en7581-switch
> +
>     reg:
>       maxItems: 1
>   
> @@ -284,7 +288,10 @@ allOf:
>     - if:
>         properties:
>           compatible:
> -          const: mediatek,mt7988-switch
> +          contains:
> +            enum:
> +              - mediatek,mt7988-switch
> +              - airoha,en7581-switch

The compatible string won't be more than one item. So this would be a
better description:

compatible:
   oneOf:
     - const: mediatek,mt7988-switch
     - const: airoha,en7581-switch

Arınç

