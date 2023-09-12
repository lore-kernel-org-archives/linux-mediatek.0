Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69FFCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCCgJL7CLOtHoIO/zrNI8lFiRIRwo/myDfec2fb0VWc=; b=w2TbTtJ2yzIWpH2Z1jzFc2kqE/
	3iVK4Sw8yECK/YQ2zqquXODTly73+kkaFCsWnRjtkKiKIYQEF47OXQPP9ltnQTjo5IOduUziauSyY
	0nG1UbUxhPRQ3OARFDvlezf6X9nXeXSReTOK3+1IkMgM6nY571JhS/owHTHNmAwH8tVRR1U2giw7y
	3J66QXszlo5/BKuKbPTMcLgGjgpM07u8KAxKR09lmfT8Dy0FhmjeYN34PhpS0KckbRSAUvCK/298W
	QUQjjxID6eGXIYQJ94bVhbPmy0tH27L8aClwMO8HnyL5RQ3J1mPQ8nGbK9l5AD/MDBm+OD7kwKW9Q
	1aEzzZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxGO-002KNb-2S;
	Tue, 12 Sep 2023 06:52:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxGL-002KMJ-0l
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 06:52:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so13633167a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694501557; x=1695106357; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCCgJL7CLOtHoIO/zrNI8lFiRIRwo/myDfec2fb0VWc=;
        b=XgE8KV/Wafo15eUPuKINQxTewZjoO9Zhnj2ASDVVe1G5G/0K2KGAT1/A5oSOVIdeyz
         hzDHnnJmsT7m2PyPgKHU9t6wIwUAOiDR8o2+vNwlsNUj/NdownD5oa06vN2uwbHcd49B
         8rZq8AmQWSdm2nQkvBc9RWYtCYGEKECOIY3WEfSm7eYnXyNoyQTRGs2YNa6WJbS8EYze
         e18DsqW7ijdMveezaApmKi33TZ8SFu2hZpL8BkFDBGpwzdWBDm+Vf2t4/WtKkDmnEZ1U
         bkRMNK1gb3S0zKqEb/zM02zVmO3LxfgTlVOXt1Hjmn+6HqpeKbqybvz8yzqgoZLJFwbs
         gsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694501557; x=1695106357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCCgJL7CLOtHoIO/zrNI8lFiRIRwo/myDfec2fb0VWc=;
        b=qwtGHeRTAjhBoZi6RS76hV1mdtEf0ptzi9J/viLSL4ydCbneYvY3xehYd7rjaPg55Z
         ARchafpQMJkH7NXoGKj0/vnr8iQhdr6Iu3LG4FzhptGG/33Lk49JDJ8shfPYyE3OcYSg
         wyK8TgXECjjwA6gDm6d+fOWl2Q5c1z66RRJ9mt6nh0oVkVL9Hk0lKL9cXLjFBEqFsZSg
         KVY8BUttNMnuBJLjVFX0umJNzWaynZxjmr473LkkpsrdZwxKs3l/oladRDCgkNXoMSNS
         9Jf11U2HUqXYdAoWHOk5SPdoBGolb/JbEG/BpDHR8lQlxlupxJX42MSFO6UNdW2OGo6U
         j//w==
X-Gm-Message-State: AOJu0YzMweCEVwZH2bMOxUG3lErZ/10wqpoGcP2QlLO/c8yDrRx+o3yK
	zA6WrwuL/p3Y1K/GyX5WO5bevQ==
X-Google-Smtp-Source: AGHT+IEWx95lm8CI08zr313SKed7edRDb0xjUNuKz1BYbcYP69GABjKTuBlO5trTmLCvZTrPwxPVCA==
X-Received: by 2002:a05:6402:d06:b0:51d:b184:efd with SMTP id eb6-20020a0564020d0600b0051db1840efdmr2064236edb.20.1694501557143;
        Mon, 11 Sep 2023 23:52:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g12-20020a056402114c00b0052ea9ad21bdsm5474261edw.72.2023.09.11.23.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 23:52:36 -0700 (PDT)
Message-ID: <89341643-3d0e-89f6-f81c-579c56a358a3@linaro.org>
Date: Tue, 12 Sep 2023 08:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
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
References: <20230911081126.18463-1-macpaul.lin@mediatek.com>
 <53cd72f7-5a8d-ee9e-4d8a-f5159cafb3e7@linaro.org>
 <4010955c-9df7-da30-aef9-477ae8483e89@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4010955c-9df7-da30-aef9-477ae8483e89@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_235241_290567_C4826A31 
X-CRM114-Status: GOOD (  15.29  )
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

On 12/09/2023 08:29, Macpaul Lin wrote:
> 
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> change for v2:
>>>  - rebase this patch to follow the v5 patch set of mt8395.
>>>   - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
>>>  - Fix description as a single board.
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> index 2e8ad49c3479..b163995e32d5 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> @@ -244,7 +244,8 @@ properties:
>>>            - enum:
>>>                - mediatek,mt8183-pumpkin
>>>            - const: mediatek,mt8183
>>> -      - items:
>>> +      - description: MediaTek Genio 350 Board (Genio 350 EVK)
>>
>> Drop, no need, redundant (copies the compatible) and your other entries
>> do not have it.
> 
> The primary objective of this patch is to incorporate a description that 
> will prevent users from confusing this platform with others.

How platform can be confused? The compatibles define it, not description.

> Additionally, it aids in identifying this as a "Genio EVK" for marketing 
> purposes.

Kernel is not a place for marketing.

> Thanks
> Macpaul Lin

Best regards,
Krzysztof


