Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D853C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhch3db6MGt/Re3ze76zv4VkC3b6owjpMbW4P7IKS+w=; b=I+51+D83Tp5Oho
	80K+dtRvsL202JBdNAIHK6gOqchGqB76lmzb8Z2Ix3yeZhUdfg/rlTt/YjkqKhp/wRXHzyzRW/GuE
	HDVRnc4kNM1T5GNKQzEvsuwasylCRIFPck5D2yTHNUVBs9dMg1RaLxs4SNKd+FENUlnNKZOhS7/2j
	sBr0PeXnCFzCpMl/jrxA4hozSLItJhFwr+d2A7hfC7G7kaofrdbU5s9yaUTzFAqVGfHlgw8rpbDNy
	iMbm/6dVioGJhH2aK9CfPT/1e9rm3qPP+MKKMVRdVhmZ67RpFRE82koSOAaUHKUI6RDAn9HGATiqt
	S2BYajJ7IkXs0/lVoOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqF8H-007ieG-0B; Thu, 25 Nov 2021 13:49:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqF82-007iZ1-G0; Thu, 25 Nov 2021 13:49:35 +0000
X-UUID: 383148f9af4e49c183548f9d5a6ba252-20211125
X-UUID: 383148f9af4e49c183548f9d5a6ba252-20211125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927555217; Thu, 25 Nov 2021 06:49:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 05:49:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 21:49:27 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 25 Nov 2021 21:49:26 +0800
From: <guangming.cao@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <guangming.cao@mediatek.com>, <john.stultz@linaro.org>, <labbott@redhat.com>, 
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, Guangming <Guangming.Cao@mediatek.com>
Subject: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table release flow
Date: Thu, 25 Nov 2021 21:49:51 +0800
Message-ID: <20211125134951.62002-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_054934_561959_C69CB564 
X-CRM114-Status: GOOD (  11.08  )
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

Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
sg_table to free sg_table.
Use (for_each_sg) maybe will casuse some pages can't be freed
when send wrong nents number.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
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
