Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF92C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6F52076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVcdtAiY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9cG23A4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6F52076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mX3E/6B2sTKHCluigklSYGvnlFHe+0pFwCPvVAOmKxE=; b=iVcdtAiYKidaVo8XGdum2VO6p
	Lyi5afXRNSLNwRO8WRH8k7rF/eFaK/mVWP7vooafazE6HbiF1wvfi+R1CdXzdbAW2oMRAENamIj7p
	PV0jyovxQGJ6D8OBbhoEGh1rzv9KvFZMf7acd9blaiQbwkbeFM0z7kYBS+DxWD36zbSBPDnVAjb6l
	HvjwIZ3fd0USzm5oHNpkgddSuWBbzBNTF8euvNm02QHx6Hb4MSeZtnt06ymNLgn2ByOyJzkpawc29
	DHO0AIlDRtgOkZcLypqoAO0efydDdKXw6G3tOzX4tmHEJZDUNccZOMbIVsBDi17i0nizXi68jkLVV
	AfSUviStg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hFA-0002xd-T4; Wed, 29 Jul 2020 08:15:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hF5-0002vd-5j; Wed, 29 Jul 2020 08:15:16 +0000
Received: by mail-wm1-x342.google.com with SMTP id q76so817104wme.4;
 Wed, 29 Jul 2020 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rlchZqwkXTtwtE28PNsYh99vPS/5jVQbHUXJ9dhuRrA=;
 b=P9cG23A4bFDPWjtj4larjxw9qub354zQJMGt5m62NGpQZpZF1zWrdiDiI0E56b8bbe
 Ibl63wLkvwrYw1yO6bvu5qRR9Is94HvtOtHxhoV9oNvJaQ6wzhwYo58wAPYP6JEmn5ss
 Fxh0ydAuS41xj5OPLQZeuyR6PC2OE20K19zt26Wi35TVcs6YS4rEz7U2RT7l4TI14jpK
 GTF52mTM953Tbhi4XahEtPtjuefcbB0wRQ/zCPFf3HwOtRa5ydkptAcivPwhBZ33d7hs
 vjfp2wbqX5WHkzIB1+JoASZsOhQc+oxdW+PUvytH/UlkuJOnqcb9Vp2rZUcAW/2Mg4gO
 Q7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rlchZqwkXTtwtE28PNsYh99vPS/5jVQbHUXJ9dhuRrA=;
 b=NcEsBAbeK++HTondrJaGVF89HdcrVxAHAh/vwAzXhNYdoHiTwq7F8YH43Gm9iKMONU
 OJAWZmXhH5ioJxmRrnMRqmHbtesJmDobBH9P1Mq9FHHz3B6OuWvG1JO9r5Wr7tgr0u/m
 JAw84vnXsmoF8kh/4zDsPMq4+Z+3eCzlb04I0hecSWxHMVo7Eaq6uteHj2lsHdXHr5SO
 63QTurwfivjkxj/sTg+86CmuSF3bahW0ndGeByZ8SPFxyIgQ34624ajiJi20TD9+eSEa
 0J0zrc/jEBSSDPgxNnna0vGrS6i+Ko14bWKwAC6ap0i3fAR3GpVjmR8jL94UMKW5Ahi7
 ahkg==
X-Gm-Message-State: AOAM5326NScoCb3zgPm6eMHohK1kqs4Q63GhNTWZyR56F/1IroC5i+7j
 9xt9iAgfzV/Am01rjVlk5LA=
X-Google-Smtp-Source: ABdhPJyFW7pSFOpmJYqx4oK1oTZOOOz/JCxfYIwaWtqZ29VmQTDiliOunqQhsLOYzEtFTRU+wQ5fgA==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr7413895wmj.122.1596010514275; 
 Wed, 29 Jul 2020 01:15:14 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id p6sm3336770wru.33.2020.07.29.01.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 01:15:13 -0700 (PDT)
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
To: Crystal Guo <crystal.guo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
 <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
 <1596010313.11360.2.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
Date: Wed, 29 Jul 2020 10:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596010313.11360.2.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_041515_302491_58715659 
X-CRM114-Status: GOOD (  19.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 10:11, Crystal Guo wrote:
> On Wed, 2020-07-29 at 15:42 +0800, Matthias Brugger wrote:
>> Hi Crystal,
>>
>> On 29/07/2020 08:30, Crystal Guo wrote:
>>> merge all the reset numbers in one head file.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>    create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
>>>
>>> diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
>>> new file mode 100644
>>> index 0000000..d73a4ba
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset-controller/mtk-resets.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2020 Mediatek Inc.
>>> + *
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
>>> +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
>>> +
>>> +#define MT2712_TOPRGU_SW_RST_NUM	11
>>> +#define MT8183_TOPRGU_SW_RST_NUM        19
>>
>> Maybe I didn't explain myself properly. We want to have all resets in one file
>> and do not want to have the resets for the watchdog in a different file. That
>> means I don't thin your patch is correct and the effort should be abandoned.
>>
>> Regards,
>> Matthias
> 
> Do you mean to keep the current way unchanged? For example, with a new
> SOC 8192, should add a new head file mt8192_resets.h for the resets
> numbers.
> 

Exactly.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
