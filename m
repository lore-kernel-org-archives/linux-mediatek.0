Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB907C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FEBfCwRmoWJAO0E8fVEgOoH2ZEnJP65kigjujwRZhVA=; b=p90d4AxRHxBEjG
	S4NBEOtarnM1cEfOY+CbtRJWuRP4v7ROPI3XwqLiuJZc1IvKUNF5REvkTWpaBeaQ2GPXQDy3uc9Mg
	3zUOhQINxpeoUAVnFfxc2D2KMC9HIGB0a+7rdmS/+6dQSdIaEE3AE6SBUrOaOoH58FDwRGv5h6tH0
	E9OpiktvuAxhIrE73cU38nlSDUsRisVnPhxnpSVUYilw2nDZmcRf+TY/W2I63wAH7o/RaW7aZcSRc
	1L6hZqdqnGTncFfSyT+2U5D0pI7HalWyXUCzN4oMVCQM5pSfyOdrPKb3lG/qhj/orddALCOyEiBZe
	7NuE7oXzwHALefSYpO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6TeW-007WNy-4l; Sun, 09 Jan 2022 08:34:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6TeR-007WMq-BY
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 08:34:10 +0000
X-UUID: fd71db189b4c465cb65975687ec28c60-20220109
X-UUID: fd71db189b4c465cb65975687ec28c60-20220109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 34252494; Sun, 09 Jan 2022 01:34:00 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 00:33:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 9 Jan 2022 16:33:51 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 9 Jan 2022 16:33:50 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Leon
 Yen" <leon.yen@mediatek.com>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: sdio: disable interrupt in mt76s_sdio_irq
Date: Sun, 9 Jan 2022 16:33:50 +0800
Message-ID: <a8a84184942de2214979f46482c77c5921c40af5.1641716611.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_003407_427194_1FC36EE1 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Sean Wang <sean.wang@mediatek.com>

It is unnecessary to keep the interrupt enabled in mt76s_sdio_irq because
the driver is already aware of the interrupt, schedules the
mt76s_txrx_worker to handle the corresponding actions, and eventually,
the interrupt would be enabled again when mt76s_txrx_worker finishes its
work.

So we can safely disable the interrupt in mt76s_sdio_irq as soon as
possible to increase the CPU productivity by dropping the redundant
interrupt triggers.

Note that sdio lock acquired/released would be handled in sdio_irq_work
at mmc driver so we don't take care in mt76s_sdio_irq at function driver.

Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index f2b46975d831..488ad7734d85 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -349,6 +349,7 @@ void mt76s_sdio_irq(struct sdio_func *func)
 	    test_bit(MT76_MCU_RESET, &dev->phy.state))
 		return;
 
+	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	mt76_worker_schedule(&sdio->txrx_worker);
 }
 EXPORT_SYMBOL_GPL(mt76s_sdio_irq);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
