Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C0AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF7F20672
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2vsCIGd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IeQC8Z1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF7F20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32UffPWuZqSrXYEt7AZH3VoxnNUAaQANgx7nhCGLGLU=; b=a2vsCIGdJUeKwHFaM4M2qKU8t
	bxaXSMkXfQ2xA94+OcNS+0ciGvoRZY4nOH/E8R3RkjMV7UXapbCBPgQljy3JG9oI/ls9K40U4xlFd
	Vc13VITNL4DsMoKzUbwvYMFxcsBpBOsd9yYa5+rW1PDKnJ5cm3NJMbKHbk8ztkuCsEXbMtCEBWZdM
	0QgYK0DiEL9bDj4m3pyBB/b1J1yP5Jewe+tZlM3Hhu3uKFOYVjJqmA2GyUhJBC27JO39f4b7oyOCb
	QPtgk1UsOLRabd8cg2OOP1vsOWTqL93dSZqXEPjCqTeRD9yTSbS5R/f0CK6nGgDgMIKsFXEssKGkQ
	nt2b8YVEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxQE-0007Ix-4y; Mon, 27 Jul 2020 07:19:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPT-0006we-RV; Mon, 27 Jul 2020 07:18:57 +0000
X-UUID: bcd87bd801214407a4e6fa8190f740db-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=R0PFD56iMUUiowOUwyB1KNj/knmrsfJF+Xf3HDW/OJs=; 
 b=IeQC8Z1lS23jS0RO/jhG8gT8EtldQmBqZZNZczuBT5uvEzLF+G9HBFaPMCNt1yqb/34t/nAZ1a0mNBNnwk9+cWu371e0eJLOzDQ6XSTqRdLwzIt6Ps+DJ/5fbJh08Lk2icVOgIB/T5EDjf3bD56WdmOpEvzmpw56bnUhzkAsoU0=;
X-UUID: bcd87bd801214407a4e6fa8190f740db-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 396134105; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 06/11] usb: mtu3: add ->udc_set_speed()
Date: Mon, 27 Jul 2020 15:14:55 +0800
Message-ID: <1595834101-13094-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031856_122056_2C1616D1 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make use of the method to make sure connect on speeds
supported by the gadget driver.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h        |  4 ++-
 drivers/usb/mtu3/mtu3_core.c   | 68 +++++++++++++++++++++++++-----------------
 drivers/usb/mtu3/mtu3_gadget.c | 14 +++++++++
 3 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index d49db92..9d68f25 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -348,7 +348,8 @@ struct mtu3 {
 	struct usb_gadget_driver *gadget_driver;
 	struct mtu3_request ep0_req;
 	u8 setup_buf[EP0_RESPONSE_BUF];
-	u32 max_speed;
+	enum usb_device_speed max_speed;
+	enum usb_device_speed speed;
 
 	unsigned is_active:1;
 	unsigned may_wakeup:1;
@@ -433,6 +434,7 @@ int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 void mtu3_start(struct mtu3 *mtu);
 void mtu3_stop(struct mtu3 *mtu);
 void mtu3_dev_on_off(struct mtu3 *mtu, int is_on);
+void mtu3_set_speed(struct mtu3 *mtu, enum usb_device_speed speed);
 
 int mtu3_gadget_setup(struct mtu3 *mtu);
 void mtu3_gadget_cleanup(struct mtu3 *mtu);
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9694813..c875b22 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -203,7 +203,42 @@ static void mtu3_intr_enable(struct mtu3 *mtu)
 	mtu3_writel(mbase, U3D_DEV_LINK_INTR_ENABLE, SSUSB_DEV_SPEED_CHG_INTR);
 }
 
-static void mtu3_set_speed(struct mtu3 *mtu);
+void mtu3_set_speed(struct mtu3 *mtu, enum usb_device_speed speed)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	if (speed > mtu->max_speed)
+		speed = mtu->max_speed;
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+		/* disable U3 SS function */
+		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
+		/* disable HS function */
+		mtu3_clrbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+		break;
+	case USB_SPEED_HIGH:
+		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
+		/* HS/FS detected by HW */
+		mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+		break;
+	case USB_SPEED_SUPER:
+		mtu3_clrbits(mtu->ippc_base, SSUSB_U3_CTRL(0),
+			     SSUSB_U3_PORT_SSP_SPEED);
+		break;
+	case USB_SPEED_SUPER_PLUS:
+			mtu3_setbits(mtu->ippc_base, SSUSB_U3_CTRL(0),
+			     SSUSB_U3_PORT_SSP_SPEED);
+		break;
+	default:
+		dev_err(mtu->dev, "invalid speed: %s\n",
+			usb_speed_string(speed));
+		return;
+	}
+
+	mtu->speed = speed;
+	dev_dbg(mtu->dev, "set speed: %s\n", usb_speed_string(speed));
+}
 
 /* CSR registers will be reset to default value if port is disabled */
 static void mtu3_csr_init(struct mtu3 *mtu)
@@ -225,8 +260,6 @@ static void mtu3_csr_init(struct mtu3 *mtu)
 		mtu3_setbits(mbase, U3D_U3U2_SWITCH_CTRL, SOFTCON_CLR_AUTO_EN);
 	}
 
-	mtu3_set_speed(mtu);
-
 	/* delay about 0.1us from detecting reset to send chirp-K */
 	mtu3_clrbits(mbase, U3D_LINK_RESET_INFO, WTCHRP_MSK);
 	/* enable automatical HWRW from L1 */
@@ -280,13 +313,13 @@ void mtu3_ep_stall_set(struct mtu3_ep *mep, bool set)
 
 void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 {
-	if (mtu->is_u3_ip && mtu->max_speed >= USB_SPEED_SUPER)
+	if (mtu->is_u3_ip && mtu->speed >= USB_SPEED_SUPER)
 		mtu3_ss_func_set(mtu, is_on);
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
-		usb_speed_string(mtu->max_speed), is_on ? "+" : "-");
+		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
 
 void mtu3_start(struct mtu3 *mtu)
@@ -299,6 +332,7 @@ void mtu3_start(struct mtu3 *mtu)
 	mtu3_clrbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 
 	mtu3_csr_init(mtu);
+	mtu3_set_speed(mtu, mtu->speed);
 
 	/* Initialize the default interrupts */
 	mtu3_intr_enable(mtu);
@@ -569,28 +603,6 @@ static void mtu3_mem_free(struct mtu3 *mtu)
 	kfree(mtu->ep_array);
 }
 
-static void mtu3_set_speed(struct mtu3 *mtu)
-{
-	void __iomem *mbase = mtu->mac_base;
-
-	if (mtu->max_speed == USB_SPEED_FULL) {
-		/* disable U3 SS function */
-		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
-		/* disable HS function */
-		mtu3_clrbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
-	} else if (mtu->max_speed == USB_SPEED_HIGH) {
-		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
-		/* HS/FS detected by HW */
-		mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
-	} else if (mtu->max_speed == USB_SPEED_SUPER) {
-		mtu3_clrbits(mtu->ippc_base, SSUSB_U3_CTRL(0),
-			     SSUSB_U3_PORT_SSP_SPEED);
-	}
-
-	dev_info(mtu->dev, "max_speed: %s\n",
-		usb_speed_string(mtu->max_speed));
-}
-
 static void mtu3_regs_init(struct mtu3 *mtu)
 {
 	void __iomem *mbase = mtu->mac_base;
@@ -780,6 +792,8 @@ static void mtu3_check_params(struct mtu3 *mtu)
 	if (!mtu->is_u3_ip && (mtu->max_speed > USB_SPEED_HIGH))
 		mtu->max_speed = USB_SPEED_HIGH;
 
+	mtu->speed = mtu->max_speed;
+
 	dev_info(mtu->dev, "max_speed: %s\n",
 		 usb_speed_string(mtu->max_speed));
 }
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 6b26cb8..3d13129 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -577,6 +577,19 @@ static int mtu3_gadget_stop(struct usb_gadget *g)
 	return 0;
 }
 
+static void
+mtu3_gadget_set_speed(struct usb_gadget *g, enum usb_device_speed speed)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(g);
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s %s\n", __func__, usb_speed_string(speed));
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	mtu3_set_speed(mtu, speed);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+}
+
 static const struct usb_gadget_ops mtu3_gadget_ops = {
 	.get_frame = mtu3_gadget_get_frame,
 	.wakeup = mtu3_gadget_wakeup,
@@ -584,6 +597,7 @@ static int mtu3_gadget_stop(struct usb_gadget *g)
 	.pullup = mtu3_gadget_pullup,
 	.udc_start = mtu3_gadget_start,
 	.udc_stop = mtu3_gadget_stop,
+	.udc_set_speed = mtu3_gadget_set_speed,
 };
 
 static void mtu3_state_reset(struct mtu3 *mtu)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
