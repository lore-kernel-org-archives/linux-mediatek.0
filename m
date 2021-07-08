Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D5C07E9C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABCB61418
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AABCB61418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHh/NjtqdAvd0tB0df0gnl3EAI3fWOuEX+rmt4ndjbg=; b=IrNLmmFIk1ZCgl
	d1Z4nb5b4wSaa3GSMBMrxEVk5ReMOMbFphRT1hbmpq/fK2Z82FGdxv4HRgCGr1gln6dXQdpMUGQDi
	l2tNO0ynCi8GX1iNtJF59+gcCvTBkbxu4FTreTmXWUKwTf2xdtC8BQmpdJW9KpUCy7PiNHUqqpq9z
	BYo1W/jbFG42rNZKRnBtHfhB1Ck1exsYusskAP1tOjf/7J1rPM/z3kGwYUc0p6aj0DaGIMgyiJgoO
	E94i09gLbigKR0z1KlrkSFVcqFlgS1kVykjRO4WA0xblCkacz2TPtH303PNporPIu1fC1lBMSO8Ev
	dTfhXgtdMtdCzbFTk00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1R3F-00Gai1-3Y; Thu, 08 Jul 2021 10:14:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1R3B-00Gafo-2o; Thu, 08 Jul 2021 10:14:35 +0000
X-UUID: a7982f05c88b4ebd90928fb619d68231-20210708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BdKf2p9ZqSn+V2IGWR+PNooNX2lJcGUJfQegrqEiVdM=; 
 b=b9KBXnQhFfVkALohUmv/2LnhbOt1iUi904ILwVtQ1tYHLOaWrXl1XYroC752ZyZqDtJex2kTKqACUwgbm3cX8vQjTL97yy4w4zDXL8YDUxLp+ybU6dYhlz1T18HznDFrejFTF7tLeIyBkuB8OEs6eyMkf03jlsC5iSjlHijj/DE=;
X-UUID: a7982f05c88b4ebd90928fb619d68231-20210708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 8124391; Thu, 08 Jul 2021 03:14:27 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 03:14:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 18:14:23 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 MTKCAS06.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 8 Jul 2021 18:14:22 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark
 <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-heap: Let dma heap use dma_map_attrs to map & unmap iova
Date: Thu, 8 Jul 2021 18:14:21 +0800
Message-ID: <20210708101421.9101-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 879CEDBA69CA375324736404F3170BD4C1626A51C81092302B49131EC5ACEC612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_031434_444020_C3F3617D 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

For dma-heap users, they can't bypass cache sync when map/unmap iova
with dma heap. But they can do it by adding DMA_ATTR_SKIP_CPU_SYNC
into dma_alloc_attrs.

To keep alignment, at dma_heap side, also use
dma_buf_attachment.dma_map_attrs to do iova map & unmap.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
 drivers/dma-buf/heaps/system_heap.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..2c9feb3bfc3e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -99,9 +99,10 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = &a->table;
+	int attrs = attachment->dma_map_attrs;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
 	a->mapped = true;
@@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attrs = attachment->dma_map_attrs;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
 }
 
 static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..fc7b1e02988e 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -130,9 +130,10 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = a->table;
+	int attrs = attachment->dma_map_attrs;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				      enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attrs = attachment->dma_map_attrs;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
 }
 
 static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
