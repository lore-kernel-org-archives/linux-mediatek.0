Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF8EC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:53:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BE6206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHJ0e4mB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="anVGfFPS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79BE6206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S0sPLWopf8QTG0+YbnW9apaE0zsyLW3BpXALIueVvoY=; b=jHJ0e4mBlj8e4fK7rUmJIf5XA
	Gm0XgkgsZzXFEt0x9oqlM+ziOD01jYEk0t08hIywGBCvJyhax1RhNaDGjWDX5XoVnccEkWGdjiwmC
	V5PYdLoIi8mTpCMH41LeGzHtPB/XCRdxEOAvOmHnVatdeARZctetuZ0lZrmH6gyadeULqKRtp7dNX
	hgLenH/ONIfv4z8NqBFQyQPtCVluEHouZrSb5Iobo/yZPaG8XgDnyONcMrXIjT3990ySTmXLMtiGK
	1NiXWgiXYRHflgcNuPL/vz+JJ1uGq5p7In0kXuh6BGniBPfjHfaLnY9VhW8aWljYTkE8Enyeq2HI+
	JyeiQJa8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Nav-0006qR-KG; Wed, 19 Aug 2020 12:53:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NaK-0006Wk-0e; Wed, 19 Aug 2020 12:52:57 +0000
X-UUID: 1cc1bb77f1114eb888a6f0946269295d-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AQIMWJYfBrMtRgOV2GfpNte4cp/Qee5OO3k+Wl9/GA0=; 
 b=anVGfFPSZJTh3Hjxn0ixqNUitHVdfhtXF5gVIt/YJJ9pvBQPlLxlb4N7eUThZKN+N8AUZZg9SEJh6Hc9qvhFEUZ3UQPKfAWV79mmeTz0ecMgdN/DRuedCaP1AVWtUE6jYUCAB9JYMBRMRvcxPgS7ZPfbe4AXt9h2BRtsYHnCWZw=;
X-UUID: 1cc1bb77f1114eb888a6f0946269295d-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 592649390; Wed, 19 Aug 2020 04:52:50 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 05:42:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 20:42:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 20:42:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/10] usb: xhci-rcar: convert to readl_poll_timeout_atomic()
Date: Wed, 19 Aug 2020 20:40:59 +0800
Message-ID: <1597840865-26631-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BCE825A1C94D2720BFEDB625C7672783B5064235399A4E02EC7DCDEB11E3DB422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_085256_303201_05E990A9 
X-CRM114-Status: GOOD (  16.29  )
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
