Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxQ4Op4wJkfy+E4USfATcQwka4uMnYgoKUlk7fhdGSE=; b=Lgnbxoegp45ai5vCioseVLe/sl
	3XUg91J2yITkIsoiIA1AFaSc1JakVuHU3KVUhuQUb7QxgSQVQndS799dct6XuAUoOF6RlHwCOhy3F
	WEDkOl7hqtcAY9dslKRJ8hriBynEmKIj/8ziUrKZ6mM+Mhi1fOdc4NoiyqfJJE5H9VbUoOqCtnT23
	EUM0XfG9Ak8T3RRh6v8HIBZhlOr206Rb8n85INpWnSjZp2aysYOJSl+tAl6Ybf6/3G3UrOIAPhRtG
	nPiKtMwbJ+YRb7DzWKPjBlnj51dhLjs3r9BoKQb543rynXTBxe+tTP8YxgeFlNYzS6IzAwkqhPS2c
	bN1QrJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZzz-000S07-E0; Mon, 28 Nov 2022 09:00:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZzv-000Rx2-03
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 09:00:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id j16so16255607lfe.12
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxQ4Op4wJkfy+E4USfATcQwka4uMnYgoKUlk7fhdGSE=;
        b=vYdb5XXPSaGwuCoLSVoXRdQxnPaAziy9sgNBD8ranp2ceRSNgedYCPqR4S0vLEMnU5
         P7HmMByv0VoBFVxh3uq65mFCK6MQA3c0f560kARTzEWaiHCOOyVKCJTkHV4l3S0g0eq6
         vyrw/O9/ZX1QkVXD18yE6C+NWMpaloiZ48EArn/TOG2veHbj9d1Vcemour9Z1xigBKa3
         RpQk3CTgz6qadxdn6IuvgcjwozjTQ3KcPOCBhwr3enogTDQR0PzTks2bn9+1k7OhHpBq
         tbyLx/EFDgvPrd35WmKItzN43WvkclKutLtUhhSEvey4QSfvY342K6flzqPRcf5xJC5F
         updg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxQ4Op4wJkfy+E4USfATcQwka4uMnYgoKUlk7fhdGSE=;
        b=KyJbZY7VJQIcC45p76a9n9WOlLZIJNnEVrR4BIbUpYfEvgUjO9vL0OeqhzNEFbOVip
         tVWVCOOB93aEQT6mV1xpnR1dTki9oer8n/gHX90XCC5apE/rnkIrAWnu4kyfqjE4eZxH
         GsmY4jjVjALlDQwawLnzlLhgA4x9mQIop/1R+CCDOHV/jPCR+3l5HxwyqJJneE51723y
         okETEv5RfBSiM/6sdDN5FZyHM61Oax9kzLE88zWtcQazXvwpS09Fr2OW9inFJ15Tw6Gl
         hE1L0DXJUsPGu5DPrGztQqoPps2WfTFbl90lBxg0s0kBj0i8tfCz1P3ZW/P8vdJkfDm6
         HsUw==
X-Gm-Message-State: ANoB5pniVLFum3q96+8iRzQx+QgHq0yS0MHHfKAp5HyLEGI+4tYPq0pZ
	w0Ur6NcXHytGLwCJ5ndkvTdx0A==
X-Google-Smtp-Source: AA0mqf4yCrmsZoHkLNUdgjrfnhNmrW+jAyoF8Yth5MPBnrKTzOxQXVV9S2/fv4YTu9XRNKVY+0RP+Q==
X-Received: by 2002:ac2:52aa:0:b0:4b1:fc9:429f with SMTP id r10-20020ac252aa000000b004b10fc9429fmr17759584lfm.84.1669626015128;
        Mon, 28 Nov 2022 01:00:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v28-20020a05651203bc00b0048a757d1303sm1655307lfp.217.2022.11.28.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:00:14 -0800 (PST)
Message-ID: <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
Date: Mon, 28 Nov 2022 10:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_010019_076340_DB1B70C3 
X-CRM114-Status: GOOD (  14.88  )
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

On 28/11/2022 03:06, Xiangsheng Hou wrote:
> 1. add mt7986 IC bindings

Subject: drop second, redundant "bindings".

> 2. add optional nfi_hclk property which needed for mt7986
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> index 6e6e02c91780..ee20075cd0e7 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -26,6 +26,7 @@ properties:
>      enum:
>        - mediatek,mt7622-snand
>        - mediatek,mt7629-snand
> +      - mediatek,mt7986-snand
>  
>    reg:
>      items:
> @@ -36,14 +37,19 @@ properties:
>        - description: NFI interrupt
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: clock used for the controller
>        - description: clock used for the SPI bus
> +      - description: clock used for the AHB bus dma bus, this depends on
> +                     hardware design, so this is optional.

Optional for which variants? For all of them?

>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: nfi_clk
>        - const: pad_clk
> +      - const: nfi_hclk



Best regards,
Krzysztof


