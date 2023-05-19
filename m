Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A314C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xTS/+ikRkp6T2vKwWJPFVIVMKM4hxn92K6n0PRCytk=; b=b9X0Yj51MQ4/zVHO927/KLDqqY
	IAk1GTSdZ07WEAzDWkxeSyuQUKJ0/eT534WSKRRKQ1fFpfNZB1WR/Qav7UKLpv3AYK54/YjwQ9ujN
	RQP2J2pUt28grrlNn90Dhz7CFFQ3WFkmyZsldEMU4jqsLqQ7U2J83veealhT0LcEvCQFnxqZylEvJ
	yEF17ASwgNoj+JZEQeiHLm4a4w+3Duqiliqd3M7rQek8+WWJvuz2ujVgqJCrRZbSmxknvnNfDM+0m
	2t8/Ju67ECdws4ooXIXkQYJgQW8x3hDZhreCuOqJI62A5J+8Bjc9Bl+Kd99ok4udwQBPKiCXVBLIO
	8/5r7dzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwyx-00Fq99-13;
	Fri, 19 May 2023 10:05:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwyt-00Fq76-3A
	for linux-mediatek@lists.infradead.org;
	Fri, 19 May 2023 10:05:05 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d11974b45so1379837b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 May 2023 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684490699; x=1687082699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xTS/+ikRkp6T2vKwWJPFVIVMKM4hxn92K6n0PRCytk=;
        b=kknctPkpZrVOtKToPJl+ulrI88aXtNavFYH10YxLF2I4G2cDXB2nOfkmYVnypLwYOr
         97CSCYF/uB4e6h6q791T5909bZmXXMvpBslfC1NgSzpFMpUcERN+W6b7wZnnsDCim1LE
         CU2uKf5iyeHjv4M2QrZ1p3QERw1tEVISL+9CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490699; x=1687082699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xTS/+ikRkp6T2vKwWJPFVIVMKM4hxn92K6n0PRCytk=;
        b=LizCX2fD7rwKJ+pppzXmn33ozsMTqz+6EJnTl6W9ECA8G7x2c1pmBkxhsDPZqGvmf1
         N+ZHvelVa9gz2P1XVH7bia2TxJkQN7ZURZ8Jl1PsEGgaaLSgjE6j69T19mmXx7Wao9lT
         tK8AnFX1+oIv5DX5xOv788T/OcDKZjhdqpnRm1shSdUax8ob/kAWP2b+oYMUmNkJIzRO
         ls4aJvR0YWlKYxit4U2zIgIAD0R5bzXaJI5UgGYuuvgwh9vdLMN/P3362v+lAtRHjAt2
         epu9xVto2/zejGfRNJ3NZHCK0dV7dDUSTuOzPEeOMyBQTgZozY3Xe04YHe1p2cZouuhi
         9dUQ==
X-Gm-Message-State: AC+VfDzK2hZy5ET2jkt7vMNxyoPiu56/JDdsAlI1efXmq4RShqnwAp3F
	8yBkibLMXsl98DfQydFWThTb+g==
X-Google-Smtp-Source: ACHHUZ5tvd92H6EeKlIkOXPkMDBslOJK20p/RKYh/cqtFgsiyWV7f/sG/EKWlt6mVLUiEs9OHaRAHg==
X-Received: by 2002:a05:6a21:9706:b0:104:387a:bbaf with SMTP id ub6-20020a056a21970600b00104387abbafmr1046602pzb.53.1684490699233;
        Fri, 19 May 2023 03:04:59 -0700 (PDT)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 11-20020aa7910b000000b006372791d708sm2678533pfh.104.2023.05.19.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:04:58 -0700 (PDT)
Date: Fri, 19 May 2023 10:04:53 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
	shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl, jernel@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Message-ID: <20230519100453.6o4eriisloiji32g@chromium.org>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-3-benjamin.gaignard@collabora.com>
 <20230321181610.GE20234@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321181610.GE20234@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_030504_040043_FEEAF0BC 
X-CRM114-Status: GOOD (  30.63  )
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

On Tue, Mar 21, 2023 at 08:16:10PM +0200, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Tue, Mar 21, 2023 at 11:28:49AM +0100, Benjamin Gaignard wrote:
> > Instead of a static array change bufs to a dynamically allocated array.
> > This will allow to store more video buffer if needed.
> > Protect the array with a spinlock.
> 
> I think I asked in the review of v1 why we couldn't use the kernel
> IDA/IDR APIs to allocate buffer IDs and register buffers, but I don't
> think I've received a reply. Wouldn't it be better than rolling out our
> own mechanism ?
> 

+1, with a note that [1] suggests that IDR is deprecated and XArray[2]
should be used instead.

[1] https://docs.kernel.org/core-api/idr.html
[2] https://docs.kernel.org/core-api/xarray.html

Also from my quick look, XArray may be solving the locking concerns for us
automatically.

Best regards,
Tomasz

> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   |  8 +++
> >  include/media/videobuf2-core.h                | 49 ++++++++++++++++---
> >  2 files changed, 49 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index 79e90e338846..ae9d72f4d181 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -2452,6 +2452,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
> >  	mutex_init(&q->mmap_lock);
> >  	init_waitqueue_head(&q->done_wq);
> >  
> > +	q->max_num_bufs = 32;
> > +	q->bufs = kmalloc_array(q->max_num_bufs, sizeof(*q->bufs), GFP_KERNEL | __GFP_ZERO);
> > +	if (!q->bufs)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&q->bufs_lock);
> > +
> >  	q->memory = VB2_MEMORY_UNKNOWN;
> >  
> >  	if (q->buf_struct_size == 0)
> > @@ -2479,6 +2486,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
> >  	mutex_lock(&q->mmap_lock);
> >  	__vb2_queue_free(q, q->num_buffers);
> >  	mutex_unlock(&q->mmap_lock);
> > +	kfree(q->bufs);
> >  }
> >  EXPORT_SYMBOL_GPL(vb2_core_queue_release);
> >  
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 5b1e3d801546..397dbf6e61e1 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -558,6 +558,8 @@ struct vb2_buf_ops {
> >   * @dma_dir:	DMA mapping direction.
> >   * @bufs:	videobuf2 buffer structures
> >   * @num_buffers: number of allocated/used buffers
> > + * @bufs_lock: lock to protect bufs access
> > + * @max_num_bufs: max number of buffers storable in bufs
> >   * @queued_list: list of buffers currently queued from userspace
> >   * @queued_count: number of buffers queued and ready for streaming.
> >   * @owned_by_drv_count: number of buffers owned by the driver
> > @@ -619,8 +621,10 @@ struct vb2_queue {
> >  	struct mutex			mmap_lock;
> >  	unsigned int			memory;
> >  	enum dma_data_direction		dma_dir;
> > -	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
> > +	struct vb2_buffer		**bufs;
> >  	unsigned int			num_buffers;
> > +	spinlock_t			bufs_lock;
> > +	size_t				max_num_bufs;
> >  
> >  	struct list_head		queued_list;
> >  	unsigned int			queued_count;
> > @@ -1239,9 +1243,16 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
> >  static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >  						unsigned int index)
> >  {
> > -	if (index < q->num_buffers)
> > -		return q->bufs[index];
> > -	return NULL;
> > +	struct vb2_buffer *vb = NULL;
> > +
> > +	spin_lock(&q->bufs_lock);
> > +
> > +	if (index < q->max_num_bufs)
> > +		vb = q->bufs[index];
> > +
> > +	spin_unlock(&q->bufs_lock);
> > +
> > +	return vb;
> >  }
> >  
> >  /**
> > @@ -1251,12 +1262,30 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >   */
> >  static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
> >  {
> > -	if (vb->index < VB2_MAX_FRAME) {
> > +	bool ret = false;
> > +
> > +	spin_lock(&q->bufs_lock);
> > +
> > +	if (vb->index >= q->max_num_bufs) {
> > +		struct vb2_buffer **tmp;
> > +
> > +		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
> > +		if (!tmp)
> > +			goto realloc_failed;
> > +
> > +		q->max_num_bufs *= 2;
> > +		q->bufs = tmp;
> > +	}
> > +
> > +	if (vb->index < q->max_num_bufs) {
> >  		q->bufs[vb->index] = vb;
> > -		return true;
> > +		ret = true;
> >  	}
> >  
> > -	return false;
> > +realloc_failed:
> > +	spin_unlock(&q->bufs_lock);
> > +
> > +	return ret;
> >  }
> >  
> >  /**
> > @@ -1266,8 +1295,12 @@ static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *
> >   */
> >  static inline void vb2_queue_remove_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
> >  {
> > -	if (vb->index < VB2_MAX_FRAME)
> > +	spin_lock(&q->bufs_lock);
> > +
> > +	if (vb->index < q->max_num_bufs)
> >  		q->bufs[vb->index] = NULL;
> > +
> > +	spin_unlock(&q->bufs_lock);
> >  }
> >  
> >  /*
> 
> -- 
> Regards,
> 
> Laurent Pinchart

