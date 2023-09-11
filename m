Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F51AEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HRm+Y6RHREhAisd/9XgRmAyoMKP+6E7yqxOyOn8vFA=; b=Jo7NSXZrw8nqA2fRAhxoi8ysLl
	asIE1mtysRH6Ub9lxK4QQl8PFgfv04LTvP2K13g09aIMJgnecrFw5nofBdPjCPzubz6ht/vscot52
	E8Q6MLykP2MNcsCxPq3HClpZJ3gPO+B/7xoLuaWtn9Fy52YehFfCZx69XYDxFNcu+394BA1QXbFRk
	RWT3Qql9cy6LuUPTX7F9AxWDo4ukFEm2Gjg9MvrSHnvo9l/sQ5HUi53Kpt1CQtfBL1htPK1rwU8Qb
	Xj7nLXAIZicIiTNxt4BOEoMCwvT1Ict7mUBZQPIssQc74/XoSdzHqQHIYXFjxZ45y24XgnzJRs99p
	6kXyO/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfaxY-00HNFE-1t;
	Mon, 11 Sep 2023 07:03:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfaxV-00HNEn-2x
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 07:03:47 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c4923195dso508139866b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694415823; x=1695020623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HRm+Y6RHREhAisd/9XgRmAyoMKP+6E7yqxOyOn8vFA=;
        b=or1vCBqcBrGjqSLlbQLobdq4JswV4e53rfj1YOQAnPfrFQAIC5ElMnIa0bBDrsKLK3
         gTwOng0M8YtS/ytJIGnearLkPKA7yJ9gO0vCMbJEKfqiWinyDopwL3OhiNsEgkd6TcIP
         pDgvclXt4W1PGz0QAtjwZIJuIp6vv73APgQCrmt96m9BTHfXpB8pBPjb35wcKyso50rr
         nulZ7LItdN2uJsxTofTdfOckOI96bcxM2S8alZ5Pooo7ZRezJSmCT2iPck8pjHl1IBkN
         5V1J7ArD5f7dbBlS8Lrh7JRJLObpnRtJFgfxO0v05ow7SEiP0RRsfs6Z9N2S7q7roV0s
         nT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694415823; x=1695020623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HRm+Y6RHREhAisd/9XgRmAyoMKP+6E7yqxOyOn8vFA=;
        b=q2nPWHc2HbZhPck+ec8pTK0i2s9YlWsJ5S2YoI2g/V7D3PVP62jnWCgGKOMEuITBKo
         e2OhyHQzE8mKr0G36JJ4qWsPIbG05CZl7LwG/vmRbn0hcChXCEoL+0D7u9TV3PRmXbNK
         BX4t25cOWAWjVejioijHhbZifRkKk3Mm6vlNPoIly9jVuY+TVFFB8XuOvoQFbWLrWYuI
         sl9LtS54yI7fv0JgQBdeDmrUN44+ApP9IvZQ9guDw9i5JQBkiVgTO645PfUG5I9YmTpa
         Cj7+ISlmQsf+zXQv/RM8VMTlje7DQFNd7T7m1PGuGxmJ5318wYRWCSsamasgFMkTWy6r
         a6/w==
X-Gm-Message-State: AOJu0YxJ/afACIXyXKS1f9EPG/CcXwmZsAMn7VowOOVCFZveLOOQguiN
	07alUFiRMDssTxqhuBxn9R2YLw==
X-Google-Smtp-Source: AGHT+IGlhl6S6bo4yFHk9OuoeD6bmuBmPDRsJLNGTMN304xWsSVIV7iaHzYC4iOaU65e/b4CLF5/mA==
X-Received: by 2002:a17:906:31c1:b0:9a9:e735:f621 with SMTP id f1-20020a17090631c100b009a9e735f621mr7374615ejf.15.1694415823235;
        Mon, 11 Sep 2023 00:03:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id cx2-20020a170906c80200b0099cbfee34e3sm4886533ejb.196.2023.09.11.00.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 00:03:42 -0700 (PDT)
Message-ID: <81fe77c4-5f19-984d-5331-cbc4b13f2de3@linaro.org>
Date: Mon, 11 Sep 2023 09:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230909132819.21626-1-macpaul.lin@mediatek.com>
 <2318be3d-5687-8b6c-3669-1d2ae1c94d2c@linaro.org>
 <946ee1c5-77af-3ce0-83ba-2966fab70a5f@mediatek.com>
 <fc4bd212-c112-0d42-e94c-c3ba569d2d32@linaro.org>
 <d959de4d-43e3-ec58-8873-415165ac2705@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d959de4d-43e3-ec58-8873-415165ac2705@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_000345_963106_C8A7A3DD 
X-CRM114-Status: GOOD (  15.68  )
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

On 11/09/2023 08:46, Macpaul Lin wrote:
> On 9/11/23 14:07, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 10/09/2023 14:23, Macpaul Lin wrote:
>>>
>>>
>>> On 9/10/23 18:56, Krzysztof Kozlowski wrote:
>>>>
>>>>
>>>> External email : Please do nost click links or open attachments until you 
>>>> have verified the sender or the content.
>>>>
>>>> On 09/09/2023 15:28, Macpaul Lin wrote:
>>>>> 1. Add compatible for MT8395.
>>>>> 2. Add bindings for the MediaTek mt8395-evk board, also known
>>>>> as the "Genio 1200-EVK".
>>>>>
>>>>> The MT8195 and MT8395 belong to the same SoC family,
>>>>> with only minor differences in their physical characteristics.
>>>>> They utilize unique efuse values for differentiation.
>>>>>
>>>>> The booting process and configurations are managed by boot
>>>>> loaders, firmware, and TF-A. Consequently, the part numbers
>>>>> and procurement channels vary.
>>>>>
>>>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>> Changes for v4:
>>> Changes for v5:
>>>   - No change, update Reviewed-by tag only. Thanks.
>>>
>>> The explanation is here. The version v4 and v5 are the same.
>>> For sending v5 is because "Patch v5 2/2" has been updated and these 2 
>>> patches were in the same patch set. I think to update the whole patch 
>>> set together with a single modified patch should be a usual operation.
>>> Did I miss anything?
>>
>> Yeah, like not top-posting.
>>
>> Why do you change the same line in other patchset?
> 
> Hmm, they are different patch actually.

That's what I wrote. "Other patchset" == "different patch".

> I've tested the patch v5 here can be applied with / without mt8365's 
> description patch independently.

That's not the answer to my question. I asked "Why". I have troubles
getting any answers here, so let's be clear - this or the other patch is
just wrong.

Best regards,
Krzysztof


