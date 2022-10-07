Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80837C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWghyGfI8r0c3097UqN0zerXL+0pRljW8LjOqSXHU6U=; b=CH41NpYu8QRH7RgCWsu578n/CK
	wanA5ZsgZxWWqgMofPzA0cbJSx2bgLLfuMVgwED7YsHkqRVbVbCXFrefMBjD3O1BiIlHSm7LF5ljq
	rihF+2RpGykvArpjHeEOmdjWTnvV5ZxsepAxCh1dmy47TQ62YY9NKglE85Vfbv0s8cSFL+sABZyks
	QBvrghSpgNvjX61yht4TVw19bAMkw00n2MRFqcxyHwb4YIqZXcqYxvgc4V1Qk5E8wS3cjN/KQG5WN
	mSqvB8sMFh0SskkZ7DbnaY7IiD47fcpdX6AJ2BYaspuDD9ptcKkMe7DOkWAK5srvjEijsmXbqHNSn
	oRIsEsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjAp-008AyC-RT; Fri, 07 Oct 2022 08:57:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjAe-008Arb-T1; Fri, 07 Oct 2022 08:57:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A9CC6602329;
	Fri,  7 Oct 2022 09:57:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665133047;
	bh=DQBkdVd/FiyJTSnISGC19lKx+6Sgmh+oa4zSGkVpqG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcR0TT2y8evoR2oLeK1bAVfv/ZpYL8gQrpcURHLomLY4wcuZEoRM4T5LsUbYHpkG9
	 KPdFI3XZG8n/IWeAweqgsyQjoZY0KYIn/yGd4inEOHDXu2kOKFraXcwnKBHNTKZz7R
	 Z5XNCrxjzZ19fYEpMr7hAuOShI33dQEVoiIkRdBCaZ3wtpQP4KyVxtZQj8Vt9TVYXC
	 mqQyQE/eEifafc+jyCCMHViBsVujEPu5Mxc8ZsDMZC0X0JXU2PoIZ/bn/O6v1vCnHJ
	 v6KMmKz+Umvtbe8Phw/Winzs2kNWHiQAOfzRp3k3YEjlm+1fzuIbazr1Ik5aYB15Yn
	 VKQncYwdhs9YA==
Message-ID: <603804c4-770e-80ed-3133-94b04be98240@collabora.com>
Date: Fri, 7 Oct 2022 10:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9, 2/4] mailbox: mtk-cmdq: add gce software ddr enable
 private data
Content-Language: en-US
To: "yongqiang.niu" <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
 <20221006043456.8754-3-yongqiang.niu@mediatek.com>
 <ded0300b-5b54-48eb-038e-102ae91573c5@collabora.com>
 <a4b0e7744f6934dee8f0247492cc399bbf3973bf.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a4b0e7744f6934dee8f0247492cc399bbf3973bf.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_015729_096441_98A8CD00 
X-CRM114-Status: GOOD (  20.07  )
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

Il 07/10/22 03:51, yongqiang.niu ha scritto:
> On Thu, 2022-10-06 at 11:29 +0200, AngeloGioacchino Del Regno wrote:
>> Il 06/10/22 06:34, Yongqiang Niu ha scritto:
>>> if gce work control by software, we need set software enable
>>> for MT8186 Soc
>>>
>>> there is a handshake flow between gce and ddr hardware,
>>> if not set ddr enable flag of gce, ddr will fall into idle
>>> mode, then gce instructions will not process done.
>>> we need set this flag of gce to tell ddr when gce is idle or busy
>>> controlled by software flow.
>>>
>>> 0x48[2:0] means control by software
>>> 0x48[18:16] means ddr enable
>>> 0x48[2:0] is pre-condition of 0x48[18:16].
>>> if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at
>>> same
>>> time.
>>> and only these bits is useful, other bits is useless bits
>>>
>>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>>> ---
>>>    drivers/mailbox/mtk-cmdq-mailbox.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> index c3cb24f51699..04eb44d89119 100644
>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> @@ -39,6 +39,7 @@
>>>    
>>>    #define GCE_GCTL_VALUE			0x48
>>>    #define GCE_CTRL_BY_SW				GENMASK(2, 0)
>>> +#define GCE_DDR_EN				GENMASK(18, 16)
>>>    
>>>    #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
>>>    #define CMDQ_THR_ENABLED		0x1
>>> @@ -81,6 +82,7 @@ struct cmdq {
>>>    	bool			suspended;
>>>    	u8			shift_pa;
>>>    	bool			control_by_sw;
>>> +	bool			sw_ddr_en;
>>>    	u32			gce_num;
>>>    };
>>>    
>>> @@ -88,6 +90,7 @@ struct gce_plat {
>>>    	u32 thread_nr;
>>>    	u8 shift;
>>>    	bool control_by_sw;
>>> +	bool sw_ddr_en;
>>>    	u32 gce_num;
>>>    };
>>>    
>>> @@ -132,6 +135,9 @@ static void cmdq_init(struct cmdq *cmdq)
>>>    	if (cmdq->control_by_sw)
>>>    		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
>>>    
>>> +	if (cmdq->sw_ddr_en)
>>> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
>>> GCE_GCTL_VALUE);
>>> +
>>
>> No. That's redundant.
>> Here's a better way:
>>
>> 	u32 gctl_regval = 0;
>>
>> 	if (cmdq->control_by_sw)
>> 		gctl_regval = GCE_CTRL_BY_SW;
>> 	if (cmdq->sw_ddr_en)
>> 		gctl_regval |= GCE_DDR_EN;
>>
>> 	if (val)
>> 		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
>>
>> Regards,
>> Angelo
> 
> thanks very much for your advise.
> shall i separate this into two patches?
> 1st one is
> 	u32 gctl_regval = 0;
> 	if (cmdq->control_by_sw)
>> 		gctl_regval = GCE_CTRL_BY_SW;
>> 	if (val)
>> 		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
> 
> 
> 
> 2nd just add this
> 	if (cmdq->sw_ddr_en)
>> 		gctl_regval |= GCE_DDR_EN;
> 
> or one patch is ok?
> 

One patch is ok.

Thanks,
Angelo

>>
>>>    	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base +
>>> CMDQ_THR_SLOT_CYCLES);
>>>    	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
>>>    		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
>>> @@ -545,6 +551,7 @@ static int cmdq_probe(struct platform_device
>>> *pdev)
>>>    	cmdq->thread_nr = plat_data->thread_nr;
>>>    	cmdq->shift_pa = plat_data->shift;
>>>    	cmdq->control_by_sw = plat_data->control_by_sw;
>>> +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
>>>    	cmdq->gce_num = plat_data->gce_num;
>>>    	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>>>    	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler,
>>> IRQF_SHARED,
>>
>>
>>
> 


