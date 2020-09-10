Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFEDC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BD12076C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MO/StGiY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qREblY+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BD12076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrmstXkVXO7jwF0vMnmtP9Gi084HYoIEJqKrxZKoPFs=; b=MO/StGiYrEPVvElBNMIQdoGMW
	UxCq4WxQW+F3UV0P4FaQcSPpNOE0e4koMtRI5t049lfI/XBv++mJyKVVhTXAet42kkHi3FUfiLh0L
	Z+s2Fs078t1NmhYUvRPhmiMiM91SXy9kzqAZGeQxM/jrdFeQcM+QplWWbXXAOgYvEs8yS9zx1lzbp
	gp+ou0zxxnu6rKKy4Iw6Arq2SUzMxWUowuvRl15LGvyEQSUpZPSConfv/PmRlzUSZtF/6JINZR3XI
	E8ZSc9wyrxiGAQ35kTqIRwuVVxKdpxGTff88K18c2VDJ4PKr7XqobLCK32fZyWlpo6sz90ipExgoK
	n+pXukmmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGI25-0005gJ-US; Thu, 10 Sep 2020 08:34:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGI1y-0005cZ-GK; Thu, 10 Sep 2020 08:34:11 +0000
X-UUID: 4404e5aca1634779b161dbfb78b07fd5-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F4mzGda76Rx36DNHSGEKqplD8yql9lIdY7JyMYhES0w=; 
 b=qREblY+tAu/SgNpJMTQzd/sZ4hRoD66ApAOGdSQDBzSZeIShujZ9tVzlcQ1JLto2i2OY+lFjLRJyX9ooCz4av/FKV4rOTQ8FGSrmVx0rav34vfYVdHmWA1r5T+NGVJkVJ/tJUlr9/B8ohQ1qfF7NdxsffXzRzl+XV5KtqNj+ook=;
X-UUID: 4404e5aca1634779b161dbfb78b07fd5-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1880151973; Thu, 10 Sep 2020 00:34:05 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:04 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:24:02 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:45 +0800
Message-ID: <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D551D691DB25F07A367A51FC77988420B16EE09204599E6579A68152A513AEC42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043410_676109_DFEF97CD 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Jann Horn <jannh@google.com>, Ben
 Dooks <ben.dooks@codethink.co.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@linaro.org>,
 Chuhong Yuan <hslester96@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index c1025d3..74f836f 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 	void __iomem *regs = hcd->regs;
 	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 	const struct firmware *fw;
-	int retval, index, j, time;
-	int timeout = 10000;
+	int retval, index, j;
 	u32 data, val, temp;
 	u32 quirks = 0;
 	const struct soc_device_attribute *attr;
@@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
 		writel(temp, regs + RCAR_USB3_DL_CTRL);
 
-		for (time = 0; time < timeout; time++) {
-			val = readl(regs + RCAR_USB3_DL_CTRL);
-			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
-				break;
-			udelay(1);
-		}
-		if (time == timeout) {
-			retval = -ETIMEDOUT;
+		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
+				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
+				1, 10000);
+		if (retval < 0)
 			break;
-		}
 	}
 
 	temp = readl(regs + RCAR_USB3_DL_CTRL);
 	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
 	writel(temp, regs + RCAR_USB3_DL_CTRL);
 
-	for (time = 0; time < timeout; time++) {
-		val = readl(regs + RCAR_USB3_DL_CTRL);
-		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
-			retval = 0;
-			break;
-		}
-		udelay(1);
-	}
-	if (time == timeout)
-		retval = -ETIMEDOUT;
+	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
+			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
 
 	release_firmware(fw);
 
@@ -200,18 +187,12 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 
 static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
 {
-	int timeout = 1000;
+	int retval;
 	u32 val, mask = RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK;
 
-	while (timeout > 0) {
-		val = readl(hcd->regs + RCAR_USB3_AXH_STA);
-		if ((val & mask) == mask)
-			return true;
-		udelay(1);
-		timeout--;
-	}
-
-	return false;
+	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
+			val, ((val & mask) == mask), 1, 1000);
+	return !!retval;
 }
 
 /* This function needs to initialize a "phy" of usb before */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
