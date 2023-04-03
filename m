Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C25C77B6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO01+3k4fzVS/CqC5YjvddkQFJufKZJtp6FmS8S3Vzg=; b=ZTjqfYNJ9Nbg1MAjVF18YIHJTA
	bzZXeNI/de6cMWmbjKBBXWQD3OdhT+7cd85TSrZSEmGUHlea+79VoMHnZoy8bLAcZaHxnK3qU3ZMa
	M8QhgUwaz3ROkIptTSzK7+JAjrnnIRmIFp4ab+RHve7F0MoPSVEpWx5GoqQbzvnLLl6m8CXi2DiB5
	SikpjMd1Jjr1QIBeV6FI2AaFL4/Fb865rL4O3HznPdpB2jjO1KSC+XbR6mdwQewt1/bI9mhYoK5pb
	YWfR6LRUxu/9ZGicvP6LUONItFOZE34aG0CfPWOg62WbbK25N9ybRuA0EDSp1FnAskILJKFjlnDT2
	FUx0v0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPiY-00GMpW-1C;
	Mon, 03 Apr 2023 19:19:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPiV-00GMmB-1B
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 19:19:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id er13so80555101edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rO01+3k4fzVS/CqC5YjvddkQFJufKZJtp6FmS8S3Vzg=;
        b=Yi7A7zkfu+IHMbck2/TitvdJ6L4cw+Vm0TPV9ZEdJNaXE2NYh5wdbS816CRXVg1CxL
         o5p0DvQniMBWegtUeBvP+ZarG3PhT4+CAPAcgwSsl69C+lJqOuCiahmTb9xJ4WAjR7T3
         BWJz6rzqv40oWo/QS0xLlgDHKMUE0ozRFQQorBjzztoMXAVWRojOe1homea76gTy/GA6
         Vxd/XrKS4xy2JybNYgoqpiM2XMbBxbYzFClQ1AdvWbdRZgEYbSGI7SlMede0+eaOSIud
         lxNFqCwLwfj8hj81cTDnFqUvaUjD4sCMZOgFUTRWabMMu25FVvYPyOjf+AToCzO0oPQc
         aFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rO01+3k4fzVS/CqC5YjvddkQFJufKZJtp6FmS8S3Vzg=;
        b=Qzucv5PmdpdOqPkf93O03PVHSP72X8eI5FL2DnRoigCU7id1hQY6CAcsMMqbbHklLZ
         9drvdaTOy7ZFiXcOVYY6RIIHvF4xOMCT5+ueL+8lrDljjJNiiDrpYo9ACFvP/GpKUxOG
         RCUxftLj0RzdHlXUxp8tcTFXmP2WUmAJ1C5dUnmrpLCGTBXF2ZbFApNRmwSnDrH769a5
         Dy1xIRpX2cW/UQMTGdt8yBbL5vbDgoNalacEEM0ewEXvXRSgOaLbeNRViK3eWMxpu7Zm
         xYWOkvWzRUCi2EMgEsKVUPOMjatv7gfIvhr2MMXPlCsn2YlxmNlxwsS6brcjz7SYbqbq
         whSQ==
X-Gm-Message-State: AAQBX9dQNuyyAnA9OrFo4JgTO+99ViXE7+n+Cfo2ngzuq8IExvAIN9zl
	SICqiLROz7HrADnI+JJqBBHo9A==
X-Google-Smtp-Source: AKy350bqVpOgQVbWoSPL7MpqchC8QTkyqwgB6DRPSqU1gag0Z4fSDQBJAF/ATSBK3zN8Uba0NWmgGQ==
X-Received: by 2002:a17:907:25cb:b0:946:f79b:e785 with SMTP id ae11-20020a17090725cb00b00946f79be785mr22215288ejc.2.1680549582892;
        Mon, 03 Apr 2023 12:19:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906261700b008e0bb004976sm4882835ejc.134.2023.04.03.12.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 12:19:41 -0700 (PDT)
Message-ID: <d8f3432a-b364-e939-c1f2-b4d55b1586e9@linaro.org>
Date: Mon, 3 Apr 2023 21:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403060232.25699-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403060232.25699-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_121947_411804_AE326BFE 
X-CRM114-Status: GOOD (  13.56  )
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

On 03/04/2023 08:02, Chunfeng Yun wrote:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index c119caa9ad16..ee8167fbc541 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -77,6 +77,7 @@ properties:
>        - description: Mcu bus clock for register access
>        - description: DMA bus clock for data transfer
>        - description: controller clock
> +      - description: frame count clock
>  
>    clock-names:
>      minItems: 1
> @@ -86,14 +87,15 @@ properties:
>        - const: mcu_ck
>        - const: dma_ck
>        - const: xhci_ck
> +      - const: frmcnt_ck


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  
>    assigned-clocks:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 6

But these should be dropped:
https://lore.kernel.org/linux-devicetree/20230403191850.374839-1-krzysztof.kozlowski@linaro.org/T/#t

>  
>    assigned-clock-parents:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 6
>  
>    phys:
>      description:

Best regards,
Krzysztof


