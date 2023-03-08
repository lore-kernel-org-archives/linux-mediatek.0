Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D72C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t11cxmne+0VdAolMvDq/xltshYeH2IXmpwmlXchwk3k=; b=xztWlUcPZHFKCuc+nWbArgCSWx
	2zUIrKtkxpofFQrNCPs5eCJBJuh+gYLbKzIlM1cWCIO73hvLZD987bzyguVoOPW7qe0z/qQabxv8x
	rkfZ+T7mFty0d0TpRY12Wgo7zDKpfhNeF4jUSodAyymEEi5VRj8txKo2aASxJ/gxt/kQiFIjWv+/M
	L+waeJ4dwiDpIzrV7kGhJw2rc0DoATrN/C4/uUqYpw9O/z7EcE4gtC6ACeaUF9If1CVK4/7ZHf2og
	dq7SEWl5k3Fzi9ZKBxiyeFf5B0NSNb5tLQnqKId4Yhhs30XR1GjmS4DinXo2EZMxx8DIkIO1iOJ6Q
	6IuEU+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz23-006STw-JU; Wed, 08 Mar 2023 19:00:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz1q-006SMj-08
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 19:00:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id j11so50217236edq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 11:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678302044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t11cxmne+0VdAolMvDq/xltshYeH2IXmpwmlXchwk3k=;
        b=AGLZkhWFlMA8ZWIjUlo0+w3j+VFetWhvUJxpWk0y0IoM53AD4KkK9U4PLEdndBDqQg
         xu5jkIFSsnXO74ausz2POBUYhA7DpXBG7rJIc4SXzSBYunKc/Uq0Y848Fi0ibHHV/t5n
         MTQPTJxKtdipKusQ+0r6Ct67v3Uhl12P3UszYAS9WvufRH08OOT4Ija27PAYJQRdXlKp
         XZNnumm6spmdNIbzNbaDDPOLazEWmpj0RwawvbRfKEcEXr/FwTB8KDX7I7koQNrwq5cO
         2NnwC/96XcIxWGgxA/jq9dJF5MOv+mIIfBpddgzLuiAxZeAWBbrYLNKr0ssGSGaGbQxJ
         B3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t11cxmne+0VdAolMvDq/xltshYeH2IXmpwmlXchwk3k=;
        b=xVmCEOHhGqvMxZCTymQvODp3xAZJyjMAYKlhZLZr1/WbFSS8sKC9PD8RmnCOXvQ7lQ
         bcxiPLoBlHTRQf4zf+JkDU//t5QO6+AXVOIof7MBGxksVT6oI/de48g+CAIbmWgctx3W
         VtidQcx+h57A3FQXYXeNc1kXmLxe5S0+5tv/o8WAKHvgiyj/tAkR8h9YSOSh3KC6OWBb
         0k112NcoD9ixkAJ7dPJtMcNlfX2eqEQnuCnGLN2COEkpmvwZAyv/nWNZC/bXvQ1rz5sF
         NOGGQBBMpa3g9bgMfLoc4OIpdWoHj7mZX3brC7QVBANfIaCFN7uBixYmp83FGACiY/Pw
         xYoQ==
X-Gm-Message-State: AO0yUKVvYdwOdP3vnFF+94UFsTXMhXsiAWTEpIJ9yj/tPThY/WZoGoHZ
	7cqGU5h68yMMrORUKqxGfyA6Sg==
X-Google-Smtp-Source: AK7set/+5jp0MA8IXZg5DhthNgI1lxVOkSh+a5PHrXyYyfbVxm4Qz0kTiahcu3zvWUYmETajoJJw5w==
X-Received: by 2002:a17:907:7e9a:b0:88a:a27c:c282 with SMTP id qb26-20020a1709077e9a00b0088aa27cc282mr25411368ejc.47.1678302044260;
        Wed, 08 Mar 2023 11:00:44 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id dt2-20020a170906b78200b008dcf89a72d7sm7955386ejb.147.2023.03.08.11.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 11:00:43 -0800 (PST)
Message-ID: <def9197e-bb3c-b9f2-35c5-168b632ef93e@linaro.org>
Date: Wed, 8 Mar 2023 20:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add binding for MediaTek
 MT6735 power controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230302122708.73848-1-y.oudjana@protonmail.com>
 <20230302122708.73848-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302122708.73848-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_110046_079359_2514B583 
X-CRM114-Status: GOOD (  16.82  )
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

On 02/03/2023 13:27, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT binding for MediaTek MT6735 SCPSYS power controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/power/mediatek,power-controller.yaml  |  2 ++
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |  1 +
>  include/dt-bindings/power/mt6735-power.h           | 14 ++++++++++++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt6735-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index c9acef80f452..710db61cab53 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -23,6 +23,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - mediatek,mt6735-power-controller
>        - mediatek,mt6795-power-controller
>        - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
> @@ -81,6 +82,7 @@ $defs:
>        reg:
>          description: |
>            Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt6735-power.h" - for MT6735 type power domain.

Isn't the comment obvious? Maybe let's stop adding them?

>                "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> index 2bc367793aec..3530a6668b48 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -20,6 +20,7 @@ Required properties:
>  - compatible: Should be one of:
>  	- "mediatek,mt2701-scpsys"
>  	- "mediatek,mt2712-scpsys"
> +	- "mediatek,mt6735-scpsys"
>  	- "mediatek,mt6765-scpsys"
>  	- "mediatek,mt6797-scpsys"
>  	- "mediatek,mt7622-scpsys"
> diff --git a/include/dt-bindings/power/mt6735-power.h b/include/dt-bindings/power/mt6735-power.h
> new file mode 100644
> index 000000000000..782b49a88773
> --- /dev/null
> +++ b/include/dt-bindings/power/mt6735-power.h

I am pretty sure we already discussed the file naming with some other
patches... mediatek,mt6735-power-controller.h

Best regards,
Krzysztof


