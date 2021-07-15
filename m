Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4FEC1B08C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCAA60041
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCAA60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Qq1FxMq1sb4WvuHLWlU0aKbWRAaj0ZnXiAPaFUIEdc=; b=1dtdxWhtMAg0MM
	KJP090ZJj3eDgz+fCOXCKFHfnvLI6miJ9a0Ae/eCNdtowsL5jAvWQTbFUHfvdLhBemNXOif9fh7Jy
	tALIJ6vhaTwWCez/Es/yEQnudgSm7Q8Mau6qWrcj9VEMN7IvZVsHugDRoEx2YwDJY54Yk46E+qvuw
	y32E1sRbxPieTVFDz0Wgu9CdGxHqWbHNy78/t1swi5dq4Gbty/R7E6ymE0FBJuZxl1CeG5pBA48vY
	1FDF1mLs6eomMwx9jk34uaRwYiHz7Z/wdc6GsPbdV+UEXJWDVOgxE8E3D5M5RYrfJ/ie+IkoWgfRO
	alkBfbJ83KBVmhmcccXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xWg-00078b-0X; Thu, 15 Jul 2021 09:19:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xVc-0006i6-8D; Thu, 15 Jul 2021 09:18:22 +0000
X-UUID: 4d11a776d2284293a6afd6896ee47259-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SMXiOx1Xdljb0J4ReqdGG3L82zMSS2S1A4RygdCHLMM=; 
 b=OVWMNwqDKaofWJQ87a7VHpgsPBrd8GcU+ycWeqy4oY3t/v6QyD4vTQ4Lz1mqWwjdQ6ij6eAndqP9awpODibg6WxUf7alHB/zuVD9HqNaPi5g9PnMSKVwLWSTZk/iybqWsp+miUl9Ju7XWos7P05f2a7IBJV+Kyf7SEDHU5V3BI0=;
X-UUID: 4d11a776d2284293a6afd6896ee47259-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2139445233; Thu, 15 Jul 2021 02:18:17 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:23 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 13/13] usb: mtu3: support suspend/resume for dual-role mode
Date: Thu, 15 Jul 2021 17:07:58 +0800
Message-ID: <1626340078-29111-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_021820_351027_CC0B6245 
X-CRM114-Status: GOOD (  19.90  )
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

Support suspend/resume for dual-role mode including the single
port and multi-ports supported by host controller, when the host
supports mult-ports, only port0 (u2/u3) is used to support dual
role mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/mtu3/mtu3_core.c | 32 +++++++-------
 drivers/usb/mtu3/mtu3_dr.c   |  2 +
 drivers/usb/mtu3/mtu3_dr.h   |  8 ++++
 drivers/usb/mtu3/mtu3_host.c | 10 +----
 drivers/usb/mtu3/mtu3_plat.c | 84 ++++++++++++++++++++++++++----------
 5 files changed, 89 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a800920d38b9..f90e5cdec614 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/dma-mapping.h>
-#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -1008,12 +1007,25 @@ void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 	mtu3_hw_exit(mtu);
 }
 
+bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+
+	/* host only, should wait for ip sleep */
+	if (!mtu)
+		return true;
+
+	/* device is started and pullup D+, ip can sleep */
+	if (mtu->is_active && mtu->softconnect)
+		return true;
+
+	/* ip can't sleep if not pullup D+ when support device mode */
+	return false;
+}
+
 int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 {
 	struct mtu3 *mtu = ssusb->u3d;
-	void __iomem *ibase = mtu->ippc_base;
-	u32 value;
-	int ret = 0;
 
 	if (!mtu->gadget_driver)
 		return 0;
@@ -1024,17 +1036,7 @@ int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 	mtu3_dev_suspend(mtu);
 	synchronize_irq(mtu->irq);
 
-	/* wait for ip to sleep */
-	if (mtu->is_active && mtu->softconnect) {
-		ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1,
-				value, (value & SSUSB_IP_SLEEP_STS), 100, 100000);
-		if (ret) {
-			dev_err(mtu->dev, "ip sleep failed!!!\n");
-			ret = -EBUSY;
-		}
-	}
-
-	return ret;
+	return 0;
 }
 
 int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 30e7e5fc0f88..a6b04831b20b 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -149,6 +149,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	dev_dbg(ssusb->dev, "set role : %s\n", usb_role_string(desired_role));
 	mtu3_dbg_trace(ssusb->dev, "set role : %s", usb_role_string(desired_role));
+	pm_runtime_get_sync(ssusb->dev);
 
 	switch (desired_role) {
 	case USB_ROLE_HOST:
@@ -169,6 +170,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 	default:
 		dev_err(ssusb->dev, "invalid role\n");
 	}
+	pm_runtime_put(ssusb->dev);
 }
 
 static void ssusb_set_mode(struct otg_switch_mtk *otg_sx, enum usb_role role)
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 5286f9f5ee18..e325508bddf4 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -59,6 +59,8 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb);
 void ssusb_gadget_exit(struct ssusb_mtk *ssusb);
 int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg);
 int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg);
+bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb);
+
 #else
 static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
@@ -79,6 +81,12 @@ ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
 {
 	return 0;
 }
+
+static inline bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
+{
+	return true;
+}
+
 #endif
 
 
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index a0a6a181b752..7d528f3c2482 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -254,7 +253,6 @@ int ssusb_host_suspend(struct ssusb_mtk *ssusb)
 	int num_u3p = ssusb->u3_ports;
 	int num_u2p = ssusb->u2_ports;
 	u32 value;
-	int ret;
 	int i;
 
 	/* power down u3 ports except skipped ones */
@@ -280,13 +278,7 @@ int ssusb_host_suspend(struct ssusb_mtk *ssusb)
 	/* power down host ip */
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
 
-	/* wait for host ip to sleep */
-	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1, value,
-			  (value & SSUSB_IP_SLEEP_STS), 100, 100000);
-	if (ret)
-		dev_err(ssusb->dev, "ip sleep failed!!!\n");
-
-	return ret;
+	return 0;
 }
 
 static void ssusb_host_setup(struct ssusb_mtk *ssusb)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index e174ada689f2..81266f34986f 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -45,6 +45,29 @@ int ssusb_check_clocks(struct ssusb_mtk *ssusb, u32 ex_clks)
 	return 0;
 }
 
+static int wait_for_ip_sleep(struct ssusb_mtk *ssusb)
+{
+	bool sleep_check = true;
+	u32 value;
+	int ret;
+
+	if (!ssusb->is_host)
+		sleep_check = ssusb_gadget_ip_sleep_check(ssusb);
+
+	if (!sleep_check)
+		return 0;
+
+	/* wait for ip enter sleep mode */
+	ret = readl_poll_timeout(ssusb->ippc_base + U3D_SSUSB_IP_PW_STS1, value,
+				 (value & SSUSB_IP_SLEEP_STS), 100, 100000);
+	if (ret) {
+		dev_err(ssusb->dev, "ip sleep failed!!!\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
 static int ssusb_phy_init(struct ssusb_mtk *ssusb)
 {
 	int i;
@@ -421,6 +444,28 @@ static int mtu3_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int resume_ip_and_ports(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ssusb_gadget_resume(ssusb, msg);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_resume(ssusb, false);
+		break;
+	case USB_DR_MODE_OTG:
+		ssusb_host_resume(ssusb, !ssusb->is_host);
+		if (!ssusb->is_host)
+			ssusb_gadget_resume(ssusb, msg);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
@@ -432,26 +477,36 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 	case USB_DR_MODE_PERIPHERAL:
 		ret = ssusb_gadget_suspend(ssusb, msg);
 		if (ret)
-			return ret;
+			goto err;
 
 		break;
 	case USB_DR_MODE_HOST:
 		ssusb_host_suspend(ssusb);
 		break;
 	case USB_DR_MODE_OTG:
-		if (!ssusb->is_host)
-			return 0;
-
+		if (!ssusb->is_host) {
+			ret = ssusb_gadget_suspend(ssusb, msg);
+			if (ret)
+				goto err;
+		}
 		ssusb_host_suspend(ssusb);
 		break;
 	default:
 		return -EINVAL;
 	}
+
+	ret = wait_for_ip_sleep(ssusb);
+	if (ret)
+		goto sleep_err;
+
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
 	ssusb_wakeup_set(ssusb, true);
 
-	return 0;
+sleep_err:
+	resume_ip_and_ports(ssusb, msg);
+err:
+	return ret;
 }
 
 static int mtu3_resume_common(struct device *dev, pm_message_t msg)
@@ -470,24 +525,7 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 	if (ret)
 		goto phy_err;
 
-	switch (ssusb->dr_mode) {
-	case USB_DR_MODE_PERIPHERAL:
-		ssusb_gadget_resume(ssusb, msg);
-		break;
-	case USB_DR_MODE_HOST:
-		ssusb_host_resume(ssusb, false);
-		break;
-	case USB_DR_MODE_OTG:
-		if (!ssusb->is_host)
-			return 0;
-
-		ssusb_host_resume(ssusb, true);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
+	return resume_ip_and_ports(ssusb, msg);
 
 phy_err:
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
