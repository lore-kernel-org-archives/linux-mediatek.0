Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B909C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0Qf6XYpQVz6j4kI9S9/dfIfwmKCeXho7yxm3tWLHDw=; b=ATHJBxNNC2/ismM/17dsN8DbMM
	eM+0z4Oqg6xU/0gwwNDEhOVmYY/cSzvmImZSTarAJgkcTI2pnkyPwtq361JiqzrND2ZmkiNsQk1tE
	Z/47uek5rETYR/h7eIvPkxs5RCynjd6sNql7PLuxXAd/KCGyhSiAJ9Pv9MbR+NOeEBOX0dOANbvfm
	yV+e6rrybR5IpHEJGjZD/WLTupxkREro20qDKjYTIsha8DlF5WaigpmkBF81baHDQBLvhSB3rUvI3
	+NTfBFNHIctt+Bx/vCYED+P17NjRNQ4qJMCSEgwDJ7BwPGDJSKqH+dPj6YmDGcMQSxTXwYM7CvNGC
	GE6OvclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j7u-002R0w-Ka; Fri, 08 Jul 2022 08:14:14 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j5V-002PqA-DS; Fri, 08 Jul 2022 08:11:46 +0000
Received: by mail-il1-x135.google.com with SMTP id p13so12476687ilq.0;
        Fri, 08 Jul 2022 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D0Qf6XYpQVz6j4kI9S9/dfIfwmKCeXho7yxm3tWLHDw=;
        b=a8PcvC8T4pJniQ7yqIayMgWH+3gEkHFNYRNhxRMkOr+jhG/UVyB81CyvGH1U4WYubR
         kpQ6Xx8kAmsRhSqkwvV2Wmt1lbaLqIT2v8NsFZiAJfZYikttPD39vSH//rSSnRJNKWvP
         Fd4GpgmjsxOTqwJVm5oWb5g1hbTgrTWJmgv1ydYr/5ZIGUfX/Ra4U9VsVHtVb3hTNdC0
         Ba3uPYLrjTDGkbr9WrQnt3A/kHsQWVzo7qPGW7Xl3yeTNshhdwpBPg/bkWBk8iaMDxys
         n64woJm5X85Tw/NZHT+GJG3SJJ0xSGbjYzuTIWnKfkKwxKgVg1VaWrTs9U4crZuba7d/
         LIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D0Qf6XYpQVz6j4kI9S9/dfIfwmKCeXho7yxm3tWLHDw=;
        b=UUsjuP0obCJxJaq0tfOyu+rOjnXAUjeXdik+vyzxQQ5IRhuMaxD572ygYsXYVEVvtm
         UYAWsfE0kPewoCcItQYA/QxPTXDIAohvUPOjAolIffVbAerNzdj90PlMOR6Neuet40zb
         iNdsQw/WvNGjgGspHjLwY4j9igmZxzCJFSiM4SZ95Fmx8q5YGARFbpg0d7wCYrIpMEP5
         s3PBhMBM/UsLeaDNMHO3wMtfUcUqo3iuQiX1BJu0tP5mkwlizGNzdBA6NOwcpQ3Swx3n
         /6559LNQ7VDiITfLPhEEw8B2AYRKChIKqaGCHLbjrvsYqZ0i2qlo78HXDRvQNCDRXEXF
         5LBA==
X-Gm-Message-State: AJIora/Cai15P7GJNOCb66Gd/JVYzK8zrXpqyhOHzBSIL/ZyUUJ8l7v8
	W7zZ8B+G0dfA1BxoS+hpcXo=
X-Google-Smtp-Source: AGRyM1v57jK2+8qNDptU7lzeTTrC2OcvyKTWnuxBMkLgal9tNGKAfuHo96gs8C1loeyjFe61SHiZww==
X-Received: by 2002:a05:6e02:1848:b0:2da:af35:e7c3 with SMTP id b8-20020a056e02184800b002daaf35e7c3mr1352620ilv.265.1657267904342;
        Fri, 08 Jul 2022 01:11:44 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z62-20020a0293c4000000b0033f258426c0sm960209jah.108.2022.07.08.01.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:11:43 -0700 (PDT)
Message-ID: <624e365e-0f00-9640-74a7-c16e7c7d3469@gmail.com>
Date: Fri, 8 Jul 2022 10:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhongjun Tan <hbut_tan@163.com>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.c, tiwai@suse.com, jiaxin.yu@mediatek.com,
 tanzhongjun@coolpad.com, colin.king@intel.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220708024651.42999-1-hbut_tan@163.com>
 <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_011145_495231_1A05AFFA 
X-CRM114-Status: GOOD (  13.99  )
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



On 08/07/2022 10:01, AngeloGioacchino Del Regno wrote:
> Il 08/07/22 04:46, Zhongjun Tan ha scritto:
>> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>>
>> Remove condition with no effect
>>
>> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
>> ---
>>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c 
>> b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> index db71b032770d..6be6d4f3b585 100644
>> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct 
>> snd_soc_dapm_widget *w,
>>       case SND_SOC_DAPM_PRE_PMU:
>>           if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
>>               regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
>> -        else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
>> -            regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
> 
> I think that this needs some clarification from MediaTek: was 0x31 a typo here?
> 

Looks like the write is covered by the else case already, so we don't need the 
else if here. In any case commit message could be improved.

Regards,
Matthias

> Regards,
> Angelo
> 
>>           else
>>               regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
>>           break;
> 
> 

