Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C45C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHOpktd5j+schtioHDAiqwFMZBNX59sxxCcnr68QsDo=; b=3PSj3uRELwTA1G
	jlV8JC7iTdAftdpQa5ejLi9CxMUZUPoyDGsVh9HvjdhuWdcT7zkDdui8Ppgpuvo0rJMjy+1Ju/DLv
	EtY1oz6HKJNcB+O757pLmG338S495YPcZd6YlL81c2fJ99ByRPG1fk2KwMKffp34TnI3eI0VnUs/V
	7yVa4g1+d7Kzx2RhoDYE8Xhx6jM47DmM6gYybRP4gCaMv8fTrQcE5J/1p8WMJavcslCnMcgCA/C+t
	r0xDPwuD4UKU190J7X0oevQ/iiq+irV2M24YM1TFe9Sqz/aaGRQeYSHObSozu5uiTgWaknmlIKAML
	y03OPNr8z20kP+G/6HRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARhv-009I6t-KC; Thu, 20 Jan 2022 07:18:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARht-009I68-19; Thu, 20 Jan 2022 07:18:06 +0000
X-UUID: 098846d287944148ae2ec437733ab97d-20220120
X-UUID: 098846d287944148ae2ec437733ab97d-20220120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 526460845; Thu, 20 Jan 2022 00:18:02 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 23:08:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 20 Jan 2022 15:07:53 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 20 Jan 2022 15:07:52 +0800
From: <guangming.cao@mediatek.com>
To: <john.stultz@linaro.org>
CC: <benjamin.gaignard@linaro.org>, <bo.song@mediatek.com>,
 <caoguangming34@gmail.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <jianjiao.zeng@mediatek.com>, <labbott@redhat.com>, <libo.kang@mediatek.com>, 
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <michael.j.ruhl@intel.com>,
 <mingyuan.ma@mediatek.com>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>, Guangming
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v5] dma-buf: system_heap: Add a size check for allocation
Date: Thu, 20 Jan 2022 15:08:50 +0800
Message-ID: <20220120070850.95495-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
References: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_231805_085905_5B93791D 
X-CRM114-Status: GOOD (  12.77  )
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
index 23a7e74ef966..459dc18bc4a2 100644
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
+	if (len >> PAGE_SHIFT > totalram_pages())
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
