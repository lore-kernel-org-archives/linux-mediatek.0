Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E451ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQsYoJcJj+hrRt1cv36jHySIhXkSA0/HItyBCk3yloI=; b=doSV2ERxcchVX7Oc6NE33+V8D/
	gUpptwFugCY7qezJdiwksDJf/i25B4XbPnkldNH6YYCdcQMZEdXGRda3DqprsrZEMXhMSIM4o4oV/
	pLj+RqdFxlq6Aydzqfj/vm5cD/9fci0jeNVbZngb5Ua0dFTFM+g5XTvou2jrHkqX1t+Fn2AMJ3Q+l
	ajEKGn2rWoG0vgU5sdkvPX8ZnicQ69BPaRNeRaY48ecBXxpMpY5k/VPdMO9SnQQ2q/33ZsjAAG83A
	RIT4F/SOgU34A5gjNhSWhbJI5dS+vq2J9h/9qUUvksr2nQUANbPeFS4LMzmyerMmK6kkhrAKiOK/i
	Y66LuWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSx2o-00FMsE-FY; Tue, 30 Aug 2022 08:56:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSx2X-00FMj2-Tf; Tue, 30 Aug 2022 08:56:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id u18so577767wrq.10;
        Tue, 30 Aug 2022 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IQsYoJcJj+hrRt1cv36jHySIhXkSA0/HItyBCk3yloI=;
        b=hVpKlmQSZ1poDiEgiEMuQb1JBdOXqUi05gHmK5W4i0sbjvZXOqtB2hR9/liRY4tSp4
         nHKHFaukNBtGFOaqCCPATK+yCTPjOWsXYezL9CG1oninUcN+rcJ+RSDSM9mox2x/77Bl
         iXGLwYKE9wzwSCY6b0EH/mZR+OP8pjJ6n3Gn6cxb4lm/Dr/HyNmDoaf+uAFZBBfjGH4m
         KkRzQHjnLyijGX2Idr0u2NxhMCpzo12U3Kkz+Y1roEqjRDP+iY+8RN+Rw7cWqB+cYj+V
         Ic3dj06WuQPG7iCsRYrNnt+MkN/GrfCibH6zkOp62dFoxckjOhtZn12VGYZY2oZNHTjA
         Crgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IQsYoJcJj+hrRt1cv36jHySIhXkSA0/HItyBCk3yloI=;
        b=m1/uIIjcddpleoeQzO5TwWg4pxNtbP+jSYCDgsajZw2kA2A2i0lF8U8U6wl60eKK0D
         izkvXKdgkp3gZx/c4gk7tADCq7L4ry7z8cr/FbbuAw/NffiQ/4HOe76nInObLqdm9jng
         SucDCWoYfzFDz61Pww5V0+hAqJ5iQEJ19zaGRR/71k456liy7nAXbVISgZGbktdMD1Qv
         +z8XLuDbyGoOWCAFEpdmHW+5V5PQKfOks6ho5HzRMazeNOh11rXtDQ5iijVxVVOabiQk
         9bKU7BWYgMd1So70wrDiidFNW892v3H/gouWQ5GydSHeNfY5Y6TIn9a28/LfYxzIhcsF
         rHCg==
X-Gm-Message-State: ACgBeo0+zn4+eLM3yTfr7JGWqXxkoVfHIYZwTO9n9Iko80IMKxN4kVzu
	RoMURntKXBaRlqvM1VWvoYE=
X-Google-Smtp-Source: AA6agR4w6N5w3ZMDmfqrj94y8/JEIVQqlq8DKQ3N+FsJmqb6FNHnL33qPTQTuhl6g94rqWakjwryPg==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id 11-20020a056000156b00b00222c789cb2dmr8426597wrz.197.1661849767619;
        Tue, 30 Aug 2022 01:56:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i13-20020a05600c354d00b003a5f4fccd4asm11950542wmq.35.2022.08.30.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 01:56:06 -0700 (PDT)
Message-ID: <80280240-8769-ea25-6348-b5f60d34ef5f@gmail.com>
Date: Tue, 30 Aug 2022 10:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Explicitly include bitfield
 header
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220829204439.3748648-1-nfraprado@collabora.com>
 <5a8a2b0d-fa7c-e8c6-bb04-152f8c17aa76@gmail.com>
 <ea7b7b08-cb9a-b6a3-bc7a-050616696e89@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ea7b7b08-cb9a-b6a3-bc7a-050616696e89@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_015610_012124_91FBA3E3 
X-CRM114-Status: GOOD (  13.28  )
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



On 30/08/2022 10:06, AngeloGioacchino Del Regno wrote:
> Il 30/08/22 09:37, Matthias Brugger ha scritto:
>>
>>
>> On 29/08/2022 22:44, Nícolas F. R. A. Prado wrote:
>>> Commit a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros
>>> where possible") introduced the use of FIELD_GET and FIELD_PREP macros,
>>> which are defined in the bitfield header. Add an explicit include for it
>>> so we're sure to have the symbols defined independently of the config.
>>>
>>> Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros 
>>> where possible")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> ---
>>>
>>>   drivers/soc/mediatek/mtk-svs.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>>> index 64dba9f830f3..f67f3e971653 100644
>>> --- a/drivers/soc/mediatek/mtk-svs.c
>>> +++ b/drivers/soc/mediatek/mtk-svs.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright (C) 2022 MediaTek Inc.
>>>    */
>>> +#include <linux/bitfield.h>
>>>   #include <linux/bits.h>
>>
>> What do we need the bits.h for?
>>
> 
> bits.h has the definition for GENMASK(h, l), used in this file :-)
> 

Right, seems that some other include includes bits.h as well, as compilation 
does not break. But we probably don't want to rely on that for the future.

Applied thanks.

> Cheers,
> Angelo
> 
>> Regards,
>> Matthias
>>
>>>   #include <linux/clk.h>
>>>   #include <linux/completion.h>
> 
> 

