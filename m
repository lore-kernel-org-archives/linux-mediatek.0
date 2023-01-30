Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0AC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkp4rkyxPgpsD/uKlrIIe9RaCjDd2iGDYMH6lIDGA08=; b=vAgN+Ffh9drEhXu+NryJSDywDk
	yGN03Iaxq1aCgblRbqlAYQt6keLlzo1zd5DNElAPoZiAbywk7+HmpRhqS9GXCw9q7/Pgc7WSBz8fD
	XXE7sUSR8NPHZX2bl8NYwWbuhdfPnmE8wqaXxgWP3WPsmkmVlu/cfSGdPglIC5Zi2oxFiqhuKzUi2
	0/br+arlyGXGPTJPpt3pDqV5ud0Yjld3Im0IhkzFNDOAlzBLMKZsHTV4m118KSS0Bo2Ca60J+r6/F
	t9IHw13fqLa2+w/Tk/hY2tWw3TL2NgH9lAlAuVZV8IaM7IdeditCntoO0D9D++CTGdq96Mg7cP5kN
	xNBOdfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSCn-003GrV-4h; Mon, 30 Jan 2023 11:20:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSBb-003Gkb-AW; Mon, 30 Jan 2023 11:18:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q5so10742571wrv.0;
        Mon, 30 Jan 2023 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkp4rkyxPgpsD/uKlrIIe9RaCjDd2iGDYMH6lIDGA08=;
        b=abpt2ulPIdGPmIvepxo6Cv91sShFhDssmHfiPZpMNayWwndjSU2xssnbeqLQ452ZYs
         efyDdYOvNXRwFbl2ze3wN5fs9GMKGUAn10MbYcDqP6gBOocekGw6Dja4/4SELwP8OzEG
         3DOPhP0UBdPFQt576Ie3Xo/DmfN6DSDx4Q7dcW00yCdyNyhXziqGbhpI5qB4U9cjMHah
         hSiBoWyMeA7ySx7f/udXhuo1xdGQXmZvYVZ8G8hmUWTaz14qHUQxNg2ywYHlfIOxDfh5
         HEywEtK7v5HbdXj9HPlLmMlp1yxFNrBCEJEYUaS9vCKqAKecmDDKpDwQhLq56pm5raFh
         a18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkp4rkyxPgpsD/uKlrIIe9RaCjDd2iGDYMH6lIDGA08=;
        b=K1dQg+fvYaMYQAs3FGsx7Lb7XM0+sFTh6oVskAhdtNRsT9G+TMsCsCB9gHAOdeYXQG
         mARXg3abvcHsNpZyyByp4wMKAUfJwy5lHN8pdJ5C5M0PlTH4m6/TjzIwQf3I/1Qr36wL
         56wIIOO7igb49Jkbvgf0V5ZcHBj33HO8E+40cEoijhbi/bPgLltcnXFl3pu86D68w0ZK
         XjLu7kYe01NYyqM5CzkIYJh8TIeC1lLypEWk1JE+6fqO5QNreebj+EBOEW5PibEKcnk+
         tuggjJ0wTzZV+M+SmBam7/Lwo3xcXqXI+Msk52q0ch7XCe3s270djYdF3fOZ5JWNNP+3
         d0cw==
X-Gm-Message-State: AO0yUKUPhOYYRoXV92I2LtJsl2ku+a8rHh2Ssw4ma6mPOEBxsNQqOHcs
	/78vQ4vnf4XtRY3lHCgTplQ=
X-Google-Smtp-Source: AK7set8I9YflWW0cSwJMchVO/4uVYr4AsWm9Ei9TpWsGvGjSY92DMQt+BNMb+NGDgOcDPBrbwEUnug==
X-Received: by 2002:adf:a453:0:b0:2bf:ee61:7daf with SMTP id e19-20020adfa453000000b002bfee617dafmr2022150wra.10.1675077533640;
        Mon, 30 Jan 2023 03:18:53 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w10-20020adfcd0a000000b002bff7caa1c2sm364623wrm.0.2023.01.30.03.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:18:53 -0800 (PST)
Message-ID: <b4bec164-5986-718e-b9cc-290dfc995edb@gmail.com>
Date: Mon, 30 Jan 2023 12:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
 <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_031855_411027_CCC3C04A 
X-CRM114-Status: GOOD (  19.89  )
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



On 30/01/2023 11:40, Balsam CHIHI wrote:
> Hi Krzysztof,
> 
> Thank you for the feedback.
> 
> On Sat, Jan 28, 2023 at 11:48 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/01/2023 17:10, bchihi@baylibre.com wrote:
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> Add LVTS thermal controllers dt-binding definition for mt8195.
>>
>> Subject: drop second/last, redundant "dt-binding definition". The
>> "dt-bindings" prefix is already stating that these are bindings.
> 
> fixed.
> The patch title has been fixed as you suggested :
> "dt-bindings: thermal: mediatek: Add LVTS thermal controllers"
> 
>>
>> Plus two comments at the end.
>>
>>>
>>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>>> ---
>>> Changelog:
>>>    v12:
>>>       - Fixed subject prefix
>>>       - Fixed licences GPL-2.0+ to GPL-2.0
>>>       - Added dual licenses
>>
>>
>>> +    };
>>> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
>>> new file mode 100644
>>> index 000000000000..902d5b1e4f43
>>> --- /dev/null
>>> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
>>
>> Same filename as bindings.
> 
> fixed.
> rename :
> include/dt-bindings/thermal/mediatek-lvts.h =>
> include/dt-bindings/thermal/mediatek-lvts-thermal.h
> 

I think it should be
include/dt-bindings/thermal/mediatek,lvts-thermal.yaml

Regards,
Matthias

>>
>>> @@ -0,0 +1,19 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
>>
>> Although this is correct, any reason why not using exactly the same
>> license as bindings?
> 
> fixed.
> both files are now using the same license :
> "SPDX-License-Identifier: (GPL-2.0 or MIT)"
> 
>>
>>> +/*
>>> + * Copyright (c) 2023 MediaTek Inc.
>>> + * Author: Balsam CHIHI <bchihi@baylibre.com>
>>> + */
>>
>> Best regards,
>> Krzysztof
>>
> 
> I'll send the changes soon.
> 
> Best regards,
> Balsam

