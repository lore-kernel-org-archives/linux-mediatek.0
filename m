Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B358C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRd1JuCUsRDstQ4XnepFMXgh3KSENhu5rGylzjVtscw=; b=ACiwvcPA3nmu3DSQvSRnvxTIU7
	sijMuFBjPlqgLix6LdTzlP1cynSHTKh0gnvAPjifGVvD4CtJqYdXcvEb8x8deJBC8CPUbHCDMwPge
	6q9FSxs8hevc3UpR0SNxqTBtOh/OeZisCPoOxjRVxVAcCQBQpOz5TlGrXYqqGLhUxg+aPEx8i+k38
	2sjsbk+8Edg0KTDdSzYTpJxIR1/jmhLWxp8MCO/rtQsUUmXOOqT9B3vbys1TqOi6HWf5j7DUH5smx
	xDrC9Znec0AHga7njSo0Cyp3URU/VwDLzXZBg6B6Heabmz2qad3n8YoyOMB+UvPar2dl22r923AbS
	WZnsRxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQolK-00CWny-Re; Wed, 24 Aug 2022 11:41:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQol6-00CWee-NT; Wed, 24 Aug 2022 11:41:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id d5so8625125wms.5;
        Wed, 24 Aug 2022 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=iRd1JuCUsRDstQ4XnepFMXgh3KSENhu5rGylzjVtscw=;
        b=fbFyIyGRBd1TbKvcIv6v1FsjGJ2wjibvgSzJG6K1k1Bm7S38z4wCVF4hZxlmWHl5/b
         fU/dKju0dIcg91N4KMyF0EKx0F2NwNa3szfNglU0u28Alnoke1Csdl2xCimMmVsumlak
         WII3ZniIifAbpLASSbzkFUrjFr042tmOyDqAEu5hydqVPoGHPR4vE5PCfaQPelEWHDnr
         2bEsZKu1PD++Gn7PXqlY/Z72rV9Wns/0QG/m1icgDWM0P4NjmG0CAXEumS3vSZ01oP89
         j6QoKrjWZR0E7AySBWUPZcQCctR9sUJ46+r1YYTnAJXovSwJOk5+W7RHfQP9q3kkSeug
         ZSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iRd1JuCUsRDstQ4XnepFMXgh3KSENhu5rGylzjVtscw=;
        b=l7zgj7bzaFpVYBLBgmF96qYoFHAGVJXTtcyJ7pdtA8jvGlTloDak+zAXb0a7z3kJlw
         pfenmqGN/h1Udl6EBd7t7JCEA0FzEKOVcRNDMZG+bHYWr4Vrx8tcwLhk7LMomsXbozJX
         JoHTM5xBiBxolVw7GbrtbkgfXz8Y1IGK+VIC9PrUbYwIOzjK1W2TSwuP7JU9iwOoJIi2
         rQlOV+42PeReazJYB01eikGnsiv633Co6MbPhLA7jDo2oxFkeuB+pyUywzCecjOLPx8N
         aFL/QL/6J0CHrZf/6dzHGLj7sb4QzIrHYdl40CtptDag1y3ZJkf3lYBxY7bwZktTmkOT
         Wfnw==
X-Gm-Message-State: ACgBeo1zsXr0sfid8ntxJfo2UnYREUIKNDSVG6VHipoaE5lKW5XSaaOF
	pjsJelVMwWGlbfuUuDL+0/M=
X-Google-Smtp-Source: AA6agR5Hk4GDz/jmGGQn2rMBOj9Jqo+Vp8cc07NMZwHew1fytMh4PkKeUfXK6xMdYlVuT6cqYhYf1A==
X-Received: by 2002:a05:600c:3509:b0:3a6:1888:a4bd with SMTP id h9-20020a05600c350900b003a61888a4bdmr5083036wmq.191.1661341275790;
        Wed, 24 Aug 2022 04:41:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p18-20020adfce12000000b002253f18d87fsm13444017wrn.96.2022.08.24.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 04:41:14 -0700 (PDT)
Message-ID: <db271721-163f-e5ec-25d8-e90357104b6c@gmail.com>
Date: Wed, 24 Aug 2022 13:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v26 07/10] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220819061011.7672-1-nancy.lin@mediatek.com>
 <20220819061011.7672-8-nancy.lin@mediatek.com>
 <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
 <140b3cd10317a5db781df180ce4efb697cdd641b.camel@mediatek.com>
 <c7c4e73f-dd03-4c88-f434-2aa3bd681e39@gmail.com>
 <7c59d86501c39fa6e0e182f4a537de814320426e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7c59d86501c39fa6e0e182f4a537de814320426e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_044120_810158_495A67E4 
X-CRM114-Status: GOOD (  30.21  )
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



On 24/08/2022 04:44, Nancy.Lin wrote:
> Hi Matthias,
> 
> Thanks for your comment.
> 
> On Tue, 2022-08-23 at 14:08 +0200, Matthias Brugger wrote:
>>
>> On 23/08/2022 13:30, Nancy.Lin wrote:
>>> Hi Matthias,
>>>
>>> Thanks for the review.
>>>
>>> On Tue, 2022-08-23 at 12:20 +0200, Matthias Brugger wrote:
>>>>
>>>> On 19/08/2022 08:10, Nancy.Lin wrote:
>>>>> Add mmsys for support 64 reset bits. It is a preparation for
>>>>> MT8195
>>>>> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
>>>>>
>>>>> 1. Add the number of reset bits in mmsys private data
>>>>> 2. move the whole "reset register code section" behind the
>>>>> "get mmsys->data" code section for getting the num_resets in
>>>>> mmsys-
>>>>>> data.
>>>>>
>>>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>>> angelogioacchino.delregno@collabora.com>
>>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>>>> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>>>> ---
>>>>>     drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++-
>>>>> ---
>>>>> -------
>>>>>     drivers/soc/mediatek/mtk-mmsys.h |  1 +
>>>>>     2 files changed, 27 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>>>> index 999be064103b..20ae751ad8a7 100644
>>>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>>> @@ -20,6 +20,8 @@
>>>>>     #include "mt8195-mmsys.h"
>>>>>     #include "mt8365-mmsys.h"
>>>>>     
>>>>> +#define MMSYS_SW_RESET_PER_REG 32
>>>>> +
>>>>>     static const struct mtk_mmsys_driver_data
>>>>> mt2701_mmsys_driver_data = {
>>>>>     	.clk_driver = "clk-mt2701-mm",
>>>>>     	.routes = mmsys_default_routing_table,
>>>>> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8173_mmsys_driver_data = {
>>>>>     	.routes = mmsys_default_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>>>>>     	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8173_mmsys_match_data
>>>>> = {
>>>>> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8183_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8183_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>>>>>     	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8183_mmsys_match_data
>>>>> = {
>>>>> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8186_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8186_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>>>>>     	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8186_mmsys_match_data
>>>>> = {
>>>>> @@ -128,6 +133,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8192_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8192_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>>>>>     	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>
>>>> You didn't reply to Nicolas regarding the reset numbers. I
>>>> actually
>>>> agree with
>>>> him that we will need the num_resets declared for all devices.
>>>> Why do
>>>> you think
>>>> this is not the case?
>>>>
>>>> Regards,
>>>> Matthias
>>>>
>>>
>>> Sorry, I lost Nicolas's email.
>>>
>>> I checked with the mmsys git log with reset controller function.
>>>
>>> 1. Enric add mmsys reset controller function in [1]/[2].
>>>      => in mtk_mmsys_reset_update(), all mmsys reset offset is
>>> MMSYS_SW0_RST_B (0x140).
>>>
>>> 2. After Enric's patch, Rex add sw0_rst_offset in mmsys driver data
>>> in
>>> [3].
>>>
>>> So, I think sw0_rst_offset is not zero. Instead of only add
>>> num_resets
>>> but also need to add sw0_rst_offset for all mmsys. What do you
>>> think ?
>>>
>>
>> Good point. It seems we have a bug in the driver. Either all SoCs
>> have the
>> reset, but it's broken since
>> 62dc30150c06 ("soc: mediatek: mmsys: add sw0_rst_offset in mmsys
>> driver data")
>> or we are adding a reset controller independently if the silicon has
>> one, which
>> would be an error in:
>> f27ef2856343 ("soc: mediatek: mmsys: Add reset controller support")
>>
>> We have to find that out.
>>
>> Regards,
>> Matthias
> 
> 
> In [2], I think the first revision of Enric's reset controller is added
> for 8173 and 8183, not for all mmsys device.
>      =>[v3,4/7] arm64: dts: mt8173: Add the mmsys reset bit to reset the
> dsi0
>      =>[v3,5/7] arm64: dts: mt8183: Add the mmsys reset bit to reset the
> dsi0
> 
> In [3], Rex only add sw0_rst_offset in 8173 and 8183 mmsys driver data.
>>
> 
> For other SoCs, like mt2701,mt2712..., these SoCs even don't define
> mmsys hw reset bit[4]. So I think only set the num_resets to 32 or 64
> to those mmsys devices who really need the reset control, others set to
> 0(same as my v26 patch).
> 

Thanks for looking into this, please see my comment further below.


> 
> [4]mt2701-resets.h
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/reset/mt2701-resets.h?id=62dc30150c06774a8122c52aedd0eddaceaf5940
> 
> Regards,
> Nancy
> 
> 
>>> [1]
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=f27ef2856343e2ddc392975d7b15120442e4d7b7__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_fKynszs$
>>>   
>>> [2]
>>>
>>>
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20210825102632.601614-1-enric.balletbo@collabora.com/__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_cH-3nM8$
>>>   
>>> [3]
>>>
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=62dc30150c06774a8122c52aedd0eddaceaf5940__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_VXEsbNa$
>>>   
>>>
>>> Regards,
>>> Nancy
>>>>
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8192_mmsys_match_data
>>>>> = {
>>>>> @@ -288,13 +294,19 @@ static int mtk_mmsys_reset_update(struct
>>>>> reset_controller_dev *rcdev, unsigned l
>>>>>     {
>>>>>     	struct mtk_mmsys *mmsys = container_of(rcdev, struct
>>>>> mtk_mmsys,
>>>>> rcdev);
>>>>>     	unsigned long flags;
>>>>> +	u32 offset;
>>>>> +	u32 reg;
>>>>> +
>>>>> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
>>>>> +	id = id % MMSYS_SW_RESET_PER_REG;
>>>>> +	reg = mmsys->data->sw0_rst_offset + offset;
>>>>>     
>>>>>     	spin_lock_irqsave(&mmsys->lock, flags);
>>>>>     
>>>>>     	if (assert)
>>>>> -		mtk_mmsys_update_bits(mmsys, mmsys->data-
>>>>>> sw0_rst_offset, BIT(id), 0, NULL);
>>>>>
>>>>> +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0,
>>>>> NULL);
>>>>>     	else
>>>>> -		mtk_mmsys_update_bits(mmsys, mmsys->data-
>>>>>> sw0_rst_offset, BIT(id), BIT(id), NULL);
>>>>>
>>>>> +		mtk_mmsys_update_bits(mmsys, reg, BIT(id),
>>>>> BIT(id),
>>>>> NULL);
>>>>>     
>>>>>     	spin_unlock_irqrestore(&mmsys->lock, flags);
>>>>>     
>>>>> @@ -351,18 +363,6 @@ static int mtk_mmsys_probe(struct
>>>>> platform_device *pdev)
>>>>>     		return ret;
>>>>>     	}
>>>>>     
>>>>> -	spin_lock_init(&mmsys->lock);
>>>>> -
>>>>> -	mmsys->rcdev.owner = THIS_MODULE;
>>>>> -	mmsys->rcdev.nr_resets = 32;
>>>>> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>>>>> -	mmsys->rcdev.of_node = pdev->dev.of_node;
>>>>> -	ret = devm_reset_controller_register(&pdev->dev,
>>>>> &mmsys-
>>>>>> rcdev);
>>>>>
>>>>> -	if (ret) {
>>>>> -		dev_err(&pdev->dev, "Couldn't register mmsys
>>>>> reset
>>>>> controller: %d\n", ret);
>>>>> -		return ret;
>>>>> -	}
>>>>> -
>>>>>     	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>>     	if (!res) {
>>>>>     		dev_err(dev, "Couldn't get mmsys resource\n");
>>>>> @@ -384,6 +384,18 @@ static int mtk_mmsys_probe(struct
>>>>> platform_device *pdev)
>>>>>     		mmsys->data = match_data->drv_data[0];
>>>>>     	}
>>>>>     
>>>>> +	spin_lock_init(&mmsys->lock);
>>>>> +
>>>>> +	mmsys->rcdev.owner = THIS_MODULE;
>>>>> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
>>>>> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>>>>> +	mmsys->rcdev.of_node = pdev->dev.of_node;
>>>>> +	ret = devm_reset_controller_register(&pdev->dev,
>>>>> &mmsys-
>>>>>> rcdev);
>>>>>
>>>>> +	if (ret) {
>>>>> +		dev_err(&pdev->dev, "Couldn't register mmsys
>>>>> reset
>>>>> controller: %d\n", ret);
>>>>> +		return ret;
>>>>> +	}
>>>>> +


This code is only relevant if mmsys->data->num_resets > 0. Let's check for that 
before setting up and registering an interrupt controller. What do you think?

Regards,
Matthias

>>>>>     #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>>>>>     	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base,
>>>>> 0);
>>>>>     	if (ret)
>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
>>>>> b/drivers/soc/mediatek/mtk-mmsys.h
>>>>> index f01ba206481d..20a271b80b3b 100644
>>>>> --- a/drivers/soc/mediatek/mtk-mmsys.h
>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.h
>>>>> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>>>>>     	const struct mtk_mmsys_routes *routes;
>>>>>     	const unsigned int num_routes;
>>>>>     	const u16 sw0_rst_offset;
>>>>> +	const u32 num_resets;
>>>>>     };
>>>>>     
>>>>>     struct mtk_mmsys_match_data {
>>>>
>>>>
> 

