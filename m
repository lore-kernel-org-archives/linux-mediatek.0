Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ACBC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:47:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D86520724
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/CNV9QK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uwfDNSQo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D86520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yX6OlRkK8uIKx5GMbe0hZci49o0nnAopTqztIPI6ofE=; b=E/CNV9QKSteRg8bf/2mBnFdSS
	sV6ewpqPP8cynoTOvZu5NPbWGpzi6J3RkIw941gjkX9DL9W+Mm0T/EFR/cHZzybrMqkUtByyO7O1/
	i8iwJN05xwE+DzXZEJ2PR+1EG+Jflm9JehkzDHv8RgwuT1FBBST3JzekRuSbZauOpsJKKNVSIZ9+w
	ze8SPfsRxK8v9QUeSJq1girXVZanoRgPFyxjwrVwjBBJ02Tty2oka9GB+l59ggCz4nNECkDp5/Vgp
	3XfqH4aMNgUTd9OSDiaenKr5tPjhy5urqtWmrs1fl5qGqLbSQ5MncDOLPGIanJu02y+32aqKLB1Tz
	Qm3fMDDVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dQJ-0003FU-S9; Thu, 20 Aug 2020 05:47:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dQ5-00038g-30; Thu, 20 Aug 2020 05:47:27 +0000
X-UUID: 71c379cdd6f3491fbe8543de90ab43c6-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KqivLJ82o4nQcvuVJ38MnC9qLo3O961PB6uECAnVwuo=; 
 b=uwfDNSQoBKHKf12TeA1ZtPrzf9xu8n9m/NMSGEF1XxMHo6x9nyIiHglkvLvQNu1gL7/uW4oHRD00Cfvci8sIUZNN80TvHwxkw/QV3MdbHcc7eicDzHK1EF5uoec7baqB3ubKBwgSELqBX6PMZMszYqC3BRAmuN3z65VYHuP9OkM=;
X-UUID: 71c379cdd6f3491fbe8543de90ab43c6-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1109351234; Wed, 19 Aug 2020 21:47:18 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 22:47:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 13:47:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 13:47:11 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Date: Thu, 20 Aug 2020 13:45:42 +0800
Message-ID: <1597902349-8998-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A432BAA91F560CA8F5BAB65220EE2453B9D32BEB3EF465235A28FB7C317A19F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_014725_268880_BF0BFB5E 
X-CRM114-Status: GOOD (  15.86  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
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
