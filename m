Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34247C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYHSgufQGPfsF5vAg0opMnss76My6NDOcEfiI+dOR3E=; b=48+UwlbIzmML5Ysuk1ZL1jjvzH
	5PqQxAt7aAaBZZREShRkBErQXyNQvybwlxUkbTErBmbeswauB8MUe6vxgZGtIlef54wmSAvul1zk0
	FWdj04ZWM3YW6MwlFPUKQsxeFCSMI7Z0j/QR1ycyLjUGPvGAG+0jnBMw0CuxU697DVpGkQFwQJ29x
	FTsJN116/vvalFiGDVaqemZ7uUVkK1SdzwkHePr79VPLsFzCYXfQSBR3SNZoDp2ETcutIA5ZDqfqo
	GxlFKt3OENYFpwBOe5JUISh+V9mUCEQn4mPlu7GL8+M2YOQEP291/jHGk3UU1NeyhBkurr65ml+go
	XUj92wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZh8-0037wp-1W;
	Wed, 12 Apr 2023 12:35:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZh6-0037uk-0Z;
	Wed, 12 Apr 2023 12:35:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id l18so10672776wrb.9;
        Wed, 12 Apr 2023 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302920; x=1683894920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYHSgufQGPfsF5vAg0opMnss76My6NDOcEfiI+dOR3E=;
        b=Gdoo7jQaku69ktNF9SD+vwJOUXaz8W5CG7Iec1zVbexwiq0FwZblgy3P9YHsS+/YMR
         kfmWq9T6J5UD6nBDAbUk5kEsPiGt77owQYxonu+e4/WKERVILLYVpXKE2QCckV8J6Nt5
         eTmKA/Nvl6SM70odZp51QoDMPAmqMLBTffQhdENQWztVd5qXYxkI1XXu1vqLzLOC+f9d
         zwzyifpaIzunPEAIFP34jMT1M02huYUbZzo5rmO8yooQXCGQ7OFZUwtf509ajbqbtmIU
         6OHNDcqpu3ZMn9elbph56P1JeVoZL8NJaNaUJ6TMHfyRt7GIavnWBZIhrhz4JYiptJ/e
         GcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302920; x=1683894920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYHSgufQGPfsF5vAg0opMnss76My6NDOcEfiI+dOR3E=;
        b=k+Q4Ybkf7ItvSzDjggT4cHh+FgTr/6jrcz2ynJtr7x/UyLAn+2D5bi1khi0N5DZRZC
         hDf8XWfVWL1yUKj89BY/j8aeaAAH9P5ESDc0iMBgKzX8CO+Ion067Lr+6Wpb8qBAYGxD
         DgrqOybzxawlBWzloQal6MT2xslFPoJgnxYiu5UJx1GtSjQT7zb4pP0pDTc6veYyDXFB
         9kfznBgdbuZQrzfO3DzkOXTvSZrwvcq5VwPw3CXS3ZL6rh4B+EAg/UhBSMmtvYppI+cQ
         h9EjAqZfqrPhx/IhLdyfFdZuYukVWL42p/c2ToVoXHKC6V4Ba0HegbHhhmaAD75YgBYZ
         JB+Q==
X-Gm-Message-State: AAQBX9coYkTWqwhfta4iPD02mUj9g0OUpnHpikLh35N/EKPs/flpjrGn
	H2gjuJitvAQBo0+ddWtYsw0=
X-Google-Smtp-Source: AKy350YJDBIXDYs4pLFPPdXIwXv2xr+tmhcoVzQ/7lfEPyTz8FT7yOyyA6AmK41Lu0ewaS+izRE8PA==
X-Received: by 2002:adf:e0c1:0:b0:2ef:b4a9:202f with SMTP id m1-20020adfe0c1000000b002efb4a9202fmr11506835wri.69.1681302919583;
        Wed, 12 Apr 2023 05:35:19 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i3-20020adfdec3000000b002f24db41f50sm7013909wrn.69.2023.04.12.05.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:35:18 -0700 (PDT)
Message-ID: <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
Date: Wed, 12 Apr 2023 14:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053524_211861_BEA1E9AA 
X-CRM114-Status: GOOD (  11.92  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index d976380801e3..803c00f26206 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dpi
> +          - const: mediatek,mt8183-dpi

Shouldn't we declare both const: ?

