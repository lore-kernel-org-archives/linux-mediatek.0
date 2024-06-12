Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16423C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=; b=U9hREV1LJq3IxQxCiasf46smNb
	fpNTdWKl8DNB3uwFwp+sCyl06dpUW4a0DWVToisKni7Ilxuej2qqxZpC1Mkmefzq28Yg9mS+HSqFq
	0evY5mU0H1XlhS0vuEDBpBGvF+H/VyTt7PlD7fQwCeOsmhojXfVT3BEopfqk0MAtmev9W37Y9NNnR
	/W4aUUr+nyHtGo5ZjWEfh+ajF780pDoVyw+yhJwL84nkGOwuMRxJJ8rvrvUVd8KoRfN92PMAmILVU
	VA3sqB8UdSvB0cS36vNvb4DVmQgg8KbM2B5uwtQLabGmVD2Kj3brPMULmjn89LlCtjL86+Jae1zS/
	cc+PmoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHFe5-0000000B1pN-03go;
	Wed, 12 Jun 2024 04:31:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHFe0-0000000B1ni-0tmL
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 04:31:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-6e3ff7c4cc8so3582467a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718166689; x=1718771489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
        b=Zn9NIAZU0V3hMRdW1mRRNUC603j1sVKFvFPGrCB1beYJuobRApqlM2wlvBPmDH3NjY
         9IhakYX8oUym2hIdYexECME+AThLqZLkA3Dczo+rnUFYoPRtc3YOaF2hiiTpVNRKbxx1
         OOQMUhgC85OKnb5rukmeNFPcqkKDj5aS8ikIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718166689; x=1718771489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
        b=JJ4AKvyA+0oYGf79yEreQysEUQ5r1LsPmcQknJJ4z2bAiFi3wearha2eMcf1ABgdkE
         uDlAf4POWSPsAW//JtalvBFzAKKryKT2KNpp+Ym+nMj0R2RGz30D7Bg1N+Ypz7DhKqRa
         FZXcK4xV+h0WtCzVuqWnm8OazrxPQUbj0MkL+MNSrDE1xoVQpUs9K4OlPMZASLmf40qY
         XXtSYT3QRcXLWKCcn8gvbB+gV5VILwZcS4kEsIc5d1J8Li/Fr5qgniKLOWRuwZOVJOSp
         pwBkFamYhdrXm10sDSkZTHAdBy/zb8PYos9iKnBKnGGmf45eU935UTUvEJhbcjw2vUo5
         foww==
X-Forwarded-Encrypted: i=1; AJvYcCX/pdnbbWVKu3m0mybcGC9njFvFRSkbDXox3kz3RVdSGpz9gpE2CMPV8c66vE8Ui4so0rca+RqfcGgqtiWgorVyvrtYeIJF8h3omcg0NA11FKys
X-Gm-Message-State: AOJu0YxW+wJFvNJSot0rA3ncE9HARZW8y3wKaPdxXlpknCVG5f6Hy1jR
	W7jslAf7OGeKq2mWEOpka8oE9wNAug+EPdJslkZIF+yF4R8gwp9thIkey7768g==
X-Google-Smtp-Source: AGHT+IEDNIroERFQYahAEyUp89r/l251ag7KXTZkZl5/HBfB+fwRsfZPqR83QoYb4oKa3SSk62X7hQ==
X-Received: by 2002:a05:6a21:81a2:b0:1b2:2e3e:42dd with SMTP id adf61e73a8af0-1b8a9be9bb0mr745623637.34.1718166688682;
        Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f74179d0basm11631455ad.122.2024.06.11.21.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:31:22 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,03/24] v4l2: verify restricted dmabufs are used in
 restricted queue
Message-ID: <rw6dkzasaz4lnvtmxkxlkxte5nvphpjixigjouvjkpctscpdla@bheblt7kmj4y>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-4-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_213132_305592_BE2FD1A7 
X-CRM114-Status: GOOD (  20.86  )
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

On Thu, May 16, 2024 at 08:20:41PM +0800, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Verfies in the dmabuf implementations that if the restricted memory
> flag is set for a queue that the dmabuf submitted to the queue is
> unmappable.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..35a3c1c01eae 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -710,6 +710,14 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Kernel coding style [1] defines multi-line comments to start with an empty
line.

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

This would leak the mapping. We need to unmap the attachment here.

> +	}
> +
>  	/* checking if dmabuf is big enough to store contiguous chunk */
>  	contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6975a71d740f..2399a9c074ba 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -570,6 +570,14 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Ditto.

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

Ditto.

Best regards,
Tomasz

> +	}
> +
>  	buf->dma_sgt = sgt;
>  	buf->vaddr = NULL;
>  
> -- 
> 2.25.1
> 

