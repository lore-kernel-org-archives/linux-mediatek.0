Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B2EC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDww99bxZ2K/yqjmoq3VMhTRa5h4h8Y1EfcjnZHfk94=; b=anW52xOpXIjHkPlpOgMmQas3Ek
	bcYyWqzc1D+1blSpicX1/DFAQxbOZ4Iv+DE3772AvsPeh5km96SwxwoZP0UVGBBa/ElTByrpO32bc
	JZ85hzyRB299K4BTggva64qdpKWZ2wqm1fagAGvObofPEkdsxPWM/i516FR9q5YH0Sux3KO7osZb4
	AX7yFlS8dzrhZEgj7rvpkm3UL2zjq6pWe6FwyJ8W+OujzRaiU/ZEg95t+08/i88lyiSQXDQyZRZPw
	J9ERJLrBstjaT4t14w0QicM1Zu46HQimmvMAy3oZ+h/oVuZh8JJVFGvD0qBaXFFcgaS+W0kwoLfjR
	OzEBNkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInkM-00C7AE-PK; Tue, 02 Aug 2022 08:59:26 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInkB-00C6zZ-21
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:59:16 +0000
Received: by mail-lj1-x22a.google.com with SMTP id h12so14915571ljg.7
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rDww99bxZ2K/yqjmoq3VMhTRa5h4h8Y1EfcjnZHfk94=;
        b=P/jl4sFtz1DbCpP1Q7lGN97y4/R9mecC9JwtO80y4ggDk15tvzJrsxnyKC62COQETW
         v8MLmUHK20P81S4TLUGEoqR/POhXAReg4qYYUl1rRfJ4DLT5N5/uE/4tUL0AIxY6LV/n
         e+xAgt6br1ENb/zETwDDrS0luENfM9kMwNDSxcSiAuL3AKjJoGPROydxlVkm1wgn/lsD
         NSyCBNThJ3/wU9+q61xEPyIp+Z26OHa3FvMLkb2lDXr/+oyu6R25Zb2aZmEJ99BivGzf
         q7rQr5pc5OTE7R/ttOiG8yKwta95k5djwaOWQW3xNmzFypfZZ5SF9MdulDizkoWYGmZy
         2m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rDww99bxZ2K/yqjmoq3VMhTRa5h4h8Y1EfcjnZHfk94=;
        b=aZfAH1T/jOW7XVV8EfA35Utkbe+FavOGyDn5i9NgE5I2ltyeQK5VCBJku1ujf6h2dH
         3ryl/pK6H0TUw76Gq/DjRmoTvDxVNfnQ4djokEwrEzJZ0Xc2UUMd58POBKDN2Zig8efl
         rTiXCqOpHW0bBhcnfjtKUUmuAZqmCtdcUfsaIRiNNIG6TwTnwmbUKz8sw8kdMwMx3N0a
         1EYb6pefEMR1fnblRSmijhtnmax3qJ0Ot57bkSRo/xw/v/b1JFOmQKjT/OC51/rdvJlj
         t2dq7/D7nEBSjpj5QVpHpKw5HYmG5oeuAuWBcGr6lSEeZkSMIU5o/FGwsI67BPTA1aEs
         BFzg==
X-Gm-Message-State: AJIora+VwePm62sBfN64xwhLmk4Ca5gpWs9Nj9yukdCWiL5ftKP06OXI
	y5XnxWUUqJFiwOGEa5SS5Jwz3A==
X-Google-Smtp-Source: AGRyM1uOWqNPMAzWytOXQR2J61sWqAunSBTaLh3kg+0TBkWkquMqqEGhG2ByS32YRfZ/WqjuKxpL8w==
X-Received: by 2002:a2e:96c1:0:b0:258:e8ec:3889 with SMTP id d1-20020a2e96c1000000b00258e8ec3889mr6323278ljj.6.1659430751040;
        Tue, 02 Aug 2022 01:59:11 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id u8-20020a056512128800b0048ae316caf0sm1524349lfs.18.2022.08.02.01.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:59:10 -0700 (PDT)
Message-ID: <cd9518e3-9cb4-5165-af03-00e5300ab927@linaro.org>
Date: Tue, 2 Aug 2022 10:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Rex-BC.Chen@mediatek.com, TingHan.Shen@mediatek.com,
 Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
References: <20220801113709.12101-1-jianjun.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220801113709.12101-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_015915_148787_78453210 
X-CRM114-Status: GOOD (  17.45  )
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

On 01/08/2022 13:37, Jianjun Wang wrote:
> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
> 
> Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
> "peri_mem" instead of "top_133m".
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
> Changes in v3:
> Use enum property to add the new clock name.
> 
> Changes in v2:
> Merge two patches into one.
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml           | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0499b94627ae..a0ca9c7f5dfa 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,14 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +          - const: mediatek,mt8192-pcie
> +      - items:

You have one item, so this is just const. Or enum if  you expect it to
grow soon.

> +          - const: mediatek,mt8192-pcie
>  
>    reg:
>      maxItems: 1
> @@ -84,7 +91,9 @@ properties:
>        - const: tl_96m
>        - const: tl_32k
>        - const: peri_26m
> -      - const: top_133m
> +      - enum:
> +          - top_133m        # for MT8192
> +          - peri_mem        # for MT8188/MT8195

This requires allOf:if:then restricting it further per variant.



Best regards,
Krzysztof

