Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89361C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C684217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j5Zn9njG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NklGje/k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C684217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYDMm2cRKm3iMifjy0Wd8SKiJUXoc+5rxs5X7cMFr1o=; b=j5Zn9njGZBKGyL
	wbvm/04uDHoAbt7K/8j+Iv5QTe8WjHRm4jKoy3Cer7Z812rRR19s/vG8/iUXbIA9BdBz1iGk2jXWg
	LMYrF5uDGg1IdmS08/ArBZT/IKiZZgRPmzsHyiXTW3ADki3PT+RqXEmdoc1K5eRnIM5cep+p0qlu9
	48zdbj2QDbC3qFMYigzof/f8cvK5LWT8MBylxr63c5jWL+HlcnAl+HJ18t8STqG+7+TO6mtzk0kM0
	0z0UHhETf4sTB4RJtlFMSb4u75u4quiG5xlLBJswLMCr/YlsF4Uwc1h0WQL2F75N9FxH/6G+sjeJD
	yAy1qm9/WWiF+xgaQhmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituIG-0004tO-Gi; Tue, 21 Jan 2020 14:14:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituIC-0004my-CQ
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:14:10 +0000
X-UUID: edef1cbcf8d74813917c710e5d26a7bd-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v+wcGDsO7LzhLYd0t7yY8jTM7GyhTanF/p5aGuMf2uY=; 
 b=NklGje/kIs9H6YZMhJYYcOb2naR7kYKWOjV6hqfOgMJG7bXuBJQva956RilTOjuRoD9De68YcR8Yei28jMzAlLmrRvBGCvyt5AxKb8sZOWB0hw2xlzks/7ZGY58Fnn70Lrckc8wkL8Rdpzoj/PEkBPU6/zp8jgrtMBmn90KlSMk=;
X-UUID: edef1cbcf8d74813917c710e5d26a7bd-20200121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 42087101; Tue, 21 Jan 2020 06:14:05 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:15:09 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:12:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:30 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 4/7] mt76: mt7615: adjust command flow for firmware v2
Date: Tue, 21 Jan 2020 22:13:39 +0800
Message-ID: <48e1baba8a4d87dc6c081189034f78447d65bf14.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B03C0DA28A1CC07F7DDAEF4D85FBDFC6E7BE8B28A39E7767ABA05FED6B601882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_061408_441123_756252F9 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add fw_version in mt7615_dev to adapt new firmware version.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 16 ++++++++++++----
 .../net/wireless/mediatek/mt76/mt7615/mt7615.h   |  5 +++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 6bef0dcb83b7..c055949b289c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -491,6 +491,11 @@ static int mt7615_load_ram(struct mt7615_dev *dev)
 		goto out;
 	}
 
+	if (!strncmp(hdr->fw_ver, "mtk_v2", 6))
+		dev->fw_ver = MT7615_FIRMWARE_V2;
+	else
+		dev->fw_ver = MT7615_FIRMWARE_V1;
+
 	release_firmware(fw);
 
 	ret = request_firmware(&fw, MT7615_FIRMWARE_CR4, dev->mt76.dev);
@@ -992,18 +997,21 @@ static int
 mt7615_mcu_send_sta_rec(struct mt7615_dev *dev, u8 *req, u8 *wreq,
 			u8 wlen, bool enable)
 {
-	u32 slen = wreq - req;
+	bool is_v1 = (dev->fw_ver == MT7615_FIRMWARE_V1) ? true : false;
+	u32 slen = is_v1 ? wreq - req : wreq - req + wlen;
 
-	if (!enable) {
+	if (is_v1 && !enable) {
 		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
 				    req, slen, true);
 
 		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
 					   wreq, wlen, true);
+
 	}
 
-	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE, wreq,
-			    wlen, true);
+	if (is_v1)
+		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+				    wreq, wlen, true);
 
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
 				   req, slen, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 9bd926d6963f..fa39632cd2bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -30,6 +30,9 @@
 #define MT7615_FIRMWARE_N9		"mediatek/mt7615_n9.bin"
 #define MT7615_ROM_PATCH		"mediatek/mt7615_rom_patch.bin"
 
+#define MT7615_FIRMWARE_V1		1
+#define MT7615_FIRMWARE_V2		2
+
 #define MT7615_EEPROM_SIZE		1024
 #define MT7615_TOKEN_SIZE		4096
 
@@ -144,6 +147,8 @@ struct mt7615_dev {
 
 	spinlock_t token_lock;
 	struct idr token;
+
+	u8 fw_ver;
 };
 
 enum {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
