Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D74C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf8HO/XIeQu0vGl/GZdecK7EeIByfzm/jVCwZ9wayQU=; b=BLGMsioXlAL4aLCWF+Tuesj7RT
	35r46XC2qDZbJB0PELWD8x40gmiv0FbWt/B1MXWKgPInixtt8znpq7f6uiEuy5BmgKaW6PLl2odt0
	uT+9gaNvH0vVf1LrzAss7uXrHsrjXWT/cxaf9eZDaoo1tv2PW1rnd6mmXpJPdbOuKGS4QwlJ912Iu
	JunebLimM/u3pIqCPXHQb1PIDqSZuX8WR/prEDbpjer3acXgkFnvo7HMyehFPGveqCCMIdKlRm9eE
	I7mZpNtMYrxzVRmLX3jNAfjSVI6yzgwwrmiYwTV3KhhEImhuuGQGUb9hFnLlX2NmuRJfRyzwepka7
	8+du6I+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oush5-009e3j-F8; Tue, 15 Nov 2022 09:57:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousVb-009XOH-5T
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:45:36 +0000
Received: by mail-lf1-x12d.google.com with SMTP id a29so23564070lfj.9
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bf8HO/XIeQu0vGl/GZdecK7EeIByfzm/jVCwZ9wayQU=;
        b=zJ9iFlPxC5kBZlShYAclfv/S2Xy2ncbwX/SBlWyAMca7P1RBBMOtGp1apfYkHbFwRa
         ZIirw0a6s+OyZjyZZS0RZLfZdq5hlxdClr3W6UXiK6kiklf543QcLcl755RcFJHG6SzM
         uBJGUiL8U41JTLktNMtPRFS153BRupgjrqMFgMK2Y4FdvUzGhAWUYOr4OleO9MQ00xjn
         JHzImuDzwkuokcuGwN9+NE7pobWnMlRm3cYNW+UzYvUZLNFi/yV1HDu8PWlqe90H2RJb
         qs8I/jJbcG+VXOqwf69XVb1eBy1QZ8RKYLHxDPL0d+qbt8Q15wEz7M4OZDbWGN+kngzB
         KaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf8HO/XIeQu0vGl/GZdecK7EeIByfzm/jVCwZ9wayQU=;
        b=WFL3LKRt33mGj0WhmL7npnYT2p+4AMAesB3NG8q7QBD929dE3iqPSaj4qJ4d8UcMoy
         d2fQ2eQzRHmKBOHwn3sEEO1NhvPpiIMDgb0nN0Upram5UNIi/zW6vFKvz7F9s6wwVNKn
         LIS4mzwaOTZdObBa5lKmkUug7mlcrCYElJoMGQMHkIucNJ3+StHALQf+qrjJo3jfQWMc
         MLuUyaoxycPAsKNmqdXAI51Q4j7TUMUmphz4uhIHMQU48i8YGmkHWhp4azAQbZI5/MCU
         7qI8yjeVtSf0B667rqNzhWg7EkTSmftuLwdPzDn7Ezm/iSI7rUlQ+eUAV2YQL+pSxLRG
         TqzA==
X-Gm-Message-State: ANoB5pm2qGhrWmYUfCgAz08mOubCEsUL0KrhN7I9DUw4KvtLl5M42QKL
	iZ2XfqHrtZWt6p0mNeIq3cstDg==
X-Google-Smtp-Source: AA0mqf4Wlvih1IVv17a57nIDdz2FyS6XUznZz9vKavTZNcBZguHWdtTfxHxa1eFqUi2cgDxZh3HDkA==
X-Received: by 2002:a05:6512:1296:b0:4ac:7d84:cb99 with SMTP id u22-20020a056512129600b004ac7d84cb99mr5102141lfs.412.1668505533772;
        Tue, 15 Nov 2022 01:45:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24c51000000b004b0b131453csm2140251lfk.49.2022.11.15.01.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:45:33 -0800 (PST)
Message-ID: <c119939b-0559-4a8a-e14b-92a139d64463@linaro.org>
Date: Tue, 15 Nov 2022 10:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/15] dt-bindings: nvmem: mediatek,efuse: add MT8365
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-9-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014535_230227_2BF6D8C9 
X-CRM114-Status: GOOD (  15.18  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add bindings documentation for the efuse driver on MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 75e0a516e59a2..6893f2a6ea225 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt8192-efuse
>                - mediatek,mt8195-efuse
>                - mediatek,mt8516-efuse
> +              - mediatek,mt8365-efuse


This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

So you ignored all my comments... awesome.

Best regards,
Krzysztof


