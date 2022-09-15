Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E090C6FA90
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 22:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpqoR6zYZaDbnVePsdH4FdM+xRD3zWKF1Haict6bhus=; b=UHH/sa+6ZEKgY7/kQKhwvE01UN
	yFqMI7poTcadzhRdhQdkhVAEmUx9BEq2Mg94Pg8zOf0V77RO63zQlDOELTl4/2Y+rNyDaSEIKJd7g
	PQROh1mMGirLyiXb++ukjtJ3/+Vg6fZotlNAxoxFQLHAwm+fRsV0Pn7C9qmgtyBAiSHvl3KKiGS6Q
	59wxCaswAL4+rVscuRtYrGP9zPqPLqwvp4qBGeMl2Rs/BMVx6T1WGENekzFAwfpb9ueNUsXSAU2Kl
	uD5EWHFq+cvj1q9i0qLbBGstHubXaQVC0fN7L/4Gi8o8t4H6bLIrVpOSvMB3k1ZaJilIbQsbdaXAp
	NkF2i18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwzU-000j4c-CO; Thu, 15 Sep 2022 22:05:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwzQ-000iva-FI; Thu, 15 Sep 2022 22:05:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id x14so95380wrv.2;
        Thu, 15 Sep 2022 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zpqoR6zYZaDbnVePsdH4FdM+xRD3zWKF1Haict6bhus=;
        b=XsVZUp1G1GndrcNDmonhqsYyg8HENAjE19GNzlYPa/9kJbmBwf5y8+EJXbj0+cAhPJ
         K/d+4UWOFoDSxeoGXdWIdcZR/FU8eOo0ROvShTuaP1k0e9WN9d9NxzdivNQz1SyuC1s0
         HFknvEWVqwQWonj6Hjtb2csapqZ8tthlClB/YlLzrIPHCGItCQSFE+PoO6evABmQEIL6
         0cXE5lJQ/WGwcjbX8iAqVaG+8Ae5a3o16RGAV+/bFA27j1PzMp2FoCDIx8yMhVjblA2Y
         fao53K60h9ADNAbZt+b5wHD7mhvKx+8h3JPGzSkufm6Rixa6jeUaX0bsQyWwPVD1Cx7Y
         DhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zpqoR6zYZaDbnVePsdH4FdM+xRD3zWKF1Haict6bhus=;
        b=dZfn2I/3bZ9dypGY26Kv+jNYPIfW8wicv1CfQq71U5ny+9eImCWPzld9nGLRMiYWKw
         Jdb7t3erLxWo2QLZOdoZ0XR3QBJYoqCPACTZcllO0PVaFV4NgoQaCdszwKBg3ZRM5u/0
         /CDbxwf/P/UTjQLBcsFrIGRh4Nfvg/VGuRDIyrFNR8C6T1U03QoDSzdi8ID6TXHQZNyH
         DFjQk1OpcoxCd9Yv3rcnub7sFMw01WRArdBNlawC9Ad8wFBr0QQXajLLLz9EXzK0hGsq
         GMKnFjJ4na7sZglyhdj/R6q2xLpTZ3pSOjNpOeyD6n8YuyMN1y21GWscLZUwuc4orVM4
         vVgw==
X-Gm-Message-State: ACrzQf3AIqpaAQs7EAoekEGUJd04Clt6fOpqpgd+W6mkB2QJzd72fNGS
	/lb8HnD4TUaDaUfj0SHxD4U=
X-Google-Smtp-Source: AMsMyM5AwDHR+8oZ+u3KaLAwxnWLC8Cjl6pFCJwRn0zoZVRLZeruSgKYx2FpwJShdi51jWomIYHDfQ==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id e35-20020a5d5963000000b0022a47edf98fmr1022216wri.155.1663279536730;
        Thu, 15 Sep 2022 15:05:36 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003b33943ce5esm217457wmq.32.2022.09.15.15.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 15:05:35 -0700 (PDT)
Message-ID: <e6921ed7-a14c-aadb-abd4-1e7ee0a63be9@gmail.com>
Date: Fri, 16 Sep 2022 00:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915161817.10307-1-jason-jh.lin@mediatek.com>
 <20220915161817.10307-2-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220915161817.10307-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_150544_542840_87BAEE7E 
X-CRM114-Status: GOOD (  20.93  )
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



On 15/09/2022 18:18, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..0e267428eaa6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,7 +31,7 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys
> +              - mediatek,mt8195-vdosys0

Nack, we miss the fallback compatible, as I already said twice.

Regards,
Matthias

>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:

