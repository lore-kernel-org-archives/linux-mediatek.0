Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444DAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iYSjYgPA853NNgTftU+8vO7rrc6asFwDtyutxaSTU0=; b=ocnml8tAPejsemtAUfjhmUBg+k
	a8E6f0/uWDjXJB3tBjvzicJpVqDfJBlKF0Z29Y70fyQIG4F5MPrnr6WzyxsdHop/gfK3f0N1HgMHP
	WOyvAMGj2WkVwXtYXDRVK372FBMw9Q0Rs6HpAB05hihhr4uXdmdsuhq0ucJ5oeHLAhWMGm67S7u7F
	cQ4nxn0441xuqDhW697E2hsHbMUxWZZ3SOnu7rNJzPLMRIZUJxYHfjmhrQzsifL7ioJsjZXry2D50
	xWBStjGIa9LGTTFVDxleQhz7oPEVVNd0kJMpJgQYt8Bnrfa/3YMIGPeH73EUfWyPbiKDrdjjWGmtt
	2tEQaALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OHG-008FJ6-1H;
	Fri, 10 Nov 2023 09:58:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OHB-008FHj-2Q;
	Fri, 10 Nov 2023 09:58:11 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A78066073F0;
	Fri, 10 Nov 2023 09:58:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699610288;
	bh=vrNV2GhNqWh/xBpCPEe9AvJUCx3NTwSzBq79fFKMFXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DuwFQG1hrwVOUMfTm66Nt2HFOMGrdy1qL6Zk0SfpSUTLwAhBTDxoHQXQo9fSpSXNv
	 C3PGjIBNZtWJjF94AybOCJ7wGcEqjIym5tECcXQXxJv+z4OLU/T5hmo7PCD2XrTJfi
	 2vTl0MeCnZc0uKvhjPEnYkPSSZZoK2somzeSEw2vbBPe1zcXadd7Jl0jL4DC2gbOUl
	 2IMstZ2CAG4KqEj1mxvsKPqnQUrsicfrKe5k9QhiQ8N6Hca2og3S5lNFCtqF1aQ/0d
	 cyuXjTNgWG6CG+SSO+M+Wyk0r+1TD0SAPfe9pFtqLlVItHQc9eVe7XpSVnTgAbDl+O
	 6JbUN+7roVQyg==
Message-ID: <84f22803-bd25-4985-a17c-b38bd738b487@collabora.com>
Date: Fri, 10 Nov 2023 10:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 30/56] media: test-drivers: Stop direct calls to queue
 num_buffers field
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-31-benjamin.gaignard@collabora.com>
 <0b79bb25-2e44-4a6d-b306-76477a2c8a08@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0b79bb25-2e44-4a6d-b306-76477a2c8a08@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_015810_091772_F83AC937 
X-CRM114-Status: GOOD (  22.67  )
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


Le 10/11/2023 à 10:35, Andrzej Pietrasiewicz a écrit :
> Hi Benjamin,
>
> W dniu 9.11.2023 o 17:34, Benjamin Gaignard pisze:
>> Use vb2_get_num_buffers() to avoid using queue num_buffers field 
>> directly.
>> This allows us to change how the number of buffers is computed in the
>> future.
>> If 'min_buffers_needed' is set remove useless checks in queue setup
>> functions.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> CC: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>>   drivers/media/test-drivers/visl/visl-dec.c         | 4 ++--
>>   drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 3 ---
>>   drivers/media/test-drivers/vivid/vivid-meta-out.c  | 5 +++--
>>   drivers/media/test-drivers/vivid/vivid-touch-cap.c | 5 +++--
>>   drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 3 ---
>>   drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 3 ---
>>   drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 3 ---
>>   drivers/media/test-drivers/vivid/vivid-vid-out.c   | 5 +----
>>   8 files changed, 9 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/visl/visl-dec.c 
>> b/drivers/media/test-drivers/visl/visl-dec.c
>> index ba20ea998d19..4672dc5e52bb 100644
>> --- a/drivers/media/test-drivers/visl/visl-dec.c
>> +++ b/drivers/media/test-drivers/visl/visl-dec.c
>> @@ -287,7 +287,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, 
>> struct visl_run *run)
>>       frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>>         len = 0;
>> -    for (i = 0; i < out_q->num_buffers; i++) {
>> +    for (i = 0; i < vb2_get_num_buffers(out_q); i++) {
>>           char entry[] = "index: %u, state: %s, request_fd: %d, ";
>>           u32 old_len = len;
>>           struct vb2_buffer *vb2;
>> @@ -347,7 +347,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, 
>> struct visl_run *run)
>>       frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>>         len = 0;
>> -    for (i = 0; i < cap_q->num_buffers; i++) {
>> +    for (i = 0; i < vb2_get_num_buffers(cap_q); i++) {
>>           u32 old_len = len;
>>           struct vb2_buffer *vb2;
>>           char *q_status;
>> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c 
>> b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
>> index 780f96860a6d..0a718d037e59 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
>> @@ -30,9 +30,6 @@ static int meta_cap_queue_setup(struct vb2_queue 
>> *vq, unsigned int *nbuffers,
>>           sizes[0] = size;
>>       }
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> -
>>       *nplanes = 1;
>>       return 0;
>>   }
>> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c 
>> b/drivers/media/test-drivers/vivid/vivid-meta-out.c
>> index 95835b52b58f..4a569a6e58be 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
>> @@ -18,6 +18,7 @@ static int meta_out_queue_setup(struct vb2_queue 
>> *vq, unsigned int *nbuffers,
>>                   struct device *alloc_devs[])
>>   {
>>       struct vivid_dev *dev = vb2_get_drv_priv(vq);
>> +    unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>>       unsigned int size =  sizeof(struct vivid_meta_out_buf);
>>         if (!vivid_is_webcam(dev))
>> @@ -30,8 +31,8 @@ static int meta_out_queue_setup(struct vb2_queue 
>> *vq, unsigned int *nbuffers,
>>           sizes[0] = size;
>>       }
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> +    if (q_num_bufs + *nbuffers < 2)
>> +        *nbuffers = 2 - q_num_bufs;
>>         *nplanes = 1;
>>       return 0;
>> diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c 
>> b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
>> index c7f6e23df51e..4b3c6ea0afde 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
>> @@ -13,6 +13,7 @@ static int touch_cap_queue_setup(struct vb2_queue 
>> *vq, unsigned int *nbuffers,
>>                    struct device *alloc_devs[])
>>   {
>>       struct vivid_dev *dev = vb2_get_drv_priv(vq);
>> +    unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>>       struct v4l2_pix_format *f = &dev->tch_format;
>>       unsigned int size = f->sizeimage;
>>   @@ -23,8 +24,8 @@ static int touch_cap_queue_setup(struct vb2_queue 
>> *vq, unsigned int *nbuffers,
>>           sizes[0] = size;
>>       }
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> +    if (q_num_bufs + *nbuffers < 2)
>> +        *nbuffers = 2 - q_num_bufs;
>>         *nplanes = 1;
>>       return 0;
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c 
>> b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
>> index b65b02eeeb97..3840b3a664ac 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
>> @@ -134,9 +134,6 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
>>         sizes[0] = size;
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> -
>>       *nplanes = 1;
>>       return 0;
>>   }
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c 
>> b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
>> index cd56476902a2..434a10676417 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
>> @@ -30,9 +30,6 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
>>         sizes[0] = size;
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> -
>>       *nplanes = 1;
>>       return 0;
>>   }
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c 
>> b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> index 3a06df35a2d7..2804975fe278 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> @@ -117,9 +117,6 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
>>                       dev->fmt_cap->data_offset[p];
>>       }
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> -
>>       *nplanes = buffers;
>>         dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
>
> here the format specifier for "*nbuffers" is "%d"...
>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c 
>> b/drivers/media/test-drivers/vivid/vivid-vid-out.c
>> index 184a6df2c29f..1653b2988f7e 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
>> @@ -73,12 +73,9 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
>>                          vfmt->data_offset[p] : size;
>>       }
>>   -    if (vq->num_buffers + *nbuffers < 2)
>> -        *nbuffers = 2 - vq->num_buffers;
>> -
>>       *nplanes = planes;
>>   -    dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
>> +    dprintk(dev, 1, "%s: count=%u\n", __func__, *nbuffers);
>
> ... but here you change it to "%u". Is there a reason for these two to be
> different? I didn't notice it in the previous version but now it 
> stands out
> clearly. Probably you changed to %u because of the type returned by
> vb2_get_num_buffers(). And, actually, *nbuffers _is_ unsigned, too.

Like you said *nbuffers is unsigned so %u sound for me.
The goal of this patch was to avoid vq->num_buffers usage not to clean up all the
file.
That could be done in other patch since there is lot to do here.

Regards,
Benjamin

>
> Regards,
>
> Andrzej
>
>>       for (p = 0; p < planes; p++)
>>           dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
>>       return 0;
>

