Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7C6C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOdZm+t0ZjNb9E1ZMCmZ/u5jw9aDGTn6ypSEA7WGmII=; b=mjn6lJQq9YDkB4
	wTw6hkvfp9Q3xI7hkTwUOIE3Vd5x2gbFNPSiuTHd5qMlUk3ztZLcy1cGRYftOQHQ18XMepVhmMuIP
	bmHz/GwEWuvLH0H8G9k2GENW/PQvXPFib8oa8SUgQUqx6lRda8TOGG/QraaNjiwHpSw/rap/lSS3G
	a9LLE0oN3hdaVH5Y/em1y6KNEF3rxZqRXiCEeLirQ1U58xoEn+NXyDqhtarcBewuXMcM/DmzG7wt5
	XfNx7tJwGP3HFZWDmdSDjjYOG8dM4Fjort6nuaXouAoG0tkIHatrrqeL0r3sJvhfqmfbJ6bHA7kbC
	ic5cB4+K0M6izR35mysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAV0-00GGUo-Rz; Mon, 21 Nov 2022 17:22:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAMj-00GCaI-Su; Mon, 21 Nov 2022 17:13:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id s5so3642376wru.1;
        Mon, 21 Nov 2022 09:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOdZm+t0ZjNb9E1ZMCmZ/u5jw9aDGTn6ypSEA7WGmII=;
        b=Bri+YqkxR9A7oBnDSBN5S+vyOvU73bMGjpOqXuh54mO57W/8vv2dISgFfJOv3GVPOO
         oprFGOYKvPDkUXBkinoQBz9ugVtWHtbvoxjmtsz8uoKHrn3o4h7g8HzFMT7pZSWm3tQl
         ClJNBQoFkCPAL0MU349QGlUMLQGqPY86xykMZKCWkbcHBRDAz2s9EzUbcjmMdXrFaeWy
         KXJLqSv1NIG7+lIf0t23v2cu1b2bFHGZMN8NVVK6CAXLcA04FgEkSIorOTi9/NgTZfPk
         2ZWmQ/1KOoaRIrZVUtuN5dcjuJheAkvjOXD8diWI7ljW/v9ofHCjrFQZKA5aY3kxeK6O
         TpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOdZm+t0ZjNb9E1ZMCmZ/u5jw9aDGTn6ypSEA7WGmII=;
        b=nqYmLVs0Agq2fYfF2yJLHSU3Kc7dVsj6KlXwqa9fRX2b3LOk0VjJvLJni9XK4iSi84
         HdrmP8VFXTm91gvLwfdoT5xRQA6THJD7RjrJ1qb3YN1a9IDqlkf8p3yrqqnT49EF+9Zl
         S8q+rDLPPrDmiQrEOcbtd8yr3TMmtgC7Y0NEhDWoyyRB6lsz2wvUekBUwbKWaYDMmEeO
         PRxyRbfyL2a1faUYmAcN8EiVAlp0qfXr6X4zFSZR54trXHCoonh7W+YjO3Hw7rd5uXDV
         YdJ6kbgQB1i2ym0VjF9MVTM7ZWaj0GnQfl3Kh+8M3sMz6etq1/dhH/O+Nd6oUSV4uwYD
         nY4Q==
X-Gm-Message-State: ANoB5plza2j39P1fFwb9FrIFiETJ+if8mAit4W6vqSSFUAnHJbGiOARe
	K64siqW+acMP8BCX3c3SiC0=
X-Google-Smtp-Source: AA0mqf4hbwsmtUuhLGr69LHoOQQEqvX+EvI7mtwqoCP9NL9TQavoW8740rWW99QiGdXzv6vfRPk5aw==
X-Received: by 2002:a05:6000:10c6:b0:241:d021:52d3 with SMTP id b6-20020a05600010c600b00241d02152d3mr4812424wrx.540.1669050831503;
        Mon, 21 Nov 2022 09:13:51 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c020400b003b492753826sm13911425wmi.43.2022.11.21.09.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:13:50 -0800 (PST)
Message-ID: <ef9c585f-37fd-f1f4-032b-20680bda1865@gmail.com>
Date: Mon, 21 Nov 2022 18:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 05/11] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-6-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_091354_062313_6F1FD1CC 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/11/2022 20:01, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string and clock-definition for mt7986. It needs 4 clocks
> for PCIe, define them in binding.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Jianjun Wang <jianjun.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v2:
> - squashed patch 2+3 (compatible and clock definition)
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 5d7369debff2..f7a02019daea 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,6 +48,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - mediatek,mt7986-pcie
>                 - mediatek,mt8188-pcie
>                 - mediatek,mt8195-pcie
>             - const: mediatek,mt8192-pcie
> @@ -78,9 +79,11 @@ properties:
>         - const: mac
>   
>     clocks:
> +    minItems: 4
>       maxItems: 6
>   
>     clock-names:
> +    minItems: 4
>       maxItems: 6
>   
>     assigned-clocks:
> @@ -160,6 +163,20 @@ allOf:
>               - const: tl_32k
>               - const: peri_26m
>               - const: peri_mem
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7986-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: peri_26m
> +            - const: top_133m
>   
>   unevaluatedProperties: false
>   

