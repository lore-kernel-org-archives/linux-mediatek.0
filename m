Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402F2C3F68F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 16:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164A42468A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 16:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QQoPu/7x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqTd2bRL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164A42468A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2yEaTtpjr6I2leGj6OUdPtabUmcrZindE1u+ENa8eY=; b=QQoPu/7xk5i9Xv
	MlYc1FBMvB0j3F20yyxLf8LbG4jhZ8pCl8+0QWIwwNN6/SV6vo6VMNRn2VGZ796m9Wb+Ttac7tCfv
	5PatbTrJoy5GKQlJxIRaAqQ04IyreZAN6vy9u+mptBLsHVeEtHfNj93yiM0VCTYCnrkqvhDxziCO7
	hDzLOZ2z8K7CwqqsWHwyX/cwIEcWA+u/Qp+SqdOSrUfCfosEJ8j0ouYpDoN2Ti1QQKwFDaoNIZTYy
	tsU37VGiix8EgVuHPgMeHCW6llceN558AzqKnGZ7a7kdHFwSOuKXd9ZYkS/ARxf1OY6vCZhkM5DFd
	fNRHxgEHA9cFHad5UerA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8SA-0004tq-Gf; Thu, 16 Jan 2020 16:57:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8Ov-0000M6-Fi; Thu, 16 Jan 2020 16:53:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBCEB20730;
 Thu, 16 Jan 2020 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193625;
 bh=YxgnhOYDbT7KSEZFo5YqdsGUEpgMB64qZI0ItoJFqAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EqTd2bRLA5uYhIELYykjEdLBjucIndSVIo3vxcbhxHaitjisG9Rr3kYsSI3MKMTJA
 DIZMS+D9tNB2KIBEZ2sfjxkZfralqMzAN3SJlNPBszq7UpC2g1wJJwvZ87a7Fr07WR
 JrSWNADo4CRwDeQqHMW+kmMcFn1YTdxAxs955by0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 159/205] mt76: mt76u: rely on usb_interface
 instead of usb_dev
Date: Thu, 16 Jan 2020 11:42:14 -0500
Message-Id: <20200116164300.6705-159-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_085345_681312_DBCAAE87 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Sasha Levin <sashal@kernel.org>, Zero_Chaos <sidhayn@gmail.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 80df01f4dc79abbed724bbe0851cab3fe8ad9d99 ]

usb drivers are supposed to communicate using usb_interface instead
mt76x{0,2}u is now registering through usb_device. Fix it by passing
usb_intf device to mt76_alloc_device routine.

Fixes: 112f980ac8926 ("mt76usb: use usb_dev private data")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Tested-By: Zero_Chaos <sidhayn@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h       |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c |  2 +-
 drivers/net/wireless/mediatek/mt76/usb.c        | 12 +++++++++---
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8aec7ccf2d79..e8605ae6f8a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -799,7 +799,8 @@ static inline int
 mt76u_bulk_msg(struct mt76_dev *dev, void *data, int len, int *actual_len,
 	       int timeout)
 {
-	struct usb_device *udev = to_usb_device(dev->dev);
+	struct usb_interface *uintf = to_usb_interface(dev->dev);
+	struct usb_device *udev = interface_to_usbdev(uintf);
 	struct mt76_usb *usb = &dev->usb;
 	unsigned int pipe;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index 00a445d27599..65d404e61404 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -226,7 +226,7 @@ static int mt76x0u_probe(struct usb_interface *usb_intf,
 	u32 mac_rev;
 	int ret;
 
-	mdev = mt76_alloc_device(&usb_dev->dev, sizeof(*dev), &mt76x0u_ops,
+	mdev = mt76_alloc_device(&usb_intf->dev, sizeof(*dev), &mt76x0u_ops,
 				 &drv_ops);
 	if (!mdev)
 		return -ENOMEM;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index da5e0f9a8bae..8b26c6108186 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -39,7 +39,7 @@ static int mt76x2u_probe(struct usb_interface *intf,
 	struct mt76_dev *mdev;
 	int err;
 
-	mdev = mt76_alloc_device(&udev->dev, sizeof(*dev), &mt76x2u_ops,
+	mdev = mt76_alloc_device(&intf->dev, sizeof(*dev), &mt76x2u_ops,
 				 &drv_ops);
 	if (!mdev)
 		return -ENOMEM;
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 20c6fe510e9d..05aa42bd9808 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -20,7 +20,8 @@ static int __mt76u_vendor_request(struct mt76_dev *dev, u8 req,
 				  u8 req_type, u16 val, u16 offset,
 				  void *buf, size_t len)
 {
-	struct usb_device *udev = to_usb_device(dev->dev);
+	struct usb_interface *uintf = to_usb_interface(dev->dev);
+	struct usb_device *udev = interface_to_usbdev(uintf);
 	unsigned int pipe;
 	int i, ret;
 
@@ -235,7 +236,8 @@ mt76u_rd_rp(struct mt76_dev *dev, u32 base,
 
 static bool mt76u_check_sg(struct mt76_dev *dev)
 {
-	struct usb_device *udev = to_usb_device(dev->dev);
+	struct usb_interface *uintf = to_usb_interface(dev->dev);
+	struct usb_device *udev = interface_to_usbdev(uintf);
 
 	return (!disable_usb_sg && udev->bus->sg_tablesize > 0 &&
 		(udev->bus->no_sg_constraint ||
@@ -370,7 +372,8 @@ mt76u_fill_bulk_urb(struct mt76_dev *dev, int dir, int index,
 		    struct urb *urb, usb_complete_t complete_fn,
 		    void *context)
 {
-	struct usb_device *udev = to_usb_device(dev->dev);
+	struct usb_interface *uintf = to_usb_interface(dev->dev);
+	struct usb_device *udev = interface_to_usbdev(uintf);
 	unsigned int pipe;
 
 	if (dir == USB_DIR_IN)
@@ -952,6 +955,7 @@ int mt76u_init(struct mt76_dev *dev,
 		.rd_rp = mt76u_rd_rp,
 		.type = MT76_BUS_USB,
 	};
+	struct usb_device *udev = interface_to_usbdev(intf);
 	struct mt76_usb *usb = &dev->usb;
 
 	tasklet_init(&usb->rx_tasklet, mt76u_rx_tasklet, (unsigned long)dev);
@@ -965,6 +969,8 @@ int mt76u_init(struct mt76_dev *dev,
 	dev->bus = &mt76u_ops;
 	dev->queue_ops = &usb_queue_ops;
 
+	dev_set_drvdata(&udev->dev, dev);
+
 	usb->sg_en = mt76u_check_sg(dev);
 
 	return mt76u_set_endpoints(intf, usb);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
