Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 03:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqW58ZHy4g7P9u3/YOU76LTc9H0D7jAQtp00SdpX9k8=; b=RQzY/dnugSlhDa
	m46zSnzW5DmTBVXcnl3Wia+uFsi6BOoaJNKXKpNsUWSgelcIHMfhO9tnCDLPfJIlkluZJFCXH5bD/
	02S+NB6XhywLhmqWu6eTZo8O8JTLEEfA9153KJQtr+fO3Wk5EDC/1ad3YQ7KxiZYgmclXEPuxS0Du
	LnmJzL6xRjY3Kd43LoQZdCkMuRHkCR4rCIbqtH5D3AYrzgNnImoQa9TIhkXic90dpbxer0uJb3xbs
	nqcWqtepGgk4f607BSH0Ii6tJ4AllnzbKPeAtLQWsSPsPEO9J9vURIZmjAY/fbvI+I7M36LsKVRz6
	zwKP6zpvyLu6+xZbzh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv9tX-00EoDH-Bm; Thu, 09 Dec 2021 03:14:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv9tA-00Eo6u-Eo; Thu, 09 Dec 2021 03:14:33 +0000
X-UUID: ae6d3e17f4b94180bc665d6b78bdd026-20211208
X-UUID: ae6d3e17f4b94180bc665d6b78bdd026-20211208
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1940876414; Wed, 08 Dec 2021 20:14:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 19:14:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 11:14:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 9 Dec 2021 11:14:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>
Subject: [PATCH 3/3] usb: mtu3: fix list_head check warning
Date: Thu, 9 Dec 2021 11:14:24 +0800
Message-ID: <20211209031424.17842-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_191432_520901_510A8360 
X-CRM114-Status: UNSURE (   7.35  )
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

This is caused by uninitialization of list_head.

BUG: KASAN: use-after-free in __list_del_entry_valid+0x34/0xe4

Call trace:
dump_backtrace+0x0/0x298
show_stack+0x24/0x34
dump_stack+0x130/0x1a8
print_address_description+0x88/0x56c
__kasan_report+0x1b8/0x2a0
kasan_report+0x14/0x20
__asan_load8+0x9c/0xa0
__list_del_entry_valid+0x34/0xe4
mtu3_req_complete+0x4c/0x300 [mtu3]
mtu3_gadget_stop+0x168/0x448 [mtu3]
usb_gadget_unregister_driver+0x204/0x3a0
unregister_gadget_item+0x44/0xa4

Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index c51be015345b..b6c8a4a99c4d 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -235,6 +235,7 @@ struct usb_request *mtu3_alloc_request(struct usb_ep *ep, gfp_t gfp_flags)
 	mreq->request.dma = DMA_ADDR_INVALID;
 	mreq->epnum = mep->epnum;
 	mreq->mep = mep;
+	INIT_LIST_HEAD(&mreq->list);
 	trace_mtu3_alloc_request(mreq);
 
 	return &mreq->request;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
