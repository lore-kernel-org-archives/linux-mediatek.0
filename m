Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD94BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 05:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=opA14T5HfEI37/0noOgTz+PwviZCWQNi4AaQx7RkSfo=; b=iAUttRyP2yzcPu
	BoyFwaxU1QVJo9zYN7yCKc3As0H4E9fL4R/quRok749DVL3vuY+JUpj8PBdr5yNcuDJhK87UhjQSX
	8wMGv5ThZ+M7FqSgBixEMs3OHu0dcjgRgnQZcNu4EmCN8LABFzqSI3m1GWRwbGtpvjSDQvrZYUP8f
	jq4MgGY7lpzESBOsWH9Wic+I/AQ+oPrzPcCf/OReqzt7TGCx35gk9QfULzaS5a1XQN1bvoG24VnsR
	fdXLGmXv5WRZHxO0KF6eBXelykwbu7NJ644zFIjCF3TQBqDC23EnFNVH/Ahfq2+nfzFzlvZ4Zxh9v
	mQtnLgOQZVUWUdXAj7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzue3-009HsH-85; Wed, 22 Dec 2021 05:58:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzue0-009HqV-85
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 05:58:33 +0000
X-UUID: 992a9637c7d743d6a04f9d72327a5057-20211221
X-UUID: 992a9637c7d743d6a04f9d72327a5057-20211221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 394989099; Tue, 21 Dec 2021 22:58:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 21:58:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 22 Dec 2021 13:58:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Dec 2021 13:58:19 +0800
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
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921s: clear MT76_STATE_MCU_RUNNING immediately
 after reset
Date: Wed, 22 Dec 2021 13:58:17 +0800
Message-ID: <f18bbe4b077e5e21c3fbb04c5ab84520142d567d.1640151776.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215832_322439_C920FB4B 
X-CRM114-Status: GOOD (  12.51  )
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

clear the flag MT76_STATE_MCU_RUNNING immediately after reset to indicate
the MCU has already stopped working at the point. That is a preliminary
patch for the following patch to perform the register access in the
remaining reset handler using SDIO mailbox way instead of MCU command
because the RAM firmware is cleared out.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index ccaf8134cec7..e0f0d3a2b17e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -60,6 +60,8 @@ int mt7921s_wfsys_reset(struct mt7921_dev *dev)
 
 	sdio_release_host(sdio->func);
 
+	clear_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
+
 	/* activate mt7921s again */
 	mt7921s_mcu_fw_pmctrl(dev);
 	mt7921s_mcu_drv_pmctrl(dev);
@@ -81,7 +83,6 @@ int mt7921s_init_reset(struct mt7921_dev *dev)
 	mt7921s_wfsys_reset(dev);
 
 	mt76_worker_enable(&dev->mt76.sdio.txrx_worker);
-	clear_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
 	mt7921s_enable_irq(&dev->mt76);
 
@@ -114,7 +115,6 @@ int mt7921s_mac_reset(struct mt7921_dev *dev)
 	mt76_worker_enable(&dev->mt76.sdio.net_worker);
 
 	dev->fw_assert = false;
-	clear_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
 	mt7921s_enable_irq(&dev->mt76);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
