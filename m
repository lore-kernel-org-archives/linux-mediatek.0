Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09S/13fBRPAxsCorCiL70CGZb4OWv/aKFiKXIGNZde8=; b=EstjRuGYZ8DpdT
	vPLm+9tA3lsiyC0a4Kh8WK34HOYrkFAIdDvj5zcFUYrtSSYQmY4BluGkTPESRwS3AtxE5GBSeIvtG
	oSBI5LJ5T3OsWyyxQRw2aGdIJGNJhFCogZ8YoMm0wAXhmqMiwIsG0Wu5pGBCUJZUfW4jtev9plOq+
	b5WMtN1TIai4oWBM3hZbPxOytFXUOriwtHZnqbOBwLtBFJBS0s56VjaVxy3ekyMi78LnDdQl5fO3L
	rr1JYcml365JWULekN8saZ/vkTfw0Hzbg26igdMXQ0/NRbpUEyEDOE6ptNo2ww8M4/+O/sM45Vg5K
	ly8g7r6BVURHk7BKfaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noo9C-007WLf-5l; Wed, 11 May 2022 15:21:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noo8d-007W5i-EG
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 15:20:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id i19so4707451eja.11
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=geKshak1zwJUIf6OJmXvrC7YdZBGtitn11Vxo6ekyyA=;
 b=l20H3mA7oW2a+08LERco53HKdKbo219aB2WAapCII+6f+y9IzHx4HswyXM1KzGYjvO
 bzH58mV2hjC7NGckBKnwPYTxLnai4AVKm610If4TLKWKSBjeDLKw45Ih/1OOwktZPb4J
 tttTyazCCkuV0Udgr/mC7OfZiv4pt1gs0XPZNq51YAN7PnsJ8t5FOw+KlyUK8CKP7QlZ
 oB85sNr0d9Ww/tDpirsFMJX6WRtjgAEQe7MWx+rCxBO/4kj4kLuWryMRhb/x1bKFn1dh
 CU2j1xYQKKPrr5rZmW3Wo0UtPGq5M/m4zb83+fuiFaR8i5j5rV3o3gOzFoMRcBv4QOxY
 7GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=geKshak1zwJUIf6OJmXvrC7YdZBGtitn11Vxo6ekyyA=;
 b=iT/RQe+TmDH64w/1paKnqvCxpeKjEeQlG0Yzd7z+x04LnKOj2MXu4qj71FCPRkEMm2
 N1ZXwBy0zPnKweqTtdUWJMd4RnSNNUUcocbkqGpP6VDf6Y1+iUU+tfXihX7NXK3WaJWE
 o6Qj4rsQGiR5vpM7cPcb23WfoExXSxkZnEF4AZolG8XyfKGSMp2Qg1jJC4ZBTy2m6oXq
 vNSyGdO5zP2yBlHU3UxHLWuSGGCzf/F2QpUeGMO23kNqiLEzBNtNp0cVlER07Ozhqy2x
 osvJXvLHqw/yioBtzAIhly6FgXAE4BKkcBJh7vpyucJT29xElEJg8oPfuxvT51OMomC4
 E+dw==
X-Gm-Message-State: AOAM530NXcdHK5NOoXadVjCmj8caUIlF5lIFoEq6nPhmjk4Lt8bGMXMw
 YIq+0kcPbDDcapnST4/cvU8qqg==
X-Google-Smtp-Source: ABdhPJzp4+SiFl11hXg8UOEugmLgp6eOUHjNYxsYVthXNxpX+8C9Ahj3caDgh9Ngw0AFLp/1Je3bpQ==
X-Received: by 2002:a17:907:7e99:b0:6fd:c2a2:9620 with SMTP id
 qb25-20020a1709077e9900b006fdc2a29620mr6120374ejc.554.1652282428949; 
 Wed, 11 May 2022 08:20:28 -0700 (PDT)
Received: from [192.168.0.154] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 m4-20020a1709060d8400b006f3ef214e2csm1079710eji.146.2022.05.11.08.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 08:20:28 -0700 (PDT)
Message-ID: <78cc1d8a-e8c4-bb6a-1058-ab912b90ebe4@linaro.org>
Date: Wed, 11 May 2022 17:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/3] dt-bindings: nvmem: mediatek: document deprecated
 efuse property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>,
 Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
 <20220510132637.5864-3-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510132637.5864-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_082031_533231_F3020E26 
X-CRM114-Status: GOOD (  18.53  )
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

On 10/05/2022 15:26, Allen-KH Cheng wrote:
> From: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
> 
> We mark mediatek,mt8173-efuse and mediatek,efuse as deprecated to
> prevent them from being the single compatible in the future.
> 
> The mediatek,efuse compatible should be used as generic fallback for
> all MediaTek chipsets.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/nvmem/mediatek,efuse.yaml | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 529f5888d93f..04ecf5980b2e 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -16,16 +16,18 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - mediatek,mt8173-efuse
> -          - mediatek,efuse
> +      - const: mediatek,mt8173-efuse # Don't use this in new dts files
> +        deprecated: true
> +      - const: mediatek,efuse
> +        deprecated: true
>          description:
> -          Only mt8173 SoC-specific compatible with generic fallback should be
> -          used
> +          Please use mediatek,efuse as generic fallback to enable the MediaTek
> +          eFuse support.

Now I see the change, it's a bit surprising to have it in separate
patch, but ok. In such case, in your first patch don't add this
description. There is no point to add a description which immediately
you change in next patch.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
