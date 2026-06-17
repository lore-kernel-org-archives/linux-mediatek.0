Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98682CD98F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=; b=i82QYCs4J+1xaSHSnZONcY5NAe
	3F+NJ5qbZ9e6xpEnSDdE0LsD6tCjJzP7vOuDCeGD9ZqbtIAGSDE7l8ajf5feMyxeUon6sDwZWTWJ3
	yI9NnhcCzgv/GRuXJqOnn+ihUi3PPJxHRNH4D8ZlLRwt6OV/rv4JuRuy9X+7tOpm5IwAUUreAV9Zj
	j8PMlWaiC3Tm4MsYIweGnWL6BXvhhJS9DuD6XfIFFURHlpt24ALJiYKPbSLqwuXOBiGafKkaz6Llc
	zU4oZrPNjpD0g4FYPF9yaVjlUaQ0LDjDl0jnzFfz38s8MNLoh9+LdNfEeQrA0/gA2tUHI+ynxp7t2
	zBhiscmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwDB-00000000Gmo-2g5D;
	Wed, 17 Jun 2026 19:46:09 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwD9-00000000Glz-26cS
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 19:46:08 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-13981833e13so198021c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781725565; x=1782330365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=;
        b=PAzd9LoNVEnrdLQhbT4Cp/VMnQF3CX7plyMJyxbRmtaykrTepLJJ+Nb92GabCi2BL0
         ZeeXw1ZWyGoTd2jjHYLbTuLA066yhXHA1v7YrDQnMPhcClx3bf+gCiqB7+DZxepL80bm
         V5047MyMkhVMZ8clw3xZIRMcT+j7TulyBssSFdpc4vlAWEwRRpRb/tc1dTNUNV794cc7
         aXcPUq8yj4noFHXyeucwp/aRMAVW54SrmNdKWKEUskgUu76ApNGYNCwG7RKONgakLc8j
         gJyJBrND5uUHsNRWMBx2ZL0DqBKWJunFsaVjbANec7XpKxM5ZXFMGTVcYxkGMnq7MMOE
         W8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781725565; x=1782330365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=;
        b=Htg/Zkwv8mr0zbMEQ+TWtaoPInjTnEHrLGwH9htaoRI0WnPrgyjCUgkHScn+NHR9jy
         CloUZXsgrhekzkCsRZrdPKBbYw4xVolZEqO+JNnLkqmy4or7PIbqDVs+H2cC5HGXJt3g
         yq2wX2bFph80iSNOZ1X+fniceCpdUu9VmOykG+w0S80NZw3RrdCIJQwn3TTkLJVVb7sA
         H8samfUN3RJJtVGghJTAFQy0GmubQJbhvL2zxNIw13Yr4KRR5akDTejarOgeoq4XL2IS
         Sd6sGDTTISH81qeNU+QMttB0qC5vVRDI+TMT6t2Gilc1WGgjXhTN3VrFHJANyUmEXZvR
         kz6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/aqyE3US0sFQd91rYtgaUPC+8SSubJnXrDfiOXBlh4APcQD06unjgOYU9F74N1zgoHk1qQnwQv4mcnxWZfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS7LG055MZvBWhHGyVO1H9dMu4z0NsrHq00bmQWFm3d7vqBW9a
	5Aq0Xq/gk9BLQ4IZjKJdMH9FDpjRxtpXT/j+aLxbpZCH9N76nBJsivyiVWBKS7Ya
X-Gm-Gg: Acq92OFGt4KkiqJCauFbZ8WOBehzXcvzPVAJSAaEH4soIOfHWzP/Fp9vm/qMYy9RMrG
	Y6Swepedu60j+RYB53DugmtzuK7P0ow4xdSwzpm8MjNbB8Pw3qZBlnQcobFGDmBn00xnEs78PoQ
	kh0YQkhUK4w9dJkyKOKeGVfljJP8eOIwtReQWd/P0QahOvACPqcObLbVxpJ/fO1dp4tNZFdeUDb
	+hUgZy0H3Ryxf9fgQFdJgmnxy9OQnuviP+scQVF8nZBRWgjUbqLSE+aH4ID/tLDsCeYJcmoaoT6
	xkMtCxCGfnSFYScwoFavs47v4CyMAXopPFGvm0MKq/EvDwKL9K0XVF6dB48Mk38PL1+2/k7C5sJ
	dDLvqwqpr0JRpSv8qD+/RPQ24ljrnWoRfogqMnbddjrxKzoIyYUmncgVdcym+m1n19mSZnCOohe
	X77+x8ym3FPJfV8pexG2qSnhL0Fstb7LDu1ggHxFc76A1yGpklyVXTc+fwcrlaH8+jqGlzS3wt
X-Received: by 2002:a05:7022:fc07:b0:137:ea00:3f49 with SMTP id a92af1059eb24-1398f6cb641mr2356917c88.35.1781725564958;
        Wed, 17 Jun 2026 12:46:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm24167978eec.27.2026.06.17.12.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 12:46:04 -0700 (PDT)
Message-ID: <13836c1e-8f38-4cd3-aa7f-da7c9caf15d5@roeck-us.net>
Date: Wed, 17 Jun 2026 12:46:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: watchdog: mediatek: Add MT8127
To: zkh1@proton.me, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
 <20260617-mt8127-amazon-ford-basic-v2-1-6859e29e72a8@proton.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-1-6859e29e72a8@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_124607_550396_45C5BB29 
X-CRM114-Status: GOOD (  13.15  )
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

On 6/17/26 06:36, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh1@proton.me>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>

I don't know if I am supposed to pick up this patch. I assume it will
be picked up with the rest of the series, so

Acked-by: Guenter Roeck <linux@roeck-us.net>

for that.

Guenter

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 953629cb9558..e6e4546da0aa 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -40,6 +40,7 @@ properties:
>                 - mediatek,mt7622-wdt
>                 - mediatek,mt7623-wdt
>                 - mediatek,mt7629-wdt
> +              - mediatek,mt8127-wdt
>                 - mediatek,mt8173-wdt
>                 - mediatek,mt8188-wdt
>                 - mediatek,mt8189-wdt
> 


