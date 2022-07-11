Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeyCZN/nvsiRNNCAAR15uWNXyKxL+fyysaeRMmXtoJA=; b=HY543GA7jqdGftiPRl2P0azYQc
	x6pq1hY2Q0IDd9whWJZFqSC8kk7KgfBFmjTspKccobX2DdZHqEP7oA7FT/KgQYFvwf7lfEIlOCZDD
	w2duP3s6HTHzHyF3AriXqGXATPXSJsCuuExXr0TkJbTEtdThtJhwhXSsYfsyAzIphkqvBpWmSVFLX
	w3K36jJbJtakalkiIJJr90GenD2E6bfxKRLYWMjRzwFTz3L6t/dbJ/dd/1ZVodA3iOdL86RAaVDZg
	HlDgEfbHG72kJD7aqqd1XiJ+wOub3FomG290jWW6EqGO9kc5oXXqoc31Obj/IrURyd7v4Mb+swwS+
	YyYTFTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oArBV-000uWe-Sj; Mon, 11 Jul 2022 11:02:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oArBT-000uVL-4G
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 11:02:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id t25so8059623lfg.7
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MeyCZN/nvsiRNNCAAR15uWNXyKxL+fyysaeRMmXtoJA=;
        b=D4OVU2SdZDl1a2Jmvol1Su2acwSKKhbqYZKZn6/Qc8eT2iND/KO9t9DapzIOJtxYXe
         Me3ljHAhTzWcyA62SHeecPkZ9BDGif3nIQh/4L6wxXSsOfYRKcaerfZkctH+lPcPcaXR
         9nwslGSNuJR55nrpcs0QsF89vgcW8SmISLwf7h2vLLq4lkAVjwTUIVYO0/uBy/LsND6c
         fUnyCOa9fgewXhbnW8EdRaMnWofxJvAWbnpmaDz4VV5KTLCEbsVuj6MgdDHsj0ja4Cm4
         7iMTtMjKPL9Xg15Ww0kzLHvpVQi9YC6P0O0itH4F7zJK4x/PaxvCYROPFLopO6UyHl1u
         Htcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MeyCZN/nvsiRNNCAAR15uWNXyKxL+fyysaeRMmXtoJA=;
        b=uM0bI2pYRrmIht6peTs7syuafu8K3M+UKcE3dh08TMFz9dv1lT+USQ1wCh0+/aMgoh
         ncgs7aNIe/xZ3pvir7B4XV1iQg7hHc3BlRg9X552utSOXmn6XQ+3faCaTvKT9RqFdOJB
         y3beuP9fdPoFQZsupT7YCgkP8Mdy8yE56/9hKBgQmzdCfMoT7idLWWZRpNTI+COiNn/p
         FanxNEpndGBMYI1zyNPW38T8sWORLr3/pMpZr0zB15a/n9zR522IzTybVxQE0byqozmN
         SXVKEQI5H+tXCe4QUqKrzmbDJwYSr17c0xXG4KCuZZ5xp2E+jm4Rgv2yuLKfyWDyqU1t
         UwMA==
X-Gm-Message-State: AJIora/yQ8HiWW5+ssV6g6n6Vwif/azSqExjlN5UM5Dh2ycRpaz6fQbz
	vMlOQ/zU70/jkIfdrMj1RtoIbg==
X-Google-Smtp-Source: AGRyM1vhnNj6aFdiTr/noru4YDiDuSvAcJcPUSJPfEwIMQ9AAASbaicPsvFT+S0lPieRGdaNAEiPLw==
X-Received: by 2002:a05:6512:3b20:b0:47f:8ca1:bd7 with SMTP id f32-20020a0565123b2000b0047f8ca10bd7mr10686215lfv.105.1657537353492;
        Mon, 11 Jul 2022 04:02:33 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id u10-20020ac258ca000000b00478a311d399sm1489609lfo.0.2022.07.11.04.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:02:32 -0700 (PDT)
Message-ID: <c8f8f5f4-173e-797d-e060-e5eaac7ca822@linaro.org>
Date: Mon, 11 Jul 2022 13:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: mmc: Add compatible for MediaTek MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, ulf.hansson@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220707054710.1396-1-johnson.wang@mediatek.com>
 <41e17a56-5cb0-8e90-c7ae-a7a56de986d0@linaro.org>
 <3216ec92952c7d722feaeb76986e0a6a54340646.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3216ec92952c7d722feaeb76986e0a6a54340646.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_040235_211372_4970B990 
X-CRM114-Status: GOOD (  16.43  )
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

On 07/07/2022 09:30, Johnson Wang wrote:
> On Thu, 2022-07-07 at 08:46 +0200, Krzysztof Kozlowski wrote:
>> On 07/07/2022 07:47, Johnson Wang wrote:
>>> This commit adds dt-binding documentation of mmc for MediaTek
>>> MT8188 SoC
>>> platform.
>>>
>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> index 2a2e9fa8c188..3fbf33ad4f7c 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> @@ -32,6 +32,9 @@ properties:
>>>        - items:
>>>            - const: mediatek,mt8186-mmc
>>>            - const: mediatek,mt8183-mmc
>>> +      - items:
>>> +          - const: mediatek,mt8188-mmc
>>
>> You duplicate quite a lot. Use enum.
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> Thanks for you suggestion.
> 
> I will use 'enum' to place this compatible strings.
> 
> Just like this:
> - items:
>     - enum:
>         - mediatek,mt8186-mmc
>         - mediatek,mt8188-mmc
>         - mediatek,mt8192-mmc
>         - mediatek,mt8195-mmc
>     - const: mediatek,mt8183-mmc
> 
> Moreover, it seems that missing an "items:" between oneOf and enum in
> the compatible property.
> Is my understanding wrong?

I did not propose to remove items, so where are they missing? Not sure
what you are asking about...

Best regards,
Krzysztof

