Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6282C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb3QrMvZd6yXgo618qylfqMF5lEqCyijeAUK/t+b8pY=; b=3qNmAbX+F4R/Qq3o/ncv9FL0pQ
	z0V8pbpPS7bzUTWEkv3hpsFgi0aNvN5S/Vf92taz21if/7iAC4cryU0h9xFcGBWLYcuJ9BS7Slf4B
	1ti3AmW51c98oufeS9ZlYUf0Effp/rBXerBmbvABpAdfCtOw7B7kNgxpiyYdN1FlhITsnlTao2b8b
	c2nAQdh5mTx5mPPkaIs1xTsR701GGAJLKnTcPOFn8+VBkNexdPt3pWqaBn9T4dxu5KnKb2LG7QY+q
	Z3G1DnHsIT1Cfyf6nhwLPl2W80m3rsWeTYq+FDvW+aaKq/HOIhbdSADK/Dil4qyOUXubZzGs6l9UR
	lBSDzjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR0S-00DQ6U-23;
	Wed, 15 Mar 2023 13:17:28 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR0O-00DQ52-2U
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 13:17:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id fd5so41526707edb.7
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xb3QrMvZd6yXgo618qylfqMF5lEqCyijeAUK/t+b8pY=;
        b=tllWpTVkNiFevbCV6hrsro8EDioioGuXMk8U7uog+O3LTKQ+iwWPKkRrK2a6/gFt5T
         KwLk2WSdmaLSw+gfle9g2We2K7WaRPNyZefDvVsHAna15v3BHpv77DQTr9pWOkmNC4Fa
         /BgHTwnJJ9jluRuRVQULjJbYi5tK3ItpWVTJBKEmpsz/nkG3RIRNcGGKCsMrhxjGhIL1
         RXGOIpfj/3xbldFNygvv8MeKNPspTZ6uEJahOCtvAvU16zTpPJIFPt8K0LF8Rl3rOBrF
         4E9YCPTFe/5T1pbj4Z8UQEI0WAdq8sKV3npKVuuklm/+UvBjD02NfY57buCnifJZWVoW
         OQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xb3QrMvZd6yXgo618qylfqMF5lEqCyijeAUK/t+b8pY=;
        b=B6S2FSCHqHGu5cshy9zRGMDmi8dQmxcimDEyeOg08art0i/RTjKHRRhpR3z7Xu8Nl/
         d64kUplOW7HiWNYiooZlUiSluK/I4fOoi5XGLf9Fia/zEPWLvFFhLz/MKUki4fpX4A2a
         ZyeH2P/yc+oEjw84+YxCyEg0UBI8D8PdAaul8SQnlL4I6gZ2vXHESkKQWm/VDIgi+XRZ
         nHKVE3FnjNSkMOvwyqaaB9qieKZFfuBLKjBgvT6SJr5zBUeK/kaXpDoCOUnXP6zjredG
         EYVJplyFSTsk920TeMtZ/lDD7OWFJD2Z4j3wicnOQQvmSlNsvvno3snYQRkFm7/JstRj
         sCDA==
X-Gm-Message-State: AO0yUKUlLBpZMrL47Ww9YNMLFVNS0KlEWPOtLqjBvMneoxOq16sHMSOS
	Si7U81BDJCuimIfOnA18yCFSHQ==
X-Google-Smtp-Source: AK7set8XLwvi0YYJ2zeYnMe04uDSQnmdw08tghX2TWXAj6C5xYII9tMdLb9fM2JagC5ZFNQlGrwrlA==
X-Received: by 2002:a05:6402:455:b0:4fc:b83d:c31f with SMTP id p21-20020a056402045500b004fcb83dc31fmr2560472edw.16.1678886242456;
        Wed, 15 Mar 2023 06:17:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id r9-20020a50c009000000b004c13fe8fabfsm2414078edb.84.2023.03.15.06.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:17:21 -0700 (PDT)
Message-ID: <37c2c7de-792e-0289-4551-24bbb9fe31d9@linaro.org>
Date: Wed, 15 Mar 2023 14:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
 <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
 <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_061724_817500_3086DE6C 
X-CRM114-Status: GOOD (  13.94  )
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

On 15/03/2023 09:01, Alexandre Mergnat wrote:
> Le ven. 10 mars 2023 à 09:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a écrit :
>>
>> On 09/03/2023 15:23, Alexandre Mergnat wrote:
>>> Add compatible for the MT8365 SoC.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> index ca0ca549257d..931d66893dff 100644
>>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> @@ -34,6 +34,7 @@ properties:
>>>        - mediatek,mt8186-mdp3-mutex
>>>        - mediatek,mt8192-disp-mutex
>>>        - mediatek,mt8195-disp-mutex
>>> +      - mediatek,mt8365-disp-mutex
>>
>> All these look compatible. Either make mt8635 compatible with something
>> or even rework entire list and make everything compatible.
> 
> All of them use "mtk_mutec.c" but have specific data.
> 
>       .data = &mt8173_mutex_driver_data},
>     { .compatible = "mediatek,mt8183-disp-mutex",
>       .data = &mt8183_mutex_driver_data},
>     { .compatible = "mediatek,mt8186-disp-mutex",
>       .data = &mt8186_mutex_driver_data},
>     { .compatible = "mediatek,mt8186-mdp3-mutex",
>       .data = &mt8186_mdp_mutex_driver_data},
>     { .compatible = "mediatek,mt8192-disp-mutex",
>       .data = &mt8192_mutex_driver_data},
>     { .compatible = "mediatek,mt8195-disp-mutex",
>       .data = &mt8195_mutex_driver_data},
>     { .compatible = "mediatek,mt8365-disp-mutex",
>       .data = &mt8365_mutex_driver_data},
> 
> I don't see any SoC compatible with mt8635, and I have no idea which
> rework you have in mind. Can you please point me an example ?

You are right, I looked at wrong of_device_id.

Best regards,
Krzysztof


