Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBA3FF885A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZigS9vjftMF0VQjxlX5PZ83w4DOdKz05NDo5rQAbe4=; b=cYUWzK/04C0vLebdTKgNAkL5e7
	xb6U9+b4IQxT5uGiSXm+PUh9I6iI+fKLbaTWzqfZyO53fxyK2at5ePgaws9whTqKgfviKXZg1oBfE
	sgaCPqqehkYgV1pxP5iBcEVWrAzmvxVQlEP/Se5LisZ1dYwFBxHojosVPnoi6r5RbzJClbNiaMQri
	EwogFgY8jzQpyZFlSJ1/OKNGjk6sxEhzQxP3Vm9dUjGW5DDGM0N00uekXtN8AMd31QFthP3rSjHsQ
	fFn8BqyE7vtw2r2ecg9iFXF8ZQR8t2xk8Yaq0M4VWjY8Bb5g6txz2cUBCktIeSXACejoFP5c3NT+L
	IQK0x5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1C-0000000Em7X-32ge;
	Sat, 25 Apr 2026 19:50:22 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1A-0000000Em6z-1MU0
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:21 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbe437b072so5074532a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146619; x=1777751419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZigS9vjftMF0VQjxlX5PZ83w4DOdKz05NDo5rQAbe4=;
        b=CRWIT0q9RmbEctUgBLjS62LAhnqIOnBKYsws6hZtk7EUrTNSDz++D0FIo2otPXB/M+
         k9UKxSLAedy3gCobg6h2dadY8bTujCYIMf3NjIjwGTEBd9RHGQ3t40V6wuw3VwLrfurs
         8WcfzpOipUpZntoeTKPgil9y26W5g8q50URm/u0d0ggqXBXQUSOGy5/hw64TXg8DFaNx
         JhFtV/drYAwYH90tgOytgmiK2sHvcIqfAU0qNg+EATyRBSjfBf10EWSL6MqBgj9roTOF
         5XoDCE7F63tt1TPN7yb5vJvCs/OPsZ1DFPU3Pbh0+oQaj9F6DmIja8rCsmx4D3I2f2XN
         Hnxw==
X-Forwarded-Encrypted: i=1; AFNElJ8m4trKvrC6eKmAetbLOP8xdRyKNWM8OM38Auw0F8O7LrHgT+AmlOIFdp/FfQyLdfNeTsSoL0yE57GGL4ZzCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyskSIwA1Zih/AMg6srxpd2MfNU2IfB24KOuOk0NZ/jElamsvPX
	ipxkVCWD1P5p93fylk2R7ZOpM/H+Kolayze3XPk/Zkeet2SdSXN/JvAp
X-Gm-Gg: AeBDietU3gPwWVdnMzXEg6skZroIRGtnQGmSbhOOqTQFmc5hXUXKOM0KEoFDzQqUE4N
	Ud7Vj/PP48XayLQ4JufgQgJFieZ6G3fpOnMVtptWbBAPWoqtzBVvotAZoe8K9LdB/gocxXPSZ+q
	Otvx4RlqjPR95n/yn6ORRan5z6/SzApl5GfbKc3hZcQmv5vdolxQ5J4a4mjZS6crT7AoNlmmXzA
	OuCX+mo5OCt2Z4ycNNe+/u3QypWbI7yq01Ple9o+zVw8xnkRDOxB/8J2l8V8NY4RYCUfPHmZfD8
	JEW+9xiKoq2yIcjVnj04jzvY0yXvypP2SnJt5Xdd91pHJKh5cYUW0Ht6ry89y/mt9nlb1vLuSyZ
	diuclGjdCbVpl19w4HK8xdExPReSGe2VdBLrCVibQ40Tb7WlxCpWt+1yowcsCwG7GC5Kb4o9geM
	tpd9kFQ4XkXW6jpZz305FUB9jwTRJ551PoR7Rwpobx2C5tXgej/0JPBUzzN0QqPZGCFHzy/ZQ0s
	A==
X-Received: by 2002:a05:6830:3149:b0:7d9:f50f:968a with SMTP id 46e09a7af769-7dc951177a9mr22041763a34.5.1777146619095;
        Sat, 25 Apr 2026 12:50:19 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:18 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 00/21] wifi: mt76: mt7925: MT7927 (Filogic 380) support
Date: Sat, 25 Apr 2026 14:49:50 -0500
Message-ID: <20260425195011.790265-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125020_380383_AB9DEBC3 
X-CRM114-Status: GOOD (  14.18  )
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

This series adds support for MediaTek MT7927 (Filogic 380), a combo
WiFi 7 + BT 5.4 device, in the mt7925 driver.

Patches 1-5 add generic 320MHz EHT support without MT7927-specific
references.

Patches 6-9 add the initial MT7927 enablement pieces, including chip ID
helpers, firmware paths, per-chip IRQ map handling, and disabling ASPM
and runtime PM for MT7927.

Patches 10-21 add the remaining MT7927 support needed to make the device
usable, including connac3 helper cleanup, non-MLD link removal handling,
inactive BSS deactivation tolerance, WFSYS reset support, common DMA queue
helper refactoring, MT7927 PCIe DMA configuration, BSS band assignment
sync, MBMC event handling, CNM ops enablement, and PCIe/USB device support.

The follow-up MT7927 support patches are folded into this version so users
and testers can apply one complete series for MT7927 enablement.

Tested hardware:
- ASUS ROG Crosshair X870E Hero (BT 0489:e13a, WiFi 14c3:6639)
- ASUS ProArt X870E-Creator WiFi (BT 0489:e13a / 13d3:3588, WiFi 14c3:6639)
- ASUS ROG Strix X870-I (WiFi 14c3:7927)
- ASUS ROG Strix X870-F Gaming WiFi (BT 0489:e13a, WiFi 14c3:7927)
- ASUS ROG Strix X870E-E (BT 13d3:3588, WiFi 14c3:7927)
- ASUS ROG STRIX B850-E GAMING WIFI (BT 0489:e13a, WiFi 14c3:7927)
- Gigabyte X870E Aorus Master X3D (BT 0489:e10f, WiFi 14c3:7927)
- Gigabyte Z790 AORUS MASTER X (BT 0489:e10f, WiFi 14c3:7927)
- Gigabyte Z790 AORUS ELITE X WiFi7 (BT 0489:e10f, WiFi 14c3:7927)
- MSI MEG X870E ACE MAX (BT 0489:e110, WiFi 14c3:7927)
- Lenovo Legion Pro 7 16ARX9 (BT 0489:e0fa, WiFi 14c3:7927)
- Lenovo Legion Pro 7 16AFR10H (BT 0489:e0fa, WiFi 14c3:7927)
- TP-Link Archer TBE550E PCIe (BT 0489:e116, WiFi 14c3:7927)
- EDUP EP-MT7927BE M.2 card (WiFi 14c3:7927)
- Foxconn/Azurewave M.2 modules (WiFi 14c3:6639)
- AMD RZ738 reference design (WiFi 14c3:0738)

Tested on Arch Linux, CachyOS, EndeavourOS, Fedora (Bazzite), NixOS,
openSUSE Tumbleweed, and Ubuntu across kernels 6.13-6.19.

Changes since v4:
- Add Reviewed-by tags to patches 1-9.
- Add MT7927 follow-up support:
  - replace is_mt7925() with is_connac3()
  - use link-specific removal for non-MLD STA
  - tolerate inactive BSS deactivation
  - add MT7927 WFSYS reset support
  - factor out common DMA queue allocation
  - switch mt7925 DMA init to common mt792x queue helpers
  - add MT7927-specific PCIe DMA support
  - sync MT7927 BSS band assignment
  - add MBMC event handling
  - enable CNM ops for MT7927
  - add MT7927 PCIe support
  - add MT7927 USB support

Changes since v3:
- Dropped patches 9-13 (DMA, HW init, band_idx, PCI IDs). Sean Wang
  will submit these as part of a generic layer refactor. The CNM quirk
  (v3 patch 13 feedback) will be folded into mt792x_get_mac80211_ops()
  as part of that work.
- Fixed is_320mhz_supported() to use mt76_chip() directly instead of
  is_mt7927() which was not yet defined at that point (patch 5).
- Trimmed verbose inline comments in ASPM/PM patch per review feedback.
  Detail kept in commit message (patch 9).
- Added tested hardware: ASUS ROG STRIX B850-E GAMING WIFI.

Changes since v2 (suggested by Sean Wang):
- Fixed is_320mhz_supported() to check for MT7927 only, not the
  entire mt7925 family. MT7925 does not support 320MHz (patch 5).
- Dropped phy_cap_info[7] 320MHz additions (NON_OFDMA_UL_MU_MIMO
  and MU_BEAMFORMER) to keep capabilities conservative (patch 5).
- Disabled runtime PM for MT7927 (patch 9). The combo chip shares a
  CONNINFRA power domain between WiFi and BT; SET_OWN/CLR_OWN
  transitions crash BT firmware. Discovered via user reports of BT
  lockups after enabling power_save=1 (Reported-by: Nitin Gurram).

Changes since v1 (suggested by Sean Wang):
- Reorganized from 18 patches into 13 across 8 logical groups
- Common 320MHz patches first, chip-specific changes later
- Introduced mt792x_dma_config struct to reuse mt7925_dma_init()
- Replaced is_mt7927() with is_320mhz_supported() in common patches

Link to v4: https://lore.kernel.org/linux-wireless/20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me/
Link to v3: https://lore.kernel.org/linux-wireless/20260325-mt7927-wifi-support-v2-v3-0-826feb8fef8e@jetm.me/
Link to v2: https://lore.kernel.org/linux-wireless/20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me/
Link to v1: https://lore.kernel.org/linux-wireless/20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me/

Javier Tia (9):
  wifi: mt76: mt7925: fix stale pointer comparisons in change_vif_links
  wifi: mt76: mt7925: add 320MHz bandwidth to bss_rlm_tlv
  wifi: mt76: mt7925: handle 320MHz bandwidth in RXV and TXS
  wifi: mt76: mt7925: populate EHT 320MHz MCS map in sta_rec
  wifi: mt76: mt7925: advertise EHT 320MHz capabilities for 6GHz band
  wifi: mt76: mt7925: add MT7927 chip ID helpers
  wifi: mt76: mt7925: add MT7927 firmware paths
  wifi: mt76: mt7925: use irq_map for chip-specific interrupt handling
  wifi: mt76: mt7925: disable ASPM and runtime PM for MT7927

Sean Wang (12):
  wifi: mt76: connac: replace is_mt7925() with is_connac3()
  wifi: mt76: mt7925: use link-specific removal for non-MLD STA
  wifi: mt76: connac: tolerate inactive BSS deactivation
  wifi: mt76: mt792x: add MT7927 WFSYS reset support
  wifi: mt76: mt792x: factor out common DMA queue allocation
  wifi: mt76: mt7925: switch DMA init to common mt792x queue helpers
  wifi: mt76: mt792x: add MT7927-specific PCIe DMA support
  wifi: mt76: mt7925: sync MT7927 BSS band assignment
  wifi: mt76: mt7925: add MBMC event handling
  wifi: mt76: mt792x: enable CNM ops for MT7927
  wifi: mt76: mt7925: add MT7927 PCIe support
  wifi: mt76: mt7925: add MT7927 USB support

 .../net/wireless/mediatek/mt76/mt76_connac.h  |  16 ++
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   4 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  13 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  26 ++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   9 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  80 ++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  43 +++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   3 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  25 +++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 133 +++++++++---
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  12 +-
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  15 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  25 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  11 +
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 198 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt792x_regs.h  |  23 ++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/usb.c      |   1 +
 19 files changed, 578 insertions(+), 73 deletions(-)


base-commit: e8c819df02436f2c2379766946735e1f06a7c923
-- 
2.43.0


