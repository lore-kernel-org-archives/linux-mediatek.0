Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08905C83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 13:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1082206D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 13:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SSv6uDxO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqQoYRa7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1082206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sha+GcyQcENrLhemv/o/XM6SB6Io3Q79BzVojXyi4fM=; b=SSv6uDxOYBE16m
	a1ZQ8SFxs9RzWANZ3kxdoMGeFxVpOOHm8dwp00u7DdUVujK3nBNgmVWS1EhDOC6rH3jILKVpFnDi7
	tHYzS5lOg27DAbbTo4hRCNasT3ozeHaWuJi/IUSpHHt2WIOX/mK94lB7aNOiCQkGwssD4jPc+9HPM
	pJQqGB8k0RMFKqK7WMrqItcrJSnBOLL+0RWYUpjchVSOOST1FSQ9joaCxOp563NoWbScMYYl3i7aR
	WMbjqy1cV0ofTuaoaJ+cG74QDXOQ//+W9gICrdMkHfeYhelItQDYsrzYFTKh627+he8zBu0DJWspl
	JJiqbBEwt2q59M41bbfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTQNR-0000s5-OI; Tue, 28 Apr 2020 13:34:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTQNP-0000rY-LG
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 13:34:21 +0000
Received: from localhost.localdomain.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13458206D6;
 Tue, 28 Apr 2020 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588080859;
 bh=/lAvAVfc2XJMF76KRRCnfMzEaU/zSr3rPcqiWH0cLvE=;
 h=From:To:Cc:Subject:Date:From;
 b=nqQoYRa7niiyM7JYmuDkdgWmNjatj0KdZzIa0agdQTbLIsOtozbMDhr8tvpyg3uaM
 y0BGPt194UO9PGZhivnn6ZPxx6Wtxq5x9DHP+0TRxZPNtl6xM1VZsl/yne6aQNrH+j
 6kvNLEtPQCKn1uI5VBTmwXuZ2+r4EX4aRupvgeJg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2] mt76: mt7663: add the possibility to load firmware v2
Date: Tue, 28 Apr 2020 15:34:09 +0200
Message-Id: <1b8ba4db0fd127de4ed3d07466b143f0eaac1c2c.1588080532.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_063419_734762_EEDD70FE 
X-CRM114-Status: GOOD (  12.65  )
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

mt7663 firmware v2 is used for embedded devices since it has more completed
features in AP mode.
Add the capability to specify which firmware load first (v3 or v2)
using prefer_offload_fw kernel parameter and fallback to the other one
if the selected firmware fails to load

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- use a kernel parameter instead of a Kconfig entry
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 55 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 +-
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  2 +
 4 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index aee9ee43436f..071c29ac425f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -11,6 +11,11 @@
 #include "mac.h"
 #include "eeprom.h"
 
+static bool prefer_offload_fw = true;
+module_param(prefer_offload_fw, bool, 0644);
+MODULE_PARM_DESC(prefer_offload_fw,
+		 "Prefer client mode offload firmware (MT7663)");
+
 struct mt7615_patch_hdr {
 	char build_date[16];
 	char platform[4];
@@ -1728,7 +1733,7 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 		return -EAGAIN;
 	}
 
-	ret = request_firmware(&fw, name, dev->mt76.dev);
+	ret = firmware_request_nowarn(&fw, name, dev->mt76.dev);
 	if (ret)
 		goto out;
 
@@ -2081,8 +2086,49 @@ static int mt7663_load_n9(struct mt7615_dev *dev, const char *name)
 	return ret;
 }
 
+static int
+mt7663_load_rom_patch(struct mt7615_dev *dev, const char **n9_firmware)
+{
+	const char *selected_rom, *secondary_rom = MT7663_ROM_PATCH;
+	const char *primary_rom = MT7663_OFFLOAD_ROM_PATCH;
+	int ret;
+
+	if (!prefer_offload_fw) {
+		secondary_rom = MT7663_OFFLOAD_ROM_PATCH;
+		primary_rom = MT7663_ROM_PATCH;
+	}
+	selected_rom = primary_rom;
+
+	ret = mt7615_load_patch(dev, MT7663_PATCH_ADDRESS, primary_rom);
+	if (ret) {
+		dev_info(dev->mt76.dev, "%s not found, switching to %s",
+			 primary_rom, secondary_rom);
+		ret = mt7615_load_patch(dev, MT7663_PATCH_ADDRESS,
+					secondary_rom);
+		if (ret) {
+			dev_err(dev->mt76.dev, "failed to load %s",
+				secondary_rom);
+			return ret;
+		}
+		selected_rom = secondary_rom;
+	}
+
+	if (!strcmp(selected_rom, MT7663_OFFLOAD_ROM_PATCH)) {
+		*n9_firmware = MT7663_OFFLOAD_FIRMWARE_N9;
+		dev->fw_ver = MT7615_FIRMWARE_V3;
+		dev->mcu_ops = &uni_update_ops;
+	} else {
+		*n9_firmware = MT7663_FIRMWARE_N9;
+		dev->fw_ver = MT7615_FIRMWARE_V2;
+		dev->mcu_ops = &sta_update_ops;
+	}
+
+	return 0;
+}
+
 int __mt7663_load_firmware(struct mt7615_dev *dev)
 {
+	const char *n9_firmware;
 	int ret;
 
 	ret = mt76_get_field(dev, MT_CONN_ON_MISC, MT_TOP_MISC2_FW_N9_RDY);
@@ -2091,14 +2137,11 @@ int __mt7663_load_firmware(struct mt7615_dev *dev)
 		return -EIO;
 	}
 
-	ret = mt7615_load_patch(dev, MT7663_PATCH_ADDRESS, MT7663_ROM_PATCH);
+	ret = mt7663_load_rom_patch(dev, &n9_firmware);
 	if (ret)
 		return ret;
 
-	dev->fw_ver = MT7615_FIRMWARE_V3;
-	dev->mcu_ops = &uni_update_ops;
-
-	ret = mt7663_load_n9(dev, MT7663_FIRMWARE_N9);
+	ret = mt7663_load_n9(dev, n9_firmware);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 44eb3d8dca78..0476b9426b03 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -42,8 +42,10 @@
 #define MT7615_FIRMWARE_V2		2
 #define MT7615_FIRMWARE_V3		3
 
-#define MT7663_ROM_PATCH		"mediatek/mt7663pr2h.bin"
-#define MT7663_FIRMWARE_N9              "mediatek/mt7663_n9_v3.bin"
+#define MT7663_OFFLOAD_ROM_PATCH	"mediatek/mt7663pr2h.bin"
+#define MT7663_OFFLOAD_FIRMWARE_N9	"mediatek/mt7663_n9_v3.bin"
+#define MT7663_ROM_PATCH		"mediatek/mt7663pr2h_rebb.bin"
+#define MT7663_FIRMWARE_N9		"mediatek/mt7663_n9_rebb.bin"
 
 #define MT7615_EEPROM_SIZE		1024
 #define MT7615_TOKEN_SIZE		4096
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index 21b3ec29aa12..f9469198cabd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -68,5 +68,7 @@ MODULE_DEVICE_TABLE(pci, mt7615_pci_device_table);
 MODULE_FIRMWARE(MT7615_FIRMWARE_CR4);
 MODULE_FIRMWARE(MT7615_FIRMWARE_N9);
 MODULE_FIRMWARE(MT7615_ROM_PATCH);
+MODULE_FIRMWARE(MT7663_OFFLOAD_FIRMWARE_N9);
+MODULE_FIRMWARE(MT7663_OFFLOAD_ROM_PATCH);
 MODULE_FIRMWARE(MT7663_FIRMWARE_N9);
 MODULE_FIRMWARE(MT7663_ROM_PATCH);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index bcd131969923..9353175b139b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -386,6 +386,8 @@ mt7663u_resume(struct usb_interface *intf)
 }
 
 MODULE_DEVICE_TABLE(usb, mt7615_device_table);
+MODULE_FIRMWARE(MT7663_OFFLOAD_FIRMWARE_N9);
+MODULE_FIRMWARE(MT7663_OFFLOAD_ROM_PATCH);
 MODULE_FIRMWARE(MT7663_FIRMWARE_N9);
 MODULE_FIRMWARE(MT7663_ROM_PATCH);
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
