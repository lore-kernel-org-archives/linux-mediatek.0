Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82CBC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZJ7g9xm8CIRNf5XJ28L5pXRBhEVUBZSQ5ws3FNwvwo=; b=XUcqjqEmvcyvLx
	d7nZHR2nwGnISQsc3Mp25Jga8W4ByHP4bpnj6CwgqEc1Y3a0Go/v9EA7lRiK/mtN74p8w3kJPlR+w
	FtPHKb4enyLZ7MsA/gWujyd3/Q7tyCqEEpnBfywfMjuxGJNXf4SqSuTOIl4dHL7fJRZS5+DkF6Qcd
	BRByp70Ijf23W+Yqjwm+gcCJ8RaZkLAgjECQBnll0vlpTAAPnGN/njr1hbfa1SYZ+JcTMk+Ag0VHI
	0qdSvNdJ0Um1tDX0WUVqS6ZDARmnnBQjBN/VMUB5VD5M+Mf8OFj/K2Nfm1Q+RQTM/yPjl0pPSCI0y
	GwAxcgxheMJZowTVTM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o11NU-0085mY-L6; Tue, 14 Jun 2022 07:54:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o11Jz-0083ft-Ij
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 07:50:45 +0000
X-UUID: 262e1d8e44334eb9a71d80d1875c8a4c-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:144b7aef-9e49-40dd-be9a-606de99adf1c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:e1b860c5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 262e1d8e44334eb9a71d80d1875c8a4c-20220614
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1532884245; Tue, 14 Jun 2022 00:50:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 00:50:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Jun 2022 15:50:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 14 Jun 2022 15:50:31 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
	<Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] mt76: mt7921s: fix possible sdio deadlock in command fail
Date: Tue, 14 Jun 2022 15:50:24 +0800
Message-ID: <f24180fa3f8bc61e452c0bcda90f50feb2ef72e2.1655192477.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_005043_662610_DA104458 
X-CRM114-Status: GOOD (  11.30  )
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

From: Deren Wu <deren.wu@mediatek.com>

Move sdio_release_host() to final resource handing

Fixes: b12deb5e86fa ("mt76: mt7921s: fix mt7921s_mcu_[fw|drv]_pmctrl")
Reported-by: YN Chen <YN.Chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2: 1. Align the code with mt7921e
    2. Add Lorenzo in co-developer
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
index 54a5c712a3c3..c572a3107b8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
@@ -136,8 +136,8 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 	struct sdio_func *func = dev->mt76.sdio.func;
 	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt76_connac_pm *pm = &dev->pm;
-	int err = 0;
 	u32 status;
+	int err;
 
 	sdio_claim_host(func);
 
@@ -148,7 +148,7 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 					 2000, 1000000);
 		if (err < 0) {
 			dev_err(dev->mt76.dev, "mailbox ACK not cleared\n");
-			goto err;
+			goto out;
 		}
 	}
 
@@ -156,18 +156,18 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 
 	err = readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
 				 !(status & WHLPCR_IS_DRIVER_OWN), 2000, 1000000);
+out:
 	sdio_release_host(func);
 
-err:
 	if (err < 0) {
 		dev_err(dev->mt76.dev, "firmware own failed\n");
 		clear_bit(MT76_STATE_PM, &mphy->state);
-		err = -EIO;
+		return -EIO;
 	}
 
 	pm->stats.last_doze_event = jiffies;
 	pm->stats.awake_time += pm->stats.last_doze_event -
 				pm->stats.last_wake_event;
 
-	return err;
+	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
