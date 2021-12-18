Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0FAC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8bDPaAWlN9NzbDEFknDzoHzOph5q0o9bnb9uhY57e0=; b=t4cIBo0Qob4T8g
	b5Wua7m8+hsrubm/FiVcKBenwTJhjsRhZZQPJ8dS3kFQgRndJr0Km16FiJTURNAtLqaYPkai9nG4q
	nJDKLFxNrcjWPt+cAj8aTIbbjNwPNOX2jJdqqYZ0Zxnn2ZErj8dxR9xJOA3bX63bMP0KB8NrnS54w
	HrAuKI5xHSfsj8cqnTtYJlJs/es6FaNmSv5e68PGjCpanJA3z36dPqt96sDHimmFAvIz9ZtfrRLev
	PkOZNiobloqa4SfrYy1lRjfb6hRj02O4wMkpyvcJry4yDizDGsDYVzZRjhJyxDxIkLwKtq5a9VMir
	xuOY2DeHEdrtgWDbwt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWTg-00DR2U-1p; Sat, 18 Dec 2021 09:58:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWTc-00DR05-NO; Sat, 18 Dec 2021 09:58:05 +0000
X-UUID: ab0e5bcbdf514d309abc68df78e5aae2-20211218
X-UUID: ab0e5bcbdf514d309abc68df78e5aae2-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 584510513; Sat, 18 Dec 2021 02:58:01 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 01:57:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 17:57:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 18 Dec 2021 17:57:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Eddie
 Hung" <eddie.hung@mediatek.com>, <stable@vger.kernel.org>, Yuwen Ng
 <yuwen.ng@mediatek.com>
Subject: [PATCH v2 3/4] usb: mtu3: fix list_head check warning
Date: Sat, 18 Dec 2021 17:57:48 +0800
Message-ID: <20211218095749.6250-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_015804_808516_8988EC24 
X-CRM114-Status: UNSURE (   8.25  )
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

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Cc: stable@vger.kernel.org
Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add Fixes and Cc suggested by Greg
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
