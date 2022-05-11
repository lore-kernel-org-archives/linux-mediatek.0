Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C70AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My0ECp6BDAkzdzLrL993xFe39YeIdDDJx9V605Zyfdc=; b=YRAvc0FxU3TJbQ
	LjKcJfti2AqudnNh43t5l4qDcm1TJSOokx6yeAd5xYfnOYBw2Uo5eVTHpfjWN9mpOKPEMyVgA+Xre
	yvYWpQqnDkg2RxaOoA+dIsYZ/ZxiocMXODj2/E9C3mBFaqo4gavanDmbnZxuz4HTu3EBARJlkj6n3
	h/oj2PYrqZ7Ri7g6NS3puy2ub2EVzPPKr6PtfO1/2IxVB+Pf95GTl+XkHb+G2MCz3YhPOvD50CSHG
	jaKZVUFQjf2A8qQEp4y6hIRmG1L8MEJzUn1CBWEh2MqDhv2dUIa1n2bkUeWfpl4v7iqg92mPvl9tm
	1mcfK/Pm2/eWNGi9+D5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noo5U-007Ucr-3J; Wed, 11 May 2022 15:17:16 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noo5H-007UTZ-37
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 15:17:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id ba17so2976497edb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mJWH/lfuqaU5M9ClCLXzwM3OtS13pgUbIbBqib9/b5Q=;
 b=ddJhLrfYUIgcxyKQaBI/0k415nx1UNPNu98YhvgC0QlOY0Ocgejj86nL2/rEb0bAn9
 c40Yx3zPRL28IYuLwUjNLLft35OstKwrmM1bYiJS/ZqFPkRcJtw4MJBo83nyKMYzUqDS
 qV0lGZKiLfZRCZMFLb5Ng9Qa+IAi04kOv5+cudFwOhDVUjd4mC9stNMAqP60/Y31f2oY
 4azTzrSqzsYxT1GynXLkRdUKqN8WX1sQqqK5qxqLOMSWKVeQ3FQDcEO2pDnsqqpoY1GL
 kiHTYB6eyaV3HXxFPi2MidsBU/g+yN4NFoKHXHgVFoAiokwxrrPKlC5DmjDlLnG05rGU
 YBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mJWH/lfuqaU5M9ClCLXzwM3OtS13pgUbIbBqib9/b5Q=;
 b=ILNKQKzT+ANFKPRQWFTANPyh9LBSkSPyiVGA+Oz30wnn2Ry0gFrhQMgI1CouLRGoXF
 jh0nlOLIkPL1KNUjbpcQn7mi3erNIrh+cBa9DsMFFyhuLoJPWr7gZaQ4crscgj6UET5c
 qroXd4tKzIgiDti178qXM05OQd9bHwO9vkepbTbrW7C9zum7Zn6vzEnsI4qYNib6ukec
 MKBpnCn8mAWVSGBWS2Pw138tFkw0tnURoHkcqIrhqURV8LmzfGcOhDzq8ZyTUu6Se6Im
 mVyM3S5bthflwHmBsQ/VyURGZMU1uNyJoJJeoNMTASmm81m1RFdA8esnt6dA1G9hutdL
 X9Dw==
X-Gm-Message-State: AOAM530ro0jPZ6mmOmIkO20q8ohicSqwtsAXOBLqlcQIgTuFaT+7fU3T
 vYgU2RtexUhNyw51fxR5xpYNBQ==
X-Google-Smtp-Source: ABdhPJyf1gmEybUdj3DMvkaOP9NhT9SQ+0nnD2P+TaFDr2QIgSiYzka959iRA8NSpHNx7pCTN/VgTQ==
X-Received: by 2002:a50:a6c8:0:b0:428:5b3a:6c99 with SMTP id
 f8-20020a50a6c8000000b004285b3a6c99mr28532674edc.222.1652282219761; 
 Wed, 11 May 2022 08:16:59 -0700 (PDT)
Received: from [192.168.0.154] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 bw6-20020a170906c1c600b006f3ef214dc7sm1123249ejb.45.2022.05.11.08.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 08:16:59 -0700 (PDT)
Message-ID: <53da6771-b7cf-3050-abee-33d78c2ada7f@linaro.org>
Date: Wed, 11 May 2022 17:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: mediatek: Convert efuse
 binding to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
 <20220510132637.5864-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510132637.5864-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_081703_206485_03E4025E 
X-CRM114-Status: GOOD (  16.73  )
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
> Convert MediaTek eFuse devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/nvmem/mediatek,efuse.yaml        | 57 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 --------------
>  2 files changed, 57 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> new file mode 100644
> index 000000000000..529f5888d93f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek eFuse
> +
> +maintainers:
> +  - Lala Lin <lala.lin@mediatek.com>
> +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8173-efuse
> +          - mediatek,efuse
> +        description:
> +          Only mt8173 SoC-specific compatible with generic fallback should be
> +          used

I don't see changes here after our v2 discussion. In the past several
comments were not implemented in new versions (filename, title). So this
is one more case where you receive a comment and send a next version
without implementing it.

Can you please focus on the received comments and not loose pieces of them?

https://lore.kernel.org/all/0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org/

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
