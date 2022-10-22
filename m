Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EE4C04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3ny+yXpYDqLgCl1b12wzlahRflhVPiMY2auk8rtU9A=; b=wzMmnAtnsTfbVz
	MHHjm3mqMvXR7X1ZRa/fMde2CT77ej7+4FlO1Xz+CQWcB1rEAP4iZ0Jpf+D9R5k1JQLeLFEspUSy2
	8VEdfsoxAPRfJAMAOvGZ+FndE0yiZrtMfy0nqWkqHUKX71fRoNK0yd/8rvS/kBqCtEahBF0rUWIPF
	yXb6zVz4mxTz/FpdbuBDAPHIdzoCPeS3mJez+FJcMRZO9s5IksgQThE2/RVQrtt8IKxXLCQZqVFpa
	osBJEzMyib0WtBDQZ0oDyap4cJKGbYqTxG9j3UYkjAwZeA0JT5ZWeAwmLgccRrr9h6OSIXja8G2Bp
	t1m6d5hSrpN8IYdhwtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHMg-00DFI1-Fg; Sat, 22 Oct 2022 16:28:50 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHMU-00DFEB-Pj
	for linux-mediatek@lists.infradead.org; Sat, 22 Oct 2022 16:28:40 +0000
Received: by mail-oi1-x231.google.com with SMTP id g130so6534201oia.13
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Oct 2022 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3ny+yXpYDqLgCl1b12wzlahRflhVPiMY2auk8rtU9A=;
        b=JdjPExc59m1e2oyhgLWsKrEbhHJUNp3rx52BD3ksxMWuy2Y1q7cAjERfKDTFb7ojf+
         uaCYqxoqvwfrVXiIBjI84aWy6Sb40M8dHHH/+mUOK8VZE7S82aY5TuBFED5NMOFMDTCh
         bO046RFT+6uIrWK3ZwYENkB1OFrPnT3ybrPqGL0CoPW6cNZO4JjLRqCZXaDGQVv6ywQA
         tuhKYVpWFXvMEreOiG7/EueX1PZ5hgMNMuYNJXKn4KSSIMqZB9nFHLoR/WWDyAujYcFQ
         vKjHyg73LewI90SjFaL3MMwYb3wx4oCLsjiCZ/mbF5pSl6tE60R/SWOLJHpnjw1Mj10w
         hiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3ny+yXpYDqLgCl1b12wzlahRflhVPiMY2auk8rtU9A=;
        b=Bd1ppwXDcu2sROfz8wMjGy0RQtczcrvWhPNx6fVioJ85Zq8ArjkARZ4K5n3TpWWEpE
         SVi+PC/rqO5HcatVeFdw4Av7fP7Zo7iglSGLLS3XT5CsiJYMPATtifcuFkZ2ynlYEGkn
         I7L+FW79cIUOtwA0+1LczLlYrN2jgy1yq+Wt5f87wbKpNsLKjTUBob7AHrnZG/P9kg08
         1sMJsfFwhhcASltr/ym/zCm6CS4xzlJl7DMB+o23w5HhqPyMRIO0RUAfGjSMePdgVF96
         oDQqxN8aabYzxIx4A8sOhT91jWpvzWuRiG8orh3CMCvHwbh9dykpwx7472jIsF3CaQM7
         6vqA==
X-Gm-Message-State: ACrzQf0gfbHLqnozIgRq8GgB3Gl1Z3sx4uYZ8sYqqXXw35moRE3Zj8rN
	Rj4vHjrBNENJ0Q79oTDR3zz5bA==
X-Google-Smtp-Source: AMsMyM634zWdX9U8U9UebN4uP0I0NHWWXs08sHj/vn8eEv9h2ANg8MGdNdngwgd9cwKtD9sU/cL1zg==
X-Received: by 2002:aca:c143:0:b0:355:4f9a:78a0 with SMTP id r64-20020acac143000000b003554f9a78a0mr11757740oif.245.1666456115751;
        Sat, 22 Oct 2022 09:28:35 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id d8-20020a056870960800b00127fbb7afffsm11282161oaq.5.2022.10.22.09.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:28:35 -0700 (PDT)
Message-ID: <1a1ab959-8c0b-90f8-347f-9809fe4b23d7@linaro.org>
Date: Sat, 22 Oct 2022 12:28:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/5] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221022090530.16265-1-linux@fw-web.de>
 <20221022090530.16265-4-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221022090530.16265-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_092838_846015_1AE52ABD 
X-CRM114-Status: GOOD (  21.90  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/10/2022 05:05, Frank Wunderlich wrote:
> From: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> The binding was describing a single clock list for all platforms, but
> that's not really suitable: mt2712 requires an extra 'bus_clk' on some
> of its controllers, while mt8192 requires four different extra clocks.
> The rest of the platforms can share the same 3 clocks, with the third
> being optional as it's not present on all platforms.

It was also wrong...

> 
> Move the clock definitions inside if blocks that match on the
> compatibles. In practice this gets rid of dtbs_check warnings on mt8192,
> since the 'bus_clk' clock from mt2712 is no longer expected on this
> platform.
> 
> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 111 +++++++++++++-----
>  1 file changed, 81 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 3cbf0208f1b4..c7bcf0c3dd5d 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -10,9 +10,6 @@ maintainers:
>    - Chaotian Jing <chaotian.jing@mediatek.com>
>    - Wenbin Mei <wenbin.mei@mediatek.com>
>  
> -allOf:
> -  - $ref: mmc-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -49,27 +46,11 @@ properties:
>      description:
>        Should contain phandle for the clock feeding the MMC controller.
>      minItems: 2
> -    items:
> -      - description: source clock (required).
> -      - description: HCLK which used for host (required).
> -      - description: independent source clock gate (required for MT2712).
> -      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> -      - description: msdc subsys clock gate (required for MT8192).
> -      - description: peripheral bus clock gate (required for MT8192).
> -      - description: AXI bus clock gate (required for MT8192).
> -      - description: AHB bus clock gate (required for MT8192).
> +    maxItems: 7

Confusing to see 8 clocks replaced by 7, but I guess this is problem of
old bindings.
>  
>    clock-names:
>      minItems: 2
> -    items:
> -      - const: source
> -      - const: hclk
> -      - const: source_cg
> -      - const: bus_clk
> -      - const: sys_cg
> -      - const: pclk_cg
> -      - const: axi_cg
> -      - const: ahb_cg
> +    maxItems: 7
>  
>    interrupts:
>      description:
> @@ -191,15 +172,85 @@ required:
>    - vmmc-supply
>    - vqmmc-supply
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: mediatek,mt8183-mmc
> -then:
> -  properties:
> -    reg:
> -      minItems: 2
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mmc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2

Blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-mmc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: msdc subsys clock gate
> +            - description: peripheral bus clock gate
> +            - description: AXI bus clock gate
> +            - description: AHB bus clock gate
> +        clock-names:
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +            - const: sys_cg
> +            - const: pclk_cg
> +            - const: axi_cg
> +            - const: ahb_cg

Blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt2712-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access (required for MSDC0/3).
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +            - const: bus_clk

Blank line

> +  - if:
> +      not:

Can you not use negation, but list applicable compatibles? It would be
easier to read, I think

> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt2712-mmc
> +                - mediatek,mt8192-mmc
Best regards,
Krzysztof


