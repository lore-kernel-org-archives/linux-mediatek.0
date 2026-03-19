Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1101088E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 04:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4Eb1YOEfRdkAVtKY58j579uUe7kZ9Q7QVxwqWPHF3s=; b=pljZfduOQe3g1LQ//Orff3ocxr
	d/7W5+LstcQH4Sp5Vdj7bbb7jp7G+wAiGwtCLbTNALHdpxa5OioopJvsw+uXZjAdTLH0TV592weOa
	tzVo2YKAYKFBmx2/guZOG3cUyHxzI/TzLrjMtRE007fZtCuwO0Q7ZVGebB6kBye5dBCAulh809JFd
	SOTuN6ZJyOOuaswe+EFCJZgr1AmaOafnHIUmevW81OSB3DO1fz0fwA/pxSeavmmsniaU56QK6G70M
	jpvaMvZjwGvpT4Hu+HnSPo2GDzwmNZ20sgErVtqgcpKeomPGmsYRLR7P1YGeHSGa9AbQNLuNM4JD2
	3wBN62ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35Oi-00000009v5A-2myV;
	Thu, 19 Mar 2026 04:54:16 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35Og-00000009v4K-1FVY
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 04:54:15 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79495b1aaa7so1857557b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 21:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896053; x=1774500853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4Eb1YOEfRdkAVtKY58j579uUe7kZ9Q7QVxwqWPHF3s=;
        b=gb60xBCaKnPacZqmAwLFfyQahqjf/8/ActwPjElygKSFRk5ebc6Di7zd7nW3ZDNzVD
         YEn9MinO4KopA46/lE7mfi8L+iFgeHEMVasgh3HPkHFNj+EeAvaquKN39fidaGK+o1mX
         SmqH7Ydc5L801ORNxLa24nM6mZltIyvJGJvKwUGMGRyxT5CsJsvvZ8h3Q3frAei1K861
         LCU/uviqgsGXp0a/d7cA4lc5Xampjx1Q/2I/vklhM3TXECrSP6l8ZBc5CYmWBCjW03Gn
         caJZOXrDiNSAu5/MzKSCWJCAAzr0I3pzFa4e9yQpysCN4tvoUZWwF+CVxtRl84oAMekK
         o7/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDfIvuOc6uQttRxoytPbxF4J89bHsnlGmymwi2sM1tAdm6fozrvP9GGqlna+revKGh2n74xvhT+EZx/9W45A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqna8Stu5FHbmPR9aZrx2JBheseHnFOxTY6nL2QJ+LX4MrWQSN
	cOpOUrjGZMOLj5aGznUrdS3jw3wHLRFGWR/LjkMrPOxKsumV1ERZQwZN
X-Gm-Gg: ATEYQzwdZgK8cCE2FCrIM3my5wZ7mA6xQDSbHtaI8avSdQXHux+TzJE14yEoKpeCOCh
	OHLbP2IUSNfnd2QgghLbAZi+OupEHfkQsS7fPyol+leA9+U7bmN+swsbk+DNPBcGFUgRfpenqE9
	u+4KFI3obUlSCrKZAo/bVlHVnD5ZHeFgVik+WYlfJ8zxSyXNNQSfVuSVyOlEM3TlD6A06AibiuR
	kav8IldpLiYZwmR7jlqKY0gB8Jqe+kp++IBLENYCH5IEMXFrigUikL4v+CKPNJL3exyNYo1qFA4
	awxSpo6qng4/ctg9ypFjfdPvmAbWYnLOQJGYCX/Z4Lt+XSsgLelc6yNYrDP24RjyB2EZjIAwebg
	x9PQ4v1wJpNoUvvGaCgkYA9+gd4XGySI4u+/rkAb6niay6BRP+jTOZ9mPluh9AETCBUbLGTx5+H
	rDRjB0N0samrXa/fOGZBV+bpB/QwIq7yU7/PT5h5hNzvxu1VU1b7yBPF3GQWwce6c1I2KmABUQ6
	Q==
X-Received: by 2002:a05:690c:85:b0:79a:40fb:933f with SMTP id 00721157ae682-79a71dbc38amr62618697b3.51.1773896052831;
        Wed, 18 Mar 2026 21:54:12 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:95a7:adb9:1a5f:f78b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136e513sm30231457b3.10.2026.03.18.21.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:54:11 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7921u: escalate broken USB transport to device reset
Date: Wed, 18 Mar 2026 23:53:57 -0500
Message-ID: <20260319045357.13796-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319045357.13796-1-sean.wang@kernel.org>
References: <20260319045357.13796-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215414_345670_51CA9C41 
X-CRM114-Status: GOOD (  15.18  )
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

Check the USB control path before running the normal WFSYS reset flow.

If USB access is no longer reliable, stop the WFSYS-only reset path,
mark the device as bus_hung, and queue a USB device reset instead.

Reuse the existing bus_hung state to represent transport-level failure,
keeping the semantics consistent with the SDIO path.

Also initialize bus_hung explicitly during probe for consistency.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  4 ++-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |  5 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 26 +++++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db73f..d27dbee8df1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -675,7 +675,9 @@ void mt7921_mac_reset_work(struct work_struct *work)
 		if (!ret)
 			break;
 	}
-	if (mt76_is_sdio(&dev->mt76) && atomic_read(&dev->mt76.bus_hung))
+
+	if ((mt76_is_sdio(&dev->mt76) || mt76_is_usb(&dev->mt76)) &&
+	    atomic_read(&dev->mt76.bus_hung))
 		return;
 
 	if (i == 10)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 6be28f4152ed..8c0f0e4ef87b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -88,6 +88,10 @@ static int mt7921u_mac_reset(struct mt792x_dev *dev)
 {
 	int err;
 
+	mt792xu_reset_on_bus_error(dev);
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
 	mt76_txq_schedule_all(&dev->mphy);
 	mt76_worker_disable(&dev->mt76.tx_worker);
 
@@ -196,6 +200,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
+	atomic_set(&dev->mt76.bus_hung, false);
 	mt792xu_reset_work_init(dev);
 
 	udev = usb_get_dev(udev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 5f06074591ca..74222c507b81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -494,6 +494,7 @@ int mt792xu_init_reset(struct mt792x_dev *dev);
 void mt792xu_reset_work_init(struct mt792x_dev *dev);
 void mt792xu_reset_work_cleanup(struct mt792x_dev *dev);
 int mt792xu_check_bus(struct mt792x_dev *dev);
+int mt792xu_reset_on_bus_error(struct mt792x_dev *dev);
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr);
 void mt792xu_wr(struct mt76_dev *dev, u32 addr, u32 val);
 u32 mt792xu_rmw(struct mt76_dev *dev, u32 addr, u32 mask, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 2558d87b1e0f..6b10d035bcbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -60,6 +60,32 @@ int mt792xu_check_bus(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792xu_check_bus);
 
+int mt792xu_reset_on_bus_error(struct mt792x_dev *dev)
+{
+	int err = 0;
+
+	if (!atomic_read(&dev->mt76.bus_hung))
+		err = mt792xu_check_bus(dev);
+
+	if (err) {
+		atomic_set(&dev->mt76.bus_hung, true);
+
+		if (!atomic_xchg(&dev->usb_reset_pending, 1)) {
+			dev_warn(dev->mt76.dev,
+				 "USB transport access failed (%d), queueing device reset\n",
+				 err);
+
+			schedule_work(&dev->usb_reset_work);
+		}
+
+		return err;
+	}
+
+	atomic_set(&dev->mt76.bus_hung, false);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792xu_reset_on_bus_error);
+
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr)
 {
 	u32 ret;
-- 
2.43.0


