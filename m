Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFCC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE7N70141Au9hlevZXAZoj6fncNpv5mG2/2AtTaaiCY=; b=ulH6Rwt1Z8HRJfuwRpOdz85Uab
	QDc1OT0zF/2E372QMpyEJs+Z/nBn/1zFYX3ZgUQqxP4swuNSnWY9X3N9/D+B2aMvdL9m02M2Cz+bu
	UiHlsT9vElryFNrqSXCxCRtaTlO8kWQXqs5ij0sZtsX3uI7Y5zAmLQDhsyKbR/OBXeyL9qL0bQPCv
	r3HJHCOPn8nHLJGW8wavyJeWzUzeSBwQeb5ExnPful3poI//8a8ob6MlQK11iiezvr2hbWTV6/e6T
	duUJBpGjooL2Uk9Zu/LCaBT6IiwWCgoYuNrkcdiU9L+BdBCuLEvIw5JYVbvUAf/xmLDx0LvKAsfIo
	W++dopzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZhp-0038HI-19;
	Wed, 12 Apr 2023 12:36:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZhm-0038FB-2A;
	Wed, 12 Apr 2023 12:36:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id j11so14380347wrd.2;
        Wed, 12 Apr 2023 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302963; x=1683894963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE7N70141Au9hlevZXAZoj6fncNpv5mG2/2AtTaaiCY=;
        b=NEcoZuzS8P4iLio4nXH/fPKA+WVpnLFtlrKOnIPIT3Hx2KjonjAQrokGpRwlwnOBGO
         bGLkPeH7icTnEBAVVxA2h5hVZ/1gQr30E7WY8UkQUX7V3g/i1ZR3jOpLBmCjnONzLIqC
         p+1OB+B2Y9WPOSeoN4GbT1ZuCIZaYDEw8spi4Z8ZyVEtkGNDLFEuM0hEDHsgjQZFOKN+
         3zjg0YwBt3OUh20M6jYtvdwRP69s7PEMPcGL2c0bvNnWZCQFOgyvdvYS6OVvygJMRzR7
         5RAtXlaNgLtQpZeh2eBC2qzZ3blTgUd8gC3wOngl0DnYAfrFQ3N3kRQ9qTWHHc79qnlr
         J2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302963; x=1683894963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE7N70141Au9hlevZXAZoj6fncNpv5mG2/2AtTaaiCY=;
        b=U54oTjS6WZRv9RmnheSKl2bsNkmvT12vGo+1zsvMku2aNdZqkB40erXDWrii5p/rUY
         p8CE+sSaEgEqhHgsq+hfgR9zUF0OojXOIvgZepiOynZfHWnYuXlmLsCqX91UO8mafU2a
         JyFtWShrYRzk8hbGLXUj6usxYBppO/Gzi0bHEbdHg2G/MVV4nbmwk2yIQBiudLEi3Qab
         OvVzwl1RKWnC1qXJilTLUVgxvoTi0XzgOWB3M5LsVFykAqRtvEe8NGhaR8+1W+g4coFS
         zLBLK+rMpYkryo9BYVIhnnf++IaxKrfmaXGL9XMs1iJ/nyr3d7tSsvdey3eHnmZWxhJX
         UptA==
X-Gm-Message-State: AAQBX9f5FOuyrkj8LkZQvKT2rH5FB+4M+liCy06HlCbOeVlmTd5NFfJr
	fk55w1Rlsh9FQ4e1w1UFT1A=
X-Google-Smtp-Source: AKy350aeuLyAiDRCHx8WCMaCn9uP+PuosubsGjcr6o2UO9HCVUKys6W1CjIDSWkAVTjaxq4gQgUTDw==
X-Received: by 2002:adf:e441:0:b0:2f1:d17f:cf95 with SMTP id t1-20020adfe441000000b002f1d17fcf95mr7353387wrm.12.1681302963216;
        Wed, 12 Apr 2023 05:36:03 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f5-20020a0560001b0500b002cfe3f842c8sm17040059wrz.56.2023.04.12.05.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:36:02 -0700 (PDT)
Message-ID: <b9424113-f812-2f2d-5068-b04bb789e0de@gmail.com>
Date: Wed, 12 Apr 2023 14:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053606_710332_A59AE38D 
X-CRM114-Status: GOOD (  12.84  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795, using the same
> DSI block as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 4707b60238b0..12441b937684 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -22,13 +22,18 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> -      - mediatek,mt8186-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +          - mediatek,mt8186-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dsi
> +          - const: mediatek,mt8173-dsi

Same here, why not const?

>   
>     reg:
>       maxItems: 1

