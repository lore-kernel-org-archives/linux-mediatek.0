Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943CEC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixxc1KBytkayC3ZhnHExX4o3Hidzp3rGnr7PAkReQxY=; b=GsqKD7mwJGdOgNynWPZvBtyw0t
	D69BVlQ1DXAMDBLEAi4o3t0A+HO7g9HJUYB9b0cpw5eO1n8Xqct9LN/h2Uv6pCc/HdfnQjTe2lb2/
	Cuu/IQ4TJwDYd8p3BYuUb7a7GrI8wSAc2C871oi4B5XJLIbChjNhvxF16QWqTBn+gbdokzgZsSGGC
	A6EXBtHa7ZlfhNBiHts4v1GBGrCI1BqH00wxhnxtN9w8mk3HlZ/IXMZ0A2fQO9j0zk1XJAfOPQV/n
	RM221sCWGuyOnc+4OAvY/lZkz57u+pQ0ndUvoksUK5veXzjStErxpKYhsRyRMpZQlYN0ddFb51pN2
	Hfr2n4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14dQ-006U3N-2W;
	Mon, 22 May 2023 12:27:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14dN-006U2e-0y
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 12:27:31 +0000
Received: from [IPV6:2a01:e0a:120:3210:2153:f1ea:39b6:7038] (unknown [IPv6:2a01:e0a:120:3210:2153:f1ea:39b6:7038])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 818CB6606E61
	for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 13:27:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684758445;
	bh=lcbNh7nKR6JyOCtD8i04pg4JevrP5d6thGP3mdruJ8Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MRjk9bqLOo9+xATO4CpYxp3+Ff2JVTMHrPBH8yrL+d6E6Yv3ujUNZRBfeLr7Rj2Wa
	 FarWmiTj6IltQiXyEhlbw8Tx/3CK+5OHAG+U3+c0uX5OcYw+frFn51/D6zHptdJKNw
	 ZxXbm+hEALCCC34hzga9rueSru32RmC26Cuwtbx9lq4CZW9JobRfmzVYdaUVc2n13l
	 prkAxhRDczDHO5Ss2OX4aZeujN1hqhbplofFbeB9IYptkhr9KB7hYnfSPoPC2ThyEu
	 aDdgZHExpNLudtEKP8YrK80AlCoWKRYy9VGof3oXKHX/nhYTDCHQhyR0DQsCUjtV7I
	 BX/EbPYXjsc8w==
Message-ID: <2707694a-685c-7a44-3243-1ed97fb45b65@collabora.com>
Date: Mon, 22 May 2023 14:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Content-Language: en-US
To: linux-mediatek@lists.infradead.org
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-3-benjamin.gaignard@collabora.com>
 <20230321181610.GE20234@pendragon.ideasonboard.com>
 <20230519100453.6o4eriisloiji32g@chromium.org>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20230519100453.6o4eriisloiji32g@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_052729_594926_7B135A58 
X-CRM114-Status: GOOD (  22.09  )
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


Le 19/05/2023 à 12:04, Tomasz Figa a écrit :
> On Tue, Mar 21, 2023 at 08:16:10PM +0200, Laurent Pinchart wrote:
>> Hi Benjamin,
>>
>> Thank you for the patch.
>>
>> On Tue, Mar 21, 2023 at 11:28:49AM +0100, Benjamin Gaignard wrote:
>>> Instead of a static array change bufs to a dynamically allocated array.
>>> This will allow to store more video buffer if needed.
>>> Protect the array with a spinlock.
>> I think I asked in the review of v1 why we couldn't use the kernel
>> IDA/IDR APIs to allocate buffer IDs and register buffers, but I don't
>> think I've received a reply. Wouldn't it be better than rolling out our
>> own mechanism ?
>>
> +1, with a note that [1] suggests that IDR is deprecated and XArray[2]
> should be used instead.
>
> [1] https://docs.kernel.org/core-api/idr.html
> [2] https://docs.kernel.org/core-api/xarray.html
>
> Also from my quick look, XArray may be solving the locking concerns for us
> automatically.

 From documentation Xarray seems to useful for "very large array of pointers"
which is, I think, not our case.

Regards,
Benjamin

>
> Best regards,
> Tomasz
>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   .../media/common/videobuf2/videobuf2-core.c   |  8 +++
>>>   include/media/videobuf2-core.h                | 49 ++++++++++++++++---
>>>   2 files changed, 49 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index 79e90e338846..ae9d72f4d181 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -2452,6 +2452,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
>>>   	mutex_init(&q->mmap_lock);
>>>   	init_waitqueue_head(&q->done_wq);
>>>   
>>> +	q->max_num_bufs = 32;
>>> +	q->bufs = kmalloc_array(q->max_num_bufs, sizeof(*q->bufs), GFP_KERNEL | __GFP_ZERO);
>>> +	if (!q->bufs)
>>> +		return -ENOMEM;
>>> +
>>> +	spin_lock_init(&q->bufs_lock);
>>> +
>>>   	q->memory = VB2_MEMORY_UNKNOWN;
>>>   
>>>   	if (q->buf_struct_size == 0)
>>> @@ -2479,6 +2486,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
>>>   	mutex_lock(&q->mmap_lock);
>>>   	__vb2_queue_free(q, q->num_buffers);
>>>   	mutex_unlock(&q->mmap_lock);
>>> +	kfree(q->bufs);
>>>   }
>>>   EXPORT_SYMBOL_GPL(vb2_core_queue_release);
>>>   
>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>> index 5b1e3d801546..397dbf6e61e1 100644
>>> --- a/include/media/videobuf2-core.h
>>> +++ b/include/media/videobuf2-core.h
>>> @@ -558,6 +558,8 @@ struct vb2_buf_ops {
>>>    * @dma_dir:	DMA mapping direction.
>>>    * @bufs:	videobuf2 buffer structures
>>>    * @num_buffers: number of allocated/used buffers
>>> + * @bufs_lock: lock to protect bufs access
>>> + * @max_num_bufs: max number of buffers storable in bufs
>>>    * @queued_list: list of buffers currently queued from userspace
>>>    * @queued_count: number of buffers queued and ready for streaming.
>>>    * @owned_by_drv_count: number of buffers owned by the driver
>>> @@ -619,8 +621,10 @@ struct vb2_queue {
>>>   	struct mutex			mmap_lock;
>>>   	unsigned int			memory;
>>>   	enum dma_data_direction		dma_dir;
>>> -	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
>>> +	struct vb2_buffer		**bufs;
>>>   	unsigned int			num_buffers;
>>> +	spinlock_t			bufs_lock;
>>> +	size_t				max_num_bufs;
>>>   
>>>   	struct list_head		queued_list;
>>>   	unsigned int			queued_count;
>>> @@ -1239,9 +1243,16 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>>>   static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>>>   						unsigned int index)
>>>   {
>>> -	if (index < q->num_buffers)
>>> -		return q->bufs[index];
>>> -	return NULL;
>>> +	struct vb2_buffer *vb = NULL;
>>> +
>>> +	spin_lock(&q->bufs_lock);
>>> +
>>> +	if (index < q->max_num_bufs)
>>> +		vb = q->bufs[index];
>>> +
>>> +	spin_unlock(&q->bufs_lock);
>>> +
>>> +	return vb;
>>>   }
>>>   
>>>   /**
>>> @@ -1251,12 +1262,30 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>>>    */
>>>   static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>>>   {
>>> -	if (vb->index < VB2_MAX_FRAME) {
>>> +	bool ret = false;
>>> +
>>> +	spin_lock(&q->bufs_lock);
>>> +
>>> +	if (vb->index >= q->max_num_bufs) {
>>> +		struct vb2_buffer **tmp;
>>> +
>>> +		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
>>> +		if (!tmp)
>>> +			goto realloc_failed;
>>> +
>>> +		q->max_num_bufs *= 2;
>>> +		q->bufs = tmp;
>>> +	}
>>> +
>>> +	if (vb->index < q->max_num_bufs) {
>>>   		q->bufs[vb->index] = vb;
>>> -		return true;
>>> +		ret = true;
>>>   	}
>>>   
>>> -	return false;
>>> +realloc_failed:
>>> +	spin_unlock(&q->bufs_lock);
>>> +
>>> +	return ret;
>>>   }
>>>   
>>>   /**
>>> @@ -1266,8 +1295,12 @@ static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *
>>>    */
>>>   static inline void vb2_queue_remove_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>>>   {
>>> -	if (vb->index < VB2_MAX_FRAME)
>>> +	spin_lock(&q->bufs_lock);
>>> +
>>> +	if (vb->index < q->max_num_bufs)
>>>   		q->bufs[vb->index] = NULL;
>>> +
>>> +	spin_unlock(&q->bufs_lock);
>>>   }
>>>   
>>>   /*
>> -- 
>> Regards,
>>
>> Laurent Pinchart

