Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2027C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0BVI/sdd04/zhgmWH7aIaeeBm4+Vvke6BUCZyn3hyg=; b=PFVQAXSFuEbKWykyzQSsSjXaZ9
	M9WWhYE4esccATHfL7RkdnTzxwsNKQkmVmrC7YSA1WNUnfsKjjoSd7/30HT8oMwxxkcZdSZ0kWtTV
	Yjayrrs7XkoiAlGR4EWjcUDnKI3toJTIpfym9pGv+mNcK6lAD9YdketN6AVErayv8tBMkZRXftlzB
	CPfehU4Xu1LeUCvQOp5ZfyXZRY5VSnEJNQwnYtKnGHmQzFKoY2ZzRzbJk5x/JohcRz8mM5F2p+IoF
	aF6wSzG8fjpHs4cktvWUJXQxyc3b6YsF7V1h4ESjgoH86kYLJQt8EiLiLSkiZDbTipnFmjsvZsx+7
	fORoPiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6z7G-0015La-20; Thu, 30 Jun 2022 18:42:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6z75-0015Hy-Od
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 18:42:05 +0000
Received: by mail-ed1-x52b.google.com with SMTP id e2so54922edv.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r0BVI/sdd04/zhgmWH7aIaeeBm4+Vvke6BUCZyn3hyg=;
        b=uQTmE1Um4nOuhHiHeoUXDpZUYNgOcZG0vZxcrqiB1QeU5sNRVVLaPdb2o1oZqUOXfF
         A5sa7uthLkoOVgJDy+fMTIUpr6aOnUSjdNFaWhhriiLY4PiMOg3pIX8QBA4Uo4ssS/wV
         qp9uGYpWrM0dQxdlb11sJihLToqdMiZwOYQO4ufTpOpWqdCkRv66MabVG6kXOORGcoUY
         kvRRElmIve3QQM04NCRKPZh8sfP3QTPCwONY2feUHQZZVX01bwUxeWcEtrpYDlReQDz6
         N+7T0ZVmAdDC0isxLUhFpOERJZp15rEytx4xmTeeMioSZYJg8KxWis5O9Md+XRBYEoHa
         K5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r0BVI/sdd04/zhgmWH7aIaeeBm4+Vvke6BUCZyn3hyg=;
        b=OqdjKmwObpX5J0bMwCGitfklR75WJnEaIL1NBJj3N2KL1MFJPgML+3jlLXhq428PCk
         Clw975Uh2zv7Yf4O2n2mLyOm16RK96gi6dILkswOaZLevYixnJty1mIS/bayw5F5IrxK
         FCtTWtycpTF1As29EuOYi+bjH7ws8bZQxdVMCSzFlZanVNjAJE5xKIKgvXoy3sgsDeza
         f8zm9gGDOy8UBkU0GbLM8B26GSOiuInfaM2AKbfUqhI79cGuIe/Y/4l1XYefqed634yy
         Oi+Qf9RUpk+PXPpKOTIlAw87RWzeGprL+qtbTmPhcF6uCo0jW1wWycNdgKlOexwJOwW5
         Nr/Q==
X-Gm-Message-State: AJIora/rtk0I9MiyNh2vU4RrFBav0gi7YTirGTR1H8UeGM7bbr9r6I1y
	WPyh8jlKMd3qbjIlplOfvqKhjw==
X-Google-Smtp-Source: AGRyM1vkKMX06qz0erPeOdymXkH8eYsVt8dkgi/ckKf9JT6cSQDwknrl7psQLouE7nProJTlZBG24g==
X-Received: by 2002:a05:6402:1c09:b0:435:6562:e70d with SMTP id ck9-20020a0564021c0900b004356562e70dmr13185356edb.203.1656614517044;
        Thu, 30 Jun 2022 11:41:57 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906614900b006f3ef214dc3sm9302978ejl.41.2022.06.30.11.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:41:56 -0700 (PDT)
Message-ID: <42b8bf2c-c343-8fd4-17fd-f22ed83d5d0d@linaro.org>
Date: Thu, 30 Jun 2022 20:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: Add assigned clock property
 and axi clock in example
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.zhang@mediatek.com,
 benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
 <20220630090157.29486-3-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630090157.29486-3-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_114203_855702_E931E6F4 
X-CRM114-Status: GOOD (  15.87  )
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

On 30/06/2022 11:01, Xiangsheng Hou wrote:
> For mt8173, it is needed to add the axi clock for dma mode.
> And it is may needed to adjust default spi frequency.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index 41e60fe4b09f..7523d992a614 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -61,6 +61,12 @@ properties:
>        - const: axi
>        - const: axi_s
>  
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +

There is usually no reason to put this in the bindings.

>  required:
>    - compatible
>    - reg
> @@ -82,8 +88,8 @@ examples:
>          compatible = "mediatek,mt8173-nor";
>          reg = <0 0x1100d000 0 0xe0>;
>          interrupts = <1>;
> -        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> -        clock-names = "spi", "sf";
> +        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>, <&pericfg CLK_PERI_NFI>;
> +        clock-names = "spi", "sf", "axi";
>          #address-cells = <1>;
>          #size-cells = <0>;
>  


Best regards,
Krzysztof

