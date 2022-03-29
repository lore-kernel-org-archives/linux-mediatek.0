Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 20:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RCj8Q/GSYaYiBii1+v1ADesfQ4ND40RD52a9RjtC14=; b=3gxYXmNFsyN2MR
	cDWYmZc+PeIu0AoMPZzXe1dxqasi1u0CwmHu5P9GWJu2NjfGGm2iH7bUY3AHdmwRjA21Lm/s7bygL
	3/Fyyvy5g9seQkEdU2CuUBXYi53otERlBrV9ayOPXAnH38GrSUBis7w0BHFeXOm7oF63l5JDCkMxU
	upw+Bu9Y3j4axPKbhmA7k0tQtAryv1dbU3op5CV55nb8FKVRrZVBy748B8EYB2Bwri6EKdSGU7OWE
	3rCyNfg1e/LR4j37LCtUdf3hjLqJXOG5IID8AmNPiLkIA5dcghzCw3x/ffB0fIgBVcMQSmQ4Y868X
	XUgn+TsLAGt5gmD99pXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZIcI-00DSGM-45; Tue, 29 Mar 2022 20:39:02 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZIc5-00DSE2-Pm; Tue, 29 Mar 2022 20:38:51 +0000
Received: by mail-oi1-f172.google.com with SMTP id j83so20213875oih.6;
 Tue, 29 Mar 2022 13:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4TtgqB+qx7XVjHzfNHtzxULilxnRMCv4wkN1Lk/S1ms=;
 b=cEbUiDzDKsWVlK9x+kHMEzLpaftXX+mz9RfnHGAfXhTgF67P2J9LkU70JdbKJp4PtO
 Mfg8gAcXTphvKTcKT5DysuUWz0gXDI3rJd62Uywna9UM3IG+tUyoG6czlcoiioae52T0
 oX6JIE+0sEr79/tfHQBFVOWNF0MPcTLv8opZ1SVgbk6uZ/22u+7Kaslqbx/T72N8P0iQ
 WUBO6brZb5e/fsN5sQsQJAsVndmySjQXDRarR3x3xU5TVyyzEN0pZIUq6vnMycPGOY8t
 Ey73OHgjx2Sg/QWAoy18cq8cheiyRaeuIBrCQZ7pW10cvh2DSitzo9o5JSYCL1EX4qo7
 H/Zg==
X-Gm-Message-State: AOAM533OiVY/EWRkImoE+b0WfFzUJPwOHaRNYdMmNoH/1IBvGq9we4Fc
 Iw7uICtCO+0g9K+LuXo4Ew==
X-Google-Smtp-Source: ABdhPJwQ4FlupI7A/BX1ZpZC7myqHedGwWuamCYndsUFew8tbRsRgZX1033348l40PCDg2B778mnZg==
X-Received: by 2002:aca:2418:0:b0:2ee:f7da:795f with SMTP id
 n24-20020aca2418000000b002eef7da795fmr499152oic.276.1648586327975; 
 Tue, 29 Mar 2022 13:38:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm8295009oab.35.2022.03.29.13.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 13:38:47 -0700 (PDT)
Received: (nullmailer pid 1228499 invoked by uid 1000);
 Tue, 29 Mar 2022 20:38:45 -0000
Date: Tue, 29 Mar 2022 15:38:45 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
Message-ID: <YkNuVTkTCfVJBFz+@robh.at.kernel.org>
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329114540.17140-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_133849_860520_F60E70FF 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Mar 29, 2022 at 07:45:39PM +0800, Tinghan Shen wrote:
> Add optional host top register base for the reg binding description.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 7032f7adf3ca..6d41bcec900f 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -40,7 +40,8 @@ properties:
>            - const: mediatek,mt8183-mmc
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

If more than 1 entry, then you need to define what each one is.

>  
>    clocks:
>      description:
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
