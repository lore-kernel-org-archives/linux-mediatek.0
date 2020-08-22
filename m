Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA15DC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A5C20825
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xq/Vl4lU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bm+iY3vb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A5C20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrmstXkVXO7jwF0vMnmtP9Gi084HYoIEJqKrxZKoPFs=; b=xq/Vl4lUN+E47h1Xk46KNAbRB
	3GFFsyqbvTsdWdQyR9zQtZJnLKO+jsUv5uehhkoA5M0tPe6vmtFKHx7dYGYK7SbcI1+4HReuyOdx/
	d8chtAxEriMtzWO4HlpXx5+xoz76zLdtU2P32Lm0t1h0D6ZKo2Gdm+ITsVKs/I0cLZCIDEdrMYIrg
	9WNNVVsadON0uEroIBS1rC0WANkl7/YWyEO5mp698bVPaHwKCcbG6wEf3GrNA2iEuv9mGak+t2IV0
	3DaBuO7OKqqVwsV9mqIHU1nDI9sZtQY6+b3YGSgGw5KU6HoaHaytpabfc9aHt0C4f1UsiQzl7aMLD
	nu3c3NB+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Okh-0007UV-Vl; Sat, 22 Aug 2020 08:19:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9OkB-0007Ec-7l; Sat, 22 Aug 2020 08:19:20 +0000
X-UUID: 147c7c5eb4c54a6baef2b50f56d8520b-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F4mzGda76Rx36DNHSGEKqplD8yql9lIdY7JyMYhES0w=; 
 b=bm+iY3vbNoY2R9TCjzV+qPuaI0RKl2SX9qNd9HuI6y3yJ2jAMiKJfemZGqjQIJ7zfDsMl61/whY/7bH7aN4OWqPSLw0BSenPjWO4dCLNk5kPDfMqcH14HCdEYIL0AD2wihLURmMNk++7s4q2mYlpI2z3daK3wSogkJDuvXqCTsg=;
X-UUID: 147c7c5eb4c54a6baef2b50f56d8520b-20200822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 402692273; Sat, 22 Aug 2020 00:19:13 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 01:09:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Date: Sat, 22 Aug 2020 16:05:46 +0800
Message-ID: <1598083553-31896-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5296C9BCC79C7F9C94936754EBF985E1571CEC744DA3503B1F7127EDE8A3DF12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_041919_470248_16693402 
X-CRM114-Status: GOOD (  15.21  )
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
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
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
