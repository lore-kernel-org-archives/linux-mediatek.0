Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05E7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 09:40:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E311206C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 09:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQ5QwRuc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mle+wtZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E311206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYBhC64yNodRHCsMQ2MA9TxT8D0OpI0pB+CdCV2q0/U=; b=LQ5QwRucC9J2JjhhjEFiwYzhCb
	KrSnlEbxfjQr9UbjFSlXfizdpPi+REOAUR8fCSSV0cuZ/SyzL3X1HbhPd+4aVjqqeG4u5z0qcYa/y
	16yaWLlnqM89jw6FkFzOBHEzioSKxfEeNrdItbMI4fCtyBmlzfpJNibHQyvE8bjFs1uSNQqJzDY0X
	LzlFEl1C7ks8kUFsWilxgY4X/Ad7m26bwM3WDhBFAh6gFwU6ca5X1p3IpeDWHMAj6JAHneV/hnQ/B
	qPWDiWjnYPjh1mv9H4KFkSB2+EDpOoSFav/cZyvGuJFqhFhczxITEg9p2cBlOSXfiqn5e58Cp7VuV
	7he3LbIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1tE-0001kF-0D; Wed, 24 Jun 2020 09:40:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1tB-0001hN-ON
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 09:40:18 +0000
X-UUID: f07a824c7a2f422bbaa00b0af8c3d06b-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7PK14oqTmOFJOT/MNKY1j9wxaPQDa9X5TZTJttjSw70=; 
 b=mle+wtZxiJfh0Onj8zPGNPIevxbP/tIPcTpFzgY0eaqPnubUFCAX5mGZ0XsxmrlntQwVEm4NsIB6/QkxzcTh+xv/L+xSz6zY0MT1K2WTT2AaJmmKBHlrz3JxykoOB9CX3+GZXQBrMtQ5LjNLRw4u0QpKWAEIcMSgQ6/yFJ67Hgw=;
X-UUID: f07a824c7a2f422bbaa00b0af8c3d06b-20200624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1403934533; Wed, 24 Jun 2020 01:40:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 02:40:07 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 17:40:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Jun 2020 17:40:03 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: mt7615: register ext_phy if DBDC is detected
Date: Wed, 24 Jun 2020 17:39:37 +0800
Message-ID: <20200624093937.26741-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B75E107CDB5820FA4F527F0EDDC99885F69BA3767655EBCCEA2B8DAFEB7A1CC92000:8
X-MTK: N
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT_EE_WIFI_CONF field can be used to detect if the chipset is MT7615D.
Thus, add support to automatically register ext_phy if DBDC is detected.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c   | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7615/init.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 22e4eab..4e07c7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -125,6 +125,9 @@ mt7615_eeprom_parse_hw_band_cap(struct mt7615_dev *dev)
 	case MT_EE_2GHZ:
 		dev->mt76.cap.has_2ghz = true;
 		break;
+	case MT_EE_DBDC:
+		dev->mt76.phy2 = &dev->mphy;
+		/* fall through */
 	default:
 		dev->mt76.cap.has_2ghz = true;
 		dev->mt76.cap.has_5ghz = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 3921e7e..c075006 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -384,7 +384,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	if (test_bit(MT76_STATE_RUNNING, &dev->mphy.state))
 		return -EINVAL;
 
-	if (phy)
+	if (phy && phy != &dev->phy)
 		return 0;
 
 	mt7615_cap_dbdc_enable(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 69cba86..ec94944 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -25,6 +25,9 @@ static void mt7615_init_work(struct work_struct *work)
 	mt7615_phy_init(dev);
 	mt7615_mcu_del_wtbl_all(dev);
 	mt7615_check_offload_capability(dev);
+
+	if (dev->mt76.phy2)
+		mt7615_register_ext_phy(dev);
 }
 
 static int mt7615_init_hardware(struct mt7615_dev *dev)
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
