Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC933C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B0B6044F
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96B0B6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgnMkpuxesVs4+6EbpfjAateM+OuWTLOu5ouA94n8OU=; b=KpurgtsgKiq8L1
	yCYEnd3sWxBMD5g3JvaaU9xZTY8FneDn+HZZd07bJuNC9enPhlRI/H2Wo5v2rraeDLofCShQPlAOc
	eeGkjdy3V6azlj/CVWmWom6YP2PrZEGgdM7Y5oxv8pmd2DnjAeurIVVUPtxJ70GjorCq0HuzbuPIa
	eGxB2yQP2lcYg46g/uURNE9mNcBLGMz+Vq7uc9iiEadKYy/aVWfRbfAqIX8OyHPAwERaRma3ui3al
	+pxiBl6RzDO7eqlynHi7cSidNGmbiC7sl96KS8YYFUiZUD5kvR3OziuhB1oCVAEEs7BPZDzjqHTXr
	ZbYg3HGOkrhexJiaq/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meyNK-00GH1l-IT; Mon, 25 Oct 2021 11:42:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meyN6-00GGxA-8Y; Mon, 25 Oct 2021 11:42:34 +0000
X-UUID: 76296bbff3634440a2b936249d2a0906-20211025
X-UUID: 76296bbff3634440a2b936249d2a0906-20211025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 584739831; Mon, 25 Oct 2021 04:42:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 04:42:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Oct 2021 19:42:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 19:42:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Yun-Chien Yu <yun-chien.yu@mediatek.com>
Subject: [RFC PATCH] usb: xhci: skip re-check pending port event if hibernated
Date: Mon, 25 Oct 2021 19:42:09 +0800
Message-ID: <20211025114209.4047-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_044232_331108_5DD8257B 
X-CRM114-Status: GOOD (  11.65  )
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
index f3dabd02382c..a7a2bf5bc208 100644
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
