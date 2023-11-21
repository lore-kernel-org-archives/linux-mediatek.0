Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE16C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urB8foVn6fjnZviJ/Z1U5hvcnT2kB6CCi19qV315oHw=; b=ptzSeCFhmUJzTjX99knTXZgkjh
	K9VpZKSSs1AMVPa2nCeWNTrQNe/AWSyDQWV370Us6VfRsJNwWHZXATguOxMK0e+EzobEFXwjShYDg
	aNF2GJWxqGoZ4d+WqiWCasSJ5YzAueBspgbIOH9YyXo7MGyyutTL4vuMLwOFiOmHGVrLcfOBTSk9O
	ys3hYAMVPVkjpOUEFphvFNGzDYEqrEj4d0HnUmvv0hVyTu8m++woofCSTE4WpjJMNBOyN08ZePOGI
	5tbj1OLTgB1dLzavJJdcjzTVud+pX0IPKJReQGfNwYkud82dw7/NgzwwihF/QZ9oz4gVdp2wbYptK
	bBsQZCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5O3b-00GGgr-1J;
	Tue, 21 Nov 2023 10:32:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5O3Y-00GGff-1y;
	Tue, 21 Nov 2023 10:32:37 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFF2066072F1;
	Tue, 21 Nov 2023 10:32:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700562753;
	bh=6QRCpa+LpHtt2e+x4B/bsyiQHgeK35mHv9WQjcBnRjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=k88kGO99Z3VLxoAXkOj+GxGNP0Tb/RSOiUBHLx6iwWzYROeFzsjZxFK450FWUuBte
	 Z5xbwcbOATBnOl9VnDU8SF2VoVAe1W3yq+mPMdGpOrrfDszxxXrPuTC4iTBHakI1WV
	 iyGICGqNcsL02NkiVR2hjbk+TwZIvGtKbwsyCI0o5CkU+/8WzHXm0j2I8I5gOzBbnr
	 F4FEzlLRMTrB9TKSHFQvjz1j84t59bZhhGRLjvySkfrOyPQp3mwUaZH2fzXEB7+Dp7
	 mcGN5D3lIg5ReDQxpyE6l6+sUcfxDi58qJCVLn4PYe9l+94OY7Wa7r2rvUQEigIQ7M
	 YIbwtv5wVyKKA==
Message-ID: <318d602b-12ba-4af8-9cb3-24498559c254@collabora.com>
Date: Tue, 21 Nov 2023 11:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT7988 watchdog and toprgu
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_023236_774905_A464E13A 
X-CRM114-Status: GOOD (  13.03  )
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

Il 20/11/23 19:21, Daniel Golle ha scritto:
> Add binding description for mediatek,mt7988-wdt.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v4: no changes
> v3: no changes
> v2: Drop adding include/dt-binding/mt7988-resets.h as that header is not
>      actually a binding header.
> 
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>             - mediatek,mt6735-wdt
>             - mediatek,mt6795-wdt
>             - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>             - mediatek,mt8183-wdt
>             - mediatek,mt8186-wdt
>             - mediatek,mt8188-wdt



