Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB2CEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjkKRWZOJVa0TjkWXeagUayHJQ6YOMEruC33WrNwKSs=; b=JNo2cubNI69HwHVry2Pxlkyitg
	stsptAE0PGdMjuN0bnEVSkEVU9dS1zK516GcLLfWFxKY3TCo+IkQG8OkY8Aqh7A/+x7p6T0kzzoLM
	BOPS7pwcKWLQxsSjAVegClXxQAf5Un4S0LD/pg6VaQ+pUBJvmnv16BXVO+6WWpF9Oq2gbmPQh29ux
	XygAkjO3T/L5aeuQKI56uKEQdejKM0gG5telSgS1TK2yPaX2v4WGXPyY8ttQFe1mvmW1eSnSIhhJo
	itGvAaNjIcIU7vZsy2hR4DigcFXBRUYkIDfqtGxhTJUYQenod8usktnqZ8Vx2X0Z2gql0BDBLvZM1
	Hs2DjOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfb0g-00HNUI-1H;
	Mon, 11 Sep 2023 07:07:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfb0e-00HNSl-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 07:07:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bcf2de59cso514743366b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694416018; x=1695020818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjkKRWZOJVa0TjkWXeagUayHJQ6YOMEruC33WrNwKSs=;
        b=rkPfRgxl8pQ4i6lArXWlBtDWgmkEJjnsij/FWRtcZKaqpUT3FJSiDC0R4ddtBJfx2b
         BycSyzx+5KaHhY5qHpG5w34WRF3WnxpOfDUp/iNdEUXNu4PfBwX5VM78lcEYOzWEt8qI
         758AVBRNAzDqzz2SPz0XMkmVfVhAWtpiuVGnn/dkquWfK2MY/ck91prt+TR1Fb797ky1
         riNASi9T+/Xz2MpiwUEt7CoaaDeCJPjtLy9AyAxAn7ZOqKi3PNR5ZhQolxUK2abXH2mL
         26Y86jpHbq68H/BwDQfhlzCNZzbrViw9R7e7UEb+cpY4N0jR7OB1R+SKG1ACqT8JchMX
         jJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694416018; x=1695020818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjkKRWZOJVa0TjkWXeagUayHJQ6YOMEruC33WrNwKSs=;
        b=lHm5ENvtI2ADtA8zrj1eWdGButgXbf53SKhmnjS0zVLEIu7DI2z92ZsDDd0irlmfev
         gWlW9UrTBaIdxC3o2QtEIosYo4Mkt6uHjuoj4csJH6TV5t1LxpthuzfMQeaYVowZ1XUs
         xDqFS7rF9Zm7NTeNpdwng8pUrsY/A8IvWaDbh+Aq7P+WrF7pqX50swNUwcrYrXd9VsVb
         Qbz5aCfsMh5ZoAkUKPvwCJX46hRYdOOtJv5jkbvrpuso4smOo5zODrtQ7zWdkXDXsEUl
         5w5uBsccCb4f3p0x/a+NHDDwraLMWHkfGZyCJX8bs/7GnH7F6tivgg1lQ5gQE8KU/mwS
         zWew==
X-Gm-Message-State: AOJu0YzEjclGzEkhMtoJty5z3iQqiQP6NtNK468orrK7ws35S03siCZZ
	23CRlUnfVEJQdKAlu8fz1UsSjA==
X-Google-Smtp-Source: AGHT+IF75xWq2fgCjjeLMTUeemR7hwE6+rL8Au86+kLHDRAffyVeK9OvpXwGtMKr5jkQa92kCB450A==
X-Received: by 2002:a17:906:ef8b:b0:99b:4ed4:5527 with SMTP id ze11-20020a170906ef8b00b0099b4ed45527mr7377789ejb.25.1694416017794;
        Mon, 11 Sep 2023 00:06:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906074a00b0099293cdbc98sm4910558ejb.145.2023.09.11.00.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 00:06:57 -0700 (PDT)
Message-ID: <649e89c3-343a-c00c-ae89-329833b38981@linaro.org>
Date: Mon, 11 Sep 2023 09:06:55 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <82a0ab25-a3cc-3e87-e379-9b15b3fbbf76@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_000700_304643_846DCB53 
X-CRM114-Status: GOOD (  19.43  )
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

On 11/09/2023 08:34, Macpaul Lin wrote:
> On 9/11/23 14:09, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 10/09/2023 14:07, Macpaul Lin wrote:
>>>
>>>
>>> On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>>>>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
>>>>
>>>> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
>>>> I don't get what is the point of this description.
>>>>
>>>>
>>>>> +        items:
>>>>>            - enum:
>>>>>                - mediatek,mt8365-evk
>>>>>            - const: mediatek,mt8365
>>>
>>> Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by
>>
>> Boards?
> 
> I'm not sure if there will be more hardware version released to market.
> Current the p1v3 is the final version of mt8365-evk.

Then your code (enum) does not match description. The code is saying:
this is for multiple boards based on mt8365.

Your description is saying: this is only for 350 boards.

Now your email is saying: there is only one 350 board.

Three different versions. Sorry, I am confused.

> 
>>> Genio 350-EVK, which Baylibre helped to do upstream tasks. The only 
>>> production version of hardware will be available on the market. The 
>>> derived version of customer's hardware is not available yet.
>>>
>>> The separate patch for renaming mt8365-evk.dts file should be send next 
>>> week for aligning the naming rules.
>>
>> So the description is not correct.
>>
>> Anyway, this patch does not make much sense to me considering nothing
>> like this was merged. You just sent v5 doing the same!
> 
> 
> Sorry I'm confused now.
> These are independent patches.
> This patch is for SOC mt83'6'5 and board mt8365-evk, which is not relate 
> SOC mt83'9'5 and board mt8395-evk.

OK, I see my confusion. mt8365 and mt8395.

Still the description is not matching the code, at least to my limited
understanding of the description.


Best regards,
Krzysztof


