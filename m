Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98429C433EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64AC62072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9wHlpnN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eIAnJEmw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64AC62072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RV8tHWI9+jLAm4EPA1mPjcBxGqUmnbQf08RPbuDbC44=; b=k9wHlpnNmYSeC6ziSpyq8CXB5
	mpAu3b3q832PhZ61negcW2k0792lkPV3ccvJOY5dmKSGsWoNe0pfrTCjp/mkoWAj4AwVGRXYZ463C
	+7oVtDb+7hvUks5hVOGxnh0CAXEwFmSLMaplvpDY6TZwn+3Zc7j90TG1FKQCK3t87uNxx6JNNx9Fd
	Q02ihUG1wXI/2dkaYmGDbsacoeB6Q4jMyETDP8l38HILMfJKuoVERRDpiK3JJggifN4WPK4kgNUlm
	NoHmy1ay1gBcU/5E2mm3rYr+YbhX2ITHfigyvRWYtPkWx/sgKkPWYZhOW1zOJsYw1r9iPNrkms9ZU
	zCOUGZVRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPZ-00071X-HU; Mon, 27 Jul 2020 07:19:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPQ-0006we-Gm; Mon, 27 Jul 2020 07:18:53 +0000
X-UUID: 830a2bea1ef64c7cbeda42cdb424e455-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=udxjwRcR6H9qN2bTMph2UQxIL1NJUT+zyNYINSQ2gPM=; 
 b=eIAnJEmw/GsQ+kdBEAbrFuvN5VbRhl/abdWJ0aYoCSY1tKRys6Mhm4pC0+3y/NSJQzB4qi+67CVz9oSgF1vmNR8KxSB4LysIORdwVa6TbtjtmoIvQEwPxQz24P/YUCjLKUSf6rTKgBHowFO7MXLKaDTpqUGc6Zenkl6CDlPz1+I=;
X-UUID: 830a2bea1ef64c7cbeda42cdb424e455-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2030236087; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 05/11] usb: mtu3: introduce a funtion to check maximum speed
Date: Mon, 27 Jul 2020 15:14:54 +0800
Message-ID: <1595834101-13094-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031852_744850_C98AEAE5 
X-CRM114-Status: GOOD (  13.47  )
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

The max_speed got from DTS may be not supported by the
hardware, so need check it, and assign a proper default
value. And make it clear by introducing a funtion.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 48 ++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index ece5b3e..9694813 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -573,9 +573,6 @@ static void mtu3_set_speed(struct mtu3 *mtu)
 {
 	void __iomem *mbase = mtu->mac_base;
 
-	if (!mtu->is_u3_ip && (mtu->max_speed > USB_SPEED_HIGH))
-		mtu->max_speed = USB_SPEED_HIGH;
-
 	if (mtu->max_speed == USB_SPEED_FULL) {
 		/* disable U3 SS function */
 		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
@@ -761,6 +758,32 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void mtu3_check_params(struct mtu3 *mtu)
+{
+	/* check the max_speed parameter */
+	switch (mtu->max_speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+	case USB_SPEED_SUPER_PLUS:
+		break;
+	default:
+		dev_err(mtu->dev, "invalid max_speed: %s\n",
+			usb_speed_string(mtu->max_speed));
+		fallthrough;
+	case USB_SPEED_UNKNOWN:
+		/* default as SSP */
+		mtu->max_speed = USB_SPEED_SUPER_PLUS;
+		break;
+	}
+
+	if (!mtu->is_u3_ip && (mtu->max_speed > USB_SPEED_HIGH))
+		mtu->max_speed = USB_SPEED_HIGH;
+
+	dev_info(mtu->dev, "max_speed: %s\n",
+		 usb_speed_string(mtu->max_speed));
+}
+
 static int mtu3_hw_init(struct mtu3 *mtu)
 {
 	u32 value;
@@ -776,6 +799,8 @@ static int mtu3_hw_init(struct mtu3 *mtu)
 	dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
 		mtu->is_u3_ip ? "U3" : "U2");
 
+	mtu3_check_params(mtu);
+
 	mtu3_device_reset(mtu);
 
 	ret = mtu3_device_enable(mtu);
@@ -857,23 +882,6 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	mtu->ssusb = ssusb;
 	mtu->max_speed = usb_get_maximum_speed(dev);
 
-	/* check the max_speed parameter */
-	switch (mtu->max_speed) {
-	case USB_SPEED_FULL:
-	case USB_SPEED_HIGH:
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-		break;
-	default:
-		dev_err(dev, "invalid max_speed: %s\n",
-			usb_speed_string(mtu->max_speed));
-		/* fall through */
-	case USB_SPEED_UNKNOWN:
-		/* default as SSP */
-		mtu->max_speed = USB_SPEED_SUPER_PLUS;
-		break;
-	}
-
 	dev_dbg(dev, "mac_base=0x%p, ippc_base=0x%p\n",
 		mtu->mac_base, mtu->ippc_base);
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
