Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606FEECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgZkkoB1Bz/RFAHmuKSBre2q5MgmdKHQaadiUhQuwwI=; b=izTTNsGV1MlhYwvEn7DSvNjWaS
	rsAIQ/raRwQRncL9N9AO3TEKq8wYd2Bc6YMQnizZ+GjfWc4QR+VDTBdkw6fhL7LA5/KA1Ik/rAKUo
	I3rlYxWhXFFrWommVzjQmn4ze+EuX7YCmqWmgIYLOGXC5ISLChSLMk7wOIKtYvXJvB9a9jUsnxGAw
	uDBRIMnhRpFyoUpKOhO21l72FmYtJjQOdMzsAaALtniOzMTxsGfPTpVWFMPLasiqXVJrLVhuR1+v8
	JoeAyM4EZ18g7lnqwi0lh06gWv1eKyRWrt8B1E8moTXaef/Ixk5/5ne4+QmuMq39ZR24Zv/eyzl/O
	KB6irtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZrf-00A90k-BK; Wed, 14 Sep 2022 21:24:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZrc-00A8hb-4I; Wed, 14 Sep 2022 21:24:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso12433033wmr.3;
        Wed, 14 Sep 2022 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cgZkkoB1Bz/RFAHmuKSBre2q5MgmdKHQaadiUhQuwwI=;
        b=FdPcRIe2gfQoQCjx1QOFkmGSVgwgHEsr++MZRUCMzJE3Gcaf5+etZRi3EQbCidd10v
         twQrXPlzLivRZUJ1R+dE/qZTWuiVHDGNr1ffeusOuRSHuCA831r6P5sya+sS7wXO6DLy
         SgrqggAbmAZY6ydB3BLwpozplPD3Ts6GR2JPVAt6I80V7plsYzFai0lLopZcp60+Dji2
         9eHgVLAXCCoRLe7zo6ZiFvzrmP89NLmmxtqP779jY8gMZcd+pPwc0NzBVDJuZ4g2ppRw
         FULL20YpZmoqhpUD0AK7WVHOIYg4hBzRGEX0XcxR+alvdpo56XTcGW62njpb3ejILjOc
         SG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cgZkkoB1Bz/RFAHmuKSBre2q5MgmdKHQaadiUhQuwwI=;
        b=vMUav4DzPyP8t25ZLIFO5eR2F5oiFgVBO0F5FjE/lkYRGt/50shQ6AlX70rUwy4u50
         J8vXHxz7vSk2HhI+gPKB6tc3guzDeAKHXxnjv/+zeu+sg5czqP3MZyZf8eSayIW7wrP6
         YJ+T6dhH0SmJYEf4umo2R09tcCMc1xcwBvAxS6lWn4qHCvjAyoW8OEzbxW+x4c7ZJ+iq
         AiPEbSqBwUvVV2CN2522UUBFHcgSpr/WY26HEEfIsGGPMyDHRWP0Nq5E5yCrFqf3qL04
         SZdhWSr5Uc586zlovOxC3H5Q6R4ZxYROM/3xDAwpJ8yMICWVvw8yhPfDfZrSBJrzmbnw
         Vesg==
X-Gm-Message-State: ACgBeo2xTjuxjM3sZ7Hi+K9nLqSbyuZhpyZ8X1skkpNVCoZ5m/mT4xYQ
	3mub9CC8Nv9CRnDegBDthAI=
X-Google-Smtp-Source: AA6agR6BDx5TGK4RjiRpwjFmyhCS3CrrcO0KEfqjytiVgYBb1lg3M4YSvUYYT25pLio+NHumVC6uEQ==
X-Received: by 2002:a05:600c:6d2:b0:3b4:8361:6154 with SMTP id b18-20020a05600c06d200b003b483616154mr4648444wmn.89.1663190644349;
        Wed, 14 Sep 2022 14:24:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb52000000b002252ec781f7sm317708wrs.8.2022.09.14.14.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 14:24:02 -0700 (PDT)
Message-ID: <1b739216-8bb1-162b-1af5-24acba7324bf@gmail.com>
Date: Wed, 14 Sep 2022 23:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
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
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-2-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_142408_219548_E50705C7 
X-CRM114-Status: GOOD (  21.22  )
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



On 14/09/2022 20:23, Jason-JH.Lin wrote:
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
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I'm not sure Krzysztof gave his Acked-by tag.

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..a53b32c0a608 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -32,6 +32,8 @@ properties:
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8195-mmsys
> +              - mediatek,mt8195-vdosys0

As I said in the last submission, we should make mediatek,mt8195-mmsys as a 
fallback of vdosys0. Actually mediatek,mt8195-mmsys is only used for the 
fallback of vdosys0.

Regards,
Matthias

> +              - mediatek,mt8195-vdosys1
>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:

