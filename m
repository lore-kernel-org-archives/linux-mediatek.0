Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C9BEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVBnqnB5rrJmJ9oxMSlJ3T1LMxyr5CXqSBdgSMAQNIg=; b=SXuTpkMAcUK7ARqhoYeaZNCr5A
	DWKhRUij1cS182b+M16oESvu0lFsEcJjMX5glYQhA+yVPzWH8hPGZzY107IWKBGTvZ6sgctRHYMZn
	8Y3haFA3SUEzC/esX4bxHtw5RT/sfmuFYwdno46SR/lPejuicdahDJU/YGtQVOxBkv9aITNtwoJF7
	OFZhUqVfBZCSl0ewmmERSvfhT7Osy3rWt7bbnLmS72XN+Kr9SEeZ+ifOyDXwp8RSJ1RuYAU//wxza
	IWI/L0DN4ORxE4X98pWmYRdgHClxs9Hie7J28+CrVZ1+6QanbZrkxZWHhFGwv5QAaw1HExqgOTCYe
	pTdOMBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdWR-0003cf-1K;
	Mon, 11 Sep 2023 09:47:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdWO-0003Yl-1P
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 09:47:58 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bf6b37859eso44103701fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425672; x=1695030472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVBnqnB5rrJmJ9oxMSlJ3T1LMxyr5CXqSBdgSMAQNIg=;
        b=FnRGu4Q0rIgoL4Bn0DzNaw6TBb+ImOvyLCCy/5IBoSqxmKrjldNY3kHOz4q5U1Pm/k
         WW1NOGTUeyB9OxKLr5bWTBO590EizRqQTjUY5l2amA2LLJpISALqHJ97um7tlxIb3XW3
         Z3osN9raY37bw7yCSXwPn1IvzgueYzta5DCz6pxICM/VutS8fdmToY2AI7MpnzDWgGXQ
         MNTkCg7640+TOVo3C/LQ7QOwd4tEY0Sn4bk4gAZuo73ABVgE4a9gIGNqgcZTM3r1Q6cW
         ZTOww5+peqgcgwIRlcmL+nAX/EGvB2QWhASgnsvF6szS81ktoQBFJRu6ZEiBPQM6drPZ
         7syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425672; x=1695030472;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVBnqnB5rrJmJ9oxMSlJ3T1LMxyr5CXqSBdgSMAQNIg=;
        b=gU8RWIDHFnCzKGSUVd7oOR4AvxPPzONljXNOClRsf6VJQv8Z/yX/5QGtqHVa6aU0LT
         kh+XEZslkfXYvE8Yl60I6tSuruSJfM2LgEwPz7BB3Mmcnx5GZK9NVFImVPeOSjjj9CSL
         KBotduwFKhbTXEe0ZzZf+G8G27VHivkTr9eyPmYLky+6r8h4PAnQzxmpGGCB841KT1TJ
         m4PUHPvgSNQeKcOSgiHeiqjw7eEHYy5HBRrIG4CQ+JhESbDHRyPlOB8qvEVjvy/1rDAA
         foZQNXJgEQL4F7/y+CAq4flkNMSBVIn1MgTvpZkGjOMjOF5uI9tTq5/FW+gNQSaSSn1y
         iCLQ==
X-Gm-Message-State: AOJu0YwGm3vRbXm8AImqwTjIqp75SuOWp4NR5hVP6YuVPAAIJFwmXcyV
	+2d4WsOl/oHoebZWz48uOSOTxA==
X-Google-Smtp-Source: AGHT+IEF/j2AH2R/KwZSRqW3RHIwq6yDyTn8L4VmbId/KdBMxnXkl4+T7K05xdZMKM/6e9WVD7bpIw==
X-Received: by 2002:a2e:7a09:0:b0:2b9:e93e:65e6 with SMTP id v9-20020a2e7a09000000b002b9e93e65e6mr7692189ljc.35.1694425672534;
        Mon, 11 Sep 2023 02:47:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709064a5600b00992ca779f42sm5088901ejv.97.2023.09.11.02.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:47:51 -0700 (PDT)
Message-ID: <6b1f1e97-f747-eab4-86ec-39be487e6956@linaro.org>
Date: Mon, 11 Sep 2023 11:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
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
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
 <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
 <12bdd17a-98f4-5551-4253-229dc36f0c77@mediatek.com>
 <ef81697f-473e-898e-ec13-4dd255e2e3d7@linaro.org>
 <82a0ab25-a3cc-3e87-e379-9b15b3fbbf76@mediatek.com>
 <649e89c3-343a-c00c-ae89-329833b38981@linaro.org>
 <e697a23e-e677-c97b-269a-a7a11d338d95@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e697a23e-e677-c97b-269a-a7a11d338d95@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024756_477400_AE9305B3 
X-CRM114-Status: GOOD (  15.27  )
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

On 11/09/2023 10:16, Macpaul Lin wrote:
> 
> 
> On 9/11/23 15:06, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 11/09/2023 08:34, Macpaul Lin wrote:
>>> On 9/11/23 14:09, Krzysztof Kozlowski wrote:
>>>>
>>>>
>>>> External email : Please do not click links or open attachments until you 
>>>> have verified the sender or the content.
>>>>
>>>> On 10/09/2023 14:07, Macpaul Lin wrote:
>>>>>
>>>>>
>>>>> On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>>>>>>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
>>>>>>
>>>>>> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
>>>>>> I don't get what is the point of this description.
>>>>>>
>>>>>>
>>>>>>> +        items:
>>>>>>>            - enum:
>>>>>>>                - mediatek,mt8365-evk
>>>>>>>            - const: mediatek,mt8365
>>>>>
>>>>> Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by
>>>>
>>>> Boards?
>>>
>>> I'm not sure if there will be more hardware version released to market.
>>> Current the p1v3 is the final version of mt8365-evk.
>>
>> Then your code (enum) does not match description. The code is saying:
>> this is for multiple boards based on mt8365.
>>
>> Your description is saying: this is only for 350 boards.
>>
>> Now your email is saying: there is only one 350 board.
>>
>> Three different versions. Sorry, I am confused.
>>
> 
> Okay, this description has been modified to support single board.
> Since there is only one type of the hardware is available on the market.

Then why the code uses enum?



Best regards,
Krzysztof


