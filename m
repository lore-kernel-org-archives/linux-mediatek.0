Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81216C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5846520663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9zku5It";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV7SsBev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5846520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfcmsvUZjm6FmXpYsYoK9P3CdtDNuJtbpBLZW/cZs1Q=; b=s9zku5ItSJoJIA
	Hd+npkio40cAcIDD/ombV1WS2ZXHrC3WIvhGaUNO1iZ08t4UG7WfcNddy4acNfx0HkY4qRqDyRY/r
	QWq2Do+LImyFWBDiDnTpd6NjZPf3ZyBvTq8X78DWWtbFFGqtrX1ZXXChquiSEElC0UBCzBM0gY2Yz
	cMqhUfEZpDHFxev0Q+EFCnXnm8/U7J/QsCLskzkkE2ROtueABwPKbvU5RTSH40Hhm2xgJ/BkrROQN
	ffMLIE+K+AmZEgo2iEwXTCc1RHlhkaBGdh9oBilIFKZXOmLVC9l0PlkdE5YxYshXCQoKyfzpZ9Lnf
	hQsul2oIL7J1u8NgmqTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIX-0007DV-N0; Tue, 17 Mar 2020 16:42:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIO-000710-K3
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:26 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D54D620738;
 Tue, 17 Mar 2020 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463344;
 bh=/Ds2yt1LMHxTq8JqlrCE4xj/w3NW71MR4QrZ+i3Qins=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dV7SsBevteJDvdS99PcFmbhSbD0y+CD/epiTe3qjWauyja67lDBg/OOhorZDFDai1
 H47vzhHMKezmZfTtBG5HxLaGzu9a6GbM80gcwhC/JeFAlfMpGkhbgm8aBFbZKXhLZW
 NpE3IgX2MFaZGKr3KotLRMX2HMt9Kb+QGO6xpRZI=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 17/25] mt76: mt7615: add mt7663e support to
 mt7615_mcu_set_eeprom
Date: Tue, 17 Mar 2020 17:41:24 +0100
Message-Id: <67f665ca06e0228a2af3a4f66eb20a8d9c05c911.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094224_703812_4CFA3E7F 
X-CRM114-Status: UNSURE (   9.34  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend mt7615_mcu_set_eeprom routine in order to be reused
adding mt7663e support to mt7615 driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../wireless/mediatek/mt76/mt7615/eeprom.h    |  2 ++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 21 ++++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
index 18c7301521b7..8a2a64b7fcd3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
@@ -18,11 +18,13 @@ enum mt7615_eeprom_field {
 	MT_EE_TX1_5G_G0_TARGET_POWER =		0x098,
 	MT_EE_EXT_PA_2G_TARGET_POWER =		0x0f2,
 	MT_EE_EXT_PA_5G_TARGET_POWER =		0x0f3,
+	MT7663_EE_TX0_2G_TARGET_POWER =		0x123,
 	MT_EE_TX2_5G_G0_TARGET_POWER =		0x142,
 	MT_EE_TX3_5G_G0_TARGET_POWER =		0x16a,
 
 	MT7615_EE_MAX =				0x3bf,
 	MT7622_EE_MAX =				0x3db,
+	MT7663_EE_MAX =				0x400,
 };
 
 #define MT_EE_NIC_CONF_TX_MASK			GENMASK(7, 4)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 9d044f23340e..e73cd3cb014a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1539,19 +1539,30 @@ int mt7615_mcu_set_eeprom(struct mt7615_dev *dev)
 {
 	struct {
 		u8 buffer_mode;
-		u8 pad;
+		u8 content_format;
 		__le16 len;
 	} __packed req_hdr = {
 		.buffer_mode = 1,
 	};
 	u8 *eep = (u8 *)dev->mt76.eeprom.data;
 	struct sk_buff *skb;
-	int eep_len;
+	int eep_len, offset;
 
-	if (is_mt7622(&dev->mt76))
+	switch (mt76_chip(&dev->mt76)) {
+	case 0x7622:
 		eep_len = MT7622_EE_MAX - MT_EE_NIC_CONF_0;
-	else
+		offset = MT_EE_NIC_CONF_0;
+		break;
+	case 0x7663:
+		eep_len = MT7663_EE_MAX - MT_EE_CHIP_ID;
+		req_hdr.content_format = 1;
+		offset = MT_EE_CHIP_ID;
+		break;
+	default:
 		eep_len = MT7615_EE_MAX - MT_EE_NIC_CONF_0;
+		offset = MT_EE_NIC_CONF_0;
+		break;
+	}
 
 	req_hdr.len = cpu_to_le16(eep_len);
 
@@ -1560,7 +1571,7 @@ int mt7615_mcu_set_eeprom(struct mt7615_dev *dev)
 		return -ENOMEM;
 
 	skb_put_data(skb, &req_hdr, sizeof(req_hdr));
-	skb_put_data(skb, eep + MT_EE_NIC_CONF_0, eep_len);
+	skb_put_data(skb, eep + offset, eep_len);
 
 	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				       MCU_EXT_CMD_EFUSE_BUFFER_MODE, true);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
