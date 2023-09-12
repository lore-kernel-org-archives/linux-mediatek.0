Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29ADCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qZAQL11LZbXLvA1F+aakZmt21/i5A/PMcXmHMfBllE=; b=lBMM3RYqxHGVGdyd185pMmMVP8
	kq5V/ZNbZu05Qdegg5WlDveW3YQsKxg4iIkpXbnjSV/wo/mJZdQ6qBf8ek3NPdwQdn9B8rRqrKj9u
	Tbj2DuUMD4L7d7KRf5p44mVnK1inCh78fyk805OakDdzrrmzMwSAwgu/4ISABfZxfNVAeFJKf/8t/
	971cHOZ5yC+26cYcPxfWXDJlYyno++GgyY3YCCVBp74tjJlOms4FOFKURrSCGOXjRI01/kwlc6Ho8
	PuwdOz+icX/oNeNXzZeuYq9qSBnUvNJrodHNSTWy7SFA/BMcyN4R0jXdwyc6uoc3NbIfwP9n+iHDL
	gv3YdrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyRe-002WNM-2m;
	Tue, 12 Sep 2023 08:08:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyRc-002WJG-2g
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:08:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdcade7fbso664882766b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506098; x=1695110898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qZAQL11LZbXLvA1F+aakZmt21/i5A/PMcXmHMfBllE=;
        b=WYOBqXdA+FJkAQWWUdv70nAOLZNvhlAc253Hl0eleSejP689rol3LKJDxC8PFkMn+z
         oCz6lzDG3dO4sU7+hZI/6F+QjoDC9ZevVWVx+VcPPrGEznKOcrOYk/Kewm/paxKx3gu2
         NzLfUbmMddCQsCQ7IejoN9hkqfNmvcsUGV819gA17cZQAcIBwCmgE+eBxL6obp6SEzj4
         elR+hlVVa/ZErEm+o97KG0tGIYEWRJz6AFUUyMbeYKeTBpJOV/VX517YNVTs1yu9K3NS
         zHgf0vRCigoV7j1aZfoZbay6l1YX3mA4yHwmRWjJMm6xYZRtofRuploRdO3h1VuL8lG5
         SMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506098; x=1695110898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qZAQL11LZbXLvA1F+aakZmt21/i5A/PMcXmHMfBllE=;
        b=FUed0QEB31SC+JydG1a1JNfPQi6iWo3qMoAfoB1j/SZeWUR9fmqDq1f92X/aUZ6N0F
         cSQYM7Dgrz1cVYSQ2FEFhLt1javoLFXySfrHxYb7Cd6tqRyVG5ZJTUzTMX5fs4TiI0P4
         OdEmMEsx2QSKG5dBNc+Wd5iV90N4TVZlvGFJyxTnt13I0Fp39NpSsJU55wTgwFJGEMUo
         Qk6udTXjGwV/h37i/9NKpVkJz8EQA69rA1BTmvOMDVS6Ea6tPH7qhQ1WgMFZi5rQRKxy
         sT0OSzxfGoGnigslGvIHN8uSD0EeV60wbr0citd5l2Sq51950I/bqS+HUERzUnfYXtX6
         fkSQ==
X-Gm-Message-State: AOJu0Yx3+55IuFbVqamT/tob1Ecxqwm6V3ZIuuVKvBcBoKX6jqhcciWb
	WrkIlZG7X5SMT7aQ6+FTMCqkkA==
X-Google-Smtp-Source: AGHT+IERPYwxvwxrtf7aXRvsNUYm+bKG63mo/Pw4/zuNJCPNP2RmbDeOAL+MxTrWlizGiTHGdWSVUg==
X-Received: by 2002:a17:906:328b:b0:9a9:ff11:9c60 with SMTP id 11-20020a170906328b00b009a9ff119c60mr8680971ejw.48.1694506097766;
        Tue, 12 Sep 2023 01:08:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0099364d9f0e6sm6416648ejb.117.2023.09.12.01.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:08:17 -0700 (PDT)
Message-ID: <22805138-e42a-cdd0-bc96-5281f0e2c586@linaro.org>
Date: Tue, 12 Sep 2023 10:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: mt8365-evk:
 update compatible
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230912072340.22862-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912072340.22862-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_010824_883903_D0959FCF 
X-CRM114-Status: GOOD (  17.93  )
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

On 12/09/2023 09:23, Macpaul Lin wrote:
> Fix compatible of 'mediatek,mt8365-evk' from 'enum' to 'const'.

What is there to fix? There is no bug... please describe why you are
doing changes.

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> change for v2:
>  - rebase this patch to follow the v5 patch set of mt8395.
>   - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
>  - Fix description as a single board.
> 
> changes for v3:
>  - rebase this patch to follow the v6 patch set of mt8395.
>   - depends on https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
>  - drop "Fixes:" tag in commit message.
>  - drop platform description update for mt8365-evk (Genio 350-EVK).
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 2e8ad49c3479..bab4fa0e8199 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -245,7 +245,7 @@ properties:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
>        - items:
> -          - enum:
> +          - const:

Obviously this was not tested... Please test before sending.

Best regards,
Krzysztof


