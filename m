Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA69D3517F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhMDaJgdHrBwkyZkpBFRF9FScxuvntJewf4BaEmC6l8=; b=dML+rWFzYhpjzagP9XQr637S7C
	WVuZrkECCf4MqgDJtfrkk+ODOvTJH+xNJGFm1T0ah856gyrQC9y1iFgxMkKudViX+sd6wIft0oXMB
	60KpidOldDe3URTzGvz/W4vSRn5bDsSttm6tz+3jTSH4Yyo4OzLjYxFi1e+aYnDeWSTxyKxSz4sMS
	t7e9KM5JDsWDySUD9w0SW1vlpd7oc5r9+25EbUOKpOj+n6qJxxdJtm118ZSxvek/QV5m0mBlkZKm4
	ylsA7v0HB2lJSXUyoTf/nD/DFWxNX76tkKs1TD9Cs7dnt6eqCosYG8AVDnIpSq7evXrCWOKyOjUz2
	dqcTQFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80tt-0000000G04A-3o81;
	Wed, 01 Apr 2026 19:06:49 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80to-0000000G03D-0nih
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 19:06:48 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-41bfec86420so63891fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 12:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070403; x=1775675203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhMDaJgdHrBwkyZkpBFRF9FScxuvntJewf4BaEmC6l8=;
        b=iFMigpGW3L8cbrNytySeHL4kDgzAcrN2oZdbDSlmm3QhbcZw76StD+KBlw/9p/vGZs
         RUV4y12G8knuHenIkPthH+rOgcKn4g8bg4zU6T0IMxP1nVqOo8yJmk3W2p8PNrRcXCUW
         /vwc/0JxgYK3ngkT01YkFCLhNsqnHwDWmCY+IJDfpVG/rsAbHHq3s373qzmlgfqmckJc
         qdlh47Q4p+M3/xl9gM8FelDrFu0XJYbOmOg4GJzuz34+7z/QkpBEW7rWYUNQdcH1POqF
         /cY8wamf8FR+wIzDHMc50uzWSORqvEMlX3lHpFeJp4Mk3DgxdL/IFnzVMXcIFZ1G43V4
         LvEw==
X-Forwarded-Encrypted: i=1; AJvYcCXrG63u2V5YJf8TxXe+jhp3L67EgPSqIk3kDOcE6C7G9bDdAUkgTqBMirTNDGn9Zf94gAy8pAFLbmN7sP+cGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxicD5lXsGNC4WyGXRD+6fRkKKCD3e4dj8xhfin4nhBb2k1gG9R
	6XoUu6WYHnVFxrd7xITz5a5JCFzE9fak+eYQNl4lcioETpiIJb6y5JRw
X-Gm-Gg: ATEYQzwKrB+oW0MfYOlSfCNxzjufduscMV52Gnzj5/06gu0ZfQvt+zmNbnXT5aWD5Dt
	Zuz5TGQeYlC2MUdLjk+WNaonlG2/rX1nkoGWNEJULnzgQgjGh2MqOyNqyoBr9irCi0JYpyl/Huf
	nN15+ue8n0ZNHAlSGzC/J6dMBCJcBoxBWMdQxHCWbL0Did5C4YO4+UDA/vOJzCKHvb8o5U8cV+i
	/39wegGJAvJOb3T0Td4XizBifxzrxbTFdRnnTjPUi5tTZ0ZXB0JxIjeiCTMuP2Qt1HgZQtm34VN
	PlbzFb/jdvKz6suL/UaZUg+juiX3nMRzhhnIp1zlb+H7j7UlbhBJY1H0bdMKv6sKzfSrhVY5V3A
	Bwpdt86HYQSGowaSvRfchOV6bR4FcUGUvE/9XoezqCtwgbwk9F6b+cjZFPsG4Qu4npFS4JZiwiy
	uafMRJqCF6xZV7tXtulJF7b7x4ljguVRr2aaX3MzuN10Vg18KTa10I0E1GwQ==
X-Received: by 2002:a05:6871:3588:b0:417:533b:79ac with SMTP id 586e51a60fabf-422cfc075bamr3055228fac.9.1775070402752;
        Wed, 01 Apr 2026 12:06:42 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eaf2c780sm551867fac.6.2026.04.01.12.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:06:42 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 1/2] wifi: mt76: mt792x: add common USB transport reset helpers
Date: Wed,  1 Apr 2026 14:06:31 -0500
Message-ID: <20260401190632.147042-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_120646_945879_6B9AEBB4 
X-CRM114-Status: GOOD (  13.45  )
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
v2:
- Rebased onto the latest mt76 tree
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


