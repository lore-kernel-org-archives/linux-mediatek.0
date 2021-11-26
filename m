Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdQcZY+I4u7xiVHXm2PKYttSLRDX2+4dRllSs38bGDQ=; b=xD7DV19bpL2+IW
	PB+ypNEerWcC7TF5mlSf7hykeXK7MuZ9d18VVvc1d1WUtHnukbm47o0ZCG4xPFPyWT3diIfKEwcwZ
	cTpF3ZUH1hRBomXW44gc6fq3sSqeVxmZacRPl30W5iL5zFQkl5gDAs4jObxa+TKO5KENZ4ugzF/Gr
	4+VAIQsqVS6nD7GxB5uNf0WrqdqXcTHXY3/NAXyqy4XPj9zz4yponqZdTIPQb9PHpEXKXUftdsZ/X
	5cGXI2WDwNBcegBJ5Nc7VcbuO5+mB5JA8FiZewor/NSBQ5KahghYcIyL4F26V2Msy6fzBTQQFHDM7
	z4Itas/C6ITwddkHtHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqW5T-009Xvi-EM; Fri, 26 Nov 2021 07:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqW5P-009XuU-6H; Fri, 26 Nov 2021 07:56:02 +0000
X-UUID: 7b8978cdd591404ba38c03d510683f8e-20211126
X-UUID: 7b8978cdd591404ba38c03d510683f8e-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 117515573; Fri, 26 Nov 2021 00:55:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 23:48:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 26 Nov 2021 15:48:39 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Nov 2021 15:48:38 +0800
From: <guangming.cao@mediatek.com>
To: <greg@kroah.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <guangming.cao@mediatek.com>, <john.stultz@linaro.org>, <labbott@redhat.com>, 
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <robin.murphy@arm.com>, <stable@vger.kernel.org>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>,
 <kuan-ying.lee@mediatek.com>, Guangming <Guangming.Cao@mediatek.com>
Subject: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages
 free flow
Date: Fri, 26 Nov 2021 15:49:04 +0800
Message-ID: <20211126074904.88388-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YaB/JHP/pMbgRJ1O@kroah.com>
References: <YaB/JHP/pMbgRJ1O@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_235559_270284_CCBDEE0A 
X-CRM114-Status: GOOD (  13.31  )
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

For previous version, it uses 'sg_table.nent's to traverse sg_table in pages
free flow.
However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the number of
created entries in the DMA adderess space.
So, use 'sg_table.nents' in pages free flow will case some pages can't be freed.

Here we should use sg_table.orig_nents to free pages memory, but use the
sgtable helper 'for each_sgtable_sg'(, instead of the previous rather common
helper 'for_each_sg' which maybe cause memory leak) is much better.

Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order pages if available")
Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Cc: <stable@vger.kernel.org> # 5.11.*
---
v4: Correct commit message
    1. Cc stable@vger.kernel.org in commit message and add required kernel version.
    2. Add reviewed-by since patch V2 and V4 are same and V2 is reviewed by Robin.
    3. There is no new code change in V4.
V3: Cc stable@vger.kernel.org
    1. This patch needs to be merged stable branch, add stable@vger.kernel.org
       in mail list.
    2. Correct some spelling mistake.
    3. There is No new code change in V3.
V2: use 'for_each_sgtable_sg' to 'replece for_each_sg' as suggested by Robin.

---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..8660508f3684 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
-	for_each_sg(table->sgl, sg, table->nents, i) {
+	for_each_sgtable_sg(table, sg, i) {
 		struct page *page = sg_page(sg);
 
 		__free_pages(page, compound_order(page));
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
