Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D33C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h40vN+qJJ52nmDTyQgAC0ol3ryuZTxWuQn3SzAIhtNw=; b=QDsg4dXpb8c0cj
	6+Tplh35DTbCL8qTQKqo5+BLfyN7jmkSSQPZhZhZusGe+4VKGdY9OmU1tYDYGa0OhxFdchNodXbDQ
	Wc8BCIw5VRxF8AvrnhY1sAT+WRdT7L1yrdGa72IY6IRiG1HgxSNteNlk/JiEalakRqz9faQl5J8sW
	Wt2XEzQtbxYjX582X+PncNSM6kihKUESIUVLE1xcLvk8hZJr8kzkUiZe/ByvtE0iggC9ou2m14ysM
	pEC1jecmkuYWopT03sgHGo/Xo6q7Lz0avot6XKwN4YBSEVCZW4HcD4G6vfIbvTD5/DOXBMAcDVfTv
	mLTKXJRGOy2CCPcIAUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrnu-005px1-Sv; Tue, 03 May 2022 12:38:58 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrnk-005pp8-E2
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:38:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id l7so33214510ejn.2
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1JzddAt8K9KGnbx/PddWeW/aXpN8uCRu8TkesisiDg8=;
 b=mvfUxP6pt9vzvdBY3cVNbRy+KclvMGErYbINAQW6NaHF5qIv+VNGWVeFMp1gMYRsvW
 FKW/A/e/+7ChGel9+1h5uqqZvBLN6e46STMYIa5nxK+NVKJkM3iP2clrXaUoZePekwmR
 UBshk2d157+fhruoX02+No2KT64NPhEsdNgkgFN7IMqT82W8A37hwTjuJ7i59Du1zX78
 EfNqWBotmAJ5tc31hcbif3hvyzLxsJ6iE2ZsqAv9irIbi76ralcj3gsiDxE8BynrZKAT
 J5oJ6Ud1V/ikyua1wctmHRGrCfkaUglX8vmzSQv49kEP1I3Dh0PVRG6Zm0WmidW0JmNN
 9pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1JzddAt8K9KGnbx/PddWeW/aXpN8uCRu8TkesisiDg8=;
 b=dbX8amAuah/YgCfZ6En8siDfkzPO7XcZtLlqTG22bWzSCZVWhAeAPG1ezihCy44NfW
 /PntvdR26MgGMTCsRjP+q/4CmnLqqOJFhxn42Ywk0FnoqWKqXJR1dz6CANZSsVySo37X
 ZxcYFqcUQMZLjaS/LUQVKN8jF/tC1Bnhixdw/PEveSYmmsBC1JtOtXb93PGcc6xsH5ZN
 7YENZ6I+1BBfoKRMfC5xSt1RXMW8D2uoq/55yhvmSg6F9ZwKde+5z1HoP1htLo501rFb
 FIBRDCKMc8Uyv3ckFgGYNwC32NHz62ZqYSwNc2YS5F9BU5u5uDwdx3irs8VkZfvj7Mci
 e/hw==
X-Gm-Message-State: AOAM533oK2BXKJRZ/+RBB8eUDqsTA2KYArsXxk8k2fRXal3phB0vdX4K
 THfsMmWK4SPf31dekqgGO1SYwA==
X-Google-Smtp-Source: ABdhPJyj7uCkL5z6VEhssOxk2Co2PObIARzRmJNP5V68Njhr6yo5+Ano7T8RW1xl68iEBFu8/IGXew==
X-Received: by 2002:a17:907:1b09:b0:6d8:faa8:4a06 with SMTP id
 mp9-20020a1709071b0900b006d8faa84a06mr15055215ejc.701.1651581526703; 
 Tue, 03 May 2022 05:38:46 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ra48-20020a17090769b000b006f3ef214e69sm4580843ejc.207.2022.05.03.05.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:38:46 -0700 (PDT)
Message-ID: <ac774c74-4577-3dfc-7bf4-3c180d45b420@linaro.org>
Date: Tue, 3 May 2022 14:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795
 power domains
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
 <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053848_544251_666CE4B9 
X-CRM114-Status: GOOD (  15.08  )
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

On 03/05/2022 12:54, AngeloGioacchino Del Regno wrote:
> Add power domains dt-bindings for MediaTek Helio X10 (MT6795).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml         |  2 ++
>  include/dt-bindings/power/mt6795-power.h         | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt6795-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 135c6f722091..b448101fac43 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -23,6 +23,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - mediatek,mt6795-power-controller
>        - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
> @@ -62,6 +63,7 @@ patternProperties:
>        reg:
>          description: |
>            Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
> diff --git a/include/dt-bindings/power/mt6795-power.h b/include/dt-bindings/power/mt6795-power.h
> new file mode 100644
> index 000000000000..0e27bc7fa748
> --- /dev/null
> +++ b/include/dt-bindings/power/mt6795-power.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

If it is not a derivative work, should be GPL-2.0 OR BSD


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
