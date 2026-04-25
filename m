Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310DBFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXD39Wztx5B19vyUuBgtwPNQEXtFgeFRMISpC6sm7Hw=; b=q/4ramdXfmMOOG6V0Uzib/k6gV
	JBjlagBUzh7AC2/JyE5Mq6fFDY+DPXziri5mXPxdxVD6A/4GIXZDJX7BksIdZ4UMxyHnZksAaxUaK
	gBlPYZCqGCtQTDKgFXvRBd8YsMWCbKFJphFS6PpLoibgJWwy6aca75VsyAMn/6fUoHG51l6KczeM9
	vPsXj4CGArS8DDxqUXRLEU8gwJ0GLrXxyhE5frly9FVaWqeCWe88Yd2PzLMGpZFYUAebCJ9qxMZUB
	iZGPrK7yobHEuw6XWTroK81GGy4mjS5n75vCkE0R6dP8zm/HcVDDsqXEL6ihS+i48BMPvDcipWKKb
	MAR24sQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj21-0000000EmJ7-0wRd;
	Sat, 25 Apr 2026 19:51:13 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1z-0000000EmIC-0ESJ
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:12 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbe437b072so5074786a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146670; x=1777751470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MXD39Wztx5B19vyUuBgtwPNQEXtFgeFRMISpC6sm7Hw=;
        b=A0jr7NCXe8Nxw8JYQLN63Uw7fnbuZ664eF+mT3+bxqFBpiYj5qe0g3lvPAMPSmpvW1
         gtf23FVOWBTsR0AwrOez1NsCUhQ8eziY48xzseg08aNOex9Wk1Y0JS8rXhBb/4D7me0Z
         5raSUAm4hFCJSiKq7sf6nT/JOzlTrk6/d/Ek8FxW9oL6mIA5eC9Knu5+bpShl7lQb0CE
         twzphbvQeyD3zzzRlMPmr9O8kmj71yUn53FRl4fJEqBBOUfwdeH3d/dUn5Kjb4JUrfBx
         Pp/VRaxjiL7FFZHnB4aBYzLAQ9+cJGVDHRK+rYXpUzSIuZ3K79OKhekPaCgzcueJfptJ
         2Etg==
X-Forwarded-Encrypted: i=1; AFNElJ8YWQNcipyW3ig38aCR//kClJP+Tm88Rcuz0egbjeSAo27CteZlDJSUwMqIY4wAyEnYf/BiUF6XGNhGNn7wew==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm10sWObMHo6xg4OrntrPzg62+psSj/bBm/CuYcLzSyVZs6kfH
	4yYVkR3DW2P5KVdrvHlA+lVFQK6DNs3PW4Uu+HQLtHLpgc57R6E+n/W/
X-Gm-Gg: AeBDievElG8vNA+83TaIRCefLRfId6Etu9YLzeyKc1GaQb0BRqizQfEe7um+srUIb9p
	MeBt8itaF4/XoRJIcY9401OVZRhTHU9LaSALRkBqoQr0UkCUNwl0kpizdQb6JO6jx/Sm/XmY2uA
	LO0BcJ0SXbzvzOjzF5r/py3Sfv5MC9G/JgDq6ohJEPRwg2b+/IRZWH8STRq02Zwkz0p7sxWRXHx
	McNxJmIlqjmBOVgLhejAgpswEOO4NoXU3MGcUNVxChVGsuTWB7QBFDwzZoQTIS+u82rkApl5XhW
	G9pcCdZD51M7MzUdFwL4C4GBus+XuFtuF3AVR1PFqzPWYU9n3w5lkbgJQDgG4kz0/yIBEJscuuB
	CllPQ0BHhnjed9Z5z7QBrY6x/fFqxSLtqVp4kjpLesNXnP4Ua9xNh8nFphXwyTTcNMrJiqCLq3h
	ZusopIXFDwq+eXOzrlk0kj2r+GrAyQSoFddiOyMMrdnER74URzQuSWtY8kWyYYxPxuM+o0KuKN2
	w==
X-Received: by 2002:a05:6830:668e:b0:7dc:cdea:7d9 with SMTP id 46e09a7af769-7dccdea1007mr15389398a34.22.1777146670115;
        Sat, 25 Apr 2026 12:51:10 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:09 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 07/21] wifi: mt76: mt7925: add MT7927 firmware paths
Date: Sat, 25 Apr 2026 14:49:57 -0500
Message-ID: <20260425195011.790265-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125111_102119_F1B3C945 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Javier Tia <floss@jetm.me>

Add firmware path definitions for MT7927 WiFi firmware (WIFI_RAM_CODE
and PATCH_MCU) and the corresponding MODULE_FIRMWARE declarations. Add
MT7927 cases to mt792x_ram_name() and mt792x_patch_name() so the driver
loads the correct firmware for the 0x7927 chip ID.

PCI device table entries are deferred to a later patch to allow
infrastructure setup before device enablement.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01d..f820d5aeb723 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -633,6 +633,8 @@ module_pci_driver(mt7925_pci_driver);
 MODULE_DEVICE_TABLE(pci, mt7925_pci_device_table);
 MODULE_FIRMWARE(MT7925_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7925_ROM_PATCH);
+MODULE_FIRMWARE(MT7927_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7927_ROM_PATCH);
 MODULE_AUTHOR("Deren Wu <deren.wu@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("MediaTek MT7925E (PCIe) wireless driver");
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4ff93f2cd624..09840483fe2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -46,12 +46,14 @@
 #define MT7921_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7922_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7922_1.bin"
 #define MT7925_FIRMWARE_WM	"mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin"
+#define MT7927_FIRMWARE_WM	"mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin"
 
 #define MT7902_ROM_PATCH	"mediatek/WIFI_MT7902_patch_mcu_1_1_hdr.bin"
 #define MT7920_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin"
 #define MT7921_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
 #define MT7922_ROM_PATCH	"mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin"
 #define MT7925_ROM_PATCH	"mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin"
+#define MT7927_ROM_PATCH	"mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin"
 
 #define MT792x_SDIO_HDR_TX_BYTES	GENMASK(15, 0)
 #define MT792x_SDIO_HDR_PKT_TYPE	GENMASK(17, 16)
@@ -459,6 +461,8 @@ static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 		return MT7922_FIRMWARE_WM;
 	case 0x7925:
 		return MT7925_FIRMWARE_WM;
+	case 0x7927:
+		return MT7927_FIRMWARE_WM;
 	default:
 		return MT7921_FIRMWARE_WM;
 	}
@@ -475,6 +479,8 @@ static inline char *mt792x_patch_name(struct mt792x_dev *dev)
 		return MT7922_ROM_PATCH;
 	case 0x7925:
 		return MT7925_ROM_PATCH;
+	case 0x7927:
+		return MT7927_ROM_PATCH;
 	default:
 		return MT7921_ROM_PATCH;
 	}
-- 
2.43.0


