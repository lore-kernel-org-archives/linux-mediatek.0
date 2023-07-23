Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D6C001DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jul 2023 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9bizb2XUBHywNQ7OsFuDywmc/SZSAKRG7HN4IcLmxA=; b=PmhcD3/UfO3xoWCY7u1MORO8jv
	mz4N9uxk2A86pAB1oIexGOnN/zMLdoERveTyQMGt8nqjKLL25zIQzyfoUCTMKMIJYJ+ko1O+YytD3
	oZE9ZFcY5UoombEbKSgHLUOlndTDo4Pqhdfla+Nnsl4eiIHcBHbqdTBLCJYn4jzLZGi3tyPxI8ZMA
	EDWGW7Qzq9yh4QeYQSsy9rBz52G5ywtrPrDVY/TOaWOHXb/EBRvGdbO8dvNoQs5AsmZniX2emrlQB
	1CEGfA1NvUIka1tYzfl+GgVQTPnymolWA2nyew8d4ilDyZjLdsnmFmboNEHIk2pyf7hrsQBJWG9EP
	4v0zMzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNW9d-000kLC-2R;
	Sun, 23 Jul 2023 10:17:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNW9b-000kKI-1K
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Jul 2023 10:17:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso26205855e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Jul 2023 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690107449; x=1690712249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9bizb2XUBHywNQ7OsFuDywmc/SZSAKRG7HN4IcLmxA=;
        b=m24HZMH7N13lRaOv5+b9dQidpC9uy3119QSO4PCp2b/m6+hXwqvQ7jPMFHXOmkj9ts
         TzMW1Yu46FjlE6yn1eOJqSqntfWnPUbNSIQX/7ZXWZ4mjjkbFBoFXJ21aSHAmpY4BFoo
         EQl2X49dqkT4GA5yFDoPHXtJN8+L+6Ysd243ij7VDjcvI+r+gteX+q2+/vFSSpTiaoCS
         JR6r7rdB0uxqIAC/MYsBicf80X3QG92XkdBLAMkfz7PaWKiuY68jVPZ4/uf5654ZgUDj
         Q39juTJMrZkfFt9a/OGS+Y/JsEwcvAndxpncQQFfAxgHsyw2ejsNHDad6IeHiiKzlRyn
         dCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690107449; x=1690712249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9bizb2XUBHywNQ7OsFuDywmc/SZSAKRG7HN4IcLmxA=;
        b=OrWIHGA58XZB4lmGV4u9sAFY2JyqM1PydXMBhB1xhqSmEgoCwcQvH7rdtkBixfShCo
         U1/sX+e+Z999J1CMZH/O2psfcDvXcb5XfVm/7nuYeaZUj4xEu8LrAhIYjOkRtq0806Hh
         9+mDENBgBCnXC8NZWbBTiMFo0TWGkQ1G0/XQaijw48fHDyBKrAVQ/x+baXmwHmsA/m7g
         XmOq0hwHvr87S+blemVgrtQClvMelMO3fKcD2K3Mt5J4ozI91ZXFRIutZfo4EX+b0v7v
         WfD1SNdbQSiLYOJIoi7pfkeBHWdV7mp8LjgOWd3Fu8jcD/6GATCfzEsV55ebTR8LQQbr
         L3RQ==
X-Gm-Message-State: ABy/qLZSWKWmP8UxsMU/zFcrVyYNCMRNG8Zu8Bwy0OIR+FxLJwqF71/w
	H4CnwvPPKiqLMmBsaOcYkUFTBA==
X-Google-Smtp-Source: APBJJlFljllVDRV4zSU98uny4rzyJPJfcQknRSy2KfrcGhNrDXhlnkPeB3obyiKeYnJqpyP75u5rDw==
X-Received: by 2002:a05:600c:210d:b0:3fb:4055:1ddd with SMTP id u13-20020a05600c210d00b003fb40551dddmr4567872wml.28.1690107449150;
        Sun, 23 Jul 2023 03:17:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003fbb1ce274fsm25898354wmb.0.2023.07.23.03.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 03:17:28 -0700 (PDT)
Message-ID: <c0f1d7b9-5923-75d6-cb57-bb4bd4635cd7@linaro.org>
Date: Sun, 23 Jul 2023 12:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] thermal/drivers/mediatek: fix a regression affecting
 other subsystems
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kang Chen <void0red@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230529162056.3786301-1-uwu@icenowy.me>
 <40546a57-27ac-8bf9-a2d8-77f7d4ab4aad@linaro.org>
 <05e6d2d6dd8805c4cded28f85ac873b96bc1467e.camel@icenowy.me>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <05e6d2d6dd8805c4cded28f85ac873b96bc1467e.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_031731_479029_DF5C6473 
X-CRM114-Status: GOOD (  15.34  )
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

On 22/07/2023 14:13, Icenowy Zheng wrote:
> 在 2023-06-13星期二的 10:44 +0200，Daniel Lezcano写道：
>> On 29/05/2023 18:20, Icenowy Zheng wrote:
>>> In the commit I reverted as the first commit of this patchset, the
>>> of_iomap function call, which allows multiple mapping of the same
>>> physical memory space, is replaced to calling devm_of_iomap, which
>>> registers exclusivity, and on my system (mt8173-elm), preventing
>>> display
>>> from working.
>>>
>>> So I reverted it, and to really solve the problem that the original
>>> commit wants to solve, I read the source of auxadc-thermal and
>>> realized
>>> that the address of these two memory blocks are not saved after
>>> probe,
>>> and they're only used when initializing the thermal sensors. This
>>> leads
>>> to my final fix, which is the second commit here, that adds
>>> of_iounmap
>>> just to the probe function.
>>>
>>> Icenowy Zheng (2):
>>>     Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid
>>> resource
>>>       leak in mtk_thermal_probe"
>>>     thermal/drivers/mediatek: unmap foreign MMIO after probing
>>>
>>>    drivers/thermal/mediatek/auxadc_thermal.c | 46 ++++++++++++------
>>> -----
>>>    1 file changed, 24 insertions(+), 22 deletions(-)
>>
>> I'll apply only the revert and let you revisit the patch 2 which
>> could
>> be improved.
> 
> Sorry, is the first patch applied? I didn't see it in any kernel
> trees...

Yes, sorry, I got another patch meanwhile which provided the same revert 
with more tags

https://lore.kernel.org/r/20230525121811.3360268-1-ricardo.canuelo@collabora.com


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


