Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D964C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kpaiwf0843lkfi5DucpeM6aGN32Q7vGcHPEEoEPGJew=; b=Uj+/CROsMBZvD0
	NiRH6AzxdEo7zVzKQ6v3ZegSfnYlhh4d0EykkAF1XaN6wnKWsOPVer/5tv3rLxUFemDcrX1iy9L5K
	cnEYjz7zO0EklypQiM/U7Yvmo2YwojcumJl1gNfRW83EGs5iOwfI6D7oMbAH/iBOZibRD6sbGZY0F
	+sUxPQ40EG1o8pr5bt00m7PLPK3QPyZLpJtu9HBUAvKmsLDIBB+xujxdlhHXlQSfTzAgHtOrbpTHr
	6QILxshD2/2vfzKrX9HVxrrLi2ZgcuFV7HfM8wmJ1t4f+gqYd+CBDVbbUNGcNINDZewxpXx7ZbP2V
	WbPyc8/H8YtCgYI3KEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZsRr-001vMl-PZ; Thu, 31 Mar 2022 10:54:39 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZsRe-001vIz-DZ; Thu, 31 Mar 2022 10:54:28 +0000
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso7333519fac.1; 
 Thu, 31 Mar 2022 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r9MO9CjxH2HfDd+vRxfevxhMbQ63nHf2fy/t+/G6Jc0=;
 b=h937QY9LPyg4HH13nvZYx0qmQ5VKURkH9NHhO0hnEC+biUZ+nzMTp/8e3pQinIJXwv
 EvZ9QNhsFAkQAmmvtrAS0O2/qHbG52mf6mXI8r8j+Ohj03nodEL2WOp15IgT01muDFZg
 C3GHkS+2anejUbnNYOlZCIJIwShD9B7RbJ8gc2MdIPMY1eNbEZldItXyrzWZr76yZZ2U
 cBUtZwRL81QmxRuMdkT86/YTIhvs4lyPM+xMFx0ZCiejG9OD7ofSg3Wfrk+gdW+l1c3R
 wXOB/XEzjBb5LPo8OslS452WzlI6ZjmNyBoTAb+AI1NhBNXlpSND8K+WT4l5jCrbdZ9z
 Etgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r9MO9CjxH2HfDd+vRxfevxhMbQ63nHf2fy/t+/G6Jc0=;
 b=joIVonppKH7L/9cKWRkuu47WiEiqzrPk0RdmrF7dAZt/uLEKxwVcAX3bl8lOph19a3
 GIgfy2HKosEhgpmIuXSqThrdg+R8OWwmGaEWFxg+Hj5lVQ25+ji/by2i9LH0DAaFjtBv
 IRGwe/hd5JOpEV/uha+VS0uPRAKhjL+mv3sPvHh2Ke00a784y4yyWGQcXFvD2ccypGrI
 SkIsqhnjxPlo2cT3iueoPJt+1yM4WERXWDix/tsdwBNwW0b0krKLmdVGs7ym27Hjjxs+
 7UoE+qpOkEYSlCs9KqovFoNR4MH0wIld+g65HizobqFVGaghynfJLpaavRTZyQhIsdkw
 WDnw==
X-Gm-Message-State: AOAM531oP4IyP9CZHs9dTbPx3stnB5o1oa/02ma5SC4PpEVEI4k4iKnp
 MsWSF54QnKWlUhTqfcjCdAU=
X-Google-Smtp-Source: ABdhPJzeYp620vLruglmRKCzBWwVvuiTG66YWc4vci+zzvBDZ356PQ8IORZSh2k5wvNENuSDBoGD4w==
X-Received: by 2002:a05:6870:c154:b0:dd:986c:afa9 with SMTP id
 g20-20020a056870c15400b000dd986cafa9mr2318919oad.160.1648724063688; 
 Thu, 31 Mar 2022 03:54:23 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a9d5a18000000b005ad458facbdsm12352123oth.27.2022.03.31.03.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:54:21 -0700 (PDT)
Message-ID: <aebbb5c8-1d27-5e66-e18a-e2b647bc8cb4@gmail.com>
Date: Thu, 31 Mar 2022 12:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 1/2] dt-bindings: mmc: mtk-sd: increase reg items
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-2-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220330094532.21721-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_035426_521506_31AF0B97 
X-CRM114-Status: GOOD (  16.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/03/2022 11:45, Tinghan Shen wrote:
> MediaTek has a new version of mmc IP since mt8183. Some IO registers
> are moved to top to improve hardware design and named as "host top
> registers".
> 
> Add host top register in the reg binding description for mt8183 and
> successors.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 297ada03e3de..2a2e9fa8c188 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -40,7 +40,10 @@ properties:
>             - const: mediatek,mt8183-mmc
>   
>     reg:
> -    maxItems: 1
> +    minItems: 1

 From my understanding adding minItems is correct, but you need to add also 
maxItems: 2 as there can't be more then two register entries.

Regards,
Matthias

> +    items:
> +      - description: base register (required).
> +      - description: top base register (required for MT8183).
>   
>     clocks:
>       description:
> @@ -168,6 +171,16 @@ required:
>     - vmmc-supply
>     - vqmmc-supply
>   
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mediatek,mt8183-mmc
> +then:
> +  properties:
> +    reg:
> +      minItems: 2
> +
>   unevaluatedProperties: false
>   
>   examples:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
