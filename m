Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0A5C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE42261260
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE42261260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIZBrIjTAQ9R6MuRNF7jEA3/xX/NM3L5ORud9RtnKE4=; b=1RXcHGCG0PLkYY
	JAhdAD9+8Din8VZRjXOhjevr4qjBX/cASziRLe7ck0jZ+JfQ9AN9Mk0RxWY2lPaPy+yxVVSrXXzR6
	+8tcq0kbgY91aaQ/W+YFxJTIqMVjCn9LD+hfSyDB8/4/NfLpLODw4kBGgoR+fP1JXOTaWU2k5cov4
	d9/WPuv9/j1Ko6yUSJCvdvOuF4+9sNhnkPErlqWDnCG22KYEEVFI3yLUQB9P4mgieSnLV653j6S/Y
	J7o8GovYMgHBc7QvwncI9TR+sJ8UxTTo/b8F7ldeQoD+V3+PaMKh3QW4HMoEpR4uOt8rXSnencAx+
	OyRh4n3/ytbFETg3npkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3unQ-00HFXS-20; Thu, 15 Jul 2021 06:24:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3unC-00HFVA-ND; Thu, 15 Jul 2021 06:24:20 +0000
X-UUID: 17b40908c25c4fefa7bd5504358166da-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FdJEfNIhRevGn/F/LNRstNPMVmwpSKWT+XSRG+RptUo=; 
 b=XwcGYvS5eBEW2tM7yKQuXk4RNV6DmpPFDWGENSlPuFnEwQSJXNoRyAOCwMMeYXtRYceq1lpEl36aLbSJSBpnvnuru//JIBbV0w3pt04fCU3tTl5FdEgEkWfDHVNhEtI7E0bEIe2vTgoOK97xYsA1o1YhDZiXATIDr8zLsEFJvy8=;
X-UUID: 17b40908c25c4fefa7bd5504358166da-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1414464902; Wed, 14 Jul 2021 23:24:13 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 23:24:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 14:24:08 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 15 Jul 2021 14:24:07 +0800
From: <guangming.cao@mediatek.com>
To: <guangming.cao@mediatek.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <john.stultz@linaro.org>, <labbott@redhat.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-heap: Let dma heap use dma_map_attrs to map & unmap iova
Date: Thu, 15 Jul 2021 14:24:05 +0800
Message-ID: <20210715062405.98932-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708101421.9101-1-guangming.cao@mediatek.com>
References: <20210708101421.9101-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D20BB1BADB131EDFEA63427CEE31F7C3446A8B841868204EDF379FDAF8A9A92E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_232418_815149_B13CEFF5 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu, 2021-07-08 at 18:14 +0800, guangming.cao@mediatek.com wrote:

Hi Sumit, Christian, Matthias,

gentle ping for this patch :)

BRs!
Guangming

> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> For dma-heap users, they can't bypass cache sync when map/unmap iova
> with dma heap. But they can do it by adding DMA_ATTR_SKIP_CPU_SYNC
> into dma_alloc_attrs.
> 
> To keep alignment, at dma_heap side, also use
> dma_buf_attachment.dma_map_attrs to do iova map & unmap.
> 
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
>  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-
> buf/heaps/cma_heap.c
> index 0c05b79870f9..2c9feb3bfc3e 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -99,9 +99,10 @@ static struct sg_table
> *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = &a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction,
> attrs);
>  	if (ret)
>  		return ERR_PTR(-ENOMEM);
>  	a->mapped = true;
> @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct
> dma_buf_attachment *attachment,
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
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> buf/heaps/system_heap.c
> index 23a7e74ef966..fc7b1e02988e 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -130,9 +130,10 @@ static struct sg_table
> *system_heap_map_dma_buf(struct dma_buf_attachment *attac
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction,
> attrs);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct
> dma_buf_attachment *attachment,
>  				      enum dma_data_direction
> direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attrs = attachment->dma_map_attrs;
>  
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
>  }
>  
>  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf
> *dmabuf,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
