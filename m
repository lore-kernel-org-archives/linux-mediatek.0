Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC118C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOsJVLNV3+8fzg2WVgYT6QH9y+i4e/+1YV4NKgsfyIU=; b=Of1y7UT0BnxCJu07pIEHYEVyJS
	alm7UTRvLYiaPTSKOlZHBB3DQqz80DGSc7ZV6q+Q1wj1Eg4usqTJLbE40cjJj+2Cfnhp/2JDC/SI+
	ArY7QapH3F9VKU2pYjLJo2AcZT/RiBmdEVPlA67eqHG+UU3dSp59R23NnRidehUkpEGfwOEr8+yu+
	wLKzBxV8wvlq1xYQDH9TLMQeR4L0bHf5JDvwVBfGBLulMnLjpF3g2j6/VZHM/8Akvjp+QzQ49Tn+C
	GbdS9VgDzlMhOqgSEUgZoe4lNTpHCEga4BNrd5j4awVLesCwYHzOAjuJ6FM/XQAdoP91nS+7OpDy4
	V8ysoYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIue-008LvT-0R;
	Fri, 31 Mar 2023 17:51:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIua-008Ltw-3A;
	Fri, 31 Mar 2023 17:51:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so14371175wms.2;
        Fri, 31 Mar 2023 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680285096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOsJVLNV3+8fzg2WVgYT6QH9y+i4e/+1YV4NKgsfyIU=;
        b=UQfsgOE9zWKSVm7VgqAUlMS6A5K0moAw7rhqbNGiP69ZoKSDDhgZXqEPnSsMQ68IJ7
         uWaRpgAIUiC9qAJqNAhYdVzfwr0h3JTrAtRrRFMh5YAzqTqGdOHZzKYQ9v+ZLFishvip
         b71sXRpxuQ2rEgDfYNljsi3yaGW3CbBDyHAz+hp7tq/EsoRZ0qwDVS0L5mAUAnUrHT1E
         g73XdSJ4NgCL5/1tnz8f+9e5oX1fNkp/uJtIN76/COQSV/tIO/avQYtEtbx0EA5px9ik
         wfAm7JraN/IiTaf+v6BJ4axOVJ/aC4DnzyyYTV17ZdHRSyp/oCx1zt/CHvhGlm2CKVpg
         h+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOsJVLNV3+8fzg2WVgYT6QH9y+i4e/+1YV4NKgsfyIU=;
        b=C99uSHnx3TrXIjVvx3j4xHFKCos+pMtAskfdGc2llw5Ei14vKMhz3u1DQybI0gIuHd
         kE9HcrCcfCJHBl6IuQVOlST7Vpd+s/ymJvSqtzY53p6gvCLxT5RH5BlmYgLyEMk2pCx7
         9bwRUv6qsbksQjpW/12h6MRLGSVk88WX9HFGc19+pH3t5+k6GMfMY+6Y5Ng+fUfFsjrJ
         Wt+htiMWTT25Q151RRferHBkFwWmuq3EXwxb6QAnof1GYKm7K2jZFiXHReGvwQ1px5oF
         gq14d8nzg7ZcKmc9DVhYJLTQyzqKK6Bgt74Koh9w6himWf1HOPkjP2zpvAd1CzQXodLq
         PyDg==
X-Gm-Message-State: AO0yUKWCxle3lmAhWmgFvrjGSq64cjArX2XuV+UvI4aLApX3k0z9jijw
	llk+2WAhJ6Q1CXciIOqeor8=
X-Google-Smtp-Source: AK7set9qL57gN72OV9S+5J0UH2Mo0pOzFKVUyACDaKG9cENwMUTAiW0fK4UhZJR7VMOAvyIF4sA6Qg==
X-Received: by 2002:a7b:c850:0:b0:3ee:93c8:4a6f with SMTP id c16-20020a7bc850000000b003ee93c84a6fmr21425955wml.32.1680285096304;
        Fri, 31 Mar 2023 10:51:36 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003ef6f87118dsm10827597wmq.42.2023.03.31.10.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 10:51:35 -0700 (PDT)
Message-ID: <42193fd5-b1f3-81ff-f76f-b11490ef2a94@gmail.com>
Date: Fri, 31 Mar 2023 19:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105141_020780_21449D24 
X-CRM114-Status: GOOD (  12.98  )
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



On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index ca0ca549257d..931d66893dff 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,7 @@ properties:
>         - mediatek,mt8186-mdp3-mutex
>         - mediatek,mt8192-disp-mutex
>         - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex
>   
>     reg:
>       maxItems: 1
> 

