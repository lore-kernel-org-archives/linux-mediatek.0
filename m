Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71281088E70
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 04:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfoPytrUz8jnu1QwEs3H3bRbE3lX1OzACwh2r6y3HCk=; b=JGV7a26maPzXwrxIsJ7/0VoEA5
	qmQpnzr7zf481Wc+R4XiTdREhz0m31TQQmmqDcK73nCiG6K+vgnRQv1hscCTb3Cx+lC9D+BViv4mv
	j0sFBU/RNV4eq9S6o8n5B33ntz/bUB/3j5kiuOGFsqTIqvReOCu0GDv0ARBbNWr49+oYKFKuOTc7t
	bd1tGWQHID4vX4X9Xs0lQTNcLfcoEMqsUvL2k/1WD5KJi51YwQsocetWsCmU6aPe+rGkO7K8X/RNe
	BMctEeSvtn76Bo49O62FUYZpaCFczxnHhP803wZ9MPyWc+6GJIOJXJd/8tVJWzSW4M4CZZvDIAAgX
	UVD5HZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35Oc-00000009v3J-1kTq;
	Thu, 19 Mar 2026 04:54:10 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35OZ-00000009v1m-3zmP
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 04:54:09 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79800183233so6279757b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 21:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896046; x=1774500846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfoPytrUz8jnu1QwEs3H3bRbE3lX1OzACwh2r6y3HCk=;
        b=Y2UyayA3Nc48IZsQGcHOXp3e/xlY7yJxpWTmvspg3m3LVLHFKBXKw6e9ai8KXBwt0c
         sLOPg7Sjn46C278/WdTypMwm05Jf8xVeBcjEVTEABxUFFHFu5tBXbCe9WheaQAR5i/WB
         s4qy9gkMx5xllXjYWOUZKRuo4yZuUa5UBS+NAbA8Pv2tW0caNLXFT/PncEAiOzu5eAwz
         zsL3NNwh9WVN1jok4AcY+RiyC8wKmYuRJz11uVuDNWcvxQbnVCyCdDESSGHNvf3ibuHn
         Sw+UkDJZ0kZZ0qK3ChnHwC7A9xsXV2xHkkge/VPauJAR8foXvaKxbQvCcnSTFiLLZHlm
         ocAw==
X-Forwarded-Encrypted: i=1; AJvYcCV23iKU09vWBFDi96OEchI23xQ58qsNwfyCeKOZNK2+kFep39di2sA7HM0OXRz8eejfwmCP7+0gc6zTMt8mfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5z5hBzbFCho2UXyA98YiEdosq3fTRgT3fEYuv1EiItQebXCZ5
	FUEPHfdytL/UT0wdtxTCPSLQOERoNHVWyhtKCs10Ieyq1LHeQJb2X148
X-Gm-Gg: ATEYQzyZjSzvZZOubC33xp3FzRSXhBCbM+ZD50oop/pfbJQ7e3rS1avqpCzMdLiZYQb
	PS+HIIpNp0ZACrP6lCOBKnffKHVddMsyd4ClSZLDaaj73vxcaLMSQs9a8HVwqrgwC3OFyssHUiY
	tM8PYElaXrJAVS1EsztnVTDote7zGBJ/LWA7+VucF3ifhtK5NvWm5THi8U6CXUAkqMIz1KOdXLu
	Y3NIFcDuhbWXqy9cWqBtcNiqsZ7/Ei6dga+VeHDAtIGp0EyWXsbU2nm+LO/bE+5vAKKmlNry23m
	9WwfnQsRWCbn3FoKb8hnPMs8AV68rqBq8u53WM7nuK6PcfLMfBexLVdNAoo4Q8/3YIwuBROVgwP
	pDrYvc0H5au48UldqQKfhhiEmUn9JOoww2bzTPGUVZRp2LKrLtYsGRFeEDPhMdAPJNGpxuLY4tp
	yjMUV3+NB1jDzWquWPAo5Gtm92/s/Y0Q4EQIoE/aVPVv6PO//JzGtHKCoqHCB8IWmcJH6yzLi9/
	g==
X-Received: by 2002:a05:690c:c247:b0:794:87bf:76ef with SMTP id 00721157ae682-79a81a7fa9fmr23274817b3.7.1773896044146;
        Wed, 18 Mar 2026 21:54:04 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:95a7:adb9:1a5f:f78b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136e513sm30231457b3.10.2026.03.18.21.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:54:03 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt792x: add common USB transport reset helpers
Date: Wed, 18 Mar 2026 23:53:56 -0500
Message-ID: <20260319045357.13796-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215408_031674_DA226451 
X-CRM114-Status: GOOD (  12.74  )
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

Add per-device USB reset work and a control-path access check helper
for mt7921u and mt7925u.

This prepares common infrastructure for transport-level recovery while
keeping the reset state per-device for correct lifetime handling.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  2 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  5 ++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 50 +++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 17057e68bf21..6be28f4152ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -196,6 +196,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
+	mt792xu_reset_work_init(dev);
 
 	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
@@ -244,6 +245,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 
 error:
 	mt76u_queues_deinit(&dev->mt76);
+	mt792xu_reset_work_cleanup(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
 	usb_put_dev(interface_to_usbdev(usb_intf));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f03856d..8b5d58125352 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -184,6 +184,7 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
+	mt792xu_reset_work_init(dev);
 
 	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
@@ -232,6 +233,7 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 
 error:
 	mt76u_queues_deinit(&dev->mt76);
+	mt792xu_reset_work_cleanup(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
 	usb_put_dev(interface_to_usbdev(usb_intf));
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4ff93f2cd624..5f06074591ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -243,6 +243,8 @@ struct mt792x_dev {
 	wait_queue_head_t wait;
 
 	struct work_struct init_work;
+	struct work_struct usb_reset_work;
+	atomic_t usb_reset_pending;
 
 	u8 fw_debug;
 	u8 fw_features;
@@ -489,6 +491,9 @@ int mt792xu_dma_init(struct mt792x_dev *dev, bool resume);
 int mt792xu_mcu_power_on(struct mt792x_dev *dev);
 int mt792xu_wfsys_reset(struct mt792x_dev *dev);
 int mt792xu_init_reset(struct mt792x_dev *dev);
+void mt792xu_reset_work_init(struct mt792x_dev *dev);
+void mt792xu_reset_work_cleanup(struct mt792x_dev *dev);
+int mt792xu_check_bus(struct mt792x_dev *dev);
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr);
 void mt792xu_wr(struct mt76_dev *dev, u32 addr, u32 val);
 u32 mt792xu_rmw(struct mt76_dev *dev, u32 addr, u32 mask, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 47827d1c5ccb..2558d87b1e0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -11,6 +11,55 @@
 #include "mt792x.h"
 #include "mt76_connac2_mac.h"
 
+static int mt792xu_read32(struct mt76_dev *dev, u32 addr, void *buf)
+{
+	return __mt76u_vendor_request(dev, MT_VEND_READ_EXT,
+				      USB_DIR_IN | MT_USB_TYPE_VENDOR,
+				      (u16)(addr >> 16), (u16)addr,
+				      buf, sizeof(__le32));
+}
+
+static void mt792xu_reset_work(struct work_struct *work)
+{
+	struct mt792x_dev *dev =
+		container_of(work, struct mt792x_dev, usb_reset_work);
+	struct usb_interface *usb_intf = to_usb_interface(dev->mt76.dev);
+
+	if (usb_intf && usb_get_intfdata(usb_intf) == dev)
+		usb_queue_reset_device(usb_intf);
+
+	atomic_set(&dev->usb_reset_pending, 0);
+}
+
+void mt792xu_reset_work_init(struct mt792x_dev *dev)
+{
+	INIT_WORK(&dev->usb_reset_work, mt792xu_reset_work);
+	atomic_set(&dev->usb_reset_pending, 0);
+}
+EXPORT_SYMBOL_GPL(mt792xu_reset_work_init);
+
+void mt792xu_reset_work_cleanup(struct mt792x_dev *dev)
+{
+	cancel_work_sync(&dev->usb_reset_work);
+	atomic_set(&dev->usb_reset_pending, 0);
+}
+EXPORT_SYMBOL_GPL(mt792xu_reset_work_cleanup);
+
+int mt792xu_check_bus(struct mt792x_dev *dev)
+{
+	int ret;
+
+	mutex_lock(&dev->mt76.usb.usb_ctrl_mtx);
+	ret = mt792xu_read32(&dev->mt76, MT_HW_CHIPID, dev->mt76.usb.data);
+	mutex_unlock(&dev->mt76.usb.usb_ctrl_mtx);
+
+	if (ret == sizeof(__le32))
+		return 0;
+
+	return ret < 0 ? ret : -EIO;
+}
+EXPORT_SYMBOL_GPL(mt792xu_check_bus);
+
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr)
 {
 	u32 ret;
@@ -333,6 +382,7 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 {
 	struct mt792x_dev *dev = usb_get_intfdata(usb_intf);
 
+	mt792xu_reset_work_cleanup(dev);
 	cancel_work_sync(&dev->init_work);
 	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
 		return;
-- 
2.43.0


