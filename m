Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4598FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbDg2hNzpnYc3U7wLKbJadKtsY13Y3AoxYppfsfEPSs=; b=G6p1gyns1/2zKU
	B/EwjWS3U2fAnvaLBNgg0P655/0Vjt4sDTCBOb7khFiY9R+6/l4dOO6UjoDae7lpr7dgrV9GJm3sG
	pRNeqGf46nmsOkW1e+kuCvrIkXszlMCTq6IlBExZugzDqT3vG78LJJPRsRRK0jvE9GOtsVIoZDC9G
	irbx0A9az8w6OSBo3QtS0f1xFmUVTg68StAbgu9GCZOZUwgSnEqpp1HE6ZAeUzpkJhVv9WK4+9j8L
	Y9IHp316z13EN2wGFYHCMxWmt3OD7b1hzk//9pMQEV6kpWUFrx+NSOn5Gmxr844u3avd6t0FsRyQV
	ClY3FFrvIZxSBw9xo/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1mkQ-00GVMc-Jv; Mon, 27 Dec 2021 09:56:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1mkE-00GVKd-Fu; Mon, 27 Dec 2021 09:56:43 +0000
X-UUID: 20974a00fc8148f0965539b96385298b-20211227
X-UUID: 20974a00fc8148f0965539b96385298b-20211227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 841801810; Mon, 27 Dec 2021 02:56:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 01:46:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 27 Dec 2021 17:46:34 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 27 Dec 2021 17:46:33 +0800
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
Date: Mon, 27 Dec 2021 17:47:16 +0800
Message-ID: <20211227094716.5870-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_015642_548316_868E7DF4 
X-CRM114-Status: UNSURE (   9.46  )
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
