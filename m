Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BAEC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cn7BURMfmZTSYvAjUDhBc61q3ac6L86uf0D6qKr5nQ=; b=VtCI8DAUQxZzVyA/6ugyiVwO5R
	43BtAbzabJBffcdv3wbA+Y12OTKgsm/P8arqr1u67z9qiR7s6+Uw/jUM62FM8zsmpip4IjlM4iWaq
	BVV9JBHUbAdxxPsd7eCONGoiEywRgznLgKN08q6eqt2yqlT6yiWQyagFKpNZrUZB1+FFbaLzc3za5
	dqVLZ1WocSM5FfKeBxYfhj9z0hdjOMn4dgNNchSzmlGTX5mbmo5yYvgL9jQacoNlUTyzX5nhcn84c
	AuqcR9vy+Bf8oWZfIyQ6/7sYqySqzSCasrX8rs871/Ylr5obJbm2IG1jXjLGJZe5zMa6aI8Y44Zd6
	IR00NuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tNA-00Ceet-01;
	Tue, 30 May 2023 07:02:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tN6-00Cebo-1z;
	Tue, 30 May 2023 07:02:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3094910b150so4072210f8f.0;
        Tue, 30 May 2023 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685430136; x=1688022136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Cn7BURMfmZTSYvAjUDhBc61q3ac6L86uf0D6qKr5nQ=;
        b=WpE/5OkdjAN1NHXIXDvk3BA+6Uw8nXLVBhjegNsl0WOf+FI9SjL/8dwAypy0fH/dni
         eYr2EPSAv3Mm6fS2d9UcbJihuuLHWW6QSluXwl1TDmOfzNG7rq6mgjBUrpORfzHqdDmw
         /6z+nK+ArUp8/pUXGwghd+56vjzGK3OSxiqrT2PboYNxkf+4J2WJk7fhSZ+fLnxYCeGw
         zwc4h2sIdMIK47LwE3VP4Gyw+ijlLxG3/xfUuu6d1FsR9EPDCdXk3XK51118g793ccbj
         04JfLdObng6t6xQf/P2PCR63O9Yt/1Yp5CwgGXoT2pDpX9LXbg3LA91X18lUDif2wbRO
         CTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685430136; x=1688022136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cn7BURMfmZTSYvAjUDhBc61q3ac6L86uf0D6qKr5nQ=;
        b=FDwI7EA2qgHoU0uGewG4VW+ltoEl3RM4eDBYaOKfnvJH/Bqa0fkHIVdno+6R3N1rh2
         mAwGDr0UQHCXC6nVBreSNaaNyMV6P7OY9bPr6NBjaMai+QhqUh978lTc1SmoDWYunU36
         yDlNGOd72Mx4KgnfEg/U7ckzmnDO9CK+pCSEiXaIOcBA58XnEzH9X88N0GoKzkMcI97+
         3SpsjvVrNeJkgE8D7fqYmfm+JljI6NFypWQp2i2GP2KhyU+Cs8QWwzk28Gdr+A3wLiNP
         kTc/uGLZz6UDGaSkb0kEFE0LEhdQEcSQD2OS6rOE/LaoUEnmJYN0AUOYUJu6Bjhcf8yW
         RhAg==
X-Gm-Message-State: AC+VfDxJ/8pHLtxC/ndsySNfXQLQURXGbiKK0THefx5TAU8Ts+V+fCfG
	F4VxQJh9xD735bRCojENH0A=
X-Google-Smtp-Source: ACHHUZ5rEMZz9DjgkZq0RFTt+kP47yJCCtuAlQ7pT+0tm1OwSGI9LO+LI9ebP3HRLxOGW1tkQ9pTUA==
X-Received: by 2002:a5d:5147:0:b0:30a:e510:ab77 with SMTP id u7-20020a5d5147000000b0030ae510ab77mr835727wrt.19.1685430135360;
        Tue, 30 May 2023 00:02:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c7413000000b003f60e143d38sm16401935wmc.11.2023.05.30.00.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:02:13 -0700 (PDT)
Message-ID: <6ba24acc-a12e-5d8e-684f-7032f4c53d6a@gmail.com>
Date: Tue, 30 May 2023 09:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/5] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for mt8192
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529164605.3552619-1-bero@baylibre.com>
 <20230529164605.3552619-2-bero@baylibre.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230529164605.3552619-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_000220_653542_E84B9E83 
X-CRM114-Status: GOOD (  13.44  )
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



On 29/05/2023 18:46, Bernhard Rosenkränzer wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controller definition for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../thermal/mediatek,lvts-thermal.h           | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> index 8fa5a46675c46..5e9eb62174268 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -26,4 +26,23 @@
>   #define MT8195_AP_CAM0  15
>   #define MT8195_AP_CAM1  16
>   
> +#define MT8192_MCU_BIG_CPU0     0
> +#define MT8192_MCU_BIG_CPU1     1
> +#define MT8192_MCU_BIG_CPU2     2
> +#define MT8192_MCU_BIG_CPU3     3
> +#define MT8192_MCU_LITTLE_CPU0  4
> +#define MT8192_MCU_LITTLE_CPU1  5
> +#define MT8192_MCU_LITTLE_CPU2  6
> +#define MT8192_MCU_LITTLE_CPU3  7
> +
> +#define MT8192_AP_VPU0  8
> +#define MT8192_AP_VPU1  9
> +#define MT8192_AP_GPU0  10
> +#define MT8192_AP_GPU1  11
> +#define MT8192_AP_INFRA 12
> +#define MT8192_AP_CAM   13
> +#define MT8192_AP_MD0   14
> +#define MT8192_AP_MD1   15
> +#define MT8192_AP_MD2   16
> +
>   #endif /* __MEDIATEK_LVTS_DT_H */

