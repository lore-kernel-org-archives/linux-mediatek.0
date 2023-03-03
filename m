Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7EBC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NaYC7Z7KE3/xDS+ojWZnShCIrXPLH1EZcxegpj4uXo=; b=Rg/+EIb57gxEpg0FDrvj4xLsmS
	qENr/+wZZmc2msBIV3Xryof2NynbBk0xCrP+nUb3qUn/7qqIy3m1P6ObnDpMIfseRwf2+pencIat1
	2X4ziLlY8o378dAi37O+0w7/1w1hMVozDOe0fbU9DEoi8BVcbjEEb2OV3WYACLUz4WO5Q9J9xfII3
	Gujf2COuPNOvJHeelGww8z1lbj10mXk7GM06jCVLoO4MU8U4cYf1UEO8HRtByPCK/dCfjZriJZdES
	4U23AE2m0/eC5V5QfzuDLH62ajSylNdVzzYP01vU/AEWBO0RO59xu216YxgT1kNVa5lnfYtFEj6I1
	Jes89uKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY045-005GG5-Ta; Fri, 03 Mar 2023 07:42:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY03v-005GCZ-HR
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 07:42:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i34so6798310eda.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677829361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NaYC7Z7KE3/xDS+ojWZnShCIrXPLH1EZcxegpj4uXo=;
        b=vRw8wJ2r4i7Z3/3FQ0GALVawwqYtGc5IZ3nkCeTKZwVvCJ93pC8TOrhqdS/aiSDqGa
         MDEEySc4FT8jD+H4FeVR1ZU1fmdhh5Ezx6susvVz5f0LEC9MWQSNzts23IizlW6LDRDk
         uAibihwPv3kGtZbFMyuYBpmULGzMsY5BNim0FTLQkSJY0q7VQ8TYL76kG7xy5r5U0C9+
         3JK+o8axtWR8oFBgB9y3Mu0LKtrfZjbPM1DSawcJMj8LZEqZ6LGoxS8FzGwfxM8RHpHE
         ijWPbrA27y6Mu4FFYtk8aztOvKlBsUYe6emc2JHIkURRoLWOZiyVIDTd2J+O5AazW4jh
         iA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NaYC7Z7KE3/xDS+ojWZnShCIrXPLH1EZcxegpj4uXo=;
        b=WNttoetovTKO+XV17OhC7/KyYTxujAE1QncyRWNmHTXTH9e86okH1lY1yhyN5O1JPd
         qh6vY0i0vk2IU5ds4IRYRjkeFTVjg1dD4UzYk+GKgEP95pQIQKRJcZYTHiGJ2A/9L2X4
         CyJZWXDKVGzG797Rn7k/0DIoGxINwnkbk5ZTgEjkD5vLlAhazyDiIlaeEaMsHnRhOfoF
         rMgbaESILgon6xkbZPaNd9QPZBVJlMMLIWEnlJXt1f8cW7wHFjnMdcg4KeGJlSCEVm2V
         myyVKXRyDfO7B5VsENElcUlXfEMx3f1xl1OUa6XOkTbQvrmf+cVOdMM7urOBSimtc6d9
         3Qag==
X-Gm-Message-State: AO0yUKWqcu+yFRK7CfzqSrniMIafN4CtpaDD6rSzgW03oczaCUoZGemG
	H6TQMs7ic82UUHJ8o4QHcH+K4Q==
X-Google-Smtp-Source: AK7set9XQN5XXL8B1oRWyaxYB8OqaN+rULhPoZWgFzO6jicJxzYWXiJ+BxcApbrfFSwmxpwqMut0ow==
X-Received: by 2002:aa7:c153:0:b0:4ac:b614:dcfc with SMTP id r19-20020aa7c153000000b004acb614dcfcmr1347767edp.9.1677829361326;
        Thu, 02 Mar 2023 23:42:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id rk9-20020a170907214900b008d2d2d617ccsm676760ejb.17.2023.03.02.23.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:42:40 -0800 (PST)
Message-ID: <54ee2141-f00a-3193-0821-2faaff826254@linaro.org>
Date: Fri, 3 Mar 2023 08:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Compatible list
 cleanup
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230302141234.169985-1-y.oudjana@protonmail.com>
 <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_234243_652214_DD42CC33 
X-CRM114-Status: GOOD (  14.12  )
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

On 02/03/2023 17:08, AngeloGioacchino Del Regno wrote:
> Il 02/03/23 15:12, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Several DT bindings of MediaTek display blocks make unnecessary use of
>> "oneOf" and "items". Remove them and replace them with enums where
>> necessary.


>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> index 7d7cc1ab526b..52f233fe1c0f 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> @@ -20,9 +20,7 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-wdma
>> +    const: mediatek,mt8173-disp-wdma
>>   
> 
> This is present on all MediaTek SoCs - literally. The issue is that the driver
> currently does not support command mode panels for real, so this binding is...
> ...well, somehow in forgotten-land...
> 
> I would hope that command mode panels get implemented soon(er-than-later), but
> I'll leave the choice to you and Krzysztof - I'm only providing the information
> here. :-)

Yep, if you predict now that oneOf sooner or later will come back to
these, just keep it. Does not hurt much and later re-introducing it
makes patch much more difficult to read. Therefore I prefer to have
unused oneOf than later a patch which introduces new compatible and
re-indents old one (so unneeded diff changes).


Best regards,
Krzysztof


