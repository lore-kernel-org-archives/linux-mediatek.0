Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65LGSiSosTIAwiGSModP7lNjJm3R4Pa8YaR9799BbV8=; b=pLRkw9UxceQkvw
	OhDu8QXB79Gik08QD9M4D7VxmMAY1WGRCPoprYHWFfbz6YI+fXIxbbsfXvXYcqwKJs3txHEwgsHQc
	DvYagclt62337FPq3RTRlpovYgBbU6Eiq1XzGejFWggRr7qluIT0IY7Tbar5/BzU/mewp28N0qBe7
	HNICwrpWsoSbE7nJ8TCw9BuH/2ERLqM72nvAuefoiQuUSAR/9tHctN86StxzHL3grBcxAsvqKnnVJ
	WbUtri3NhyHG1fTtnoA+tR3W6svz/AmX2d7LMtX25PSiB2ZanRDbxwpAqZ5T3+/k8QIptBc6hTYMv
	8/TBkTI6K/4QYAcm3Gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7zcM-005x3k-NU; Thu, 13 Jan 2022 12:54:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7zRv-005t7G-QS; Thu, 13 Jan 2022 12:43:30 +0000
X-UUID: ea62b4b834ec40cbafa6ae23b6c4fe36-20220113
X-UUID: ea62b4b834ec40cbafa6ae23b6c4fe36-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1973514974; Thu, 13 Jan 2022 05:43:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 04:33:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 20:33:17 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 13 Jan 2022 20:33:16 +0800
From: <guangming.cao@mediatek.com>
To: <sumit.semwal@linaro.org>
CC: <benjamin.gaignard@linaro.org>, <bo.song@mediatek.com>,
 <brian.starkey@arm.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <jianjiao.zeng@mediatek.com>, <john.stultz@linaro.org>, <labbott@redhat.com>, 
 <libo.kang@mediatek.com>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <lmark@codeaurora.org>, <matthias.bgg@gmail.com>, <mingyuan.ma@mediatek.com>, 
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>, Guangming
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Date: Thu, 13 Jan 2022 20:34:06 +0800
Message-ID: <20220113123406.11520-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_044327_899106_1D893349 
X-CRM114-Status: GOOD (  12.31  )
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

From: Guangming <Guangming.Cao@mediatek.com>

Add a size check for allocation since the allocation size is
always less than the total DRAM size.

Without this check, once the invalid size allocation runs on a process that
can't be killed by OOM flow(such as "gralloc" on Android devices), it will
cause a kernel exception, and to make matters worse, we can't find who are using
so many memory with "dma_buf_debug_show" since the relevant dma-buf hasn't exported.

To make OOM issue easier, maybe need dma-buf framework to dump the buffer size
under allocating in "dma_buf_debug_show".

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
---
v3: 1. update patch, use right shift to replace division.
    2. update patch, add reason in code and commit message.
v2: 1. update size limitation as total_dram page size.
    2. update commit message
---
 drivers/dma-buf/dma-heap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 56bf5ad01ad5..1fd382712584 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,6 +55,16 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	struct dma_buf *dmabuf;
 	int fd;
 
+	/*
+	 * Invalid size check. The "len" should be less than totalram.
+	 *
+	 * Without this check, once the invalid size allocation runs on a process that
+	 * can't be killed by OOM flow(such as "gralloc" on Android devices), it will
+	 * cause a kernel exception, and to make matters worse, we can't find who are using
+	 * so many memory with "dma_buf_debug_show" since the relevant dma-buf hasn't exported.
+	 */
+	if (len >> PAGE_SHIFT > totalram_pages())
+		return -EINVAL;
 	/*
 	 * Allocations from all heaps have to begin
 	 * and end on page boundaries.
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
