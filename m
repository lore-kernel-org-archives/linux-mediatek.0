Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5B8C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFWS76R3h9QsLpCttf9/B+rEP4aR/9nRNw2d0vU0q/Q=; b=1WbGjpUpK/Qu/7FCdvSYPMVoE8
	0nLLRKxEnMODhe7aC4oBMXpZN2y3VbzHldXUT2nf+KzcKbhc33fLhuWZCtOj1hSzJfgB+BK1hyF8n
	OdnQaoMqCwcLKDuja7gsH+ycd4l1syg9Qj3XOEEvGuUkmrKLkWhsULscVtndC8SBHWMDHbXC6Hxlx
	1/GeYB/9e5YVtrwOc9JWPP3J6TRyDHxPh2n9KANHPbCVuxZzGO1akP1hgAAz0AYdkiaEMwnLnAOr8
	YJZJZ84NS2ThLNIyJYc22RpIMLeDLMyppUajH/Ehp+WHOemv2oU3lfb7NLRov0BFSUQ+ZmfoTQF3L
	0VwX6X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnElN-008h1D-11;
	Fri, 14 Apr 2023 08:26:33 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnElL-008gzw-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:26:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id q23so34238027ejz.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460790; x=1684052790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFWS76R3h9QsLpCttf9/B+rEP4aR/9nRNw2d0vU0q/Q=;
        b=EcASPij0WvVh/rYuXhVEmf5faAZloZE2t4UYU0BXcdl4gTgSUptbQsLFtLsc7ugH/A
         VrkIrW84WOgQuStS05zVMJHWUe4c60KIWeP898ib604lbZIJHMhzk5zWw4XBD/U4cQNp
         /nBpe9QZNg4yyQvy9MF1YgjjAcfNJT534gqGHyCdC+lWaH9RtX65VLbIwaBnz3VhFIh7
         EwLo7mMECzYoatF6jbhVPpS5Jkdcp6WJ5nQaEUGBI9hXYcudDyP5AIP1lCG6Ax/q+qTm
         b9atbsfLXC9G8dlgmHO2tRxUmC/H+Phz/2AEgStkivf3dXs0wmFVuQsDGtp5K3HWDeQ3
         KKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460790; x=1684052790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFWS76R3h9QsLpCttf9/B+rEP4aR/9nRNw2d0vU0q/Q=;
        b=N57h4RvkG6f/D908BHWlaxtCJ7cS8dPowcwttn7ZcWiJ8cGV+tcHNzo/ouG5Gyf4eX
         7yYr8ugWbJfkcjixqOY5x2kG402jQtZA8FuKOMpsrspzVFcoaYNvMox6YkQy0iShLhqQ
         wR6HTxJ6jQvQp3dO222gwztHlQ4r44CREpoT6X8t5X9+3giIcINVcStp7rusKO4SrpyP
         q/DUYSJH0cctYjKw8+JW30BIS8bTAt0twY7on6wyFvOs1YylzAoiaehGD4DGYjAzEutb
         qBhPwo8vkKud4L+5me9NybiAeBzL+gS5FVd98G6SAZS0xE8YWJDFlGrQiAVwFZUU0SnP
         bICQ==
X-Gm-Message-State: AAQBX9eCG8Y25e89Wv/kYdzHDN0R11b9gUZd2cebsPaYcPMEfNOmNeWc
	oNgSq0ntC65aVAL+Dm5Ap0rNCA==
X-Google-Smtp-Source: AKy350aXAAH9oxumIB0VCkKQ6X1tv2Gkk4qCEQ1975WV1xW90sQ4HbH3w6xNPv+SaTTgdUMIba9+kA==
X-Received: by 2002:a17:906:e096:b0:90b:53f6:fd8a with SMTP id gh22-20020a170906e09600b0090b53f6fd8amr6544095ejb.10.1681460790073;
        Fri, 14 Apr 2023 01:26:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id gz1-20020a170907a04100b0094a6ba1f5ccsm2125915ejc.22.2023.04.14.01.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:26:29 -0700 (PDT)
Message-ID: <5b6b5a21-1dcc-0b96-b4c7-01622af7e64a@linaro.org>
Date: Fri, 14 Apr 2023 10:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/27] dt-bindings: display: mediatek: wdma: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
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
 <20230412112739.160376-9-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012631_412558_2AC97FAB 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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
> Add a compatible string for MediaTek Helio X10 MT6795's WDMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml    | 3 +++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


