Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F94C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 17:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF856109D
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 17:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FF856109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JPtJUkRzpv6l5d+bjFkYs0WAMSUHGLG/0Ae+Cy6WJE=; b=BTyhr37WfX/o84
	SlxSOiCvDCiBJ+VAIx4/tmTZQXe19NqMjz8VvpMX0xib2lMywSEY1TFUiYm0kIvGa1lyRja/HXbPU
	Fv0f6pYmNbotHeXTAOso3tHEdWCzIsyoART4Z15nL5Iwmxrj/xRKfeklx1JuJRsA+TsJN737h7dQe
	2Uf4dWARODuZXcEO6n+gaWIg19lIofOIBLN6UrfEoIOvRmzPSfusJP3fd+yutv0WBrsvuELYnjDQ0
	N9QcctIPbIHCl7jkfit/DxaX7HHUGgQzTgdoJNpyI/FfrlxbMbIIs5K3dDEEvZvvMpbM4lkjRHlHr
	WlNC7khGG425KZq+5d0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfQSH-002dDh-EJ; Tue, 26 Oct 2021 17:41:45 +0000
Received: from mxout01.lancloud.ru ([45.84.86.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfQQY-002cQh-DU; Tue, 26 Oct 2021 17:40:01 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru B67452093220
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
Date: Tue, 26 Oct 2021 20:39:41 +0300
Message-ID: <20211026173943.6829-21-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211026173943.6829-1-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_103958_654615_7192F273 
X-CRM114-Status: GOOD (  12.68  )
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

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/xhci-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c53f6f276d5c..d2dc8d9863ee 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 
 	irq = platform_get_irq_byname_optional(pdev, "host");
-	if (irq < 0) {
+	if (irq <= 0) {
 		if (irq == -EPROBE_DEFER)
 			return irq;
 
@@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
+		if (!irq)
+			return -EINVAL;
 	}
 
 	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
-- 
2.26.3

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
