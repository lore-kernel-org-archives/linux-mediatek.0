Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE37C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlmjkGlmEwPeG1vyNfy2LB3FLh3g3BVhfM8XvqJ5230=; b=JwWms0ngcOFVjw1GFG1jR4kASW
	ZKKQ1+V74puAs6Fgjmp1sx/Qfd/X3HmKLPwxQAtxJ43SsAb/JHs667j5rAQ+ObYdGBE3FnqdOmSj9
	YTyuMIONOAGkRTV8FhqtjLZieCn8wa6pTYtJI8E363xTuhpO+OKxXEsrBtKRjdEq++mGp2E6IfqAg
	mcqM5lYCAaFtv2l5lWXILvCkn32oHRnMCBvR8DuHrn+v43MD8wCV7wVfQUFU3feQnAuiKfeBpI0TG
	4N/e5LDzxuP5PiuDtUuW0RSz/QQFt9ajZs6j9VfeoBXsk1A32NpZ2IpO1+68AwaCEe3o/T3RVq+LD
	kY14Edrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEir-008fkv-18;
	Fri, 14 Apr 2023 08:23:57 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEip-008fjX-0b
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:23:56 +0000
Received: by mail-ej1-x630.google.com with SMTP id qb20so43298548ejc.6
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460634; x=1684052634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlmjkGlmEwPeG1vyNfy2LB3FLh3g3BVhfM8XvqJ5230=;
        b=QVQr2FnlD4RjAAT+O04gy+/OhztUE5CI1IOw03DdQeNErGKtZQ0QNmWPYJRhXAi/qZ
         rmEwmQflx7w+RXnfLh61kVd7/iWTKr/P8th0I6NycDg6WsYSLsUmohzDXBFB5MSvH58e
         SkWMdUoHcH8tnFI1NEIXNVAkvhlfoDup1i7u5U/dbf5Fdiq4R2tSFqATAfYIqHRLcoYy
         QE5SQsRQB4q33v+Xwz7TTh0OG6vu/o6ux78k8Dj5EkI97XpQZ8ecHx17F8rOcRu73+Bl
         +FQENJm7GHhO7PzDvr7n/Pzdv+AnsGK10INAN/iBbYfrgUCOHDmhx3Q4QQrfcMFrDFgr
         9Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460634; x=1684052634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlmjkGlmEwPeG1vyNfy2LB3FLh3g3BVhfM8XvqJ5230=;
        b=CWTssAhzN6TrxZl0YHL//KMc5FZIDu89BTQCd5DoDpPQ9SmdZXMft2c57RwJm6RQEn
         gOqFVbMgF9u81RA2nWOdIvaiN8kqn7iFRA8dgD/W23c5KWIHoogtg8HwcAdi2k5uGxbd
         wJ9/qbesMfvDBwpvxiLzF38ceaHLm/2IG64t2kBHNWcE/IIM4OP2LC/M96PIRijBsCJW
         0rMvGk6dMRYjFUeY1fOW0zexCDONnuOi3bAW677Aa9PPXIIcF05knSIUg6/PURuYNPfB
         URldQp6jmroft+NY0SmG8NrhA/YojBZFITNcsicLrIHtQi/kuMJqxLR9ckmbI15GsF+5
         tDAA==
X-Gm-Message-State: AAQBX9dI6vJWKPAqaJG0XikZpvSU0A6JIZd4kgVq6aoEOn9IghoPVrLN
	RTKKQwiTJlTpBXV+LG1MPCDOLg==
X-Google-Smtp-Source: AKy350YDDfm28Hr4Wu9pej6rnmmCl1oHhpNzr5ms7AHGJkI6pneNOhN5mTSgVEdO2HuvAbf8V5rPPA==
X-Received: by 2002:a17:907:3a03:b0:94c:784f:7569 with SMTP id fb3-20020a1709073a0300b0094c784f7569mr5193398ejc.30.1681460633867;
        Fri, 14 Apr 2023 01:23:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402344c00b00504803f4071sm1843079edc.44.2023.04.14.01.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:23:53 -0700 (PDT)
Message-ID: <18a7f165-592c-8443-c661-6b0345a6cd00@linaro.org>
Date: Fri, 14 Apr 2023 10:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
 <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012355_240016_6DCC2DC2 
X-CRM114-Status: GOOD (  11.20  )
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

On 12/04/2023 14:35, Matthias Brugger wrote:
> 
> 
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
>> the same parameters as MT8183.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index d976380801e3..803c00f26206 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -17,15 +17,20 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt2701-dpi
>> -      - mediatek,mt7623-dpi
>> -      - mediatek,mt8173-dpi
>> -      - mediatek,mt8183-dpi
>> -      - mediatek,mt8186-dpi
>> -      - mediatek,mt8188-dp-intf
>> -      - mediatek,mt8192-dpi
>> -      - mediatek,mt8195-dp-intf
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt2701-dpi
>> +          - mediatek,mt7623-dpi
>> +          - mediatek,mt8173-dpi
>> +          - mediatek,mt8183-dpi
>> +          - mediatek,mt8186-dpi
>> +          - mediatek,mt8188-dp-intf
>> +          - mediatek,mt8192-dpi
>> +          - mediatek,mt8195-dp-intf
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt6795-dpi
>> +          - const: mediatek,mt8183-dpi
> 
> Shouldn't we declare both const: ?

I assume it is likely the enum will grow. If this is reasonably
anticipated, keep enum.

Best regards,
Krzysztof


