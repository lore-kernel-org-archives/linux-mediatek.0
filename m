Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06407C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWjke0dMuTX2nnaDSJEIiLfWiyL0qUNV0xBpdYpy1Ks=; b=qTR9pJj+9pSjhr
	5aGnz+8HYmbmI1EFA03mYNwAbxj8m7u5m3G8NKUhXWw/f8s5WCrmwC7fXGzWP0w3RW6ecX8TZppCJ
	A4UyitHZ0UzQBzO3d2PTLGSeJ0/KmrAKU5Pd1CXZqV/4VEpQJcNnPizyhGWYCCMGNrdS6EcObTBEx
	kryP2jtpYtqjSyKCwijf+/HMsDnD3YB3IG+fmfCnTwjKSNcCj2nQHj9khTWruaQa//Spb8nmOsnG7
	bcLMTavKqJtere7MJ/qxw2uKZ7/avXvkxBy8fMZFEyjCidq7tT2NYh9BVq8YyFFeOCZ9mn89psHZ/
	7kH4Tah+vq2WF1yji1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCuh-00HYg8-VF; Thu, 09 Jun 2022 07:49:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCuQ-00HYRe-1p; Thu, 09 Jun 2022 07:48:51 +0000
X-UUID: 6c95619326e740079924074dc18d6afe-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ec2067f1-0f4a-4793-9a76-b09de1f7edeb,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:1c3ac47e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 6c95619326e740079924074dc18d6afe-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1547572761; Thu, 09 Jun 2022 00:48:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 00:42:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 15:42:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jun 2022 15:42:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 2/3] usb: mtu3: implement udc_async_callbacks of gadget operation
Date: Thu, 9 Jun 2022 15:42:32 +0800
Message-ID: <20220609074233.15532-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
References: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_004850_144918_4A393BA4 
X-CRM114-Status: GOOD (  12.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Implement udc_async_callbacks hook function to avoid a race when unnbinding
gadget drivers, refer to:
7dc0c55e9f30 ('USB: UDC core: Add udc_async_callbacks gadget op')

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h            |  1 +
 drivers/usb/mtu3/mtu3_gadget.c     | 19 ++++++++++++++++---
 drivers/usb/mtu3/mtu3_gadget_ep0.c |  2 +-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 022bbdc54e68..8408e1b1a24a 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -357,6 +357,7 @@ struct mtu3 {
 	unsigned delayed_status:1;
 	unsigned gen2cp:1;
 	unsigned connected:1;
+	unsigned async_callbacks:1;
 
 	u8 address;
 	u8 test_mode_nr;
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index d57cea62fe6b..30999b4debb8 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -592,6 +592,18 @@ mtu3_gadget_set_speed(struct usb_gadget *g, enum usb_device_speed speed)
 	spin_unlock_irqrestore(&mtu->lock, flags);
 }
 
+static void mtu3_gadget_async_callbacks(struct usb_gadget *g, bool enable)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(g);
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s %s\n", __func__, enable ? "en" : "dis");
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	mtu->async_callbacks = enable;
+	spin_unlock_irqrestore(&mtu->lock, flags);
+}
+
 static const struct usb_gadget_ops mtu3_gadget_ops = {
 	.get_frame = mtu3_gadget_get_frame,
 	.wakeup = mtu3_gadget_wakeup,
@@ -600,6 +612,7 @@ static const struct usb_gadget_ops mtu3_gadget_ops = {
 	.udc_start = mtu3_gadget_start,
 	.udc_stop = mtu3_gadget_stop,
 	.udc_set_speed = mtu3_gadget_set_speed,
+	.udc_async_callbacks = mtu3_gadget_async_callbacks,
 };
 
 static void mtu3_state_reset(struct mtu3 *mtu)
@@ -697,7 +710,7 @@ void mtu3_gadget_cleanup(struct mtu3 *mtu)
 void mtu3_gadget_resume(struct mtu3 *mtu)
 {
 	dev_dbg(mtu->dev, "gadget RESUME\n");
-	if (mtu->gadget_driver && mtu->gadget_driver->resume) {
+	if (mtu->async_callbacks && mtu->gadget_driver && mtu->gadget_driver->resume) {
 		spin_unlock(&mtu->lock);
 		mtu->gadget_driver->resume(&mtu->g);
 		spin_lock(&mtu->lock);
@@ -708,7 +721,7 @@ void mtu3_gadget_resume(struct mtu3 *mtu)
 void mtu3_gadget_suspend(struct mtu3 *mtu)
 {
 	dev_dbg(mtu->dev, "gadget SUSPEND\n");
-	if (mtu->gadget_driver && mtu->gadget_driver->suspend) {
+	if (mtu->async_callbacks && mtu->gadget_driver && mtu->gadget_driver->suspend) {
 		spin_unlock(&mtu->lock);
 		mtu->gadget_driver->suspend(&mtu->g);
 		spin_lock(&mtu->lock);
@@ -719,7 +732,7 @@ void mtu3_gadget_suspend(struct mtu3 *mtu)
 void mtu3_gadget_disconnect(struct mtu3 *mtu)
 {
 	dev_dbg(mtu->dev, "gadget DISCONNECT\n");
-	if (mtu->gadget_driver && mtu->gadget_driver->disconnect) {
+	if (mtu->async_callbacks && mtu->gadget_driver && mtu->gadget_driver->disconnect) {
 		spin_unlock(&mtu->lock);
 		mtu->gadget_driver->disconnect(&mtu->g);
 		spin_lock(&mtu->lock);
diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index 0ca47212f1ec..7e7013508af6 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -66,7 +66,7 @@ __acquires(mtu->lock)
 {
 	int ret;
 
-	if (!mtu->gadget_driver)
+	if (!mtu->gadget_driver || !mtu->async_callbacks)
 		return -EOPNOTSUPP;
 
 	spin_unlock(&mtu->lock);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
