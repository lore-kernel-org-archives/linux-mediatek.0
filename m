Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A90BCF31B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZN2AiYbbLfMhaNqLsxlSqP+f2HpTyj2YRP1VQUKWWc=; b=MaBKCAy63tZGyKcrJm3wBdVGZ1
	0K5ky9Fv9ey6MyMDDAQDs4mozXQF8VfMSTebOLAAZlHXo2IgqZ3VoQwMzgd1OCMtejo7kfKh7yGJe
	Bgp6OKxFgzoMD/1oxL9FTs+RP5e3xTRSP3OxsPo4KTR7G6ob8J4sGFLgUkWcAbwirotk7kedlVY1m
	9/KrNlSQEGMY1oDNZkK95BnxkDksRy4LOm29ztyRTf6/lyUW/4WXu5qVWCS7nJEE06jaC9d26TJ3u
	weOX7X29Al6Z7o9SQ4XDd7djkr4VrOkBqYM6fACRUZDJNT52/SG7I5D9DR1zEeV9oxVFRgye4lRi2
	BgSabSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svyw5-000000060iz-0xUW;
	Wed, 02 Oct 2024 12:58:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svyw2-000000060gR-3KPh;
	Wed, 02 Oct 2024 12:58:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37cdbcb139cso3834018f8f.1;
        Wed, 02 Oct 2024 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727873909; x=1728478709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZN2AiYbbLfMhaNqLsxlSqP+f2HpTyj2YRP1VQUKWWc=;
        b=jgr2FYpI0KAatVsjbvOsFhUM628+h2E8BAfYKVV9IT2oj4rQAQZwmHE8Vl3Q+5GwuA
         rG+B4oTC4LdRDbDpesf4d6+j3kwzkOz0OVaz8r5eAeDOZd1K9MqEysIgizY25/bhjpaS
         Hcmc8YrD72sHWKrbV3eXGLstaO3v4ckhV2O7RHWcjHOVoTqzfdzguJaZDdiaUxfRBK4P
         YLMLreDh6PHkmzZmHpnbZ/In3852vvQ8XmxGx2E/x8qLxP5MP+F/spOKTX704r1NQ71P
         vKg57KrdK5uvWS/JVwMOAxr6sNxHxpoxqFeZ80GVTwWDnJ99xfzihm0/+arBIn6/t7ip
         dLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727873909; x=1728478709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZN2AiYbbLfMhaNqLsxlSqP+f2HpTyj2YRP1VQUKWWc=;
        b=s7P8ozfcB05PjlKqlhoazU0FE6kd/2x42aKLEWjXHm/w07MuRw5VfgV27y8BmPCaCF
         8VZ4ub6yA5aj6Qh64XP6nUvJCva3lWxB3RuxKtOnDBn91K/Sprx0VQ4W5IbT4tp+wGC8
         djLKLPXLo333Uh0fb0FqlG0OsG2bzkXoJvGjiKm9YHmTWS4YtXZYrez1IzsK0cOZQ+Kp
         wfPm+7VS+OigF6Fz2qJJFGcKElStRA7eOjuZvr2b8Wpo/KDoBXhmHKn8nEMNIAYVI77x
         sO0kYFmwTuNAiejVmpgww09vLT93nHU65XzusfSrPjq7r1k+GHPCyB2KhOdC1xH4Uu2l
         2s6w==
X-Forwarded-Encrypted: i=1; AJvYcCVF1sx9bb4/iPQNpOmQPxKqjCoPIVcfdJ199nj2CemEE1gBbdyFzAC5gBODHYgU8Iy24AD8N0YIi3sDM4YwhuYB@lists.infradead.org, AJvYcCX3qxKcx22D7E17YitmTrCui6MGp8uxHkHalY1dlfEuB5DKNW1cTtfxJl1DGUnuysXcst/TP5wKJWDT2K4rBCI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvT0BnLs8RqeiESaO7h2LzT3tueE9ThVeASjn51B94Z8gyKnkX
	yTUYJxcgzkTpbr95Kz4jwc6g27ovSN7uICIZJhqaC/Mw/d3kV9XvKTMHIQ==
X-Google-Smtp-Source: AGHT+IHCIzhrgzRpMC0CDsbDv7z1CL/HOu8UjPjfpaANzaHy4HrMcMCN1lML0ZraecM4v1k8G5RG6Q==
X-Received: by 2002:adf:fa05:0:b0:374:c3a2:2b5e with SMTP id ffacd0b85a97d-37cfba0a664mr2078507f8f.37.1727873908373;
        Wed, 02 Oct 2024 05:58:28 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297c2d2sm859766966b.183.2024.10.02.05.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 05:58:27 -0700 (PDT)
Message-ID: <2cb6e2d6-226f-4a40-bdff-81baff8988a6@gmail.com>
Date: Wed, 2 Oct 2024 14:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] soc: mediatek: mtk-cmdq: Mark very unlikely
 branches as such
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <20240918100620.103536-3-angelogioacchino.delregno@collabora.com>
 <7d577541-cada-4f6f-8e83-c420dd0e9382@gmail.com>
 <06c5573b-8b63-4a75-8af2-d6aace86fe69@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <06c5573b-8b63-4a75-8af2-d6aace86fe69@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_055830_860619_64DB48E3 
X-CRM114-Status: GOOD (  20.45  )
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



On 02/10/2024 14:43, AngeloGioacchino Del Regno wrote:
> Il 02/10/24 14:41, Matthias Brugger ha scritto:
>>
>>
>> On 18/09/2024 12:06, AngeloGioacchino Del Regno wrote:
>>> Calling cmdq packet builders with an unsupported event number,
>>> or without left/right operands (in the case of logic commands)
>>> means that the caller (another driver) wants to perform an
>>> unsupported operation, so this means that the caller must be
>>> fixed instead.
>>>
>>> Anyway, such checks are here for safety and, unless any driver
>>> bug or any kind of misconfiguration is present, will always be
>>> false so add a very unlikely hint for those.
>>>
>>> Knowing that CPUs' branch predictors (and compilers, anyway) are
>>> indeed smart about these cases, this is done mainly for human
>>> readability purposes.
>>>
>>
>> Are you really sure we need that? As you mentioned the unlikely() is probably 
>> useless as compiler and branch predictions will do the job. I don't see the 
>> complexity in the code to have this annotations for human readability.
>>
>> I would argue against using unlikely() here as, in general, it is discouraged 
>> to use it. We will just create a data point of doing things that should only 
>> be done with very good reason. I don't see the reason here, it will only 
>> confuse other developers about the use of likely() and unlikely().
>>
> 
> If you have strong opinions I have no problem dropping this.

My take would be to drop it.

> Perhaps I can add a comment stating "this is very unlikely to happen and should
> be dropped after thorough cleanup", if that's better?
> 

As these are exported functions they could be used by out-of-tree modules, so it 
could make sense to check the input parameter. Maybe transform it to 
WARN_ON(event >= CMDQ_MAX_EVENT)?

Regards,
Matthias

> Cheers!
> Angelo
> 
>> Regards,
>> Matthias
>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/soc/mediatek/mtk-cmdq-helper.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c 
>>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index 620c371fd1fc..4ffd1a35df87 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -336,7 +336,7 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool 
>>> clear)
>>>       struct cmdq_instruction inst = { {0} };
>>>       u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
>>> -    if (event >= CMDQ_MAX_EVENT)
>>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>>           return -EINVAL;
>>>       inst.op = CMDQ_CODE_WFE;
>>> @@ -351,7 +351,7 @@ int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event)
>>>   {
>>>       struct cmdq_instruction inst = {};
>>> -    if (event >= CMDQ_MAX_EVENT)
>>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>>           return -EINVAL;
>>>       inst.op = CMDQ_CODE_WFE;
>>> @@ -366,7 +366,7 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>>>   {
>>>       struct cmdq_instruction inst = { {0} };
>>> -    if (event >= CMDQ_MAX_EVENT)
>>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>>           return -EINVAL;
>>>       inst.op = CMDQ_CODE_WFE;
>>> @@ -381,7 +381,7 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
>>>   {
>>>       struct cmdq_instruction inst = {};
>>> -    if (event >= CMDQ_MAX_EVENT)
>>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>>           return -EINVAL;
>>>       inst.op = CMDQ_CODE_WFE;
>>> @@ -476,7 +476,7 @@ int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 
>>> result_reg_idx,
>>>   {
>>>       struct cmdq_instruction inst = { {0} };
>>> -    if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
>>> +    if (unlikely(!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX))
>>>           return -EINVAL;
>>>       inst.op = CMDQ_CODE_LOGIC;
> 

