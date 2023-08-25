Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EEDC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2L5rO90tAGaO3PAkeUOFFmuIkX5hVpGdQaShN4iiTQ=; b=pjq62M76CecaSVAXb+q3IVgiIz
	m4f+RDvhh/blALNW/AzPmQmvnKFXoz6jMhhw14YIJPJYpSN3z13hiGy9mLgXFri3LmvrSd8ljt/Qu
	/SiBPS42zKQoO77zZvIR9DMPyFT0V23dt8inx3dX9Ud27VcYvrr5nTtmDmiC1zCUx9FHVRn1ajeKF
	bKEueCFrznrEv9v8VckA/BiM4RV2o6eu3waBFXsmuGtm0nviCt1pAj/JlilQtfBhHTLw9N2BB3cio
	rUFfWTtjHAYxBm9NXBGRy9pCiRxf96/MxcGH7m1TpeDQ/Lcs58n929n8sbgl4OyZNOKJ+79YE8dov
	yK6l2+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZS0g-004cWK-17;
	Fri, 25 Aug 2023 08:17:38 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZS0c-004cV3-28;
	Fri, 25 Aug 2023 08:17:36 +0000
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id E4E1620B33;
	Fri, 25 Aug 2023 16:11:49 +0800 (CST)
Message-ID: <c8c059ce-53a9-3627-8984-dff771dff1de@rock-chips.com>
Date: Fri, 25 Aug 2023 16:11:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: shawn.lin@rock-chips.com,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
To: =?UTF-8?B?U2hhcnAgWGlhICjlpI/lroflvawp?= <Sharp.Xia@mediatek.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
References: <20230818022817.3341-1-Sharp.Xia@mediatek.com>
 <CAPDyKFqN0K=2e4rijUBz=9LXVfhEVvDzNgqXTyTgvaPRK-PBNQ@mail.gmail.com>
 <f71672cc699900b57d257c56b325e185f2b6fdd9.camel@mediatek.com>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <f71672cc699900b57d257c56b325e185f2b6fdd9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkdS1ZJHUMdGh9MSR0eGR9VEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a8a2bbfe2152eb6kusne4e1620b33
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M006Hhw5DD0BLz8BLUsSDgsM
	AQswFDBVSlVKTUJJQk5KSkpLTENKVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU5ISEg3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_011734_854794_A5B94D2C 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Sharp,

On 2023/8/25 15:10, Sharp Xia (夏宇彬) wrote:
> On Thu, 2023-08-24 at 12:55 +0200, Ulf Hansson wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On Fri, 18 Aug 2023 at 04:45, <Sharp.Xia@mediatek.com> wrote:
>>>
>>> From: Sharp Xia <Sharp.Xia@mediatek.com>
>>>
>>> MMC does not set readahead and uses the default VM_READAHEAD_PAGES
>>> resulting in slower reading speed.
>>> Use the max_req_size reported by host driver to set the optimal
>>> I/O size to improve performance.
>>
>> This seems reasonable to me. However, it would be nice if you could
>> share some performance numbers too - comparing before and after
>> $subject patch.
>>
>> Kind regards
>> Uffe
>>
>>>
>>> Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
>>> ---
>>>   drivers/mmc/core/queue.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
>>> index b396e3900717..fc83c4917360 100644
>>> --- a/drivers/mmc/core/queue.c
>>> +++ b/drivers/mmc/core/queue.c
>>> @@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue
>> *mq, struct mmc_card *card)
>>>                  blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
>>>          blk_queue_max_hw_sectors(mq->queue,
>>>                  min(host->max_blk_count, host->max_req_size /
>> 512));
>>> +       blk_queue_io_opt(mq->queue, host->max_req_size);
>>>          if (host->can_dma_map_merge)
>>>                  WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
>>>                                                          mmc_dev(hos
>> t)),
>>> --
>>> 2.18.0
>>>
> 
> I test this patch on internal platform(kernel-5.15).

I patched this one and the test shows me a stable 11% performance drop.

Before:
echo 3 > proc/sys/vm/drop_caches && dd if=/data/1GB.img of=/dev/null 

2048000+0 records in
2048000+0 records out
1048576000 bytes (0.9 G) copied, 3.912249 s, 256 M/s

After:
echo 3 > proc/sys/vm/drop_caches && dd if=/data/1GB.img of=/dev/null
2048000+0 records in
2048000+0 records out
1048576000 bytes (0.9 G) copied, 4.436271 s, 225 M/s

> 
> Before:
> console:/ # echo 3 > /proc/sys/vm/drop_caches
> console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
> 4485393+1 records in
> 4485393+1 records out
> 2296521564 bytes (2.1 G) copied, 37.124446 s, 59 M/s
> console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> 128
> 
> After:
> console:/ # echo 3 > /proc/sys/vm/drop_caches
> console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
> 4485393+1 records in
> 4485393+1 records out
> 2296521564 bytes (2.1 G) copied, 28.956049 s, 76 M/s
> console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> 1024
> 

