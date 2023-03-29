Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD8C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgpY1YthWT3xIQhWwfucwfDtAT6rdZEh8Ao3ZU56Ods=; b=SjKsvtFzYqL0UOOCiDm1L8X6e+
	ECCqPvJegRdwSpORDaId3KPzZ4WFrtcvyNVM/uR6ctg+5hU7mj1XHRewG3tXlrLs0tKXk1wSmss2r
	3dhBxj6lqoiKd9ymnWHNVSRB9gdOVeR+EpC1Q5+r3YVQInX3Z8UA8IwPssMH5zQmmdZw4dnSfOLcV
	uij9z9oaAhW2rTtePXyfEpY4N9ZhlsOxueKkWqAQNxKUZ+SrHvQCWWpX4MNRdCQBaD1xi4OR34FOf
	4vAHhUQ3/VUZzOdRoaAg+k5nZ1/mtwVSh4qKE7VPsI5W56B5I/yPHuLB9RrKH3idybFGn6C2FBvr0
	0Vx/w48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTF0-00HUky-1F;
	Wed, 29 Mar 2023 10:41:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTEx-00HUja-1y;
	Wed, 29 Mar 2023 10:41:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id l37so8603916wms.2;
        Wed, 29 Mar 2023 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680086471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgpY1YthWT3xIQhWwfucwfDtAT6rdZEh8Ao3ZU56Ods=;
        b=i/2YE1oqVWapZMKkxbz+mbhQ2V5yDDdXydRYWyJXBCK7x1R43vgwgZ5KYHZkF1ByA7
         QU0ivFZ6NdMog8ERoltE4D7fkriQupBkzPBMlUFC0vWzWYZP4mr5qP/cTjAOCdjzDVEm
         A5JknFQYA9O6X92dh5xfe9Cn1OkU4WJU8jYjWzrPzwV8E272luJ8CAah6NlSAKULrP28
         d6UYwY2iOg8NXsdKLiNstV2Fg4ro97GO/oLIpCNrKvdZ0BaWsdWtAKpacFuYmSOCDkmu
         kts09u1BcAo9J7s2PdqS9WckayVIqcc1EY3z9so+K7zcfGW+ERwKv0zlFKlDHXw8QVIH
         gs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680086471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgpY1YthWT3xIQhWwfucwfDtAT6rdZEh8Ao3ZU56Ods=;
        b=mRnpZtp9NYEQnY8jGf4AbjYvRB68txLWHoSxHKfUm/6rxyz7Vblrv73mUOWpyuvn22
         HGkFjjgObDNjo2vqdVdmER28b17bhYVdlgnWs0mT7fEBVEQIYwEoJTLFO5VfXA66dK2G
         ves5GPJ86ruVk8qw2O6oDp8y9GOMltexr0NGyKu8jtUl75kDh5E4hKb6T297MLLkrdQ7
         tz+6CMIt2DvHgI9KyUg5OvJA9NEzIpwiqYdLnTf+YsY7Wrnc/505lbgmK5t2qTrrYTd2
         xzuMd89w+gKzkIkRhXZKr4s9u/9It/l/5IzD6HnRUFTa9qDMCnZcLGjQk08/BKS3/x2e
         iAKQ==
X-Gm-Message-State: AO0yUKX/KOFjgLXCHSY83n14Tgxy+Q3Vhlw73HqIfTX8iFpLS0p5fuDG
	mST9AlqfMAeOR7LTKBySGOM=
X-Google-Smtp-Source: AK7set/gT5l6g7eCFe8SN97XIH3TnyaG+4JmZEjJXvbkpsWqRF5Cq3gw8GYvkBpmrWMxkXKOvEgfsw==
X-Received: by 2002:a7b:cc82:0:b0:3eb:42fc:fb30 with SMTP id p2-20020a7bcc82000000b003eb42fcfb30mr14934639wma.32.1680086470913;
        Wed, 29 Mar 2023 03:41:10 -0700 (PDT)
Received: from [192.168.42.225] ([81.95.8.244])
        by smtp.gmail.com with ESMTPSA id n19-20020a7bcbd3000000b003ef684c5e32sm1732903wmi.48.2023.03.29.03.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 03:41:10 -0700 (PDT)
Message-ID: <d1dc242d-c381-3307-b939-7bc35c6ce55b@gmail.com>
Date: Wed, 29 Mar 2023 12:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 1/6] dt-bindings: memory-controllers:
 mediatek,smi-common: add mt8365
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-1-4a902f9aa412@baylibre.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230207-iommu-support-v1-1-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_034115_674202_7CC61C2C 
X-CRM114-Status: GOOD (  12.85  )
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
> Add binding description for mediatek,mt8365-smi-common
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml   | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a8fda30cccbb..d599a190952f 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -49,6 +49,10 @@ properties:
>             - const: mediatek,mt7623-smi-common
>             - const: mediatek,mt2701-smi-common
>   
> +      - items:
> +          - const: mediatek,mt8365-smi-common
> +          - const: mediatek,mt8186-smi-common
> +
>     reg:
>       maxItems: 1
>   
> 

