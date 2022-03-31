Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E386C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf3H8viUC03+Pk6rrjZ+IglFDk2lyIEDSmh25SKV/ho=; b=SP3VgjdHr/307SyEdJEGMeCR1S
	ow/zUTBbRelpy/DfI85d/+59semYH1ejx8UKWvyDCIRlacpHsNAffbZa93Ojv0Kraux5aoM62vXDr
	J15rgdpBAcZ3GjPU0Lx1YLyhSxNli49ZVPjlF7kHM2c8w7rJA2Ah7aNaL8lebPneQ5Whmk4FOI/1w
	2A9hmTIkrnJPXcLKA5Crbds7IAgjwzOY+8rsIhiNlMzyscljFHCmw8K7J+MdGa0sxBCBKIUdJEF8J
	9ieBljI3wr8KcfMi7WlL98WjwP4tSRwdpXofAqP8FuD2GSe4NXVQ1RY/Er98N7k72E9VN3jqX2/Sr
	Kmy/Ly3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZsYJ-001wOC-JT; Thu, 31 Mar 2022 11:01:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZsY6-001wJH-SK; Thu, 31 Mar 2022 11:01:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id b19so33199961wrh.11;
 Thu, 31 Mar 2022 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+/7/LNYiddHh3daHO4b4y3+lUSSJ6kGwQt036sq4F5s=;
 b=RkWYRYnEQActcnsOIxJdaEOmUujN+0CedWTaT+THPDjGDS+F7p0mIpLnv5t6fiFumP
 TWfbw1i2t6C/QXiZYDga486alGeUynbUh5NrCOEUloaFJLCjrfB37FfbECNprHdIvuQ+
 L4dnPv5FjAUZ8AGD9G1KGc+5t5iDJplfBGbEgLv3dTMWlrJ/GKAoayT3BqeV1cxrbxaQ
 1+IH6sJg7pZrGtCJHFziELhNKJgFfc5N7MC9HflL//lHWbiJgPszerJA7rYT0BuHHSs4
 Md6+Dx0H93l6Fby2KoMjYC9vQdbDX3INf+deJ/B0Ug9af5NpScZ4OakI7PwzjQewE+pL
 ToKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+/7/LNYiddHh3daHO4b4y3+lUSSJ6kGwQt036sq4F5s=;
 b=ZeeF7acbVo5Ao+4cmBvXBA1hJsepVkb5eZrNuUf1jWbq/9QJI0Wxq4rrzNhuxwFcD7
 H2Ycy1ion5jnxJQU2fvi82UlvOnD19JYycf/wDV82GcqeDmDq3qZexwtebOWqTE3hCd0
 aaUiL8KjvE76R1Bc97ykPTLH2X2neZw8xggny2ZTpTN/z9baptBQTia7H/j7AiFebjOG
 a93uZ/e6iC8xSeZj6jXk1m0SOemYssGzd7JiKKjgiCxsEFJnoW9oer8nV/LxxpM2iEBr
 9RwFbmoXDqeKEiSAmWKFST3NJAN9Zf468qNJTmXRLZ1NGuJ1dyF0fgQA39FmGp+zWzbV
 D1hA==
X-Gm-Message-State: AOAM530/VpuIDzNvcX4l4wYePMHhzSvKrPqVclF9xsFfxD4C+DVbpMG7
 Np9LE/Jt2djNevEoI68OJ3U=
X-Google-Smtp-Source: ABdhPJxGcX0xWhhwhpsCj5Z5atC5aB+m9HlEq6omTClNah69eRS9M6t6u3wx34IHAplSx1wQ2NI8aA==
X-Received: by 2002:a5d:47a1:0:b0:204:9a7:22cd with SMTP id
 1-20020a5d47a1000000b0020409a722cdmr3749629wrb.186.1648724464476; 
 Thu, 31 Mar 2022 04:01:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b00205a7d0c6a3sm15295315wrd.69.2022.03.31.04.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 04:01:03 -0700 (PDT)
Message-ID: <01e57ed9-222c-5b74-fe2b-4d22fe802c98@gmail.com>
Date: Thu, 31 Mar 2022 13:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/8] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-5-jason-jh.lin@mediatek.com>
 <a068f2c9b2111f3a7a20da19073ef5fdb7f4a91f.camel@mediatek.com>
 <b9ed8c1511ea26c070dd3fb61f4370e5f858058c.camel@mediatek.com>
 <97bc1358813a2449d6e62653eb7af9906dfb190e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <97bc1358813a2449d6e62653eb7af9906dfb190e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_040106_986604_73BB7CF7 
X-CRM114-Status: GOOD (  20.53  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/03/2022 12:04, Jason-JH Lin wrote:
> Hi CK,
> 
> Thanks for the review.
> 
> On Mon, 2022-03-28 at 13:39 +0800, CK Hu wrote:
>> Hi, Jason:
>>
>> On Mon, 2022-03-28 at 13:03 +0800, Jason-JH Lin wrote:
>>> Hi CK,
>>>
>>> Thanks for the reviews.
>>>
>>> On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
>>>> Add mt8195 vdosys0 clock driver name and routing table to
>>>> the driver data of mtk-mmsys.
>>>>
>>>> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
>>>> Acked-by: AngeloGioacchino Del Regno <
>>>> angelogioacchino.delregno@collabora.com>
>>>> ---
>>>> Impelmentation patch of vdosys1 can be refered to [1]
>>>>
>>>> [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
>>>> ---
>>>>   drivers/soc/mediatek/mt8195-mmsys.h    | 130
>>>> +++++++++++++++++++++++++
>>>>   drivers/soc/mediatek/mtk-mmsys.c       |  11 +++
>>>>   include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
>>>>   3 files changed, 150 insertions(+)
>>>>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
>>>>
>>>> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
>>>> b/drivers/soc/mediatek/mt8195-mmsys.h
>>>> new file mode 100644
>>>> index 000000000000..24a3afe23bc8
>>>> --- /dev/null
>>>> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
>>>> @@ -0,0 +1,130 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
>>>> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
>>>> +
>>>> +#define MT8195_VDO0_OVL_MOUT_EN					
>>>> 0xf14
>>>> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			
>>>> BIT(0)
>>>> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			
>>>> BIT(1)
>>>>   
>>>> Useless, so remove.
>>>>
>>>> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			
>>>> BIT(2)
>>>> Ditto.Useless, so remove.
>>>> Regards,
>>>> CK
>>>
>>> Although these definitions are not used, they represent the
>>> functionality provided by this register.
>>>
>>> I think we can show that we have these capabilities by defining
>>> them.
>>>
>>> Can we keep these definitions?
>>
>> It's better that we know how to use it. Even though the symbol name
>> show some information, but I would like to add it to
>> mmsys_mt8195_routing_table[].
>>
>> Regards,
>> CK
>>
> 
> OK, I think I just remove the useless define.

Actually I would prefer to add it to the routing table to describe all the 
capabilities of the HW.

Is there any technical problem with that?

Regards,
Matthias

> Thanks.
> 
> Regards,
> Jason-JH.Lin
>>>
>>> Regards,
>>> Jason-JH.Lin
>>>
>>>> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			
>>>> BIT(4)
>>>> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			
>>>> BIT(5)
>>>> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			
>>>> BIT(6)
>>>
>>>
>>> [snip]
>>>
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
