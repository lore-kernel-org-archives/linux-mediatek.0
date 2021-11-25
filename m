Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vTmKA3iwhSLHXaZwN5i0JcHAaiC3MNkdT1+PexC16fc=; b=wIBpulH4p0jbcF
	SWg570bgGSdENJk2c8fzdftc2Q1f6efPYxUqKRnJHgnvtfqhufWER1a5K8X/P5dXgNPpRaU4Y/Sma
	E21SInIp04TTbGbhJZ3o9qTkoDL3eVc5IH9MQ0HbQs5YbM1nr+RZc/axiaGmT+yd6tFhN3YSICOM+
	iRZTCIcK44RePCOFka0HVMDaJctdKK1YrzwlIQP2c+LAGZ/MMh4sCzSWiBiudvx/4DDQuH+wxhn1R
	xoaOCm85lbvdtBQALBg4Tp4C87zPYF1UQgeKCVBaa08iiaRQSiTr8s7HPgRZNYMhi3hguR6KvHZ3l
	QcEhdK7ApmB4tlRIZJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqE94-007SnB-5F; Thu, 25 Nov 2021 12:46:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqE8l-007ShP-Hh; Thu, 25 Nov 2021 12:46:17 +0000
X-UUID: 0b7910cc1ca54b798aa5fd100cb9fdc9-20211125
X-UUID: 0b7910cc1ca54b798aa5fd100cb9fdc9-20211125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 691461901; Thu, 25 Nov 2021 05:46:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 04:46:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 20:46:02 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 25 Nov 2021 20:46:01 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, "Laura
 Abbott" <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, "John
 Stultz" <john.stultz@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, "moderated
 list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Guangming <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma_heap: use sg_table.orig_nents in sg_table release flow
Date: Thu, 25 Nov 2021 20:46:25 +0800
Message-ID: <20211125124626.60068-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_044615_622133_6C730C02 
X-CRM114-Status: GOOD (  10.81  )
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

Use (sg_table.orig_nents) rather than (sg_table.nents) to traverse
sg_table to free sg_table.
Use (sg_table.nents) maybe will casuse some pages can't be freed.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..ce10d4eb674c 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
-	for_each_sg(table->sgl, sg, table->nents, i) {
+	for_each_sg(table->sgl, sg, table->orig_nents, i) {
 		struct page *page = sg_page(sg);
 
 		__free_pages(page, compound_order(page));
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
