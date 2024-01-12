Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F9C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us7FlGdER6e8HJOcJ9DbE8FEDZwENOAoyDuutoH2bnc=; b=gDVl7fwECctcz/4VB1fAHZ8mvf
	nJJB8w5ZIsy+YzY/96pYMvB0gIE4nMjkJtL8GKtrdkkof1r6C6yWidGThK4e1bbshvE+PIN9wBnzH
	HSmdWRl/YwiQpzl5pg6jb/39e1+eBYMm6IyAe3e4vOWttkiE9F5W8MWEdvGkZBOhrZQV9MyzNBY26
	5dIq89xQ34h3YBKT+U5jbE67reT+Xm/COAlx2M4GBPPNfhv/SzCw13yhZYR8K4xk5gUq1F4QTSYb/
	dPqy7psdgl8VvEcmhfYIURtXTIzjMJw7dzpxzKOENsLLkKlvofr/4bk5syFfYD8qcAKlNZbSoagIY
	OU9FPlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEA5-002Omy-0M;
	Fri, 12 Jan 2024 09:49:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEA1-002OkM-0f
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 09:49:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5573c79aac5so1364684a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705052946; x=1705657746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=us7FlGdER6e8HJOcJ9DbE8FEDZwENOAoyDuutoH2bnc=;
        b=MYoj1ztkxIcmKd7eIBb8NOaaXwb/WVPG7u/4OA2CnSJ9EJfv6VEmnHIdkqOQoSTZ/k
         ykkb16E8pzynORvk/nflihWe3I8EiwwcRezwri2aRTUS/eYE/QaJyII4BI50/Nctf0Ns
         aRKgwvY3vvE1Q2+OiBNZr3ogck3DgrSenX7rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705052946; x=1705657746;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=us7FlGdER6e8HJOcJ9DbE8FEDZwENOAoyDuutoH2bnc=;
        b=A0iz+L8JO/mhtrPkE6Gc3thGOiWuK1z+trErvffp/oPGwwoxKKyPC+yaOTvt/sCrgP
         KTAJCsoj9dLsPej7dudXD3+Br380iYy+guYmW59v06+oUaAjhm9jySG9biSyl0I6XHSq
         W9GNroKflRmCWgLVU5CdOJHdNyeHi9Txo8UCb5F5PATaaq6LHcff7grJrAsAXCUQLlyb
         tfhiW1WzuBi1jQf7VX1X8ClORXZfs4ulEMssBI14KokMh0kGFcvle97aejcirf1sDoBS
         aQmw0w44t7daI/+7fcKZXCX+/sYVSTZsv0Rcy9n6Tz3LN6RPb+e3U+TGrokIH85Tq6Bq
         UFNQ==
X-Gm-Message-State: AOJu0YwGvMMoJNe0o3XcFbqmy1o/SGmy3D2b76oZty5bYSX3WYVCJf4l
	BYgIHVAeo+AE/PY1WpA/1meIOovnBI1YoQ==
X-Google-Smtp-Source: AGHT+IEOiq3FXhd4T4HCBcGkiMyRtMKljt8lxwRBUf3NerLJ5gdqm06t+lKy82F5LT4WBLgvMEXbXw==
X-Received: by 2002:a05:6402:148d:b0:557:4249:44 with SMTP id e13-20020a056402148d00b0055742490044mr760113edv.1.1705052946272;
        Fri, 12 Jan 2024 01:49:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id dh19-20020a0564021d3300b00557332d657fsm1610937edb.39.2024.01.12.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 01:49:05 -0800 (PST)
Date: Fri, 12 Jan 2024 10:49:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Pekka Paalanen <ppaalanen@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 4/7] dma-buf: heaps: restricted_heap: Add dma_ops
Message-ID: <ZaELD4APVuX4p77P@phenom.ffwll.local>
Mail-Followup-To: Yong Wu <yong.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Pekka Paalanen <ppaalanen@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-5-yong.wu@mediatek.com>
 <ZaEJOjXP2EJIe9rK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaEJOjXP2EJIe9rK@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014909_246708_AB8B6148 
X-CRM114-Status: GOOD (  35.24  )
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

On Fri, Jan 12, 2024 at 10:41:14AM +0100, Daniel Vetter wrote:
> On Fri, Jan 12, 2024 at 05:20:11PM +0800, Yong Wu wrote:
> > Add the dma_ops for this restricted heap. For restricted buffer,
> > cache_ops/mmap are not allowed, thus return EPERM for them.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/dma-buf/heaps/restricted_heap.c | 103 ++++++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
> > index 8c266a0f6192..ec4c63d2112d 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.c
> > +++ b/drivers/dma-buf/heaps/restricted_heap.c
> > @@ -12,6 +12,10 @@
> >  
> >  #include "restricted_heap.h"
> >  
> > +struct restricted_heap_attachment {
> > +	struct sg_table			*table;
> > +};
> > +
> >  static int
> >  restricted_heap_memory_allocate(struct restricted_heap *heap, struct restricted_buffer *buf)
> >  {
> > @@ -45,6 +49,104 @@ restricted_heap_memory_free(struct restricted_heap *heap, struct restricted_buff
> >  	ops->memory_free(heap, buf);
> >  }
> >  
> > +static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
> > +{
> > +	struct restricted_buffer *restricted_buf = dmabuf->priv;
> > +	struct restricted_heap_attachment *a;
> > +	struct sg_table *table;
> > +	int ret;
> > +
> > +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> > +	if (!a)
> > +		return -ENOMEM;
> > +
> > +	table = kzalloc(sizeof(*table), GFP_KERNEL);
> > +	if (!table) {
> > +		ret = -ENOMEM;
> > +		goto err_free_attach;
> > +	}
> > +
> > +	ret = sg_alloc_table(table, 1, GFP_KERNEL);
> > +	if (ret)
> > +		goto err_free_sgt;
> > +	sg_set_page(table->sgl, NULL, restricted_buf->size, 0);
> 
> So this is definitely broken and violating the dma-buf api rules. You
> cannot let attach succed and supply a dummy/invalid sg table.
> 
> Two options:
> 
> - Reject ->attach for all this buffers with -EBUSY and provide instead a
>   private api for these secure buffers, similar to how virtio_dma_buf has
>   private virto-specific apis. This interface would need to be
>   standardized across all arm TEE users, so that we don't have a
>   disastrous proliferation of apis.
> 
> - Allow ->attach, but _only_ for drivers/devices which can access the
>   secure buffer correctly, and only if you can put the right secure buffer
>   address into the sg table directly. If dma to a secure buffer for a
>   given struct device * will not work correctly (i.e. without data
>   corruption), you _must_ reject the attach attempt with -EBUSY.
> 
> The 2nd approach would be my preferred one, if it's technically possible.
> 
> Also my understanding is that arm TEE is standardized, so I think we'll at
> least want some acks from other soc people whether this will work for them
> too.
> 
> Finally the usual drill:
> - this also needs the driver side support, if there's any changes needed.
>   Just the new heap isn't enough.

Ok I quickly scrolled through your drm patches and that confirms that the
current dma-buf interface you're implementing is just completely breaking
the api. And you need to paper over that will all kinds of very icky
special-casing.

So definitely need to rethink the overall design between dma-buf heaps and
drivers here.
-Sima

> - and for drm you need open userspace for this. Doesn't have to be the
>   full content protection decode pipeline, the drivers in drm that landed
>   secure buffer support thus far enabled it using the
>   EGL_EXT_protected_content extension using gl, which side steps all the
>   complications around content decryption keys and support
> 
> Cheers, Sima
> 
> > +
> > +	a->table = table;
> > +	attachment->priv = a;
> > +
> > +	return 0;
> > +
> > +err_free_sgt:
> > +	kfree(table);
> > +err_free_attach:
> > +	kfree(a);
> > +	return ret;
> > +}
> > +
> > +static void restricted_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +
> > +	sg_free_table(a->table);
> > +	kfree(a->table);
> > +	kfree(a);
> > +}
> > +
> > +static struct sg_table *
> > +restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direct)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +	struct sg_table *table = a->table;
> > +
> > +	return table;
> > +}
> > +
> > +static void
> > +restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table *table,
> > +			      enum dma_data_direction direction)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +
> > +	WARN_ON(a->table != table);
> > +}
> > +
> > +static int
> > +restricted_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int
> > +restricted_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int restricted_heap_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static void restricted_heap_free(struct dma_buf *dmabuf)
> > +{
> > +	struct restricted_buffer *restricted_buf = dmabuf->priv;
> > +	struct restricted_heap *heap = dma_heap_get_drvdata(restricted_buf->heap);
> > +
> > +	restricted_heap_memory_free(heap, restricted_buf);
> > +	kfree(restricted_buf);
> > +}
> > +
> > +static const struct dma_buf_ops restricted_heap_buf_ops = {
> > +	.attach		= restricted_heap_attach,
> > +	.detach		= restricted_heap_detach,
> > +	.map_dma_buf	= restricted_heap_map_dma_buf,
> > +	.unmap_dma_buf	= restricted_heap_unmap_dma_buf,
> > +	.begin_cpu_access = restricted_heap_dma_buf_begin_cpu_access,
> > +	.end_cpu_access	= restricted_heap_dma_buf_end_cpu_access,
> > +	.mmap		= restricted_heap_dma_buf_mmap,
> > +	.release	= restricted_heap_free,
> > +};
> > +
> >  static struct dma_buf *
> >  restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
> >  			 unsigned long fd_flags, unsigned long heap_flags)
> > @@ -66,6 +168,7 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
> >  	if (ret)
> >  		goto err_free_buf;
> >  	exp_info.exp_name = dma_heap_get_name(heap);
> > +	exp_info.ops = &restricted_heap_buf_ops;
> >  	exp_info.size = restricted_buf->size;
> >  	exp_info.flags = fd_flags;
> >  	exp_info.priv = restricted_buf;
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

