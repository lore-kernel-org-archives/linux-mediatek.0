Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3651FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Mar 2022 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=533he/AVsyUrqIyUDj3DV5x+U8LkJNqu5ktiVN0CZlc=; b=Wl6DPyfUzrLpqM
	TDErCzsuSNH64V7BR/Lipny9HVLEGgqoBqRZopi/m26JrTX8WmAHudjI8tvdTrvFrbnFUK3p51tO8
	bLBCiWCtqlJdSDGgo5yKSOwZx1sq/ixjVkD0VBGl0e2I+E/pPE9ZkwQ6Pni9z0NgEDhDa2K1rhvOa
	LSyFtt+8HR+nLgZBoZG34lNiJinaobxaq3k2b96paX0oXmCI6fZFYJoX4fSxiLWw8J1Y5nimil6ls
	ENFhUio6Vau0xYHASsjgVV6gcQPkVi5TA5temRqN+SLzezze9i4WK+0Uxizw5Er7eVk+WTENpLmtt
	gkjhN3I2DbdAmE9/4n8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVR6M-003F7B-Ff; Sat, 19 Mar 2022 04:54:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVR6I-003F6g-4Z
 for linux-mediatek@lists.infradead.org; Sat, 19 Mar 2022 04:54:05 +0000
X-UUID: 82de0c8dc9c74b9ca2b03da4e87e4ee4-20220318
X-UUID: 82de0c8dc9c74b9ca2b03da4e87e4ee4-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1470232256; Fri, 18 Mar 2022 21:53:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 21:53:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 19 Mar 2022 12:53:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 19 Mar 2022 12:53:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: always call mt7915_wfsys_reset() during init
Date: Sat, 19 Mar 2022 12:53:50 +0800
Message-ID: <884cf46908e7f723f8b52ec5bb38ae17142a794c.1647665580.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_215402_213615_9C3F6079 
X-CRM114-Status: GOOD (  10.37  )
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

Soft reboot might not clear certain condition, so always call
mt7915_wfsys_reset() during init.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index fd16d777f2e4..666ea7b0d3e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -651,10 +651,7 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
 	dev->dbdc_support = mt7915_band_config(dev);
 
-	/* If MCU was already running, it is likely in a bad state */
-	if (mt76_get_field(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE) >
-	    FW_STATE_FW_DOWNLOAD)
-		mt7915_wfsys_reset(dev);
+	mt7915_wfsys_reset(dev);
 
 	ret = mt7915_dma_init(dev);
 	if (ret)
@@ -663,14 +660,8 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
 	ret = mt7915_mcu_init(dev);
-	if (ret) {
-		/* Reset and try again */
-		mt7915_wfsys_reset(dev);
-
-		ret = mt7915_mcu_init(dev);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		return ret;
 
 	ret = mt7915_eeprom_init(dev);
 	if (ret < 0)
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
