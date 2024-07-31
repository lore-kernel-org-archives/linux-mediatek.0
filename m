Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860C3C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFikKRS+bowyNaOqGax/9L5/k4tghWQJ/C6z5rApaDo=; b=FBYMoj8/wIBzwV8nCpAKWzQJ3L
	jmv2guS4pAF8nBRvxqD1dctpG3bxRm6JWBk+NZavhdXoMs2tNZ2x1vYS9y5JYUDqpU8Mc4DPsSnIE
	Cyo4k2u335rcbg9h/nzBrTUwQdsMmzD5p8k/hKmWIj7tyWXVLNmzusAJsnaBwrIziD/btGy5USh9B
	4Ab+EEudraDOf5pxzX3SbXW+KTYpau6vhD2B/vlf7ijdR7hdFNNxvMa+QJkKBv0V+QY6zkzUegkLE
	gWu3wmXeptXO/a80mDuMyijaYyUG87ZoJziiCNOxHrEzvXjager8/SCgKibEKsnTjB4jzBK0E37Yx
	4h5EufaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4Zg-00000000IL1-0omb;
	Wed, 31 Jul 2024 08:20:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4Yw-00000000I85-0tU8;
	Wed, 31 Jul 2024 08:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722413996;
	bh=mrhS/CCOOLZe9KQcoq1oQixTFVyt0KJQA7x9+zGR/K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ex5C/Yg7cE3mf8MoncxyQ8zZv7dkOOubpQA0xVjlLHlRZN0moIPuegQyZMWxZLR1C
	 ILgzNQAdoIOJ9waU0cbz9b5D15Ggb4I3n9PIAxzEaOnB1WgYd5AdPU/qYiP+13VR1K
	 hpgRidRV5LAqeGrVcx55LiVXqb2tGZvaRfRRG32zwDUGKA964buoKYV7XKDUNHaWrI
	 5KNDC/ypO8R32WZxz9fhePPgsK+i+McMaTAsiIPfkVbrWZUXpH95YIIdH4M5tPSUSs
	 cUrB4nKMV03GDvEJSliA4Oh9jasyqXfQ0pta9c51dozkXuoZtETBtCPgYx1EYrzpPP
	 ILiDa1lCMpmcQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06B9E378000B;
	Wed, 31 Jul 2024 08:19:55 +0000 (UTC)
Message-ID: <a5d5d7f1-535c-4139-9cfb-b4e4fffc3083@collabora.com>
Date: Wed, 31 Jul 2024 10:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: arm64: mediatek: Add
 kukui-jacuzzi-cerise board
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
 <20240731-jacuzzi_dt-v2-2-4995335daa30@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731-jacuzzi_dt-v2-2-4995335daa30@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_011958_578437_14D5AC93 
X-CRM114-Status: GOOD (  12.84  )
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

Il 31/07/24 08:26, Hsin-Te Yuan ha scritto:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> They are almost identical. The only difference is that Cerise is a
> clamshell device without touchscreen and Stern is a convertible device.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..087773a43673 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -146,6 +146,20 @@ properties:
>           items:
>             - const: google,burnet
>             - const: mediatek,mt8183
> +      - description: Google Cerise (ASUS Chromebook CZ1)
> +        items:
> +          - enum:
> +              - google,cerise-sku0
> +              - google,cerise-rev3-sku0
> +          - const: google,cerise
> +          - const: mediatek,mt8183
> +      - description: Google Stern (ASUS Chromebook Flip CZ1)
> +        items:
> +          - enum:
> +              - google,cerise-sku1
> +              - google,cerise-rev3-sku1
> +          - const: google,cerise
> +          - const: mediatek,mt8183
>         - description: Google Cozmo (Acer Chromebook 314)
>           items:
>             - const: google,cozmo
> 


