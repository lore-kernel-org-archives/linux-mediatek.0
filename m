Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C709C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqCjltQk8I2tU7mx1MrFC3tkT7yAdLDtPhqi15VnAKc=; b=W2Moj1Sm6aYPSM4y35+Znw91Ye
	J2iPepHTxu6+VsGS/w9q40Q3UEvZFqZGGr+SHaB1UbgMR4ZFtuJLfTCrRkGe6kY6T3iTVXv9Yb7UR
	auM5tDUI9flkk9h9KO6OJYf0M6vIe6QLnWDfvQ0UebNi12rk+35CAVGtV0QjOIvgPxeqIQpb9rHow
	nU9UJ7rrgJ2RvcBSrWGvRY4hW35UYB0Bbv32u/JRxM1PsGFEeQS96NW6Uri0aoSz29MFBF8R0vRaC
	zOl9n2pbTmSbaXpJi1jc1EusoSy5hIHg8EIBOdQp4DDGFqEleW/F6rd9eTHnNxZYoqVcMoDSFFNA9
	AboAptFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jDw-002U0g-Tj; Fri, 08 Jul 2022 08:20:28 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jD2-002TZu-Dr; Fri, 08 Jul 2022 08:19:33 +0000
Received: by mail-io1-xd2d.google.com with SMTP id e5so3321510iof.2;
        Fri, 08 Jul 2022 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vqCjltQk8I2tU7mx1MrFC3tkT7yAdLDtPhqi15VnAKc=;
        b=keaZZ/15eYgScyXtLOqU1DW2ZKvwxgb58uT0uXkDm5jIXJQnw1n/0S89fkCI+p3V/G
         I0sIrQwXTSg4BniBjndlPmc9l5Lhw7sANIlipdqKv7HYzSD2cpBFxRkcXx6vIOs5xoBl
         GIiJk2KgFd86WsthsePRNLyg5OHAhT/TzdE0wLCMuUySTnNnlT3VRaWKzTgW6xyMoX2B
         lQ9TzDzRRDRuGjC3xhlBxSWMWDgXxNrrvt+6zaCYZAnsnhemVOV2H+YFrK4AtQ+ukhBd
         1/rveWjCrOy+DwbxfcYhGiaugLfvMxRSIyifH0dX9QbrBHsCGnbfqhFhrWzUCzq+GLBw
         6OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vqCjltQk8I2tU7mx1MrFC3tkT7yAdLDtPhqi15VnAKc=;
        b=jr4AckEF6FQW3Mklt/lbzM+imENl1ch+NVgSIZeUuBJGDKbmXtMQBp5ggemYQR0KbE
         TnM+BW3oR1/AWy3eqNofZ00LMMvehcX/Wf+tn7me3hCS1vmUnwCnsq4NxcqC1QGpOTfS
         kO5UszCwkygjp9VZNnjoHWbXbvmWHmYW3aJ5UtJunxCfvVXnfT7zcwYa1dMozzzmhImm
         TDyQxwB4cWRwhTfQlwUJK1BOwGtlrU6UPtTHgvkxuDfbhfwfr40rS5kyzqIl48XVtwIn
         ol8w21+eucwIad+o/XkbtKgD7btxCvQzSxr7te08sr4GtAzqtJrwF39VaVdkbit4gYiF
         3Biw==
X-Gm-Message-State: AJIora9s/1eT0qCPwJQ1lRkFcD8+3MLFVfXwyLoDGx6Aiyq6aGFXIgVV
	HMVKc8QHcENciVs90KM972g=
X-Google-Smtp-Source: AGRyM1vCl6u+NPkYq/MEqdBUcy3Zpq5zMWpGOh9L9fZ0JMLVZDj8LJqlJjfHREvLIxclxjKUpRXPog==
X-Received: by 2002:a6b:710f:0:b0:675:20a7:84e6 with SMTP id q15-20020a6b710f000000b0067520a784e6mr1276054iog.42.1657268370450;
        Fri, 08 Jul 2022 01:19:30 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r20-20020a5d9b94000000b0066952cfe3e2sm18991505iom.39.2022.07.08.01.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:19:29 -0700 (PDT)
Message-ID: <2f2f8bfe-4c7f-d81c-30bf-bcd60b42e245@gmail.com>
Date: Fri, 8 Jul 2022 10:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
 <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
 <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
 <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
 <55fafa62684e077f75c3b8b192a59df62ad01692.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <55fafa62684e077f75c3b8b192a59df62ad01692.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_011932_525171_F2B8518E 
X-CRM114-Status: GOOD (  21.22  )
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



On 08/07/2022 10:14, allen-kh.cheng wrote:
> Hi Angelo,
> 
> On Thu, 2022-07-07 at 12:59 +0200, AngeloGioacchino Del Regno wrote:
>> Il 07/07/22 12:41, Matthias Brugger ha scritto:
>>>
>>>
>>> On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
>>>> Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
>>>>> Add mdp3 mutex compatible for mt8186 SoC.
>>>>>
>>>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>>>> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
>>>>
>>>>
>>>> Please drop this commit. Adding a mdp3-mutex compatible is not
>>>> needed here.
>>>>
>>>
>>> Thanks for checking. We probably would need a fallback compatible.
>>> We can only know
>>> from the HW engineers that can confirm if the IP block is the same
>>> as the disp
>>> mutex or a different one.
>>>
>>> I'll drop both patches for now until things got clear.
>>>
>>
>> They're located in a different iospace from each other, but either
>> the platform
>> data needs to *not be* joined together, or if they're together, I
>> would not like
>> having two different compatible strings for essentially the same
>> thing.
>>
>> I would at this point prefer dropping '-disp' from 'mediatek,mt8186-
>> disp-mutex'
>> so that we would be able to declare two 'mediatek,mt8186-mutex' in
>> devicetree...
>> ...or simply have two mediatek,mt8186-disp-mutex (although logically
>> incorrect?).
>>
>> Cheers,
>> Angelo
>>
> 
> Thanks for your opinion.
> 
> They are two different hardwares for different address spaces.
> 
> I think we drop '-disp' from 'mediatek,mt8186-disp-mutex' will be
> excessive because we also need to modify mutex node in all exited dts
> files.
> 
> I prefer havingg two mediatek,mt8186-disp-mutex.
> 
> ex:
> mutex: mutex@14001000 {
> 	compatible = "mediatek,mt8186-disp-mutex";
> 	..
> }
> 
> mdp3_mutex0: mutex@1b001000 {
> 	compatible = "mediatek,mt8186-disp-mutex";
> 	...
> }
> 
> What do you think?

I think that's an acceptable solution.

Regards,
Matthias

> 
> Best regards,
> Allen
> 
>>> Regards,
>>> Matthias
>>>
>>>>> ---
>>>>>   
>>>>> .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>>>>    | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>> .yaml
>>>>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>> .yaml
>>>>> index 627dcc3e8b32..234fa5dc07c2 100644
>>>>> ---
>>>>> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>> .yaml
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>> .yaml
>>>>> @@ -30,6 +30,7 @@ properties:
>>>>>          - mediatek,mt8173-disp-mutex
>>>>>          - mediatek,mt8183-disp-mutex
>>>>>          - mediatek,mt8186-disp-mutex
>>>>> +      - mediatek,mt8186-mdp3-mutex
>>>>>          - mediatek,mt8192-disp-mutex
>>>>>          - mediatek,mt8195-disp-mutex
>>>>
>>>>
>>>>
>>
>>
> 

