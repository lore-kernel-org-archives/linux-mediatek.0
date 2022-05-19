Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4o93oNF6rh6MLAuTvP3/WWD6OpEv34CifE85YiU6zg=; b=XKmqPjLBU+Ia83yR14G3Jg8uX4
	2Wre+8CFlRIDLZzZlFafwoEJHInahszOTFcKuy04wlW3cgx+i6q57yUsxZiQiMCeTKCB7DrJqkryR
	bIzyK4X16a7mfMy0Cv38ifz5sJDQmjQT13EmblM+au/+fqBgH8ly+4rzQ+DJPd/+ph6hvskbTrP4Y
	+/Y1fIwxJAt2UcZddP5eorczXOkKB2PtMjNF6OQujUNkXFupTQ7gipbZI7jTme+QwcEQZGxHmO2Wi
	u9621Xyta9OyC9myrKuQFuv5QByuEJkTyxA9eGd/bEORhh9nAfHys+esfDsoUsxjv0Oz+5hhxxzCC
	YHwKcdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrVLM-004c8W-Hk; Thu, 19 May 2022 01:52:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrVLB-004c5g-OA; Thu, 19 May 2022 01:52:39 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L3XsR0bBgzhZ9w;
 Thu, 19 May 2022 09:51:55 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 09:52:31 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 09:52:30 +0800
Subject: Re: [PATCH -next] net: wwan: t7xx: use GFP_ATOMIC under spin lock in
 t7xx_cldma_gpd_set_next_ptr()
To: Loic Poulain <loic.poulain@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
 <haijun.liu@mediatek.com>, <chandrashekar.devegowda@intel.com>,
 <ricardo.martinez@linux.intel.com>, <davem@davemloft.net>, <kuba@kernel.org>
References: <20220518090738.2694556-1-yangyingliang@huawei.com>
 <CAMZdPi9uvh4E70-AXpGrdzkgh35mfWQbhL8Kxw_o9_DsfL2gbw@mail.gmail.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <53b384f6-5507-b767-f64a-574cfd511e13@huawei.com>
Date: Thu, 19 May 2022 09:52:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi9uvh4E70-AXpGrdzkgh35mfWQbhL8Kxw_o9_DsfL2gbw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_185238_176920_9DB12DF7 
X-CRM114-Status: GOOD (  14.57  )
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

Hi,

On 2022/5/18 17:13, Loic Poulain wrote:
> Hi Yang,
>
> On Wed, 18 May 2022 at 10:57, Yang Yingliang <yangyingliang@huawei.com> wrote:
>> Sometimes t7xx_cldma_gpd_set_next_ptr() is called under spin lock,
>> so add a parameter in t7xx_cldma_gpd_set_next_ptr() to make if it
>> use GFP_ATOMIC flag.
>>
>> Fixes: 39d439047f1d ("net: wwan: t7xx: Add control DMA interface")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/net/wwan/t7xx/t7xx_hif_cldma.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
>> index 0c52801ed0de..1fa9bb763831 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
>> +++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
>> @@ -91,9 +91,12 @@ static void t7xx_cldma_gpd_set_next_ptr(struct cldma_gpd *gpd, dma_addr_t next_p
>>   }
>>
>>   static int t7xx_cldma_alloc_and_map_skb(struct cldma_ctrl *md_ctrl, struct cldma_request *req,
>> -                                       size_t size)
>> +                                       size_t size, bool is_atomic)
> Would be simpler to directly pass the gfp_mask as a parameter.
Yes, I will send a v2 with this change later.

Thanks,
Yang
>
>
>>   {
>> -       req->skb = __dev_alloc_skb(size, GFP_KERNEL);
>> +       if (is_atomic)
>> +               req->skb = __dev_alloc_skb(size, GFP_ATOMIC);
>> +       else
>> +               req->skb = __dev_alloc_skb(size, GFP_KERNEL);
>>          if (!req->skb)
>>                  return -ENOMEM;
>>
>> @@ -174,7 +177,7 @@ static int t7xx_cldma_gpd_rx_from_q(struct cldma_queue *queue, int budget, bool
>>                  spin_unlock_irqrestore(&queue->ring_lock, flags);
>>                  req = queue->rx_refill;
>>
>> -               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size);
>> +               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size, false);
>>                  if (ret)
>>                          return ret;
>>
>> @@ -402,7 +405,7 @@ static struct cldma_request *t7xx_alloc_rx_request(struct cldma_ctrl *md_ctrl, s
>>          if (!req->gpd)
>>                  goto err_free_req;
>>
>> -       val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size);
>> +       val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size, false);
>>          if (val)
>>                  goto err_free_pool;
>>
>> @@ -801,7 +804,7 @@ static int t7xx_cldma_clear_rxq(struct cldma_ctrl *md_ctrl, int qnum)
>>                  if (req->skb)
>>                          continue;
>>
>> -               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size);
>> +               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size, true);
>>                  if (ret)
>>                          break;
>>
>> --
>> 2.25.1
>>
> .

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
