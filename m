Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752C0C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4AqjjSNcKzGBB8JiAVqYiakhH0XyrfjAOH1Lv1R4hQ=; b=5G5MbAUQaYHTrLPh6nqi/bpEvW
	ULOO+p3u3XjEP0J/x6CKjZQoXvYnAVcIECKbsTL1nonNdHfeQCjPenT54JbYiNN8VvQxya69b/CRF
	s+8JDMSmd4jsXtdFTkGMwAYkMZ0ehvjgTkrq0bNVBE4N6zCtBjghh4IxZCDpDK/SOcBw9s1bcRFMA
	+cYXMU6E5ncSc7F8FmkPKR2wmrVdEbHVmFIhIeMQs4I/hSTsIn2bbiDOZHwGhz5you3YsKlbxnOMX
	djL75kMr6pTIt1uufPWjnou1LOxPQ5OqbdYwhhH60YDVaKGL4CIOfGmgz7iSnIyrjeYYeBbFb6VfQ
	pQaMZmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rat4x-00000001RAG-2Jpj;
	Fri, 16 Feb 2024 07:56:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rat4t-00000001R7L-37Jf;
	Fri, 16 Feb 2024 07:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708070169;
	bh=esGmr0k1jtvNLG9Q6hd/tXlibBc2OxKajxHeYodi/60=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rPQdtOrNIgpCYN8og+J+TO6wRgRZnW2+Q5NvL7qnF8eshvN+FXn4MFQ03or6ST+eH
	 OafOSvBUCqIw44Ul7/jMi6838CuvOG9TWfmidbqtZrFZknEoWzR0yjnOZlqDFJ/7rC
	 KUSFKBdXLngEVxbICU3b/s5B+7tQAUshLMSVxajK2HQ2Z/jCtKwdQPKAEO5FB59yTY
	 PsylJ+E8JqbDltmobddu32g2mKs5w5f0mARbc14ukrJboyiGSDzZi7byOygtgcCWvZ
	 vq7GxOp638lurEzmRirAqhgBnYHE+cNQr9j/657RIZ1J7JZas9LXv6dU+SBgkIzKmz
	 61NuX8oZWR27g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 087483780A0B;
	Fri, 16 Feb 2024 07:56:08 +0000 (UTC)
Message-ID: <b3c384b6-7c8f-4428-a62e-1036b78217cf@collabora.com>
Date: Fri, 16 Feb 2024 08:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: platform: mtk-mdp3: drop calling
 cmdq_pkt_finalize()
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-7-chunkuang.hu@kernel.org>
 <4dcfaf49-aaac-4980-a149-02fec3109f31@collabora.com>
 <af4bfdd52f0ca022730aedcb456bb1a0b105ae3e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <af4bfdd52f0ca022730aedcb456bb1a0b105ae3e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_235612_101313_CE763941 
X-CRM114-Status: GOOD (  17.42  )
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

Il 16/02/24 07:20, Moudy Ho (何宗原) ha scritto:
> On Thu, 2024-02-15 at 11:29 +0100, AngeloGioacchino Del Regno wrote:
>> Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
>>> Because client driver has the information of struct cmdq_client, so
>>> it's not necessary to store struct cmdq_client in struct cmdq_pkt.
>>> cmdq_pkt_finalize() use struct cmdq_client in struct cmdq_pkt, so
>>> it's
>>> going to be abandoned. Therefore, use cmdq_pkt_eoc() and
>>> cmdq_pkt_nop()
>>> to replace cmdq_pkt_finalize().
>>
>> No, it's not because cmdq_pkt_finalize() has cmdq_client, but because
>> we want
>> finer grain control over the CMDQ packets, as not all cases require
>> the NOP
>> packet to be appended after EOC.
>>
>> Besides, honestly I'm not even sure if the NOP is always required in
>> MDP3, so...
>>
>> ...Moudy, you know the MDP3 way better than anyone else - can you
>> please
>> check if NOP is actually needed here?
>>
>> Thanks!
>> Angelo
>>
> 
> Hi Angelo,
> 
> After confirming with the hardware designer and performing the video
> playback test, it was discovered that MDP3 is capable of excluding the
> NOP(jump) instruction.
> 

Thank you for this extremely fast clarification.

Cheers,
Angelo

> Sincerely,
> Moudy
>>>
>>> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>    drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
>>>    drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
>>>    drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
>>>    3 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> index 6adac857a477..a420d492d879 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> @@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct
>>> mdp_cmdq_param *param)
>>>    		dev_err(dev, "mdp_path_config error\n");
>>>    		goto err_free_path;
>>>    	}
>>> -	cmdq_pkt_finalize(&cmd->pkt);
>>> +	cmdq_pkt_eoc(&cmd->pkt);
>>> +	cmdq_pkt_nop(&cmd->pkt, mdp->cmdq_shift_pa);
>>>    
>>>    	for (i = 0; i < num_comp; i++)
>>>    		memcpy(&comps[i], path->comps[i].comp,
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>>> index 94f4ed78523b..2214744c937c 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>>> @@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device
>>> *pdev)
>>>    		goto err_put_scp;
>>>    	}
>>>    
>>> +	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
>>> +
>>>    	init_waitqueue_head(&mdp->callback_wq);
>>>    	ida_init(&mdp->mdp_ida);
>>>    	platform_set_drvdata(pdev, mdp);
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
>>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
>>> index 7e21d226ceb8..ed61e0bb69ee 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
>>> @@ -83,6 +83,7 @@ struct mdp_dev {
>>>    	u32					id_count;
>>>    	struct ida				mdp_ida;
>>>    	struct cmdq_client			*cmdq_clt;
>>> +	u8					cmdq_shift_pa;
>>>    	wait_queue_head_t			callback_wq;
>>>    
>>>    	struct v4l2_device			v4l2_dev;
>>
>>




