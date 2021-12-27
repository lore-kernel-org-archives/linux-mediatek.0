Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25992C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbDg2hNzpnYc3U7wLKbJadKtsY13Y3AoxYppfsfEPSs=; b=zDpqWARq2EoE5Z
	jAT7Bu2Ppv/EOZl+3uQT2YtQ5v1oiiGxFON2WlnDmpDYo6Qv0+j1IGt8Wx46lcs9rsSpfHRAOrSxP
	/BrWX2qIwEflRVR9aZYJqSchbjNo4Pyf+iJbjO6q1BJ5MtDpMIEKp7Qg9+DcF5LYxBkJPQcXGqE24
	Bl1nXuNgE2efKON6h5yNYYp5couQMx2fHHysARYoSNr4TXgGDkoMfmvBVym5/YgBuaowX98ea0Pv3
	SEj2LT5WqSfco2nfO31kU842KZBY35cmwnVVOUeqWyS6Br+d/brBIillJ7NI+3TOwpPubSqN6hUp0
	+/Dex8N/wjh9OW5fzKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1mgY-00GUll-0B; Mon, 27 Dec 2021 09:52:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1mgG-00GUfc-RM; Mon, 27 Dec 2021 09:52:38 +0000
X-UUID: 50d65b0cd1764830a75fd3a155e0e92a-20211227
X-UUID: 50d65b0cd1764830a75fd3a155e0e92a-20211227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1143627550; Mon, 27 Dec 2021 02:52:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 01:52:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 27 Dec 2021 17:52:27 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 27 Dec 2021 17:52:27 +0800
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
CC: Bo Song <bo.song@mediatek.com>, Libo Kang <libo.kang@mediatek.com>,
 jianjiao zeng <jianjiao.zeng@mediatek.com>, mingyuan ma
 <mingyuan.ma@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>,
 <wsd_upstream@mediatek.com>, Guangming <Guangming.Cao@mediatek.com>
Subject: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
Date: Mon, 27 Dec 2021 17:51:02 +0800
Message-ID: <20211227095102.6054-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217094104.24977-1-guangming.cao@mediatek.com>
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_015236_916408_B6DF07F8 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Guangming <Guangming.Cao@mediatek.com>

Add a size check for allcation since the allocation size is
always less than the total DRAM size.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
---
v2: 1. update size limitation as total_dram page size.
    2. update commit message
---
 drivers/dma-buf/dma-heap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 56bf5ad01ad5..e39d2be98d69 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	struct dma_buf *dmabuf;
 	int fd;
 
+	if (len / PAGE_SIZE > totalram_pages())
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
