Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544DFC47256
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 23:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28626205C9
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 23:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKt3+pBU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIbMK9FT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28626205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZUSxID3QaJ3l3R99VTc/WUdgae0f0aJfjiUqBChGtns=; b=cKt3+pBUwAd1di
	dZoBPA9G3FqbNMbGB3NT+chRpiQa9iGP7c+hy+Y0RRc+CN1eBn/u0vZKMe0B/+PFeg/lJxonQXuKC
	noJWoE6kBAKTxuvMwxRPByZbGyAScOBa68ue9Fy5r8tHPClyB4s2aZ1KPngdIOtjeGSX41i1siMVa
	usU5th5wgZ6VT6HmcXi/XWzI1wyd2DiRl46BCJchdlFTdja8Pjqn6TpOlBSXGVOGF2XXUKrlwOhyl
	h3TSV3s9JP6tzE4mVKaGfu5Rv4EHAe6uptWxFfamiRb0DhOt20D8h2zrBJjr2LvHZFL/li7sJK9NE
	KDsn3eTBMzZj5aVUqjOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUeqq-00064j-2J; Fri, 01 May 2020 23:13:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUeqn-00063T-KQ
 for linux-mediatek@lists.infradead.org; Fri, 01 May 2020 23:13:46 +0000
Received: from lore-desk.lan (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10696205C9;
 Fri,  1 May 2020 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588374823;
 bh=5hBIs7ynppiec+Mcrs9/TWvkac65MInCkhDPsnn8QSk=;
 h=From:To:Cc:Subject:Date:From;
 b=kIbMK9FTS0+NRU3PUiXNElYXSAkBb+/jI/70vX+9ne/hXzpLPys9c8PBDZNlZ+zRP
 r2ROEhVt+1y1pIVpPK9qppuN9v/Cx1xCFzf9laCAWdeMcnh0YiUGf52NjIgG99mBcQ
 Kp4gl4j2O7+Q4dIPg415e5sNBDe9M4z1GBNykqpk=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7663: read tx streams from eeprom
Date: Sat,  2 May 2020 01:13:11 +0200
Message-Id: <a67ec5b853824c2561c96f880e9ebca199ffac53.1588374738.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_161345_688252_39C4ED88 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Read tx stream configuration from eeprom/efuse partition

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h |  3 +++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 521705015036..7440ad13c74b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -130,14 +130,15 @@ mt7615_eeprom_parse_hw_band_cap(struct mt7615_dev *dev)
 static void mt7615_eeprom_parse_hw_cap(struct mt7615_dev *dev)
 {
 	u8 *eeprom = dev->mt76.eeprom.data;
-	u8 tx_mask;
+	u8 tx_mask, max_nss;
 
 	mt7615_eeprom_parse_hw_band_cap(dev);
 
 	if (is_mt7663(&dev->mt76)) {
-		tx_mask = 2;
+		max_nss = 2;
+		tx_mask = FIELD_GET(MT_EE_HW_CONF1_TX_MASK,
+				    eeprom[MT7663_EE_HW_CONF1]);
 	} else {
-		u8 max_nss;
 		u32 val;
 
 		/* read tx-rx mask from eeprom */
@@ -146,9 +147,9 @@ static void mt7615_eeprom_parse_hw_cap(struct mt7615_dev *dev)
 
 		tx_mask =  FIELD_GET(MT_EE_NIC_CONF_TX_MASK,
 				     eeprom[MT_EE_NIC_CONF_0]);
-		if (!tx_mask || tx_mask > max_nss)
-			tx_mask = max_nss;
 	}
+	if (!tx_mask || tx_mask > max_nss)
+		tx_mask = max_nss;
 
 	dev->chainmask = BIT(tx_mask) - 1;
 	dev->mphy.antenna_mask = dev->chainmask;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
index 3dd7009e5836..aad82b600c63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
@@ -39,6 +39,7 @@ enum mt7615_eeprom_field {
 	MT7663_EE_TX0_2G_TARGET_POWER =		0x123,
 	MT_EE_TX2_5G_G0_TARGET_POWER =		0x142,
 	MT_EE_TX3_5G_G0_TARGET_POWER =		0x16a,
+	MT7663_EE_HW_CONF1 =			0x1b0,
 
 	MT7615_EE_MAX =				0x3bf,
 	MT7622_EE_MAX =				0x3db,
@@ -55,6 +56,8 @@ enum mt7615_eeprom_field {
 #define MT_EE_NIC_CONF_TX_MASK			GENMASK(7, 4)
 #define MT_EE_NIC_CONF_RX_MASK			GENMASK(3, 0)
 
+#define MT_EE_HW_CONF1_TX_MASK			GENMASK(2, 0)
+
 #define MT_EE_NIC_CONF_TSSI_2G			BIT(5)
 #define MT_EE_NIC_CONF_TSSI_5G			BIT(6)
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
