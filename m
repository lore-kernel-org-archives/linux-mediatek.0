Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8AFC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaNl+ijT1LjwDfHOCxRP8aD4iO5jOkHMfS/PbY8NG5o=; b=0hBNAul3XC0F3FWBX2vTPq5VXa
	j4+Fd8YxJ29p55ylrlsmZ782n8bEflgEObOzceusKQKStjePUPNCNj7coJIFWkX2ZYUgKVuqOSYQK
	GalXyzPfV4EOuZKdn0fXeQrB2atuKiGp5T5yg4Fkt2AP27YthZwP+qjacK4gI2AgIg8dOpj3Du+rH
	HKcWM41Em3wiv8QEDlUHGw3FDvYaBr49RvU0wWKaZ6aQQ3e+tp/yqwIG0SDoQsDsSai1ajeuDjYpq
	un6jnOmmQ5N/tm3NnJuAYipY/C1L3yce1P2EshB3MhQ6zGEQQv67NhVPDQifde97S+C/ZGuDcg8O1
	EAIfhuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSK1-005Kn0-3K; Fri, 12 Aug 2022 10:55:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSJy-005Kjm-RS
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 10:55:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id x19so844025lfq.7
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Aug 2022 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=aaNl+ijT1LjwDfHOCxRP8aD4iO5jOkHMfS/PbY8NG5o=;
        b=vxyPj+cWREDjzPfHlMEI4ETGGS++oBpkkT/Z8ItZIeGbY/auOJ9VffjXi3vILLOXOD
         Mo4fOrJX19n83rdKW55y3kMoxJXPsW3VNDMufG/BYD9YgGQXmwHnmVezKLYcSGjilxPr
         uTtUnjgaFRPTeCuer2xpXcUcR4Iw1HiDwKfM5sin/m7ISRpv1gn7LOs3dkOCFjorV73C
         ICUKRGn9+UdbtjCNfViIond8iPgwL+QYjeZNWrAKBWo1QSEULnQppVROKOfORzgCTplG
         9Igbk9lj21TDOx4yUz2dBCthY4WnoQWvta6ymrNWlz2t6jYvzUu865fqNAfTrbZsVquO
         Ms0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=aaNl+ijT1LjwDfHOCxRP8aD4iO5jOkHMfS/PbY8NG5o=;
        b=3r5wJyeDtaf7AP4emPPCsCF9vfAQjuhEKzmiOCSFykqbYzX52i247GUWKqIi0f5f+E
         ZyeNbpDLGZ3SwRE+GzKMtWnnc6b6vB8/4UZrgh6nsSJf4BKmP/A2jh+NcTYw3IYjOAz4
         0vjKnwg/sEZ8g9JW1Az/I8i5/lJPkt0PANHaVxCMOGLhmw9sSfyvj+f6/rgACq5iCQjl
         ft0DtvY8xkUmi5NepIAsUDPB82cVwBreMak8W5mPWWJhUxQWmHsG1LBHT/qQg1iZwr1q
         E1lgtus4SgjpPtz3JoSVgzH+eeXI0RQKsjeDrZHOJR8drawVFox2z1EvulMSpaKtoExZ
         V+Wg==
X-Gm-Message-State: ACgBeo04R/HIYwflVNfiPLeFGMsLcnDxcdTUw0Umz3K6zRjH016skZ/Q
	qk0f7lMZPlj4FBirpKswL0MiyQ==
X-Google-Smtp-Source: AA6agR6nxVAvP/ztJ9CWdcMb5byQai/Ut0mSg3vYquS5IM5ugPUQ8jhyJXPddJBUAd9gQCzcpJbNfA==
X-Received: by 2002:a05:6512:2313:b0:48a:e615:289b with SMTP id o19-20020a056512231300b0048ae615289bmr1069198lfu.201.1660301716964;
        Fri, 12 Aug 2022 03:55:16 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id l9-20020a056512110900b0048af3154456sm173419lfg.146.2022.08.12.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:55:16 -0700 (PDT)
Message-ID: <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
Date: Fri, 12 Aug 2022 13:55:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
 <20220812092901.6429-2-zhiyong.tao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812092901.6429-2-zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_035518_954337_5902D33E 
X-CRM114-Status: UNSURE (   6.73  )
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

On 12/08/2022 12:29, Zhiyong Tao wrote:
> Add mt6366 regulator document
> 

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6366-regulator
> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^buck-v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> +        type: object
> +        $ref: regulator.yaml#

You miss unevaluatedProperties in most of the places.


Best regards,
Krzysztof

