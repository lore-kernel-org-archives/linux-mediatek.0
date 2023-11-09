Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58FEC0018C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCWyDTFOKGrYpot7V/hX2yRpK+Z5vWvoNFrsFbdVsv0=; b=e1QecL4rI8LAalYbAvi9FF/jBs
	NFWVmlaPgy7imJ6jQmefI5MM9rgHZBkOxmQnWMcJ6LnYwmsKCuI77Us8ZxujUJiaF4aCVl5P2P/0q
	sK6LB/1V/K3kv+1Is0Xw6WBJ5pVLd9Z+qi9vOPPwVyqiQr6y9/cL0W0VoTAAXG54LYUVICvO90Lj9
	fCNaKlU6s0kY47QytfqAHQJ8i46gmNpJKTlX+j9s1vBh63kZFjSPQUwLlgIMKWH35EMemgC/6tmkg
	3ohYr9YNhWj2EPiyYqXWvdq/fYFHqL2stPldzYy6kjyKrIEVa0RNNKKo8ICdXjbcnOs6N0plFweEr
	Ca18fHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11ZH-005oPQ-2f;
	Thu, 09 Nov 2023 09:43:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11ZE-005oNf-2I
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 09:43:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28019b66ad5so595922a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699522995; x=1700127795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCWyDTFOKGrYpot7V/hX2yRpK+Z5vWvoNFrsFbdVsv0=;
        b=k4F1IMdHiEM01M72lGa9kjRq1/BELOFl3T1Jn+dNpvIkiMqazDs07wTloot88CI468
         I2vP1RMu5StFxcTvAi6T9wt1x/szrTQXSajhkUE/rhMUNrfBP1hob2hNJtf0W4ld1d7V
         B6IJevnkE5bfQwjIYzqCoIh8nLuBpyUInREu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699522995; x=1700127795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCWyDTFOKGrYpot7V/hX2yRpK+Z5vWvoNFrsFbdVsv0=;
        b=t29DsHOaJTRyC2xb9ggZ6AY235FRQu+FEhjwHDSLT+2r1fAuaL5bVsKPXHMulE6+DR
         JG7UQT3miOyWo8ubfRicuJCq2IHvyoUxsNxFLUGQvvjfJ3KOlPRDC4ZjTR2EX3TagR34
         fVklfaomzio21fuXYVA9ZL7BeWY8TdKPAaFMG2xcDYjUPrETCotZs37kxfbwH23SoDND
         hDWKBrKB9xtybZUPyOG+QzXRzLxgyW8ENfzR+Ph95qY22aFlRHG1Qugqh3mm6oo3hkcM
         Ur8OXPjcASOY6emfhmvcMSPzyWtA2BWFB4fWVcG9EanU6vzqOKkTxEK7MtqTFJTmYl4s
         +kog==
X-Gm-Message-State: AOJu0YyVyncylwZFHI8qP/OyxBxHbnXSdCuJdwJfiwcXeDtDzeWgsM0F
	UbS7UDghjdsozNr+Z112PB9S4g==
X-Google-Smtp-Source: AGHT+IHYEn5vCWOVKWVvobQ08zsd30PXF4KGgrclxpMN4A+BTWHHxdRtGwc4VhxQDlQqRAmCiOe3vQ==
X-Received: by 2002:a17:90b:4b4f:b0:280:a27d:e897 with SMTP id mi15-20020a17090b4b4f00b00280a27de897mr1185437pjb.8.1699522995680;
        Thu, 09 Nov 2023 01:43:15 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a01d500b0027d0adf653bsm986244pjd.7.2023.11.09.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:43:15 -0800 (PST)
Date: Thu, 9 Nov 2023 09:43:11 +0000
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
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for
 DELETE_BUFS ioctl
Message-ID: <20231109094311.yzmmn4vvskmrk4tk@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-57-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_014316_769661_181E3717 
X-CRM114-Status: GOOD (  14.04  )
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

On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs() helper.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
>  drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
>  drivers/media/test-drivers/visl/visl-video.c      |  2 ++
>  drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
>  4 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 69cbe2c094e1..f14a8fd506d0 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>  	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
>  	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
>  	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
> +	.vidioc_delete_bufs	= v4l2_m2m_ioctl_delete_bufs,
>  
>  	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
>  	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->mem_ops = &vb2_vmalloc_memops;
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock = src_vq->lock;
> +	dst_vq->supports_delete_bufs = true;

Since we have to explicitly provide the vidioc_delete_bufs callback anyway,
is there any value in having a separate supports_delete_bufs flag? Or we
envision that some drivers would support deleting buffers only for some
queues?

Best regards,
Tomasz

