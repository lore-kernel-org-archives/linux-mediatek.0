Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754EB103E171
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QF+Mc0F+aOnGEPMzgcMrjlqOHUTfrQBIkePOLMRwMs=; b=cvU12fRgcN2GxFGLyOsfN4Pn8y
	yl+uLqaxq5aGf0FD/5fIS0bQQSR+OgzPZHTpOWmm7XVkREvXhiUwS6FPgGR2NZJ4i0rw0APsurgeH
	2TXVUdwNbTUmqCtUO+0yx16mliXltdx+x/cXSTjFR3ZSq7vFhjckcGDIW+qXMRLwbKrRjcAx9OPEz
	HG5vRZb7VXdvpr44+nW6L1q+s1/0nz+XWw846B9EfQeFHMeRNbId09r8neYQMnc922axGQocb2BeS
	SYp25f8g6ssL5FMF/IDuUXngtT5yeua6hVQmmaM3adTNadVt9EB2VTpYiss9roZ0BcpZxsoTO2CYV
	+0E9FJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBL-00000008PFE-1ESy;
	Wed, 18 Mar 2026 12:39:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qB4-00000008Ozm-0zGz;
	Wed, 18 Mar 2026 12:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837547;
	bh=/9GsD8Paw2FG8zbS8w+TdnFQsZUhCwbrgaXvCp6ENE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oavHusXkCkB7Kqa5VC0x2RW+xdZIuSLE32GVO8SOJWcjAeukEHxn/HEle9dvPQjZo
	 YpmhpbYQVnKYqeeVNjitJTwB0xV3NmVNNNHFDGYnJ+6/iVWpp17z03ZLMHHP2w5lAP
	 8CX2myd0Eu0aRHM1KQkcsBtgmfMMHCLU3xWiUxQFf4P1NWXRy3HYZN/XjjyNUy9mtA
	 TQ5v/x+GT5ZnIHt8KpnaFukD4BZbBaLM5YRLy9tIvYJNuYneJkphNfV7+oMw+2Pxro
	 lzUU8XFTTB4MOGPiglYKWWa6PtnxlSvNOQVlN71YVkhj05JkR4VF4Zzm5wlJgoRPI5
	 ItYnGPP27d/9A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1426617E1330;
	Wed, 18 Mar 2026 13:39:07 +0100 (CET)
Message-ID: <8e1ce45b-e001-40a5-9b20-b113e3e6ed54@collabora.com>
Date: Wed, 18 Mar 2026 13:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Julien Massot <julien.massot@collabora.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-2-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053910_428297_AE9EBB66 
X-CRM114-Status: GOOD (  12.38  )
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

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10f..22b09e148d7c 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>             - mediatek,mt6358
>             - mediatek,mt6359
>             - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>         - items:
>             - enum:
>                 - mediatek,mt6366
> @@ -68,6 +72,10 @@ properties:
>                 - mediatek,mt6331-rtc
>                 - mediatek,mt6358-rtc
>                 - mediatek,mt6397-rtc
> +          - items:
> +              - enum:
> +                  - mediatek,mt6392-rtc
> +              - const: mediatek,mt6323-rtc
>             - items:
>                 - enum:
>                     - mediatek,mt6366-rtc
> @@ -92,6 +100,7 @@ properties:
>                 - mediatek,mt6328-regulator
>                 - mediatek,mt6358-regulator
>                 - mediatek,mt6359-regulator
> +              - mediatek,mt6392-regulator
>                 - mediatek,mt6397-regulator
>             - items:
>                 - enum:



