Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4B8C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F11B61039
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F11B61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAr/Fni3s8G5wbfBzn1lu134wT48hVE7AUCRsNJUSbM=; b=M/Op9K4NK2ltCu
	G4OK/EY5gDFFj7WACZs+mukAvZp88KWs08Xu+fU4gDNoLv3HY9c47I198LNvepzrmfCOqSVsjHaoY
	DdThDp9DoKsK3R9+T4DEw4B2coFjJxRQU2Q2ZpircimkKAuSLKGROvYP2LQbTmRXKf0FaEkuNQdS0
	gptfC/g6o4jWKx61y4uLeQOSeWhQ1YCrgGCeMiTtA875yQfwdkmwlDtF6FtNpgzSuSLRsJnAv/4FM
	uHAFOkvekGGxRfaQwprMZwtfqI9KzZNA8jm/+9KUpnHrrBGvCHDKKsJy8ZO30P5aCXkfun2DbWJS8
	jV3GRVBz1Ymq5NF4q2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKuqi-001Grn-Vv; Tue, 31 Aug 2021 03:54:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKuqC-001GkN-7p; Tue, 31 Aug 2021 03:53:45 +0000
X-UUID: 18d39a8935644af59212fa88ca7ec5d9-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JCdRt+uZc+mwIztiZuv3cr7/l1oRjxzYihOKX3FYxpM=; 
 b=c/QrTw6WazkqCSCxAazRvmKCeOcBdXzHikajsNvXif/uOwN0X+AyVQ+y2a2sOYgxnQxx9Z0qLXnYh5wEbGTOasQlLuSFUTpDBMI3fTnoWxYvORJzbYe8AiUNgfqiCcu01B3/a6a8dhh0kY/rFAODJQSI9QIarqdHNdybia8myok=;
X-UUID: 18d39a8935644af59212fa88ca7ec5d9-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 888466023; Mon, 30 Aug 2021 20:53:36 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 20:43:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 11:43:32 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 31 Aug 2021 11:43:31 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <john.stultz@linaro.org>, <labbott@redhat.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma-buf: heaps: remove duplicated cache sync
Date: Tue, 31 Aug 2021 11:44:05 +0800
Message-ID: <20210831034405.41916-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
References: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_205340_336242_49C3AD45 
X-CRM114-Status: GOOD (  21.63  )
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

> Am 30.08.21 um 12:01 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> >
> > Current flow, one dmabuf maybe call cache sync many times if
> > it has beed mapped more than one time.
>
> Well I'm not an expert on DMA heaps, but this will most likely not work 
> correctly.
>
All attachments of one dmabuf will add into a list, I think it means dmabuf
supports map more than one time. Could you tell me more about it?

> > Is there any case that attachments of one dmabuf will points to
> > different memory? If not, seems do sync only one time is more better.
>
> I think that this can happen, yes.
>
> Christian.
>
Seems it's a very special case on Android, if you don't mind, could you
tell me more about it?

>
> >
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > ---
> >   drivers/dma-buf/heaps/system_heap.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 23a7e74ef966..909ef652a8c8 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -162,9 +162,10 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> >   		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
> >   
> >   	list_for_each_entry(a, &buffer->attachments, list) {
> > -		if (!a->mapped)
> > -			continue;
> > -		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +		if (a->mapped) {
> > +			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +			break;
> > +		}
> >   	}
> >   	mutex_unlock(&buffer->lock);
> >   
> > @@ -183,9 +184,10 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> >   		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> >   
> >   	list_for_each_entry(a, &buffer->attachments, list) {
> > -		if (!a->mapped)
> > -			continue;
> > -		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +		if (!a->mapped) {
> > +			dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +			break;
> > +		}
> >   	}
> >   	mutex_unlock(&buffer->lock);
> >   
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
