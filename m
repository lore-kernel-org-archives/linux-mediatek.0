Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4474DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VerevhicyTrXhGl11ZG7GXZVwICbaYlRcrzaaQEzXjc=; b=binP3cZpef8PTe65dKVm6FOzjQ
	sQtXgW4OkMRoPfz7DDKM76oG1zeSGDWKmgvAvUCbKsDakI1Qk+MssbyDuLNzzq2QytILfZ9ATdOXe
	uZ74ZEBpvVC8IIEb6W2fXqwvGRnYO1Ny114vj+T3LG8ZWVK/51dxWwCZvFnGsC9nOYYM6rYH4aBdV
	6TbtwqGMyOkbITrhxsXB5wtbWu9bhrAKxZzaV2P7bFa20IetNQolKzXGuF/AHv6QdD6cz0AkMFyKj
	gUknFQge9cy986edDTdH9RVsUZ7E+Z9K4lp/HiPnoom1VvpEkVgRr1I2Gi4LW/MnjWlmvBGb6EVCE
	BtwBYV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeeL-009Eek-Qc; Tue, 04 Oct 2022 09:55:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeeA-009Ecx-Hx; Tue, 04 Oct 2022 09:55:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 627AB6600368;
	Tue,  4 Oct 2022 10:55:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664877328;
	bh=b5Y8ElT7N++7SJb1cU4AMqocQ9LRd73zhGkOZ0zrkrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PA2jqHIjLO7dKAOhVLqq624gT5DTAfZhYFeqTKTBHznAEeY/NEh3BhRf3Qht1sFD8
	 Tnv/M0fX5Ajid+VmULG3brJrrdFqhUnCWVzQBjtOtpEvFYuvrkCeFr7mOBXYzuWSpe
	 JcC71+F0+Vmasr3ZJkzlKbNy4QhPuNK34IH4yeul0NDEi6gEmf57huNDiK8A30dBoB
	 /1GoAGurVJCuFqAe/Q0T889c5TRIxORLK5y9djenZyJLEJnScnMs/XCXHOf6TrULLl
	 iJDAvNrHcgiNl129MJehQTH4wBtZFYNuvxT1j64/LHVofWpYyQVALcStB2TuFM2Dqs
	 wmqBbsESJNHsg==
Message-ID: <6047c983-a367-6a45-6849-9a605f70e5c1@collabora.com>
Date: Tue, 4 Oct 2022 11:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8, 3/4] mailbox: mtk-cmdq: add gce ddr enable support
 flow
To: "yongqiang.niu" <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
 <20220930160638.7588-4-yongqiang.niu@mediatek.com>
 <6bcf2f53-ffd1-5159-47a5-b3d7db548158@collabora.com>
 <af7eb0cacf8657937460287dd3ff9091f9a10f30.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <af7eb0cacf8657937460287dd3ff9091f9a10f30.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_025530_760913_CA766D63 
X-CRM114-Status: GOOD (  20.31  )
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

Il 04/10/22 11:39, yongqiang.niu ha scritto:
> On Mon, 2022-10-03 at 16:54 +0200, AngeloGioacchino Del Regno wrote:
>> Il 30/09/22 18:06, Yongqiang Niu ha scritto:
>>> add gce ddr enable control flow when gce suspend/resume
>>>
>>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>>> ---
>>>    drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> index 04eb44d89119..2db82ff838ed 100644
>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> @@ -94,6 +94,18 @@ struct gce_plat {
>>>    	u32 gce_num;
>>>    };
>>>    
>>> +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
>>> +{
>>> +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
>>> +
>>> +	if (enable)
>>> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
>>> GCE_GCTL_VALUE);
>>
>> My only concern here is about the previous value stored in the
>> GCE_GCTL_VALUE
>> register, as you're overwriting it in its entirety with
>> GCE_DDR_EN | GCE_CTRL_BY_SW.
>>
>> Can you guarantee that this register is not pre-initialized with some
>> value,
>> and that these are the only bits to be `1` in this register?
>>
>> Otherwise, you will have to readl and modify the bits instead... by
>> the way,
>> if this register doesn't get any changes during runtime, you may
>> cache it
>> at probe time to avoid reading it for every suspend/resume operation.
>>
>> Regards,
>> Angelo
>>
>>
> 
> 0x48[2:0] means control by software
> 0x48[18:16] means ddr enable
> 0x48[2:0] is pre-condition of 0x48[18:16].
> if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at same
> time.
> and only these bits is useful, other bits is useless bits
> 
> we need set 0x48[18:16] to 0 disable gce access ddr when suspend.
> and  set 0x48[18:16] to 0x7 enable gce access ddr when resume, there
> will be cmdq client send task to process.
> this control flow should controlled in suspend/resume flow.
> 
> 

That's perfect. Thanks for the explanation.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



