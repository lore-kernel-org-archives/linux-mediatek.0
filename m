Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AD2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 06:25:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FB560F9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 06:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90FB560F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9+O1ib/mwTGuAhEm9Ei8hjCsXL9oOiJ1iHUUCKdto4=; b=REUWjAgL2r4zBm
	s89sDxbqP82Bm5xAwhbtqssJd4u3in1ZsNQo6UP5rDXUe4SpVokOqFMABeZjRYe5Y9+bDxh0I67wt
	m8/r7DfQ+VeBA7mksaYNCNY8EqyLLZcv4tc0wk2RpFIXYiSO1pe2HX1ULx2+ftRtl3bAfs47tBPtd
	qHbeI0j5Ar1qjD7FpLXSPmKTSzeOec/Vmv4VefI14eQfq3nM1cvxNxE5+7P+mBXgAJypfoAIfMH8V
	KORikZfU+cUZvH0VhCf/a9kOyguBQgzalThCoWXp52zBtDuQjmGcAth18nzQtbtXsrAu5kkeCziFA
	y4wHJPI/O0cvCA8ToEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcM5B-00EJvk-SK; Mon, 18 Oct 2021 06:25:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcM56-00EJuH-PT; Mon, 18 Oct 2021 06:25:12 +0000
X-UUID: ea8bd886cdff41e4af9c8e49f4fd7151-20211017
X-UUID: ea8bd886cdff41e4af9c8e49f4fd7151-20211017
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1123718799; Sun, 17 Oct 2021 23:25:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Oct 2021 23:25:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Oct 2021 14:25:03 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 18 Oct 2021 14:25:02 +0800
From: <guangming.cao@mediatek.com>
To: <daniel@ffwll.ch>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <guangming.cao@mediatek.com>, <hridya@google.com>, <isaacm@codeaurora.org>,
 <john.stultz@linaro.org>, <labbott@redhat.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <sspatil@google.com>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma-buf: Add support for mapping buffers with DMA
 attributes
Date: Mon, 18 Oct 2021 14:25:04 +0800
Message-ID: <20211018062504.116652-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
References: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_232508_875610_9DCF641D 
X-CRM114-Status: GOOD (  32.31  )
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Tue, 2021-08-31 at 14:47 +0200, Daniel Vetter wrote:
> On Mon, Aug 30, 2021 at 10:39:11AM +0800, guangming.cao@mediatek.com
> wrote:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > 
> > When mapping the memory represented by a dma-buf into a device's
> > address space, it might be desireable to map the memory with
> > certain DMA attributes. Thus, introduce the dma_mapping_attrs
> > field in the dma_buf_attachment structure so that when
> > the memory is mapped with dma_buf_map_attachment, it is mapped
> > with the desired DMA attributes.
> > 
> > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> > Signed-off-by: Sandeep Patil <sspatil@google.com>
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> Can you pls include the code that's going to use this here too?
> 
> At a glance all the attributes you might want to set are supposed to
> be
> under the control of the exporter, not the importer.
> -Daniel
> 
Hi Daniel,

Sorry for the late. Currently I couldn't upload the coding going to use
this part because of some miscellaneous reasons.

Just as I said in commit message, for dma_heap, users can't skip cache
sync or other opetrations when map iova[dma_buf_map_attachment] by
fill (struct dma_buf_attachment).dma_map_attrs, it's not dma_map_attrs
expected(link: 
https://github.com/torvalds/linux/blob/master/Documentation/core-api/dma-attributes.rst#dma_attr_skip_cpu_sync
).

Correspondingly, if they use dma_buf to map iova[dma_buf_map_attrs],
they will not meet this issue. So, I think it's a design flaw for
dma_heap.

BRs!
Guangming
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
> >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> >  include/linux/dma-buf.h             | 3 +++
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-
> > buf/heaps/cma_heap.c
> > index 0c05b79870f9..2c9feb3bfc3e 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -99,9 +99,10 @@ static struct sg_table
> > *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> >     struct sg_table *table = &a->table;
> > +   int attrs = attachment->dma_map_attrs;
> >     int ret;
> >  
> > -   ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +   ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >     if (ret)
> >             return ERR_PTR(-ENOMEM);
> >     a->mapped = true;
> > @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >                                enum dma_data_direction direction)
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> > +   int attrs = attachment->dma_map_attrs;
> >  
> >     a->mapped = false;
> > -   dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +   dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> > buf/heaps/system_heap.c
> > index 23a7e74ef966..fc7b1e02988e 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -130,9 +130,10 @@ static struct sg_table
> > *system_heap_map_dma_buf(struct dma_buf_attachment *attac
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> >     struct sg_table *table = a->table;
> > +   int attrs = attachment->dma_map_attrs;
> >     int ret;
> >  
> > -   ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +   ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >     if (ret)
> >             return ERR_PTR(ret);
> >  
> > @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >                                   enum dma_data_direction
> > direction)
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> > +   int attrs = attachment->dma_map_attrs;
> >  
> >     a->mapped = false;
> > -   dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +   dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index efdc56b9d95f..4d650731766e 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -379,6 +379,8 @@ struct dma_buf_attach_ops {
> >   * @importer_ops: importer operations for this attachment, if
> > provided
> >   * dma_buf_map/unmap_attachment() must be called with the dma_resv
> > lock held.
> >   * @importer_priv: importer specific attachment data.
> > + * @dma_map_attrs: DMA attributes to be used when the exporter
> > maps the buffer
> > + * through dma_buf_map_attachment.
> >   *
> >   * This structure holds the attachment information between the
> > dma_buf buffer
> >   * and its user device(s). The list contains one attachment struct
> > per device
> > @@ -399,6 +401,7 @@ struct dma_buf_attachment {
> >     const struct dma_buf_attach_ops *importer_ops;
> >     void *importer_priv;
> >     void *priv;
> > +   unsigned long dma_map_attrs;
> >  };
> >  
> >  /**
> > -- 
> > 2.17.1
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
