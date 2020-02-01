Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921ADC35246
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66932206F0
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJuu2Oon";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s/7tmWME"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66932206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RosjprnqbtHxlxU5tUDDbYnGkIhi6iMkQFhcP2H/kc=; b=IJuu2OonWxr3Fx
	XR1SLpfQ1IL820lIi7L1tCOgO2BZvII2HPC0nvmXWaoZeV/u0zYaKhbNPh9DIO3Ybw+bUQfPxy/YZ
	6dLhuB4qaaIRSv49KugFGGd/Z9PiXR0HtRXW+6l9hkrvJKVskVKT79XXZxeHvMAQe8RUq1wiqNqes
	0CdQa4/nJdE6GwCLOD2niC7h0zftKi/ToAp0fH4Hqm6uwFrK4+oP7EZQnzQY0WImkIixGrudYeBMH
	1ICrj87h4xRxg13ndmJdAppbpS6aA+MrODugPPrMxGvDta9WW+XsZyvN8uu7DU8TD8NurCi4uELd4
	kPVzdWfXGxQOrbAesDCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixumv-0004sv-Os; Sat, 01 Feb 2020 15:34:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixumr-0004qm-Ou
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 15:34:23 +0000
X-UUID: 5ab6335979cc4032a5af029de5fd3042-20200201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WHvlW4nzcYlhxJhkmi6GNJeu5+5MhcgG+sf8MXm+PcU=; 
 b=s/7tmWMEyaqxOy/mHRHuLddNY5rVGkoZ/3WSy2nM/LOamrwOX2mVmHPxGSLO3zvguyZ6/XWycUeMtmf2gw3W7WSc/lgEv0nP4Op5a73JNpUEkv/TrjHkEIUP1ZyAdSnPXlX7DybNxAM5sT4w/v125JgPpjhx6Sjlm/8hVnQB4BI=;
X-UUID: 5ab6335979cc4032a5af029de5fd3042-20200201
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1469915017; Sat, 01 Feb 2020 07:34:09 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 07:34:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 23:34:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 1 Feb 2020 23:31:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 4/7] mt76: mt7615: add starec operating flow for firmware v2
Date: Sat, 1 Feb 2020 23:33:49 +0800
Message-ID: <5a64e78f336c1b72888bf000719b1cf7f77f62db.1580565624.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1580565624.git.ryder.lee@mediatek.com>
References: <cover.1580565624.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_073421_815075_793B80D6 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Josh Boyer <jwboyer@kernel.org>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add fw_ver in mt7615_dev to check firmware version, and adjust
mt7615_mcu_send_sta_rec() to adapt firmware v2 changes.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 20 +++++++++++++------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  5 +++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index baafa8fafaf1..ce70e2c03956 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -491,6 +491,11 @@ static int mt7615_load_ram(struct mt7615_dev *dev)
 		goto out;
 	}
 
+	if (!strncmp(hdr->fw_ver, "2.0", 6))
+		dev->fw_ver = MT7615_FIRMWARE_V2;
+	else
+		dev->fw_ver = MT7615_FIRMWARE_V1;
+
 	release_firmware(fw);
 
 	ret = request_firmware(&fw, MT7615_FIRMWARE_CR4, dev->mt76.dev);
@@ -992,10 +997,11 @@ static int
 mt7615_mcu_send_sta_rec(struct mt7615_dev *dev, u8 *req, u8 *wreq,
 			u8 wlen, bool enable)
 {
-	u32 slen = wreq - req;
+	bool is_v1 = (dev->fw_ver == MT7615_FIRMWARE_V1);
+	u32 slen = is_v1 ? wreq - req : wreq - req + wlen;
 	int ret;
 
-	if (!enable) {
+	if (is_v1 && !enable) {
 		ret = __mt76_mcu_send_msg(&dev->mt76,
 					  MCU_EXT_CMD_STA_REC_UPDATE,
 					  req, slen, true);
@@ -1006,10 +1012,12 @@ mt7615_mcu_send_sta_rec(struct mt7615_dev *dev, u8 *req, u8 *wreq,
 					   wreq, wlen, true);
 	}
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE, wreq,
-				  wlen, true);
-	if (ret)
-		return ret;
+	if (is_v1) {
+		ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+					  wreq, wlen, true);
+		if (ret)
+			return ret;
+	}
 
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
