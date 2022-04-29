Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpzP7PDnHsOU3/EkkavXQtoXZWfjTVTpMzczSnJnREk=; b=1yEZQ5LfuJyTTo
	3ZQpkF7E/LtPrGBPn0qkTsNxkExmUOQx2xu321nfX5QBdo3Ob+zZc41MtZSHjg+gi4kB+rwIM4Zkc
	pcZOr+2U3ivO0c6ZoSPU8zvkgzF1fpA00ywx1g38XfcBx/9RJ4PPWQyUntCm7qKlBozIyu+LFihnr
	8uXMaa4WinYITCznng4wGb6dmQf04K9/BJH6ToTQ2FZaj9u0apCsEVXwfWawpSu1bx913HLCR/MnZ
	W9KsPkevK+gaEPwsnr7tAdmr1XevIroO6iRs+F/j/GFGwmdEFkyi8mceyuHyZ6IR9eOIrurvNttSw
	vSjW89ciCiAHOj4PZ+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXj9-00CfqP-9E; Fri, 29 Apr 2022 21:00:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXgm-00Cen9-PH
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 20:58:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id n10so168592ejk.5
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 13:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jOyMAEVjtx6EhOn3fhrULMJi53nS+z6dpTQwH2rDZQA=;
 b=ZliiAuYLvhkr6Fth+vQ4kHAabPbJJtoMS9fAAQrt0Xft6BG4b7lvpXf/nkNAYpykjx
 ZLavgDJ5DZmF+mTr22z/98AhZgVMhVF8esjiOY5VLDXvpU1W1z7Cg5o8HDPzxF8R3MBW
 +qVzCe0kh2cGp/nYiBX3doLZheYXjJSYM2AHH1jSNvGyPtniK1lIx+rLgvpRbG74ndm5
 jpc2PiAk9kMTiSBYsIify49J0JKPQ8k3xq9NauAUCWEqeP+/C5buokLDFmiYIXGY9ZBr
 ExBobS6XVmAVuAEEpKsZE+2WxOCnovU7BEeQ2q0QQGyJFHL9GrM0OnkwUI//GAkIZacE
 A+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOyMAEVjtx6EhOn3fhrULMJi53nS+z6dpTQwH2rDZQA=;
 b=6gZaUZJJ3bzwP1NJuh2KvyfnUB2oGfLi0wbMFS2O4W+wRUj5RomIxYNzTSzGOfSwAS
 e7XktWxqvKOF/xddyI4e+0yAm4rKSMa55CcgC6ML/tQLdJGyNX3AW1HftpTWNWk2OUVz
 xjadPpIBf4VxysAofEC2tSQnf2M+VDpNL9D74x0n+XpqfoiuIqgAWy0HxvY7l6ScQtfW
 mbVQc4DEGq64cmPol6WSkk6NehUXsnUiSylBXjpYUmbAU+8kDfvWbPGRFotDQ+TvvCfp
 OiLLEHdZMhbv45TdflPsqYxj0urapd89wPLTCRwGbTl/arKC3hQxKs0Uh3jy1XDPzGQA
 6Mkw==
X-Gm-Message-State: AOAM531SDvNzVQpNNQp7wgiLb5J4xlD1SPORRhuwQyYK28tZaWcyJLLl
 a0YahrFqLQ8ImkotZKlkEiXGag==
X-Google-Smtp-Source: ABdhPJxUD7ft+rExvbzfsYIw+efZxKCeoimffyllGfEpZBqLF8p1xE77k6lwvrParD98yHYmSxMmFA==
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id
 kx5-20020a170907774500b006f3674a0339mr1071873ejc.207.1651265885800; 
 Fri, 29 Apr 2022 13:58:05 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e25-20020a056402149900b0042617ba63d5sm3329269edv.95.2022.04.29.13.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:58:05 -0700 (PDT)
Message-ID: <c9239316-40af-724b-cace-7da5bf7e8e21@linaro.org>
Date: Fri, 29 Apr 2022 22:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Cellopoint <cellopoint.kai@gmail.com>
References: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_135808_903983_59940470 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29/04/2022 10:30, Jason-JH.Lin wrote:
> Power:
>   Refine description and add item number for power-domains property.
> 
> GCE:
>   Refine description and add item number for mboxes property and
>   mediatek,gce-client-reg property.
> 
> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v2:
>   1. Add maxItems: 24 for mboxes property
>   2. Add description and $refs for mediatek,gce-client-reg property
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..2b27577f98cc 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -43,17 +43,19 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> +    maxItems: 1
>      description:
> -      A phandle and PM domain specifier as defined by bindings
> -      of the power controller specified by phandle. See
> -      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +      Each mmsys belongs to a power-domains. If mmsys wants to use PM
> +      interface to control the power controller of mmsys, it should have
> +      this property.
>  
>    mboxes:
> +    minItems: 1
> +    maxItems: 24

Wait, no, I wrote it should be 16 for one device and 24 for other, not
24 for all...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
