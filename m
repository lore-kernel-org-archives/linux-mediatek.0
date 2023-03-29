Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44C6C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC9tkwmc75gH+H4hmPLG9arYbdYTuVC7oSrQJMaQnv4=; b=wlXPnd+01i7fbZ0K5gpr0p6594
	ygPOs6hnjpcUq0FKlHgfsNVcIk9B2NCkISeCxYE/pNkjDBzUPxpkVsonFjk7RjzXgjX8UxRPD334i
	OZ1Fa8Tbt5WZan3D/he8DA8LBxQ64DWXIddrZLgB7qsfWKFZ+dq0dQzFRSCF+ynq9S16rMjrzhg2Y
	Qofr3XPrHMJsU2drmjBdxKrXpNi26bI87/1NHifgnjxpK3x4NkZaZsHw27zsxoRYJRVZlIlVuAEY7
	DOUOvx+DUC1DcCLmKRvP+sHFsMq9nrohWba4VbH5vjSYpyRSjX1AZZ3BFJGeDE0jdd2h+RCgXn0As
	mb2WDFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTFh-00HUrf-09;
	Wed, 29 Mar 2023 10:42:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTFd-00HUqV-1m;
	Wed, 29 Mar 2023 10:41:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so5691698wms.5;
        Wed, 29 Mar 2023 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680086514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EC9tkwmc75gH+H4hmPLG9arYbdYTuVC7oSrQJMaQnv4=;
        b=Cc2dmxbQ/7I1964fGShEZ3shF85jMjOc1v14qFyDLTLhqAOSisK8qbpY59K3FmbXGY
         8UkcjrFtVEsov7au6iHkR7dZb/q3OTVkTeqNscYkpePzZaHOl/Edrp9GF1lm2uMe5KMk
         Ye7x6u2c727j7gfKY8HM7MnP+FIQspJXmxjkSsaLSi85BQqOPjc+QlaUhoQxEnG2Qz6y
         fqZCaUmjF+FWoZ1LZCykZvg8l175DTJLZDzOOpJOdHZSMb+L4bsAr717KbuIgx465TNc
         oXF6hY2OWmjXmJ+3LVBLqsbUuLLuchA5k7Hj1WsG/8eSoZIy06u5B//RA6tsoLrRTZKt
         ctXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680086514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EC9tkwmc75gH+H4hmPLG9arYbdYTuVC7oSrQJMaQnv4=;
        b=wU55JoQIuMeAZVsTJOPW5pq7b2k+9gOZrbmGj/dSL6ILk+mySHdh0EWkYS0VvGoYrd
         bRwcXVXp++TQpl5WpVJLCKBq2U0iN8ABBZpNLYz/lT5Aa/WyK2kvZvJUvZu0aDVZFSib
         TvDyNu9DmOeYZvpom94wsJqG8hUSZlyMxa4RixDmaMg0Qdwgbw+WMGU78yjPLufXkF8u
         1UsX3d6fpuJRKndwaYxBQCOzeT9h8g+i4y9Zk+zvrBRVw5eHuUciJ26wHV3QzRRyq7rs
         rCAuXkgWbB1KMbErlRAQqR2SPD+W+bUcVXBBKUVcZiZ6kFgnRscF6aIxEblImqaLImvW
         Km/A==
X-Gm-Message-State: AO0yUKV7kDq5A0lYqUv1EjIK/p1+fplDVGmwpFfeVlp0FoKuxVBH5N1c
	u75Yo5r/SOo+raEs0nXSkbs=
X-Google-Smtp-Source: AK7set9MejkHT15VJJ8MLManRzjpXvMRuJPfIzaBWi3Mz4d8r2iGuZRrpmASD5IG5FD1prYen7xdxw==
X-Received: by 2002:a05:600c:114f:b0:3ed:5eed:555d with SMTP id z15-20020a05600c114f00b003ed5eed555dmr13741150wmz.10.1680086513662;
        Wed, 29 Mar 2023 03:41:53 -0700 (PDT)
Received: from [192.168.42.225] ([81.95.8.244])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003ef5e5f93f5sm1926412wmq.19.2023.03.29.03.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 03:41:52 -0700 (PDT)
Message-ID: <0e863367-5b24-9559-f782-4d3e5dc06961@gmail.com>
Date: Wed, 29 Mar 2023 12:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 2/6] dt-bindings: memory-controllers:
 mediatek,smi-larb: add mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-2-4a902f9aa412@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230207-iommu-support-v1-2-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_034157_588028_D6D13958 
X-CRM114-Status: GOOD (  12.96  )
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



On 3/29/23 11:52, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-smi-larb
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 5f4ac3609887..aee7f6cf1300 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -34,6 +34,10 @@ properties:
>             - const: mediatek,mt7623-smi-larb
>             - const: mediatek,mt2701-smi-larb
>   
> +      - items:
> +          - const: mediatek,mt8365-smi-larb
> +          - const: mediatek,mt8186-smi-larb
> +
>     reg:
>       maxItems: 1
>   
> 

