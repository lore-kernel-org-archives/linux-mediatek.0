Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 00:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55DBD60F02
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 00:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55DBD60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=06lmbHgxmsh67QKma8OMywgTAs/YwN1dpMxnugNFvZc=; b=MPPlt/cfyUypPv
	NLqIYijY2K/jVLA0DJZ1ioGJsA3XmK1607hvm8F2ZWsKFLSSrdHNg3yNxdZtzqEjPfpUyejpXnVST
	enF14OXyoaQXvRnlAM3lPtI/FzRsIAUz5Kg60WyF4anMKpH0hxu2Jc/3i1v89YfogWKnDxwJzwqPy
	Lg7L76Rr7h4BCNIWbDKJksFHHZsoy48G+J46DD07AH2sPGq2qBOYLkiVQNgEkaOsP+a13xT35Ev+s
	ysaEtlPZ0KD4UyGVLSTsiT6jZvLo/UP6MwtV5Gy/Q0E4+eX+lOQ83v3pR3/WbNk8fUDStE0mxIzBN
	mKbMTjoaOuLRR1NUsk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3mi-003Z6W-60; Wed, 03 Nov 2021 00:05:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3md-003Z3D-G4
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 00:05:42 +0000
X-UUID: 86023503c47c434da4170ab07c428707-20211102
X-UUID: 86023503c47c434da4170ab07c428707-20211102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 132973548; Tue, 02 Nov 2021 17:05:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 17:05:30 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Nov 2021 08:05:16 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: fix MT7921E reset failure
Date: Wed, 3 Nov 2021 08:05:16 +0800
Message-ID: <2932b5b4f3ab1604971ca93d2e3bc483ceb6a46a.1635897433.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_170539_586996_BE6C51BD 
X-CRM114-Status: GOOD (  13.47  )
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

There is a missing mt7921e_driver_own in the MT7921E reset procedure
since the mt7921 mcu.c has been refactored for MT7921S, that will
result in MT7921E reset failure, so add it back now.

Fixes: dfc7743de1eb ("mt76: mt7921: refactor mcu.c to be bus independent")
Reported-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index e9c7c3a19507..d6b823713ba3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -446,6 +446,7 @@ int mt7921_mcu_restart(struct mt76_dev *dev);
 
 void mt7921e_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			  struct sk_buff *skb);
+int mt7921e_driver_own(struct mt7921_dev *dev);
 int mt7921e_mac_reset(struct mt7921_dev *dev);
 int mt7921e_mcu_init(struct mt7921_dev *dev);
 int mt7921s_wfsys_reset(struct mt7921_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index f9547d27356e..85286cc9add1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -321,6 +321,10 @@ int mt7921e_mac_reset(struct mt7921_dev *dev)
 		MT_INT_MCU_CMD);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
+	err = mt7921e_driver_own(dev);
+	if (err)
+		return err;
+
 	err = mt7921_run_firmware(dev);
 	if (err)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
index 583a89a34734..7b34c7f2ab3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
@@ -4,7 +4,7 @@
 #include "mt7921.h"
 #include "mcu.h"
 
-static int mt7921e_driver_own(struct mt7921_dev *dev)
+int mt7921e_driver_own(struct mt7921_dev *dev)
 {
 	u32 reg = mt7921_reg_map_l1(dev, MT_TOP_LPCR_HOST_BAND0);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
