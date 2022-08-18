Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08EC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqdFW3oQXAaOy2vD929UNnW4uaTA9ODo4Hnd/8x5r/w=; b=ajTYZ/fjV8w96MbjBmNqukNvzk
	f1pkp98eNHC1F2xBfaiJjZX6MU81tu4tyeDcUsF9DjpBkms1+EtplPx68u0xN2gWQkLiAcyzqQx0C
	aXr2xRED6F4/kjUc5dEFo0bZtbRUL3aPedbX12LRXX52u0eNlHTUBvhSELBN18pqn8xZAsLjuuueZ
	XPsqqRqGYK7k2gLdazNBI3PfU2ev30dcE6ZE9TEqqSOQtOIVcEptD8liVXUQ9gx9+jx8TpvZg6tTR
	h4hO8UmsgKEIDQzzH+QoA82jsMUyqIcDAOFAi364YmBKnxwDSLUGBNKPQ6YTDPYxg03Hmrj3YHAHj
	LZitqRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfup-005hc0-9U; Thu, 18 Aug 2022 13:50:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOflQ-005Zr4-4p
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 13:40:49 +0000
Received: by mail-lj1-x233.google.com with SMTP id q18so750539ljg.12
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GqdFW3oQXAaOy2vD929UNnW4uaTA9ODo4Hnd/8x5r/w=;
        b=YuQDwPUo3DIr0crrpdiKWa7aeyFVRW4wxBAAJDKYqTTesQxo3XNEB7/JwZoqafvALT
         r11HeAmBrv9QiucR0M4IVeb3YctfJRVwDqIC9CNS6ERimqwegYhqz0qJOGA9HYrl+Chs
         pMgMGU+JXY/sTK8TJF/d9B0kYD/ojMFW1HY4YWSi7r6Gg1nnPnRjComN/AVWdpqVvbZg
         ThmVGm3VmvUG0iyuk9kqhUITpc1meIymgB79yc+laAB0OzzkFVlmYjeFCHWm3vAAtixI
         FXifZNAdGxr1Fl7ab5VDZrYCbH2mwR/eSD66rBj74nccZIRCLmh0fiqVkZFlz+awnEm/
         8c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GqdFW3oQXAaOy2vD929UNnW4uaTA9ODo4Hnd/8x5r/w=;
        b=4T/8Wtd5Ty/gcM/vlyQxWOXqvw0l7Hac5brkd/g+ITkxuUdMQMLHnHHdeu1to0I8aE
         0vsNQN2FoU1pSGgT9Sz+QcTDc5cTeyxj7jxupJyx8h3ZK17nRCiwWPSMf3ElTwgkXYio
         yNVHwLWAtOVYQneQ6Iok77m3vRMAcoVAW0yVjhwFuPWw7XtjjJhpUjZULuKVc7Unda5i
         xKqgkeVMm8Pplh/HykzhokMMFa4AJlo0/ceWuB7AoA5IncgEY5BVFai9lNvpAk4ql5Cv
         Q00qD/kzBUV8eIUR52Onm1hoRURPZ7vAwXM8tsS2KjLrthMoZaj7onciDKUlIYxSnMkF
         BQ4w==
X-Gm-Message-State: ACgBeo3lnNl01cgzs1O554y6DWpaCSWtKifCTjuMP+3rdVwlicsQ1Jry
	/+iYoWXSaE+pvQs/dmW63htM5g==
X-Google-Smtp-Source: AA6agR6canFiyg1kTCJm0l42OJhT+cDmUJ3ZeFSp8L6NUXKQ7yoOlW+9GVvc+6KFzATTGH1C1AljcA==
X-Received: by 2002:a05:651c:12c4:b0:25d:d71c:e249 with SMTP id 4-20020a05651c12c400b0025dd71ce249mr834770lje.17.1660830045692;
        Thu, 18 Aug 2022 06:40:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id k8-20020a2ea268000000b0025e53413b6dsm241886ljm.2.2022.08.18.06.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:40:45 -0700 (PDT)
Message-ID: <9947dc76-ab12-f840-3439-ca383c02c598@linaro.org>
Date: Thu, 18 Aug 2022 16:40:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek
 MT8188
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>, daniel.lezcano@linaro.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220818124602.20394-1-johnson.wang@mediatek.com>
 <3d91fe87-feed-d083-9eeb-51293aead67a@linaro.org>
In-Reply-To: <3d91fe87-feed-d083-9eeb-51293aead67a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_064048_241278_94D81362 
X-CRM114-Status: GOOD (  12.20  )
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

On 18/08/2022 15:51, Krzysztof Kozlowski wrote:
> On 18/08/2022 15:46, Johnson Wang wrote:
>> Add dt-binding documentation of timer for MediaTek MT8188 SoC
>> platform.
>>
>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> index f1c848af91d3..8bbb6e94508b 100644
>> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> @@ -25,6 +25,7 @@ Required properties:
>>  	For those SoCs that use SYST
>>  	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
>>  	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
>> +	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
> 
> Where is the driver change implementing this?

Or is there a generic fallback and you just added a specific one (not
visible on the diff)?

Best regards,
Krzysztof

