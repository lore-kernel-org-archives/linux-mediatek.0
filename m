Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EFEC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 12:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A886B600CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 12:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A886B600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pw668xcPyRGq8kYWsfcSp3Q8Ywq1DzZAieTSKKKku2U=; b=VCA2LJ6KM1zWCU
	LTIWpKNtUcHmLrBpxja+JiPtzUbz7Y5AY5cIGGl+LuJzDl6XhzIFCyLX4pPP/rNN8HhvwUoGPwCpN
	qjOdgj44kYc5ybbDsTCDu1GVBz85auhSnnNcfhs8F/7HtGf0L6CZSyu7W7UOr/jKiKmFWFMN530ch
	/eD9bn0SAaW380i1cAmL0ThRg01+6VGfhBi6U2HlfCCOod0vNfZ82Aw2ktHL7tlwRfGwu4GXxPNX1
	Cef1YreFbs4VTwmjg65797hNR9LXBz++nOdjxAUW5zwMMPD84Rga6/dj7R7OglRCv0vyXCe3PiByP
	Af2nJuRIZ1OC/ojrOI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL3Aj-002FCJ-2k; Tue, 31 Aug 2021 12:47:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL3AS-002F9m-W1
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 12:47:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q14so27507549wrp.3
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Aug 2021 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lqW6r2QxBjf3naPSK7ElejDN0miJGNk4JeUrWNu5dFo=;
 b=P7GUI4rzpcJORZdrR45U9tZBVNt+YutkUgaZAyUSoo0hNOv5YFYj2LVa3BDKBVLlEZ
 8P09RZ77gdJ/9bmvIGELMImn15ss9sRZV4C/seGIidibDM6yqDjkjA6TuRj46kpJciNn
 Jh7pnUHhLdusLFGeigWIF2NedtczE/Aou9GJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lqW6r2QxBjf3naPSK7ElejDN0miJGNk4JeUrWNu5dFo=;
 b=Ha3/jWToJRvFE4QQPWPCgnK8AzjVBD2fQ5QYc7k6LlSea1pbTR4oWUIdxhQElMM95m
 OIxM3j0KgZ6FuO0DZaVVey+Nn1zNN7q01iaGyjGJHNgbb5nwUeH0MqLhEWUIusyUwv0X
 2vINb48But3X4uTUtxO+Y6KeBDwPyPQMUlqsZJgyhiiRPi2d5bxiddQS7S8v2V1EryO3
 HeBBMEUo4gjttleOs4YLnVKWqFhorXuSl12yoh/dvJ9S6fQcuMqwcyoe/vShZpf144cM
 1Cl+nWjPOSKQ/bw5uk12vI8xZ5bapitRc2BPID3cF/lVpSl/dNVXYqWLGgnK/JIZ7QwC
 yZ6Q==
X-Gm-Message-State: AOAM532Zp6uB+78SgcrtYsnjHAQlp7sOthDfTOUrP9Ojm+0mSJdvSKBN
 CyUlF02l8OGYZ8AWe5AHKmGRjA==
X-Google-Smtp-Source: ABdhPJxwoD0EiQFf+7rgqTumGOUaiOiYizQOADtUbwoy+P/jmw6DFg/J4Q4QffVcbtqcMVqvU1avQw==
X-Received: by 2002:adf:c40d:: with SMTP id v13mr29016331wrf.388.1630414026094; 
 Tue, 31 Aug 2021 05:47:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm11701297wrc.31.2021.08.31.05.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:47:05 -0700 (PDT)
Date: Tue, 31 Aug 2021 14:47:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: guangming.cao@mediatek.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com, isaacm@codeaurora.org,
 sspatil@google.com, hridya@google.com
Subject: Re: [PATCH] dma-buf: Add support for mapping buffers with DMA
 attributes
Message-ID: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
Mail-Followup-To: guangming.cao@mediatek.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com, isaacm@codeaurora.org,
 sspatil@google.com, hridya@google.com
References: <20210830023911.4410-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830023911.4410-1-guangming.cao@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_054709_065306_8BE70DFE 
X-CRM114-Status: GOOD (  28.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 30, 2021 at 10:39:11AM +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> When mapping the memory represented by a dma-buf into a device's
> address space, it might be desireable to map the memory with
> certain DMA attributes. Thus, introduce the dma_mapping_attrs
> field in the dma_buf_attachment structure so that when
> the memory is mapped with dma_buf_map_attachment, it is mapped
> with the desired DMA attributes.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Signed-off-by: Sandeep Patil <sspatil@google.com>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

Can you pls include the code that's going to use this here too?

At a glance all the attributes you might want to set are supposed to be
under the control of the exporter, not the importer.
-Daniel

> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
>  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
>  include/linux/dma-buf.h             | 3 +++
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0c05b79870f9..2c9feb3bfc3e 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -99,9 +99,10 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = &a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
>  	if (ret)
>  		return ERR_PTR(-ENOMEM);
>  	a->mapped = true;
> @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				   enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attrs = attachment->dma_map_attrs;
>  
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
>  }
>  
>  static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..fc7b1e02988e 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -130,9 +130,10 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				      enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attrs = attachment->dma_map_attrs;
>  
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
>  }
>  
>  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..4d650731766e 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -379,6 +379,8 @@ struct dma_buf_attach_ops {
>   * @importer_ops: importer operations for this attachment, if provided
>   * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>   * @importer_priv: importer specific attachment data.
> + * @dma_map_attrs: DMA attributes to be used when the exporter maps the buffer
> + * through dma_buf_map_attachment.
>   *
>   * This structure holds the attachment information between the dma_buf buffer
>   * and its user device(s). The list contains one attachment struct per device
> @@ -399,6 +401,7 @@ struct dma_buf_attachment {
>  	const struct dma_buf_attach_ops *importer_ops;
>  	void *importer_priv;
>  	void *priv;
> +	unsigned long dma_map_attrs;
>  };
>  
>  /**
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
