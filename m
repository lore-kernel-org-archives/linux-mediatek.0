Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=imdlG+xiHBWsYtYuHTdkVOEtxSFk+Kbuvul0U/C1/XI=; b=dkQjao6IwIZxXz
	E2+TklJVKJHUbzaLivvZ6ExVjgVdUkCmsfd8K5E6xnogfk6pwgwoqRQyqjgbVFVtVJUeYC2tpD5aJ
	uTvBUAIDoO26s2Lgv5f77cEsPSs9VGQV19SKuII68xVcVkjINFl4RAq5HPJAJM1jdC0sUqw/fo8zq
	J+0Bw8w373dT5wbIHs8UIdNnCPbgO+IopfpUGRJSpzfMdFHSTe+VHQr56LWdCuQZK4L55nfmfqk7B
	UZTF6hGrDyHRzeyPyC5tYuHRNg4rLtFPaESr9fc8JFGmwjrWZ4kfonLDDVlGoZjfdN3BuADbOp/Nh
	7boC8QZs18c0HAAHGWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvDlJ-00F8d7-Ml; Thu, 09 Dec 2021 07:22:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvDl4-00F8ZH-EZ; Thu, 09 Dec 2021 07:22:29 +0000
X-UUID: ddc741205b664e25a51a39c8b68b9cfb-20211209
X-UUID: ddc741205b664e25a51a39c8b68b9cfb-20211209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1426974652; Thu, 09 Dec 2021 00:22:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 23:22:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 15:22:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 9 Dec 2021 15:22:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Eddie
 Hung" <eddie.hung@mediatek.com>, Yun-Chien Yu <yun-chien.yu@mediatek.com>
Subject: [PATCH] usb: xhci: skip re-check pending port event if hibernated
Date: Thu, 9 Dec 2021 15:22:18 +0800
Message-ID: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_232226_517011_629FFC5B 
X-CRM114-Status: GOOD (  11.02  )
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

When xHCI controller hibernated, the root hub lost power, if controller
support Port Power Control (PPC), PP is not set at xhci_resume() and
set by hub_reset_resume() later, so no need check pending port event.
If PPC is not supported, device is disconneced, seems do not send out
U3 LFPS wake signal, no need re-check again and drop 120ms delay to
save resume time.

Reported-by: Yun-Chien Yu <yun-chien.yu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 902f410874e8..686d8e6f03f6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1235,7 +1235,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		 * the first wake signalling failed, give it that chance.
 		 */
 		pending_portevent = xhci_pending_portevent(xhci);
-		if (!pending_portevent) {
+		if (!pending_portevent && !hibernated) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
