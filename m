Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A3FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMAgSidrHOjcG4s8cbGWbijYESRhf2FNOdS6mzEMeJs=; b=h9GtdJzW8aPcNyNjRozzEzTyg0
	Wfm31EAZrFEsFKpVXmP0QCCFhUfOtLr7cBSLtpGjUNnjHfuCSeB3bOiMQeyxmpesnLIn9GYT/NTkB
	UiyDQCGC/yVe9w/ZEHzQcY3oUFNuirddivGKNazlZIS89V6LBP8VQ2zxAFEbRyLx39ShejCcWU4az
	NDInAABhtLCsnrrtF0gY33IMZfXdMq20FshmJwU5VpNSN2/WfSzyanTaukQ7u8OgcmO5CstQV6hi6
	CN6VCXBwOKHt2qgancV3hHvYETX5tFe6dXuhmltTmZG9D3Hi6AEGeuZzE2wnWiO8Xo1/JGbdN399f
	7LltAP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2x-0000000EmeQ-328X;
	Sat, 25 Apr 2026 19:52:11 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2v-0000000Eme3-3Ghn
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:52:10 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso2896600a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146729; x=1777751529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMAgSidrHOjcG4s8cbGWbijYESRhf2FNOdS6mzEMeJs=;
        b=tDZQh7eknesd5CQZ+o7CATYNe4snYUcagk4Z6/DdVP5bzfPwSg1TRLC5S23IAkgJg8
         MgX+svIfLowzNrS3oLxW4sSVspY/Bm7JnY42qYRuzCdAtT31mtNfMTv8nWDdNZGNtg4l
         m+xPLlvRMGdyaq4j58vAoc4zkDVrO+VCF5R0HS/1RMdrLgqUTyAyXnBS/abOyojDas/m
         uki+GBaCr0RP/cpRunEj8axmRuFb9r+Xe8afhxfYONTtECW/M44G+PfnLaARqUnvay5j
         erPlN/4AOEcCinuoN8Qlbp2b4WmZp+wOqOyCpTEsVaJcDEXDC6LT1j9lWmYV6iPMu6GK
         Znsw==
X-Forwarded-Encrypted: i=1; AFNElJ9tjvgOjvYNdQY85BKB/lLALcN9NgR3rVb/y+WeOXzznECQ8OhLnMfzRCVrwCRjwhFIDQI33l7g9ra9/Mq1zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6QTZOFLipFs8qk11PY4fGu/HG4r2Hshb1uTeJl9WLMbjnjARW
	Cbjw+LS4ifUOOTWan3pJ2VEUOXVh0tfjFJ7RGe36QG1PUSatNw/c0ixd
X-Gm-Gg: AeBDiett/tjlGscB2mAVBvCJshAV2+MuQ1MI9el8N3TxxWVKZ8aXz9lskN5w20kBNS3
	KWmyKQtGHYe0SIgeTBY2017k5hRdcBT9kECCEefUI81hfo4WGq+Wg2GRgYd+BYbvCFC6oiul57a
	77kvgScmANfeaO/Kqij+SEsPHxaDRNpv4coXvZtF+JYMnMvT4Tc9y/noT9tGachUrhoNgWGKak5
	LCA7TG5CoGlQY0klXPBduWxPnmE+MgWe9jgY2Ykt/7/H6w2p7MCSNlWnBf4vl59U33o2OeuJE/F
	7xXr+vUe0Zo2v1rr2Bv6JnZ80HYOsPCNWHBBtQDN8n8W2A+99RSOeNX/w7stsEho/tM6QEpJLvY
	/L4caxRtsWvVABRz3eOBzz0X9NneDDaSUl3oXbWoICdgu5gwmTHOrknoycAlUkzRB6HCX4YYysh
	bAXOCP+tvzwf7e//jOa8lJGxe/4Ggc2XoxBs1NVVyUWmqjKs1p6I4Oe06w4PT5tXgukt/0jWjkr
	Q==
X-Received: by 2002:a05:6830:411a:b0:7d7:570b:6800 with SMTP id 46e09a7af769-7dc951fc052mr23532285a34.23.1777146728925;
        Sat, 25 Apr 2026 12:52:08 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:52:07 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 21/21] wifi: mt76: mt7925: add MT7927 USB support
Date: Sat, 25 Apr 2026 14:50:11 -0500
Message-ID: <20260425195011.790265-22-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125209_821404_EFD369D3 
X-CRM114-Status: GOOD (  13.53  )
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

Add the MT7927 USB device ID and normalize the raw 0x6639 CHIPID to
MT7927 so the shared mt7925u code can use the proper chip-specific paths.

Restore the required band setup after USB MAC reset before restarting
the device.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 15 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c        |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f03856d..7c64f3c1a2d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -10,6 +10,8 @@
 #include "mac.h"
 
 static const struct usb_device_id mt7925u_device_table[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x6639, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7925, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	/* Netgear, Inc. A9000 */
@@ -120,6 +122,12 @@ static int mt7925u_mac_reset(struct mt792x_dev *dev)
 	if (err)
 		goto out;
 
+	if (is_mt7927(&dev->mt76)) {
+		err = mt7925_mcu_set_dbdc(&dev->mphy, true);
+		if (err)
+			goto out;
+	}
+
 	err = __mt7925_start(&dev->phy);
 out:
 	clear_bit(MT76_RESET, &dev->mphy.state);
@@ -198,6 +206,13 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 		    (mt76_rr(dev, MT_HW_REV) & 0xff);
 	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
+	if (mt76_chip(mdev) == 0x6639) {
+		dev_dbg(mdev->dev,
+			"MT7927 raw CHIPID=0x%04x, forcing chip=0x7927\n",
+			mt76_chip(mdev));
+		mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
+	}
+
 	if (mt76_get_field(dev, MT_CONN_ON_MISC, MT_TOP_MISC2_FW_N9_RDY)) {
 		ret = mt792xu_wfsys_reset(dev);
 		if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 632ae755c7a6..9bd61c9e94ed 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -925,6 +925,7 @@ mt76u_ac_to_hwq(struct mt76_dev *dev, struct mt76_queue *q, u8 qid)
 		q->ep = q->hw_idx + 1;
 		break;
 	}
+	case 0x6639:
 	case 0x7961:
 	case 0x7925:
 		q->hw_idx = mt76_ac_to_hwq(ac);
-- 
2.43.0


