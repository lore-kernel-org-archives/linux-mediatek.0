Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8iP2YI4lQ84Ir0THS4ephJafiSIupjnuhDF8rylw0g=; b=mZlA2ecJhYYlsX
	9udDnbQcYn2xVwxynIYG7dA1FQ0CqhaFZxPVWr99xnDUtUp/3sTIyPlIHGHOILGvlr1XGEvigHeL/
	hiI6OXiEbTF4z8lNpKKJdJw8RAzRdTF/iCj1/jNqe6P0YuBdaQObZN2p+gx7eQwv7ZGGSdLPVDhEJ
	A6m3vf/lM/Z7iN0py+6WqjFNEnX5XLyZlEeYvUJagFxRCnXA9xf2qq5mLMsd5DLJMmefywJOjsd2e
	jDZbDqkegfHIAwofEnvrTH4WAKifiFpg2f+rq2jIDrlVU0XXDPsdMsGBRATrrH2Sht+e2YIyjkd04
	8DnTr6leeMhfnZblcqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP4If-00HG6Y-Al; Tue, 01 Mar 2022 15:20:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP4IJ-00HFu4-7H; Tue, 01 Mar 2022 15:20:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1597909wmb.3; 
 Tue, 01 Mar 2022 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RNJbl7QnMaZHEdtpLJkjMDRJiXx7D4kOmJTqeX5y70k=;
 b=q6E+iU2XlbDNXAYZWnPf50rPIht37/jkRm9royBk+AJcyVqBTb7Gt5ZuvGjzfqqCqe
 z793MVf2Aii7E4//Sj1HqjL0IRC9pwaJFXYUNhaHxZVspnEupnzo5s75huu3UWjJQZzp
 0gFECRKA36n05FCgtpCSNWbwliO7n3JvuDMLuVt4V0GIp4jMlcfFbSO4c7K0OJHlPgad
 7XQjONpB+QCS4wPIjYsM7tCcRdOLXkKyQ5pLukc2n104OTVxMyJQH18b3tblCv75F2v7
 Bfg8wZYzZ441ndUowrrFvoAUGFWWJKQ0/q3MALwdQqkL90Iql5mJ/H5zVzzTLbVr7S2E
 fq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RNJbl7QnMaZHEdtpLJkjMDRJiXx7D4kOmJTqeX5y70k=;
 b=ABPkBwMJhFe2fq1Qlm0cVB/EVysIkmVNs2SqMi381HMzcr2AmXMRq679A33YRTzOzR
 wncJah6EAa+XCICaI63SwJB+EhQJoKIIxgQfBGldJvIKCliMXrki2aEfePbb0xhoZ2JM
 tFAX3qHEomEBAVKBsheguOPxwV0qrocfEJ07QaSnvRK2u/TYGnMqZyxkDPWYOISCbIOs
 wJX1o8crDns/bqFGlL5QmJ5PTAtJOdxCWplmAhRCGvAvoq0fUNvTucupjRuGLvqre9Ab
 ZRBZf+JXJZQPvIh4Asj4QSY4HH87whr+DFc1FEURvVNH0Gb5NZdBaTa1oXgxbWo4yrrX
 x71g==
X-Gm-Message-State: AOAM533zmH1wfYB0JZyhTpwIKAywskP1GefK8Ga9WEaynTDG+OQit2t0
 WtL8JfrrT8LwplfKUXgg1I4=
X-Google-Smtp-Source: ABdhPJwwHoAsmZ8g/+CJWiQlouGQfJxCYoXkWtii8W5cSPPbm9HFKETEu0x/vVOeb/Mc9HZbavaSiw==
X-Received: by 2002:a05:600c:19cf:b0:381:7ab1:46ef with SMTP id
 u15-20020a05600c19cf00b003817ab146efmr6053227wmq.104.1646148005388; 
 Tue, 01 Mar 2022 07:20:05 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm14714533wri.110.2022.03.01.07.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 07:20:04 -0800 (PST)
Message-ID: <53df3112-869c-e05c-4b6e-0c6db60a536d@gmail.com>
Date: Tue, 1 Mar 2022 16:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2,0/2] Add mmsys reset control for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com, 
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220217082626.15728-1-rex-bc.chen@mediatek.com>
 <09ce5aab-0cc6-5903-8238-551085abd739@gmail.com>
 <31507af7c67640fa8161b13a4f279fea1a050f55.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <31507af7c67640fa8161b13a4f279fea1a050f55.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_072007_309006_EF2D6BA1 
X-CRM114-Status: GOOD (  17.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rex,

On 01/03/2022 12:13, Rex-BC Chen wrote:
> Hello Matthias,
> 
> Thanks for accepting my patches, but I didn't see this patch [1]
> in v5.17-next/soc.
> There will be build error if [1] is not included while [2] is applied.
> The sw0_rst_offset is declared in [2].
> 
> If I have mistake, please let me know.

Thanks for the info. That was actually my mistake. Should be fixed by now.

Thanks a lot!
Matthias

> Thanks!
> 
> [1]:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220217082626.15728-2-rex-bc.chen@mediatek.com/
> 
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24
> 
> BRs,
> Rex
> On Tue, 2022-03-01 at 08:35 +0100, Matthias Brugger wrote:
>>
>> On 17/02/2022 09:26, Rex-BC Chen wrote:
>>> v2:
>>> 1. Change variable type from unsigned int to u16.
>>>
>>> v1:
>>> 1. Add a new variable in mmsys driver data to control different
>>> register
>>>      offset for different SoCs.
>>> 2. Add MT8183 reset register offset.
>>> 3. Add mmsys reset control for MT8186.
>>>
>>> This series is based on mmsys patch for MT8186 on [1].
>>> [1]:
>>> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220216084831.14883-4-rex-bc.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!wp2uW6phbST6ySpYRlb7iwmATAVkkCL1JBau9dCwhXj8KRasrAWnLd1EUT9gLE-oF9Yq$
>>>   
>>>
>>> Rex-BC Chen (2):
>>>     soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data
>>>     soc: mediatek: mmsys: add mmsys reset control for MT8186
>>>
>>>    drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
>>>    drivers/soc/mediatek/mt8186-mmsys.h | 2 ++
>>>    drivers/soc/mediatek/mtk-mmsys.c    | 7 +++++--
>>>    drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
>>>    4 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>
>> Series applied, thanks!
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
