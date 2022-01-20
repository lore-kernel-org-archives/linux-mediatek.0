Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUEqy/l0VQPgVkLGtpIIwPxPCS4uglQXswFwGX82GcA=; b=sTPJjKT2v1++aY
	/lpLLNYCz/lyo9BbBLlXV35wFkJ0GuUa/oMqU00kXofNL3NCNSQHW+mh5AHGBy4iY4TLrxFCr/LDF
	2rkVtyWksZqbfseTOOlOQ+vFuThcqLo3wSyBZNifkknxZslEKPTudN8R9ZLNpwtSd0Lxm9/OKy5m6
	ghM2xukpItWv5AraKXZpMgaQesAMMnmFxZO6Bv9a6dNc9S/OiVT7ZQCSaj6Zs9i7EE4wqENwaMoh2
	tEfLnWBaMGDNZPVaP99NnFpCYXLHAfXDLc124Mtu8fgL7ynSlmMp6osaeRcqviADrA9DikqfhNunb
	JfBUadXshoPNqd7sP7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATBB-009wHt-1Y; Thu, 20 Jan 2022 08:52:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATB4-009wCk-Oo; Thu, 20 Jan 2022 08:52:22 +0000
X-UUID: 7cdba5cdbd494ac28ea34d09dff1d48d-20220120
X-UUID: 7cdba5cdbd494ac28ea34d09dff1d48d-20220120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1687681759; Thu, 20 Jan 2022 01:52:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 00:52:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 20 Jan 2022 16:52:01 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 20 Jan 2022 16:52:00 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <benjamin.gaignard@linaro.org>, <bo.song@mediatek.com>,
 <caoguangming34@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <guangming.cao@mediatek.com>, <jianjiao.zeng@mediatek.com>,
 <john.stultz@linaro.org>, <labbott@redhat.com>, <libo.kang@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <michael.j.ruhl@intel.com>,
 <mingyuan.ma@mediatek.com>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>, Guangming
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v6] dma-buf: system_heap: Add a size check for allocation
Date: Thu, 20 Jan 2022 16:52:59 +0800
Message-ID: <20220120085259.98147-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4f2631d3-0845-cae6-6fc0-9c00ce6301ce@amd.com>
References: <4f2631d3-0845-cae6-6fc0-9c00ce6301ce@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_005218_816432_99AE9AAC 
X-CRM114-Status: GOOD (  12.27  )
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

Add a size check for allocation since the allocation size should be
always less than the total DRAM size on system heap.
Adding this check can prevent comsuming too much time for invalid allocations.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/system_heap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..b65e597a742f 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -347,6 +347,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	/*
+	 * Size check. The "len" should be less than totalram since system_heap
+	 * memory is comes from system. Adding check here can prevent comsuming
+	 * too much time for invalid allocations.
+	 */
+	if (PFN_DOWN(len) > totalram_pages())
+		return ERR_PTR(-EINVAL);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
