Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989BDCF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFSdNR4cRBqNLngG4TruQAQgtAq5P3i07HgVakyP01M=; b=HZGlE+JbGw8yf1FhMNqT3W/juX
	nXYVtBiBCXtkSUQ3cmt89SHAPsYJmcwwZuXKrlUDqyEsV77yADH4QZeVfst6TKeUeqKFOa51Q8g8s
	FjPk9QvcEPCGgohVqbZ7ggpf4IXdotMy+N4WOZd7RhnmT+Z2dxB53H6i0DjR2o9BgnSt7N4OG24+s
	WGqELMNPuooAYCxwEdneqwNKyNoGYfMFHZUeCug42dMrppRMSEaKoYrCiQsrUN5VpvEfb502LaHIf
	lv2AA5KNIJcOGg4It+RcHQfr31BWX16u5QbNIbFVXGVYEnN/T3QZT66HB0Fzl2IBr6PL5MiNCGPC3
	tO7wB4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svyo6-00000005yjQ-2zj7;
	Wed, 02 Oct 2024 12:50:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svyhq-00000005wtn-0MI1;
	Wed, 02 Oct 2024 12:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727873027;
	bh=/5kOhcdwjXgx7vKMb12UWt95fAbSNOwU04jH9iiXY00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLs6tvREnjPZUmY4s9S5+TjmWVGcB+sV4A3kvshCpOSo6ww0Jb+79vGJpT/nqYKXT
	 iGXNifw+e0JA4jdyv3urmzVMNOGZTwvSYpCGvaYpJAi/UpyNvlqG13p+TvtxJeNoe7
	 vpuZ+5YddxtblUpxhyz1zVgdvgfzaqtI/7O8zqXPH13tWGOH17Ad8Q4U2r0Q74mUcB
	 4V97ANnt66LFL7BrE03aCG1hD6Q+u/DVJMZALipQoj0KqjRGSUF8scJ9j3oN6ZtKcW
	 Qn6KKIOeTTm17zZML+IaUI1yKhEj8BTIoMuasLCFxoOt5E1RxSmk9ynn3mVxcI3MuQ
	 OpLt+QgbJLyFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4A2917E35DB;
	Wed,  2 Oct 2024 14:43:47 +0200 (CEST)
Message-ID: <06c5573b-8b63-4a75-8af2-d6aace86fe69@collabora.com>
Date: Wed, 2 Oct 2024 14:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] soc: mediatek: mtk-cmdq: Mark very unlikely
 branches as such
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <20240918100620.103536-3-angelogioacchino.delregno@collabora.com>
 <7d577541-cada-4f6f-8e83-c420dd0e9382@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7d577541-cada-4f6f-8e83-c420dd0e9382@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_054350_300347_9F7D48B2 
X-CRM114-Status: GOOD (  21.30  )
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

Il 02/10/24 14:41, Matthias Brugger ha scritto:
> 
> 
> On 18/09/2024 12:06, AngeloGioacchino Del Regno wrote:
>> Calling cmdq packet builders with an unsupported event number,
>> or without left/right operands (in the case of logic commands)
>> means that the caller (another driver) wants to perform an
>> unsupported operation, so this means that the caller must be
>> fixed instead.
>>
>> Anyway, such checks are here for safety and, unless any driver
>> bug or any kind of misconfiguration is present, will always be
>> false so add a very unlikely hint for those.
>>
>> Knowing that CPUs' branch predictors (and compilers, anyway) are
>> indeed smart about these cases, this is done mainly for human
>> readability purposes.
>>
> 
> Are you really sure we need that? As you mentioned the unlikely() is probably 
> useless as compiler and branch predictions will do the job. I don't see the 
> complexity in the code to have this annotations for human readability.
> 
> I would argue against using unlikely() here as, in general, it is discouraged to 
> use it. We will just create a data point of doing things that should only be done 
> with very good reason. I don't see the reason here, it will only confuse other 
> developers about the use of likely() and unlikely().
> 

If you have strong opinions I have no problem dropping this.
Perhaps I can add a comment stating "this is very unlikely to happen and should
be dropped after thorough cleanup", if that's better?

Cheers!
Angelo

> Regards,
> Matthias
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/soc/mediatek/mtk-cmdq-helper.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c 
>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>> index 620c371fd1fc..4ffd1a35df87 100644
>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>> @@ -336,7 +336,7 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>>       struct cmdq_instruction inst = { {0} };
>>       u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
>> -    if (event >= CMDQ_MAX_EVENT)
>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>           return -EINVAL;
>>       inst.op = CMDQ_CODE_WFE;
>> @@ -351,7 +351,7 @@ int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event)
>>   {
>>       struct cmdq_instruction inst = {};
>> -    if (event >= CMDQ_MAX_EVENT)
>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>           return -EINVAL;
>>       inst.op = CMDQ_CODE_WFE;
>> @@ -366,7 +366,7 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>>   {
>>       struct cmdq_instruction inst = { {0} };
>> -    if (event >= CMDQ_MAX_EVENT)
>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>           return -EINVAL;
>>       inst.op = CMDQ_CODE_WFE;
>> @@ -381,7 +381,7 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
>>   {
>>       struct cmdq_instruction inst = {};
>> -    if (event >= CMDQ_MAX_EVENT)
>> +    if (unlikely(event >= CMDQ_MAX_EVENT))
>>           return -EINVAL;
>>       inst.op = CMDQ_CODE_WFE;
>> @@ -476,7 +476,7 @@ int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 
>> result_reg_idx,
>>   {
>>       struct cmdq_instruction inst = { {0} };
>> -    if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
>> +    if (unlikely(!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX))
>>           return -EINVAL;
>>       inst.op = CMDQ_CODE_LOGIC;

-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


