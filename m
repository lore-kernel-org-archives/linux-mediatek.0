Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963ADC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 15:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6900020757
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 15:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlhplsGj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnDu6cFP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6900020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RgFiAK/J/NsFeyVbvUMEUX+Winb9osFVKpaFN9gxQbc=; b=ZlhplsGj1GUhl5
	2snGsw4EaLwN+azRN2l+HuSksqOUpIWwlJKc/QVqYYZk6Ik4FSAfK/0jbxxnisTCfGwv0y7tgfgsT
	O9Ioq7U8+vqCbo+gOMbKKl8WoG5SMKU0gM4KRX4QlzKBnFTWWvzeNccxm4+pt1zzxDdRZExNuFbsB
	xEdZ/5WL3r5Zv6l7SdRcuHzO5c5B0aavQieHzzz2EmxeZGY8Tf964ehIc/IyX2+89YUluJ+nGa7C3
	T+JWBYM6swmseIkQhyH9sfOu6fxsNV+uZEtCkETJeGdT/t1muhA+m2hGK+eu1/qmP6Nmaxp7Hozi9
	z8+WLJv77Q28Jv4pQW4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVGaC-0004TH-Dp; Sun, 03 May 2020 15:31:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVGaA-0004Sw-4u
 for linux-mediatek@lists.infradead.org; Sun, 03 May 2020 15:31:07 +0000
Received: from localhost.localdomain (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9147E20757;
 Sun,  3 May 2020 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588519865;
 bh=Y30zyGha8lAC7EiljQQ4NMoD45Xbrqbt2tMA+T/Ezm8=;
 h=From:To:Cc:Subject:Date:From;
 b=UnDu6cFP71gT8rvEUyhDyYMicmaQsWr546W8hapQTAw04q8+6jm9JZ9cuRluBIGGH
 xIoKbnyB/glEZ1Ygi5S+2HT8G/CY0FePk6Tpkuu5EpjoRgg4+rWgV2ewtuk9ObS53A
 l33xIBP6/BsWAxBCrbuzmVrwWaxVq1AO/wouoZQU=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: fix delta tx power for mt7663
Date: Sun,  3 May 2020 17:30:53 +0200
Message-Id: <0cf455450efd28fbd97df81af8a591428ba7b8cc.1588519828.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_083106_226369_3BD5DE0A 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix mt7663 eeprom definitions for delta tx power parsing

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/eeprom.c  | 17 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/eeprom.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 10 +++-------
 .../net/wireless/mediatek/mt76/mt7615/mt7615.h  |  2 ++
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 4fb9658b1083..2d4932f97e9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -156,6 +156,23 @@ static void mt7615_eeprom_parse_hw_cap(struct mt7615_dev *dev)
 	dev->phy.chainmask = dev->chainmask;
 }
 
+int mt7615_eeprom_get_power_delta_index(struct mt7615_dev *dev,
+					enum nl80211_band band)
+{
+	/* assume the first rate has the highest power offset */
+	if (is_mt7663(&dev->mt76)) {
+		if (band == NL80211_BAND_2GHZ)
+			return MT_EE_TX0_5G_G0_TARGET_POWER;
+		else
+			return MT7663_EE_5G_RATE_POWER;
+	}
+
+	if (band == NL80211_BAND_2GHZ)
+		return MT_EE_2G_RATE_POWER;
+	else
+		return MT_EE_5G_RATE_POWER;
+}
+
 int mt7663_eeprom_get_target_power_index(struct mt7615_dev *dev,
 					 struct ieee80211_channel *chan,
 					 u8 chain_idx)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
index 2390b7137360..03a23c2bf776 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
@@ -31,6 +31,7 @@ enum mt7615_eeprom_field {
 	MT_EE_CALDATA_FLASH =			0x052,
 	MT_EE_TX0_2G_TARGET_POWER =		0x058,
 	MT_EE_TX0_5G_G0_TARGET_POWER =		0x070,
+	MT7663_EE_5G_RATE_POWER =		0x089,
 	MT_EE_TX1_5G_G0_TARGET_POWER =		0x098,
 	MT_EE_2G_RATE_POWER =			0x0be,
 	MT_EE_5G_RATE_POWER =			0x0d5,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 498022782d22..1262ced3727a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -222,17 +222,13 @@ void mt7615_init_txpower(struct mt7615_dev *dev,
 			 struct ieee80211_supported_band *sband)
 {
 	int i, n_chains = hweight8(dev->mphy.antenna_mask), target_chains;
+	int delta_idx, delta = mt76_tx_power_nss_delta(n_chains);
 	u8 *eep = (u8 *)dev->mt76.eeprom.data;
 	enum nl80211_band band = sband->band;
-	int delta = mt76_tx_power_nss_delta(n_chains);
 	u8 rate_val;
 
-	/* assume the first rate has the highest power offset */
-	if (band == NL80211_BAND_2GHZ)
-		rate_val = eep[MT_EE_2G_RATE_POWER];
-	else
-		rate_val = eep[MT_EE_5G_RATE_POWER];
-
+	delta_idx = mt7615_eeprom_get_power_delta_index(dev, band);
+	rate_val = eep[delta_idx];
 	if ((rate_val & ~MT_EE_RATE_POWER_MASK) ==
 	    (MT_EE_RATE_POWER_EN | MT_EE_RATE_POWER_SIGN))
 		delta += rate_val & MT_EE_RATE_POWER_MASK;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index b113eaa1a70e..36abfcf529d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -383,6 +383,8 @@ int mt7663_eeprom_get_target_power_index(struct mt7615_dev *dev,
 int mt7615_eeprom_get_target_power_index(struct mt7615_dev *dev,
 					 struct ieee80211_channel *chan,
 					 u8 chain_idx);
+int mt7615_eeprom_get_power_delta_index(struct mt7615_dev *dev,
+					enum nl80211_band band);
 int mt7615_wait_pdma_busy(struct mt7615_dev *dev);
 int mt7615_dma_init(struct mt7615_dev *dev);
 void mt7615_dma_cleanup(struct mt7615_dev *dev);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
