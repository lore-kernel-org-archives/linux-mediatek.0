Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0242C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7SWOvXweDZtmkeWSuLz6l3o0fM/vaQf8Gw102I5GRQ=; b=qiAC6gSx+umqBP
	FfqK7S7ClGKUyvt/eOSt/vVC32yLcqBO9T9cG4MUQ0F6kN38PAfzPCKuZSKTJ2Ly0Tze71Vyk7v0p
	B3PDMYoPfe49hsnas4YJkSAwxZQjhZoUXW69SzjGFMwoWF6wZKsqA8D/mQ7n4kYjq04d8UvslXNjj
	Nvg7KkNI/8javdP2/3qXP7LD+fugF0v3YDRUqIt/7X0hsPh2B7D58Uve1U76XlJa3MhINxtfdZMRj
	b8kGySSbRQrBFi6s17N2LHA1+KJCEThxK1X1ordJLJ3frr3vUknXJlxpPEsaSIyikVfvWLLn/zAci
	aIKk/mdMVMijVpJClE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHNu-00DFba-Nx; Sat, 22 Oct 2022 16:30:06 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHNq-00DFaX-RK
	for linux-mediatek@lists.infradead.org; Sat, 22 Oct 2022 16:30:04 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso1355762fac.13
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Oct 2022 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7SWOvXweDZtmkeWSuLz6l3o0fM/vaQf8Gw102I5GRQ=;
        b=G2k9jjkJCEai5xU0b1yIXA4xPlcxeZUesmGr2osHTA4IYYE1IgDDkYsqRAUVIVtdgk
         GLIIvHgw2c70Ey9XB5CESFoq93sozsyh5IXwS43rGyMW/cohocxhwjsEmwf58/kfF56/
         SVDqL53QkervbiVMC8cpiF1QJAMOdItMguNSgl/3CeUHnH8+4SSn7AZYjvmhsiWRRSih
         sLdN2h931hAUNtB/wWk4l8YptO9JLY31oRbfU8ERFMSh+yn2+PCmH7cinlQ0JCxK4oR8
         XmG2g1DuFJoE1me8OZ0ZHWpfQP9FLI7Y9qtdzVX5TvNyY2dJtK6E5XIrwZT2cX7xZ9d4
         NN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7SWOvXweDZtmkeWSuLz6l3o0fM/vaQf8Gw102I5GRQ=;
        b=vdbqYhj7Dit/t9BbDAq3oeZ52APeqT0K/eUa7QNj3f7/woTBdxnP0KNNbeTcXplPPE
         s10Sa7jV+80lKvn90wz5DTisRRiGw+AIJxnRCNjYwdTughbvh40nX3ANJA53tASO6dwy
         vcmCsExZU3GJdb2IJ81m6KnKy+8lQ8v2nr2MaSvo06NMiaAfp6LyalBuGo1pk0JDkPx0
         n8sXDpP/oXC/6a3Cf06eUKpnwu1vxq2LFW/lY/ltM5d4Q2z/yzqN4M6hRSISef31u0or
         YX+KSgGmA0M5ACMcXtlg9SOSWTDY1+rUvCLOIkA2M6GxYjxqjoTjI5+GszzrOloOFcGi
         6Oew==
X-Gm-Message-State: ACrzQf2wmBO+JAOORHTOrzqrFbCDr1o0mExp7NiJti6QDI9BLagXkCZw
	Blu0garRZoFIuwv+xLRl/RawNw==
X-Google-Smtp-Source: AMsMyM6xS8BBgTyJDXX7TcLvYtSmpPPTRH/GpaUvPLRo7YA24xOp6Qq1yrXugxI5WF50ALMLGn+ljg==
X-Received: by 2002:a05:6870:56a7:b0:136:74fb:e6df with SMTP id p39-20020a05687056a700b0013674fbe6dfmr14877673oao.37.1666456201795;
        Sat, 22 Oct 2022 09:30:01 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id y3-20020a056870418300b0011f400edb17sm11796775oac.4.2022.10.22.09.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:30:00 -0700 (PDT)
Message-ID: <0c88ae58-2841-f0f3-f103-f3030c5cf704@linaro.org>
Date: Sat, 22 Oct 2022 12:29:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 5/5] dt-bindings: mmc: mtk-sd: add mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221022090530.16265-1-linux@fw-web.de>
 <20221022090530.16265-6-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221022090530.16265-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_093002_922761_8A8F1C77 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/10/2022 05:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add SoC specific section for defining clock configuration.
> 
> Add compatible in "not" section to avoid override the settings again.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c7bcf0c3dd5d..9df63c461f1f 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -229,6 +229,33 @@ allOf:
>              - const: hclk
>              - const: source_cg
>              - const: bus_clk

Blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7986-mmc
> +    then:
> +      properties:
> +        assigned-clock-parents:
> +          maxItems: 2
> +        assigned-clocks:
> +          maxItems: 2

Define these two only if they are required for the hardware to operate
and only such setup (two assigned parents) is allowed. Otherwise you put
some constraints on board design.

> +        clocks:
> +          minItems: 3

Best regards,
Krzysztof


