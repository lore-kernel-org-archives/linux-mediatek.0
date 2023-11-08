Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84740C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zK82/6BqvKNKQgaDqfy7Pto0Ojlpc/8oMTwUMvbxWs=; b=cqEWRmx+rqXq4VpExHIVOxJ6a3
	0jmI2zDrI3hmhxYmJaQgFXpRkpawrZr8nkVWPVJuBMjSIE/p9ZVrOGIT7Nr0aCPaohlNZ4n4QdNbB
	63iTFH3wrg/gwsBlZ1y3iGJfzEKWwyLUXhLrsjMp56JISJNpr4bmKAowmh92vNGNgzEOCMKr74FiR
	ER1brww2YW+zzaqU52yqrwyQSl947/tUWB9u8MjgDoS0QpmJw784LXVLZY4P9luqn8xF4AXxzLXy+
	rHi8bNqKzVaIMFvrbcb3pW0Ip4EELAjR88psUBaP+mBocy7wSqbkkAp4Ip7ovpmfFecHL361juCP2
	JkUu2MVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0eGY-003JK8-19;
	Wed, 08 Nov 2023 08:50:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0eGV-003JIg-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 08:50:24 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso5374363b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 00:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699433421; x=1700038221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zK82/6BqvKNKQgaDqfy7Pto0Ojlpc/8oMTwUMvbxWs=;
        b=SoOti+cP3SpzWV9QCIy8J2U/D2lI4epcxIkyIbmj+sOuIOOlGGkn6RAXXCAsRm+xgm
         4bmD33HDEye+EgHLBDhCBf3gT9UXbRA6EfsZRR1TvKdmxSDyfn+LK4W/WYVsnVc05Bku
         9mt8SRr9oF2ld76K6TvEPGBc5T2KSsbeK7WNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699433421; x=1700038221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zK82/6BqvKNKQgaDqfy7Pto0Ojlpc/8oMTwUMvbxWs=;
        b=NnADt62SPEtbIZCm8894zrmcyhNH4hE9Uqa07WpCONnJiRC5jCTZT3qCwmQ8bijBmk
         MzLtJNq64vZ+OlHf45CRlJdkDl2GHPyA/cBQlUotxHcIicyWv1spAaScdM8uAGjY00b1
         uvpJys8k1V0bAs2h/LbGKkQo1duGjXYjV1eXtB0YXBMeUzBmPKjBV8EazN+eRTSOfJ2a
         CvB9KPZi70dN87m+P8tQoGPLgFDmTE/67M4mxwQHMcjUFzRJgsTAVAqgIED1n9mGlQPv
         cW6j0vTGaSvLWX2Bh364D+vxPDW7OcbB5isBKAtSFOtEJAxHefT6iFCNGBVXPK6fHmkh
         633A==
X-Gm-Message-State: AOJu0YyD6wmYb0Fs2PUepOjMjH8QadUUZv2fqaaKy4MLBWyLjy01r/GT
	u/K2k7g7QP9w39YsX89JHB5pLQ==
X-Google-Smtp-Source: AGHT+IEHQkQi7fFj1XBDdA1qkqIbF8LsDwsuYzZpYRjILqB0R+pLZlNNyUqPLPXG7J8Xz/MdT6Nc7g==
X-Received: by 2002:a05:6a00:cc8:b0:6be:2e07:5c5c with SMTP id b8-20020a056a000cc800b006be2e075c5cmr1240783pfv.20.1699433421074;
        Wed, 08 Nov 2023 00:50:21 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id n28-20020a056a00213c00b006c34a04c782sm8482914pfj.61.2023.11.08.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 00:50:20 -0800 (PST)
Date: Wed, 8 Nov 2023 08:50:16 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Message-ID: <20231108085016.3kmhmdroh4qs53f5@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-6-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_005023_204447_66CB894C 
X-CRM114-Status: GOOD (  23.49  )
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

On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> This patch adds 2 helpers functions to add and remove vb2 buffers
> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> struct vb2_queue becomes like a private member of the structure.
> 
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer in preparation for when buffers can be deleted.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
>  2 files changed, 149 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 968b7c0e7934..b406a30a9b35 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
>  		vb->skip_cache_sync_on_finish = 1;
>  }
>  
> +/**
> + * vb2_queue_add_buffer() - add a buffer to a queue
> + * @q:	pointer to &struct vb2_queue with videobuf2 queue.
> + * @vb:	pointer to &struct vb2_buffer to be added to the queue.
> + * @index: index where add vb2_buffer in the queue
> + */
> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
> +{
> +	WARN_ON(index >= VB2_MAX_FRAME || q->bufs[index]);

nit: Would it make sense to also ensure that vb->vb2_queue is NULL?

> +
> +	q->bufs[index] = vb;
> +	vb->index = index;
> +	vb->vb2_queue = q;
> +}
[snip]
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d19d82a75ac6..2ffb097bf00a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -377,6 +377,12 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  		return -EINVAL;
>  	}
>  
> +	vb = vb2_get_buffer(q, b->index);
> +	if (!vb) {
> +		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
> +		return -EINVAL;
> +	}
> +

Is this a leftover from earlier revisions? I think it shouldn't be
needed anymore after the previous patch which changed the function to
get vb as an argument.

Best regards,
Tomasz

