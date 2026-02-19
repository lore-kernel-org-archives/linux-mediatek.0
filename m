Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E40E9A050
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Moy8wItH7hT5L0ifRQslzcMjzyFDwT/JuvFfE9ZBhY=; b=zCYEmKr05v4aylWO03LFqGB6iP
	G1iPAyi1pkrHOSLAdFB/k1WphMa1KE+TYoog2dlycGXjhwH1SyQKZXVmDvgqMZq0ds8GxpOa1OYkD
	IkmZ5eSw4dhEZC7qtDAZVl4zgQV4DpSB92giwudai9+VqklKO2qDHrj04FGel1fyMNmjLlLnbWzZt
	t97BbOOXgbPS3vKqoWNKB55QCV7tovANXRuVP2Cd3B1SV1Avaj79xuiGmGeMypTA7yIz0D655D405
	lj5vAV/9jW5+34Coed0Fy6wPfQk7BwbFd1jnjo4Kr2X03L7xNVCKXhMB8BdfdiqzNnkfSLSzb4E7f
	sYof4iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5l-0000000Aehq-16BO;
	Thu, 19 Feb 2026 00:40:29 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5i-0000000Aef7-2Yt0
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:27 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ee196dd78so272738fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461625; x=1772066425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Moy8wItH7hT5L0ifRQslzcMjzyFDwT/JuvFfE9ZBhY=;
        b=LCvMuzUz4lPd8ZgycJWpnKoJ0f+balAgivnz2zUw1RgVUT7eo/Y+K1fzTz+NhNk0P3
         bXtVlwoAyfjqAELgw9aL3ju1AVxIhSJBVwlJxR1kJHkjODf5n76U7zMa3vB2+gTr8Idt
         afi/hilVZUOGwPG9wPyYl00O9wR75xoHFgn7SzWR/L2xTEYM7Q2lGgL7fRAfuHR2UOOm
         RtOHVffgWPAdiGwh9KDQsa5jDjNTj75byjB60APyA35thGEVmLHZTtzjHKu75kXGaw2b
         0G6TfU6fQRdALlzn7w0pdU5rYylhRA+QOfMcFnUgOw6L4OfwPPaCQOnwUVwjkmqcIA7a
         q7RA==
X-Forwarded-Encrypted: i=1; AJvYcCXH+jtcOys4vewConCsYkzAynW1Dvpk+IPrzdKLbRoNud/c8YQVvHbMvqGNPG33ZCEAxFHf/ydJgVRKnirtWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYPJiqKJpfHMuQ/mB/MQAwbltFSTiCLLHbKxpHf87IVSHl3/ay
	NO7f9DQnM0pqszM9dXMvTp7S9aanyG5l/2tEBxomW20Tjbi0WxhHfj/NXYG77Q==
X-Gm-Gg: AZuq6aKYq3QXtBcLh6fN197ls3+BAp89cza6hc8OXMiPMsegcRb82iKRqVCWyqbJUzp
	EYidplGqXH1+Mv+HpvZTWmnZT1neq8HzhxWJZaa28V/3Nit8bIDt0eSZyUh2n92nyGr+kki6LPl
	Guna4T1ZTo9yHzYFLFGvllxO1LHeuIhZBp0hPZ6H10v3M2dCKSS6nfG0AeK37fMhX7wEjcrIbAu
	IHRZfotMiCl4a2GMj5wxbqG/U/Dkd4NxCT1Nl+sDTsvVTEFnsvZiC8VMLV+8sTyPrJ1/lX8XM74
	BBTZtWI2HCQOOji7RyDs+Q5ZbhDaj/XAkuwvIzKhq1luBjRN5Ox7PWGBrH26eZXDisIv6CSBLMy
	Ciy1xNz55rTWCgRhiapfmatpuwLOaeTmHi06tr0Dptt4iNgMucTtpZcirh3nWfQFzmPuohWiYTR
	eVrABDKXOsOIRJXgIO+f0Mp9EGf06xP3tlEFGNmFK/S3p/9S3CUe3RzFWOxQ==
X-Received: by 2002:a05:6870:3293:b0:3fa:aa5:be04 with SMTP id 586e51a60fabf-41545894880mr49713fac.20.1771461625565;
        Wed, 18 Feb 2026 16:40:25 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:24 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 08/11] wifi: mt76: mt7921: add MT7902 MCU support
Date: Wed, 18 Feb 2026 18:40:04 -0600
Message-ID: <20260219004007.19733-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164026_659195_E02DD76E 
X-CRM114-Status: GOOD (  12.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add MCU support for the MT7902 chipset.

runtime pm is not yet supported by the driver, but normal mac80211
operation is unaffected.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 8 +++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 6 ++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index d868bb7c7ab8..51423c7740bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -182,6 +182,11 @@ static inline bool is_mt7920(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7920;
 }
 
+static inline bool is_mt7902(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7902;
+}
+
 static inline bool is_mt7922(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7922;
@@ -189,7 +194,8 @@ static inline bool is_mt7922(struct mt76_dev *dev)
 
 static inline bool is_connac2(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7961 || is_mt7922(dev) || is_mt7920(dev);
+	return mt76_chip(dev) == 0x7961 || is_mt7922(dev) || is_mt7920(dev) ||
+				is_mt7902(dev);
 }
 
 static inline bool is_mt7663(struct mt76_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 29732315af1c..8e7790702191 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -302,7 +302,9 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	if (!mt76_is_usb(&dev->mt76)) {
+
+	if (!mt76_is_usb(&dev->mt76) &&
+	    !is_mt7902(&dev->mt76)) {
 		dev->pm.enable_user = true;
 		dev->pm.enable = true;
 		dev->pm.ds_enable_user = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8388638ed550..1f381ab356bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -41,11 +41,13 @@
 #define MT792x_MCU_INIT_RETRY_COUNT	10
 #define MT792x_WFSYS_INIT_RETRY_COUNT	2
 
+#define MT7902_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7902_1.bin"
 #define MT7920_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7961_1a.bin"
 #define MT7921_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7922_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7922_1.bin"
 #define MT7925_FIRMWARE_WM	"mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin"
 
+#define MT7902_ROM_PATCH	"mediatek/WIFI_MT7902_patch_mcu_1_1_hdr.bin"
 #define MT7920_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin"
 #define MT7921_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
 #define MT7922_ROM_PATCH	"mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin"
@@ -448,6 +450,8 @@ void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 {
 	switch (mt76_chip(&dev->mt76)) {
+	case 0x7902:
+		return MT7902_FIRMWARE_WM;
 	case 0x7920:
 		return MT7920_FIRMWARE_WM;
 	case 0x7922:
@@ -462,6 +466,8 @@ static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 static inline char *mt792x_patch_name(struct mt792x_dev *dev)
 {
 	switch (mt76_chip(&dev->mt76)) {
+	case 0x7902:
+		return MT7902_ROM_PATCH;
 	case 0x7920:
 		return MT7920_ROM_PATCH;
 	case 0x7922:
-- 
2.43.0


