Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7DDC6379F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXxv4f/GrzSHSPu/QzcHkyK4EnmsjXpwAUc8WugyuBY=; b=KL/2wqe+GGE/bMA/CVXsHuUbra
	Lt87iCDSxv4maVLvYedW3qAJlnE8l+KfGufxB5tEq/7ZJco1OZ+2/VbrKIB+R56VUUM0+8+2CJB4v
	eRxuwaQJlb6wPmz2priFEEJYl+7yBbvhLxRivNJxsK9WVlNj7VDZ02pYpeh//29BtIsGnLCm+fX8A
	MY5IzoVKN1IkVEOCAkuBtvQXKC59ZPkNLznspxmhLy1tZJSQ/HQvGWcjALMqR9DRbfS8CBtsVXHbv
	9wM4V7XZDJyxCIi5CvMxIs9idTjl7Jyzhgu3lVvqxIrUXJJQO9/KEYTqtSB7iOadcjevDe6+eXE3A
	FBcxQcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXTX-005rma-2U; Thu, 19 Jan 2023 16:09:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXT9-005rgN-Bb; Thu, 19 Jan 2023 16:08:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so3891156wml.3;
        Thu, 19 Jan 2023 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXxv4f/GrzSHSPu/QzcHkyK4EnmsjXpwAUc8WugyuBY=;
        b=C1lMrrVx4bxj9zX1x/HNOWUgVfK4+6w+sbcqfAxU0BO8dfhmUvSl511zCVyOpOAUlu
         rabqut5ECP1iUkMafoskAChJhOM3IIgczRnAZ+k1NVX6MH5WDI7aScfamWfhihq3SC3N
         6DoyRntCpYgjrS9ZS357UbdY76LKm/zKp9RVQd8AOoMMH4OJgrTGwnsAu8uzBvN6xzeE
         6jeU9GYiD0vVd6tGfc3VGmOMYccvbADx1K+/3oTfvUj9U7pUEWdQcq8jKfT96XxXKnHy
         Hy5L3pKxRjsoL/GUpPbDa7ugLBA20zdmAAy5zPcKo9J8tiEsoXfIcC5nD1/zXag5Lkyy
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXxv4f/GrzSHSPu/QzcHkyK4EnmsjXpwAUc8WugyuBY=;
        b=jO//iI3iOOu3RZFZrRtQbE45ZqJ4fpqppDyKr2wbxOFAQvKO7BEkUdTeyiH9dLzVub
         4kT9Y2GrQBwNQ7kuw5GHg8G0DxmphRUvinij9+er7OqVfkXcgtg0RLGXQY6wo50eH9sK
         EEkqvklGNxIiL2cdCmkkfabZRFhHHmrwTwNzp++gHanVrJe4wSF+dIprNe7omQu2KTMq
         hV+T+wV1HT+lSeGjRvc2aTObo0ZrjE/dL1zGv3TRR0cPM+vW9PCKUtOhAcnAaWnldmgO
         CC7lURe/W1TzQ0zLJ0UqWl94ySF7uq0QejQ9vVYv7XTbPuVDwWWI+ZyqrLEImh+hnC3B
         hQOg==
X-Gm-Message-State: AFqh2krTExwhFSn0jHqePEK0/CouD6NCROZRn/F29RqXTezAlR1gdfht
	A5C4oX/zmFcuIP6Dm04Q+8Y=
X-Google-Smtp-Source: AMrXdXuHd37802o67zKMA0vSXhoL6McWWKMzRHrp3BkFuf9/dCjllHInE53NvVEDqDJ4iZmyFfmG4w==
X-Received: by 2002:a05:600c:1912:b0:3db:f0a:8707 with SMTP id j18-20020a05600c191200b003db0f0a8707mr7630059wmq.40.1674144529818;
        Thu, 19 Jan 2023 08:08:49 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id be12-20020a05600c1e8c00b003db06224953sm6249655wmb.41.2023.01.19.08.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:08:49 -0800 (PST)
Message-ID: <8ae4469e-ed2c-5019-605b-013a49af77ea@gmail.com>
Date: Thu, 19 Jan 2023 17:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-2-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118031509.29834-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080851_465663_AF469480 
X-CRM114-Status: GOOD (  14.85  )
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



On 18/01/2023 04:15, Moudy Ho wrote:
> MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Stephen, if you want I can take 1/4 and 3/4 through my tree. 3/4 shouldn't be a 
problem, not sure about this patch. In any case if you want me to do so, I'd 
need a Acked-by from you.

Regards,
Matthias

> ---
>   .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> index 17fcbb45d121..d62d60181147 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -28,11 +28,9 @@ properties:
>             - mediatek,mt8195-imp_iic_wrap_s
>             - mediatek,mt8195-imp_iic_wrap_w
>             - mediatek,mt8195-mfgcfg
> -          - mediatek,mt8195-vppsys0
>             - mediatek,mt8195-wpesys
>             - mediatek,mt8195-wpesys_vpp0
>             - mediatek,mt8195-wpesys_vpp1
> -          - mediatek,mt8195-vppsys1
>             - mediatek,mt8195-imgsys
>             - mediatek,mt8195-imgsys1_dip_top
>             - mediatek,mt8195-imgsys1_dip_nr
> @@ -92,13 +90,6 @@ examples:
>           #clock-cells = <1>;
>       };
>   
> -  - |
> -    vppsys0: clock-controller@14000000 {
> -        compatible = "mediatek,mt8195-vppsys0";
> -        reg = <0x14000000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>     - |
>       wpesys: clock-controller@14e00000 {
>           compatible = "mediatek,mt8195-wpesys";
> @@ -120,13 +111,6 @@ examples:
>           #clock-cells = <1>;
>       };
>   
> -  - |
> -    vppsys1: clock-controller@14f00000 {
> -        compatible = "mediatek,mt8195-vppsys1";
> -        reg = <0x14f00000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>     - |
>       imgsys: clock-controller@15000000 {
>           compatible = "mediatek,mt8195-imgsys";

