Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EDECA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IOXkQrWidiaV0lRtI7Qoj0/kWQo8CSo3Nd5Z45RtaQ=; b=YOayJDgWoQCaCdk6M/1fOTMLsw
	7QbIS1Z3EqUqPQwZmWoWv/56ND5w6n38kYLMxgwNEGFuPGBhbiPxPPV+TdUih+npxRko7DU7xIgqi
	rMd75/vQYsfqamvSDkWDG5y61TnlR0LmjgoIoFvWA3epBBCC17d532A7UtjmXhkh/UDrIj92F1q4S
	C1zC1pIQRSBWLPSUaR4rPrrZjJH7K6jS35DdycdSqoVlyRfdDdS4ym1T0MP7+p6lGAqjExNyY5A3q
	bIpi6YtX4LecH2xrNUr5CVGKgP8/7yU7OL/o61beguuJ1jaxSINlpzKS0Hkfi1uftxHaeFNNSoJej
	3Nnhup1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3S0-00HTg1-2D;
	Fri, 01 Sep 2023 12:40:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Kg-00HR1G-2o
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Sep 2023 12:33:05 +0000
Received: from [IPV6:2a01:e0a:120:3210:4d01:31d2:de6b:d217] (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B08466072B1
	for <linux-mediatek@lists.infradead.org>; Fri,  1 Sep 2023 13:33:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693571581;
	bh=nFeURtpEUwOUaJ+ZnLx0/XPrWWWL+hBD60JB/+lQFj4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QDukkDbSJIQPe283sF7UGLALsOyKwxO/bqcFFmaUFIlHAt5lKW92fLYHvjfmz1Jr2
	 4uMrKipsG0S1vozDrLDRNfbzsCk0J+vBdKzL0Gq37nBd7sTpAuFALWmyH+xWxyRKT3
	 RH2Kasy7miGXGK50QRpFM+exuAvtHoCYjfPzybt2BKtolezmlA6oY45MHdtwG1FD1F
	 K4R/U+z/HobQHocuBDB4iNSWhSyUlQ08T4ryLC51+7Nu7gjhzR055kY41wWCMThlIV
	 H6gcEd0tkd0RRYCcC4CvtQk/kPP5256IR2nF+vA9hF7AFf40v2lQsDcChj7ww919kq
	 pv67HNGRVyjsA==
Message-ID: <d2c2d925-dec8-681d-b732-257b3e235f5b@collabora.com>
Date: Fri, 1 Sep 2023 14:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 09/10] media: v4l2: Add DELETE_BUFS ioctl
Content-Language: en-US
To: linux-mediatek@lists.infradead.org
References: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
 <20230824092133.39510-10-benjamin.gaignard@collabora.com>
 <6530a980-a95c-7c52-f1d0-3949a9f34335@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <6530a980-a95c-7c52-f1d0-3949a9f34335@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_053303_166843_7A0090A0 
X-CRM114-Status: GOOD (  37.71  )
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


Le 30/08/2023 à 15:45, Hans Verkuil a écrit :
> On 24/08/2023 11:21, Benjamin Gaignard wrote:
>> VIDIOC_DELETE_BUFS ioctl allows to delete buffers from a queue.
>> The number of buffers to delete in given by count field of
>> struct v4l2_delete_buffers and the range start at the index
>> specified in the same structure.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../userspace-api/media/v4l/user-func.rst     |  1 +
>>   .../media/v4l/vidioc-delete-bufs.rst          | 73 +++++++++++++++++++
>>   .../media/common/videobuf2/videobuf2-core.c   | 34 +++++++++
>>   .../media/common/videobuf2/videobuf2-v4l2.c   | 16 ++++
>>   drivers/media/v4l2-core/v4l2-dev.c            |  1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          | 17 +++++
>>   include/media/v4l2-ioctl.h                    |  4 +
>>   include/media/videobuf2-core.h                |  9 +++
>>   include/media/videobuf2-v4l2.h                | 11 +++
>>   include/uapi/linux/videodev2.h                | 17 +++++
>>   10 files changed, 183 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
>> index 15ff0bf7bbe6..3fd567695477 100644
>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
>> @@ -17,6 +17,7 @@ Function Reference
>>       vidioc-dbg-g-chip-info
>>       vidioc-dbg-g-register
>>       vidioc-decoder-cmd
>> +    vidioc-delete-bufs
>>       vidioc-dqevent
>>       vidioc-dv-timings-cap
>>       vidioc-encoder-cmd
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>> new file mode 100644
>> index 000000000000..a55fe6331fc8
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>> @@ -0,0 +1,73 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +.. c:namespace:: V4L
>> +
>> +.. _VIDIOC_DELETE_BUFS:
>> +
>> +************************
>> +ioctl VIDIOC_DELETE_BUFS
>> +************************
>> +
>> +Name
>> +====
>> +
>> +VIDIOC_DELETE_BUFS - Deletes buffers from a queue
>> +
>> +Synopsis
>> +========
>> +
>> +.. c:macro:: VIDIOC_DELETE_BUFs
>> +
>> +``int ioctl(int fd, VIDIOC_DELETE_BUFs, struct v4l2_delete_buffers *argp)``
>> +
>> +Arguments
>> +=========
>> +
>> +``fd``
>> +    File descriptor returned by :c:func:`open()`.
>> +
>> +``argp``
>> +    Pointer to struct :c:type:`v4l2_delete_buffers`.
>> +
>> +Description
>> +===========
>> +
>> +Applications can optionally call the :ref:`VIDIOC_DELETE_BUFS` ioctl to
>> +delete buffers from a queue.
>> +
>> +.. c:type:: v4l2_delete_buffers
>> +
>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
>> +
>> +.. flat-table:: struct v4l2_delete_buffers
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u32
>> +      - ``index``
>> +      - The starting buffer index to delete.
>> +    * - __u32
>> +      - ``count``
>> +      - The number of buffers to be deleted.
>> +    * - __u32
>> +      - ``type``
>> +      - Type of the stream or buffers, this is the same as the struct
>> +	:c:type:`v4l2_format` ``type`` field. See
>> +	:c:type:`v4l2_buf_type` for valid values.
>> +    * - __u32
>> +      - ``reserved``\ [13]
>> +      - A place holder for future extensions. Drivers and applications
>> +	must set the array to zero.
>> +
>> +Return Value
>> +============
>> +
>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>> +appropriately. The generic error codes are described at the
>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>> +
>> +EBUSY
>> +    File I/O is in progress.
>> +
>> +EINVAL
>> +    The buffer ``index`` doesn't exist in the queue.
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 70e36389b704..3d915b4c33b2 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -1634,6 +1634,40 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>>   }
>>   EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
>>   
>> +int vb2_core_delete_buf(struct vb2_queue *q, unsigned int index)
> Same as the other core functions: rather than an index, pass a valid
> vb2_buffer pointer. Let the caller do the validation.
>
> My rule of thumb is that the core code should only need to call
> vb2_get_buffer() if it is walking over all buffers (i.e. in a
> for-loop). For functions like this it should get the vb pointer
> directly rather than having to look it up, since the caller
> should have done that already.
>
>> +{
>> +	struct vb2_buffer *vb;
>> +
>> +	vb = vb2_get_buffer(q, index);
>> +	if (!vb) {
>> +		dprintk(q, 1, "invalid buffer index %d\n", index);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
>> +		dprintk(q, 1, "can't delete non dequeued buffer index %d\n", index);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (vb->planes[0].mem_priv)
>> +		call_void_vb_qop(vb, buf_cleanup, vb);
>> +
>> +	/* Free MMAP buffers or release USERPTR buffers */
>> +	if (q->memory == VB2_MEMORY_MMAP)
>> +		__vb2_buf_mem_free(vb);
>> +	else if (q->memory == VB2_MEMORY_DMABUF)
>> +		__vb2_buf_dmabuf_put(vb);
>> +	else
>> +		__vb2_buf_userptr_put(vb);
>> +
>> +	vb2_queue_remove_buffer(q, vb);
> When freeing all buffers (REQBUFS with count=0) the q->mmap_lock is taken.
> I wonder if the same has to happen here. You don't want userspace to call mmap
> while deleting a buffer.
>
> I also think this should be refactored since __vb2_queue_free/__vb2_free_mem
> need to do the same thing.
>
>> +	kfree(vb);
>> +
>> +	dprintk(q, 2, "buffer %d deleted\n", index);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(vb2_core_delete_buf);
>> +
>>   /*
>>    * vb2_start_streaming() - Attempt to start streaming.
>>    * @q:		videobuf2 queue
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index 724135d41f7f..ffe6b66a27f1 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -751,6 +751,22 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>>   }
>>   EXPORT_SYMBOL_GPL(vb2_prepare_buf);
>>   
>> +int vb2_delete_bufs(struct vb2_queue *q, struct v4l2_delete_buffers *d)
>> +{
>> +	unsigned int index;
>> +	int ret = 0;
>> +
> Add a check if index < q->num_buffers, count < q->num_buffers and that
> the sum of the two <= q->num_buffers. I.e., basic sanity checks.
>
> Return -EINVAL if that's the case.
>
>> +	for (index = d->index; index < d->index + d->count; index++) {
>> +		ret = vb2_core_delete_buf(q, index);
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +	d->index = index;
> Hmm. I wonder if vb2_core_delete_buf shouldn't be void, and instead
> verify here first that all buffers your want to delete 1) exist, and
> 2) are in state DEQUEUED.

I will keep using vb2_core_delete_buf() because it use static functions videobuf2-core.c
and I don't want to change all of them.

>
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(vb2_delete_bufs);
>> +
>>   int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>>   {
>>   	unsigned requested_planes = 1;
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index f81279492682..215654fd6581 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -720,6 +720,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>   		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
>>   		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>>   		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>> +		SET_VALID_IOCTL(ops, VIDIOC_DELETE_BUFS, vidioc_delete_bufs);
>>   	}
>>   
>>   	if (is_vid || is_vbi || is_meta) {
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index f4d9d6279094..32336b9bb7e4 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -489,6 +489,13 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>>   	v4l_print_format(&p->format, write_only);
>>   }
>>   
>> +static void v4l_print_delete_buffers(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_delete_buffers *p = arg;
>> +
>> +	pr_cont("index=%d, count=%d\n", p->index, p->count);
>> +}
>> +
>>   static void v4l_print_streamparm(const void *arg, bool write_only)
>>   {
>>   	const struct v4l2_streamparm *p = arg;
>> @@ -2160,6 +2167,15 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
>>   	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
>>   }
>>   
>> +static int v4l_delete_bufs(const struct v4l2_ioctl_ops *ops,
>> +			   struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_delete_buffers *delete = arg;
>> +	int ret = check_fmt(file, delete->type);
>> +
>> +	return ret ? ret : ops->vidioc_delete_bufs(file, fh, delete);
>> +}
>> +
>>   static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
>>   				struct file *file, void *fh, void *arg)
>>   {
>> @@ -2909,6 +2925,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>   	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>>   	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>>   	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
>> +	IOCTL_INFO(VIDIOC_DELETE_BUFS, v4l_delete_bufs, v4l_print_delete_buffers, INFO_FL_QUEUE),
> You can add INFO_FL_CLEAR here to automatically zero the reserved field. It also needs INFO_FL_PRIO.
>
>>   };
>>   #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>>   
>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>> index edb733f21604..55afbde54211 100644
>> --- a/include/media/v4l2-ioctl.h
>> +++ b/include/media/v4l2-ioctl.h
>> @@ -163,6 +163,8 @@ struct v4l2_fh;
>>    *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
>>    * @vidioc_prepare_buf: pointer to the function that implements
>>    *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
>> + * @vidioc_delete_bufs: pointer to the function that implements
>> + *	:ref:`VIDIOC_DELETE_BUFS <vidioc_delete_bufs>` ioctl
>>    * @vidioc_overlay: pointer to the function that implements
>>    *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
>>    * @vidioc_g_fbuf: pointer to the function that implements
>> @@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
>>   				  struct v4l2_create_buffers *b);
>>   	int (*vidioc_prepare_buf)(struct file *file, void *fh,
>>   				  struct v4l2_buffer *b);
>> +	int (*vidioc_delete_bufs)(struct file *file, void *fh,
>> +				  struct v4l2_delete_buffers *d);
>>   
>>   	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>>   	int (*vidioc_g_fbuf)(struct file *file, void *fh,
>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>> index ee9161b9fd64..c9ecc4214982 100644
>> --- a/include/media/videobuf2-core.h
>> +++ b/include/media/videobuf2-core.h
>> @@ -843,6 +843,15 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>>    */
>>   int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb);
>>   
>> +/**
>> + * vb2_core_delete_buf() -
>> + * @q: pointer to &struct vb2_queue with videobuf2 queue.
>> + * @index:	id number of the buffer.
>> + *
>> + *  Return: returns zero on success; an error code otherwise.
>> + */
>> +int vb2_core_delete_buf(struct vb2_queue *q, unsigned int index);
>> +
>>   /**
>>    * vb2_core_qbuf() - Queue a buffer from userspace
>>    *
>> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
>> index 5a845887850b..2ef68fdf388f 100644
>> --- a/include/media/videobuf2-v4l2.h
>> +++ b/include/media/videobuf2-v4l2.h
>> @@ -118,6 +118,17 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
>>    */
>>   int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>>   		    struct v4l2_buffer *b);
>> +/**
>> + * vb2_delete_bufs() - Delete buffers from the queue
>> + *
>> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>> + * @d:		delete parameter, passed from userspace to
>> + *		&v4l2_ioctl_ops->vidioc_delete_bufs handler in driver
>> + *
>> + * The return values from this function are intended to be directly returned
>> + * from &v4l2_ioctl_ops->vidioc_delete_bufs handler in driver.
>> + */
>> +int vb2_delete_bufs(struct vb2_queue *q, struct v4l2_delete_buffers *d);
>>   
>>   /**
>>    * vb2_qbuf() - Queue a buffer from userspace
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 78260e5d9985..4807b38e2a6f 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2616,6 +2616,21 @@ struct v4l2_create_buffers {
>>   	__u32			reserved[6];
>>   };
>>   
>> +/**
>> + * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
>> + * @index:	the first buffer to be deleted
>> + * @count:	number of buffers to delete
>> + * @type:	enum v4l2_buf_type; buffer type (type == *_MPLANE for
>> + *		multiplanar buffers);
> I would drop the bit between (). That seems overkill to me.
>
>> + * @reserved:	futur extensions
> futur -> future
>
>> + */
>> +struct v4l2_delete_buffers {
>> +	__u32			index;
>> +	__u32			count;
>> +	__u32			type;
>> +	__u32			reserved[13];
>> +};
>> +
>>   /*
>>    *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>    *
>> @@ -2715,6 +2730,8 @@ struct v4l2_create_buffers {
>>   #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
>>   
>>   #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>> +#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
>> +
>>   
>>   /* Reminder: when adding new ioctls please add support for them to
>>      drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> Regards,
>
> 	Hans
>

