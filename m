Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 00:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E0B207F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 00:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2V4+xgAg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SDsNXvti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E0B207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x57iuyjQTS0yNhHs84Bs+Nr32mFL1Ty3Stx48+1gGOQ=; b=2V4+xgAgSXAS4gMq73RJRVMS1
	eaxPO2mWDMWcIpBSNp8j0mrz9pncTeiiD2a6ahv9U5BeGnEi3SoRF0Pmt5wdP37OUIBTvoKZRVsZD
	ySv3oCMD43s+iRMTG11UhZUPtvKxVbS8klPn3QdbpFNlgnjMO4b3sL4KN/m8t+lom2udFu0VYAcUo
	ERTQl6BzGSYsL1rlLWcwfojcpNG5Fs113C2G14FysT3GLf05eZ1lSltwcmv/BmzlFDAwLw5yrDMsf
	0TBFsNXvYXEK82BH34VEskV+Q0QQF6qfpxc9PocwYI8S2LHCVfZwoYbIAwF8DQNy8Tfac7D7bxF5b
	haTt75PAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTDaQ-0005gq-CD; Fri, 16 Oct 2020 00:27:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTDaL-0005es-9s
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 00:27:07 +0000
X-UUID: 2f2ea5a582bb4b7c9d58d8c66f7ebc02-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fbeyHcPr5HXFs3nWVr8l+SD2fzx2BPv1Slq4oYY7jSo=; 
 b=SDsNXvtioddp6ZbWCH2RBsgkIc2Y2G/P981fxYbWf1CO5CH7lkFhvM8C+EWCTuwP22CQfvAyNCy2pfJYEUEcxZd7KBSjk9MRovy4jossvRuaPTHbBg4TBdTz+KhV3C/FZ3rM/JaGQB4ysTPXNAGb+NkZM0Dy08siRCjtf7J9bDA=;
X-UUID: 2f2ea5a582bb4b7c9d58d8c66f7ebc02-20201015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365772782; Thu, 15 Oct 2020 16:26:59 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 17:26:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Oct 2020 08:26:48 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Oct 2020 08:26:48 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7663s: introduce WoW support via GPIO
Date: Fri, 16 Oct 2020 08:26:42 +0800
Message-ID: <e83ee8b209124306f3f62e85823d7f0e30721b26.1602807276.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
References: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48CCB54E6685AF6484C239E9F170579B5A1571F1DB198B59D7F6A4180DD6FDDB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_202705_522393_9C4530BE 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: ryder.lee@mediatek.com, Sean
 Wang <objelf@gmail.com>, sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 YN Chen <YN.Chen@mediatek.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <objelf@gmail.com>

SDIO-based WiFi would rely on an additional GPIO pin to wake up the host.

Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by:  Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 14 ++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.h | 16 ++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c990ccd6f472..ecf6c6165e72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -3525,6 +3525,8 @@ int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend)
 		req.hdr.hif_type = 2;
 	else if (mt76_is_usb(&dev->mt76))
 		req.hdr.hif_type = 1;
+	else if (mt76_is_sdio(&dev->mt76))
+		req.hdr.hif_type = 0;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_HIF_CTRL, &req,
 				 sizeof(req), true);
@@ -3543,6 +3545,7 @@ mt7615_mcu_set_wow_ctrl(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 			u8 pad[3];
 		} __packed hdr;
 		struct mt7615_wow_ctrl_tlv wow_ctrl_tlv;
+		struct mt7615_wow_gpio_param_tlv gpio_tlv;
 	} req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
@@ -3552,6 +3555,11 @@ mt7615_mcu_set_wow_ctrl(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 			.len = cpu_to_le16(sizeof(struct mt7615_wow_ctrl_tlv)),
 			.cmd = suspend ? 1 : 2,
 		},
+		.gpio_tlv = {
+			.tag = cpu_to_le16(UNI_SUSPEND_WOW_GPIO_PARAM),
+			.len = cpu_to_le16(sizeof(struct mt7615_wow_gpio_param_tlv)),
+			.gpio_pin = 0xff, /* follow fw about GPIO pin */
+		},
 	};
 
 	if (wowlan->magic_pkt)
@@ -3565,9 +3573,11 @@ mt7615_mcu_set_wow_ctrl(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	}
 
 	if (mt76_is_mmio(&dev->mt76))
-		req.wow_ctrl_tlv.wakeup_hif = 2;
+		req.wow_ctrl_tlv.wakeup_hif = WOW_PCIE;
 	else if (mt76_is_usb(&dev->mt76))
-		req.wow_ctrl_tlv.wakeup_hif = 1;
+		req.wow_ctrl_tlv.wakeup_hif = WOW_USB;
+	else if (mt76_is_sdio(&dev->mt76))
+		req.wow_ctrl_tlv.wakeup_hif = WOW_GPIO;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_SUSPEND, &req,
 				 sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 7b856e9eee1e..59ad6ac15e41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -477,6 +477,12 @@ struct mt7615_bss_qos_tlv {
 	u8 pad[3];
 } __packed;
 
+enum {
+	WOW_USB = 1,
+	WOW_PCIE = 2,
+	WOW_GPIO = 3,
+};
+
 struct mt7615_wow_ctrl_tlv {
 	__le16 tag;
 	__le16 len;
@@ -501,6 +507,16 @@ struct mt7615_wow_ctrl_tlv {
 	u8 rsv[4];
 } __packed;
 
+struct mt7615_wow_gpio_param_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 gpio_pin;
+	u8 trigger_lvl;
+	u8 pad[2];
+	__le32 gpio_interval;
+	u8 rsv[4];
+} __packed;
+
 #define MT7615_WOW_MASK_MAX_LEN		16
 #define MT7615_WOW_PATTEN_MAX_LEN	128
 struct mt7615_wow_pattern_tlv {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
