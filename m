Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1939C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 11:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fyb8cWovIHqjfoKBUsRkxLqfHtzttGTVJMM1/mMniBc=; b=n/1TuTuTR0Cc7kGO+0quContyt
	UZHCpa/7aqiLQQg3nA6eiVH+uewjjmjEAty7UTNSjrOpfM++1pzJC8kSR9fzUcziJPUczGY6NTvwP
	sbQgcXjiVgCCfLAuLzU6kyIAN4RYuFgu2CjI4Ca9Ri4TPfJPr/89AVFxy/EmQRROQ9FTb3cHzewpR
	h50Y4Q4GGWRtIQ4hGozKCFSXKXhwjOGV3IBD87q5kkAi0DchKRblae94OVt8/uxN7N4BCdAT+ksGD
	cm/4AD0Dsq9KGn6dgrY8b2IwmJsDJpWXDCqVZoRFJ3A21bxFRlGXa48hcqFKcTlfziUzSQHdkdVoO
	kyoTejWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAS2-0085TL-Hj; Thu, 24 Nov 2022 11:31:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyARP-0085EB-8w
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 11:30:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bn5so1690021ljb.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Nov 2022 03:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fyb8cWovIHqjfoKBUsRkxLqfHtzttGTVJMM1/mMniBc=;
        b=QZk3tIfbzK4rNT+vIGPYUeXn4gNgs+gW6dkAXRxipvRcU4xuaMIl3agnzv/tg6k1s4
         LKxEj/JapkraxMo0L3Y9KUV69bri62FuZyfBMDZ7Grj59z5hpR6L4Sxg6fh+E14Ll2Qw
         kwbdatuLICRroPArSIXGB3rUucBLjcZITeEizV/yp5Mge5dWj3Cy75qb6k7pYAu5etFQ
         O1N2dks6mhny2t+RRF/bvCEyJ+Jre9HzBZSIhsXvuWZ5/Ijw/W2ILeYfZYpeA/X3pwvP
         nomzsP11aNAY4hKRCJOE7t/rWNKRoMmCh+DYBwAkmzvrT/9DGP6OXAl6o5EdTwPHsJv0
         P6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyb8cWovIHqjfoKBUsRkxLqfHtzttGTVJMM1/mMniBc=;
        b=2FITgxmepavWgOXhj2nzPvf+XdjyPq2CFSrlHx7ZM3ccKLBdKsgT9lNZ3b/Fze87ac
         5yNSYNSNOBEwlYYSf3z76FK6DBZZag2NWm+UjBPdMSxOJScvgQx+526361ZG97wpkaF0
         OgHv3LtEjds+gSWE50Bpm15NSZHajvB+MGHYv8C2ji5JBAL/UejQ2p8sTX4d1pY1RV3d
         Au9W+QdM7b5ZINWwkJqy4mAIcuolWzA2zL35DCPVDyCngqsaO9QGAfDGXOrg6i8UG8to
         EaA4Rd4LGH3JofRmCfSrXRzBN2VzuPrrnrsSkZ6L7LXWTTDAgrj9tAib6D7J82zjIsJ0
         Kehw==
X-Gm-Message-State: ANoB5pnNWPKWCM7WFBDgv0uiI2Jg3b3ur3UpJ9yM84rEnH5ZTWUSok+v
	GvQLmqn/RIAwRNLaUs96Yjlouw==
X-Google-Smtp-Source: AA0mqf7BKwwl8DQ9FRp+pIXisHGgV5Q1UBV/4F4DMWyHmsPYWp4b2sHCx8CXTm7yLTzau1VK7KZLWw==
X-Received: by 2002:a2e:824e:0:b0:26f:be8e:5298 with SMTP id j14-20020a2e824e000000b0026fbe8e5298mr5653251ljh.418.1669289445821;
        Thu, 24 Nov 2022 03:30:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p19-20020ac24ed3000000b004b4f1ea713csm95584lfr.73.2022.11.24.03.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:30:45 -0800 (PST)
Message-ID: <e5e87795-12d7-699e-1539-2e60b8b51957@linaro.org>
Date: Thu, 24 Nov 2022 12:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RESEND v2] dt-bindings: pwm: mediatek: Add compatible for
 MT7986
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.or,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
References: <Y39PjU1BqBB8tZ98@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y39PjU1BqBB8tZ98@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_033051_369538_78475F2E 
X-CRM114-Status: GOOD (  18.82  )
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

On 24/11/2022 12:03, Daniel Golle wrote:
> Add new compatible string for MT7986 PWM and list compatible units for
> existing entries. Also make sure the number of pwm1-X clocks is listed
> for all supported units.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
> 
> Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
> makes sure dt maintainers are included. This has been requested by
> Krzysztof Kozlowski.
> 
>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 554c96b6d0c3..952a338e06e7 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -2,14 +2,15 @@ MediaTek PWM controller
>  
>  Required properties:
>   - compatible: should be "mediatek,<name>-pwm":
> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
>     - "mediatek,mt6795-pwm": found on mt6795 SoC.
> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.

This does not look right. What you are saying is mt7622 is compatible
with mt8195, which is compatible with mt8183, which is compatible with
mt7986. It could be true, but I feel you wanted to say something else -
mt7622 is compatible with one SoC which is generic and common to all
other implementations.

> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.

This as well looks excessive.

Best regards,
Krzysztof


