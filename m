Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7302C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trb4MuQ6XLLHp9cbrU7Qhxh5OD3/4hryMzvH31htzlg=; b=Ece5w8TOu6bhAm/bPWV4dW/ctz
	R5vC/3tUL59/4q1A2GK+/UMCnDA/gth0fV5qyTC/aoQBLQKzxhcCe0t0YAP1i1Dohw2Eu1Q223L4C
	bATOFNIYgaWwEJ0JIoxCwMa3U5qbIGz8kZxcQ3Q8c1ptFtz1eakocnkEwac+bWMas3BPWxKZ4VdFv
	+RZkRrzGhSrOztyTK4aCub7cSb5+pS+ATe9uKkyY7M68s3d9euE7rU3vAUi4jSAjSiej0HBli86RP
	W8i3z7n17B7Ntj8aCl7w6VVQ+jo9SMcCvo+awyLFhMvpxfVDeQ56vebSEwToAUxfgTeXLNJHyOUdH
	3U14WC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r113T-005jsT-1k;
	Thu, 09 Nov 2023 09:10:27 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r113Q-005jqb-1T
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 09:10:26 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6c4b06af98bso345866b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699521023; x=1700125823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trb4MuQ6XLLHp9cbrU7Qhxh5OD3/4hryMzvH31htzlg=;
        b=Uo2odeT4PAJFKb/AqM7FGQWX8GdGpw3L9gtvSpVqRu/SiOOA+w1f1qWSuu8cuVsXTA
         9m2hXqVOjgunekm799+78AkhvnK5yUTNfKXQorRE54cnzTZ3xqK0mV8WPLg7vpWd/u5Y
         RGPdKdS6cucoUq8rl3McXZZpYJEB9FeG6Yt1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521023; x=1700125823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trb4MuQ6XLLHp9cbrU7Qhxh5OD3/4hryMzvH31htzlg=;
        b=M8DdA2ZRkoulS3/aSM239/TZMmBmivW5k9Xz1C4N9SzVS+UeK9EY/SE+H7ScMsTljV
         Kwb1KZGCtvkxlGvnJLE/DtKwoLHxC98fUAY5A1HkyTDK94n4YaT0B1ly2sI7xewVcKAO
         Kg7tTESnhULSk6m7fDZXEJQ+gXAI5yuNf2feR4h4tIP91f5XpUlZom6dpKHiZ7dl3Ahe
         3KUy5AYe26AVzBhuHc+86CgXHim2BCZ7uAi1hKmRHOBCDjWW+SL0hAA/nPCgkYmMwKYt
         rQTJSeRsytQvHOAbS+TyKpIUfWZQgGnDRe8lWG5peT7KhbV7Z9UX/h0dl3OQ4WBd9y90
         aH5w==
X-Gm-Message-State: AOJu0YxKjbQ9A73SrBcgviFm32h87ksu2K7IgQZ+28B+Bgh1GSWoF0Mm
	1DV6MWGLdoBGXR7B3q9goeo9TQ==
X-Google-Smtp-Source: AGHT+IHeH9bwSDaqUzS/5j97Pi2uukXE85TheRG3ama6+WbfBb0l8z3y1v7unvrgCAzIC5YVZM0pcw==
X-Received: by 2002:a05:6a20:7493:b0:15d:e68d:a850 with SMTP id p19-20020a056a20749300b0015de68da850mr4661238pzd.29.1699521022894;
        Thu, 09 Nov 2023 01:10:22 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b001c9d968563csm3041205plr.79.2023.11.09.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:10:22 -0800 (PST)
Date: Thu, 9 Nov 2023 09:10:18 +0000
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
Subject: Re: [PATCH v14 53/56] media: core: Free range of buffers
Message-ID: <20231109091018.tzodchqp44tmwq3k@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-54-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-54-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_011024_524872_6FD0402B 
X-CRM114-Status: GOOD (  26.18  )
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

On Tue, Oct 31, 2023 at 05:31:01PM +0100, Benjamin Gaignard wrote:
> Improve __vb2_queue_free() and __vb2_free_mem() to free
> range of buffers and not only the last few buffers.
> Intoduce starting index to be flexible on range and change the loops
> according to this parameters.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 59 +++++++++----------
>  1 file changed, 28 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 6e88406fcae9..010a8bca0240 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -519,15 +519,13 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  /*
>   * __vb2_free_mem() - release all video buffer memory for a given queue

This comment is kind of outdated. Maybe we should replace it with

	release video buffer memory for a given range of buffers in a given
	queue

?

>   */
> -static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer;
> +	unsigned int i;
>  	struct vb2_buffer *vb;
> -	unsigned int q_num_buffers = vb2_get_num_buffers(q);
>  
> -	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
> -	     ++buffer) {
> -		vb = vb2_get_buffer(q, buffer);
> +	for (i = start; i < q->max_num_buffers && i < start + count; i++) {

We could make this (and all those numerous simialr iterations) more
efficient by using bitmap helpers (probably wrapped in some vb2 helpers),
e.g. for_each_set_bit_from() (vb2_for_each_buffer_from()?). It can be done
in a follow up patch separately from this series though.

> +		vb = vb2_get_buffer(q, i);
>  		if (!vb)
>  			continue;
>  
> @@ -542,35 +540,35 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
>  }
>  
>  /*
> - * __vb2_queue_free() - free buffers at the end of the queue - video memory and
> + * __vb2_queue_free() - free count buffers from start index of the queue - video memory and

nit: How about using the @count and @start notation to refer the argument
names? (Can be done with a follow up patch outside of this series later.)

>   * related information, if no buffers are left return the queue to an
>   * uninitialized state. Might be called even if the queue has already been freed.
>   */
> -static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer;
> -	unsigned int q_num_buffers = vb2_get_num_buffers(q);
> +	unsigned int i;
>  
>  	lockdep_assert_held(&q->mmap_lock);
>  
>  	/* Call driver-provided cleanup function for each buffer, if provided */
> -	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
> -	     ++buffer) {
> -		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
> +	for (i = start; i < q->max_num_buffers && i < start + count; i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(q, i);
>  
> -		if (vb && vb->planes[0].mem_priv)
> +		if (!vb)
> +			continue;
> +		if (vb->planes[0].mem_priv)

nit: Not sure if we really had to change this, but I'm fine with either.

Best regards,
Tomasz

