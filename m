Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6DDC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 08:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB10C20720
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 08:11:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXbC5ZMH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nBxJcRD1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB10C20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PIwO2r/90sIJ76DJcMJlG27h2uAun4/GRkxdDg8P2O8=; b=jXbC5ZMHGjGexdXZq25rnCc6AH
	1mA7r+mXiMl1olBXGpE7wUVh9aRTMaoxhRusTFwZ3Feth4MmFtUSrxObcz9YU0INfI9C3rYKDeCBv
	pLGleYLDsCWgIiJhzzoouexGJ7ltTt17v3OAPHeAoQiodzDhoOb5osH6MjxKcgfH3w8ITMrjJRPY3
	+9LdBINZ8DaJC3hvB/jyfgTZ8BfzwYYdeXEDhyeasqseYfD/GSw+La2I8M9RiR9Hf5zrufYISkFPz
	f1LuQ8WQnINTLe4UrMGFV6mEgKEjAdBXZalVR0oXPyA9WqBhYx+JtdCwtqiKfL9uwuyIS9nII+l+Z
	775voBNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtRek-0007gn-Qp; Thu, 09 Jul 2020 08:11:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtReg-0007f2-8H; Thu, 09 Jul 2020 08:11:43 +0000
X-UUID: e7db8257aa524ae18796d9918ace627c-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EmxpDFVko6vGSPtolSl68cxmu0wfDYMew3MmoQC0gGU=; 
 b=nBxJcRD1CP+djsbHQpGpme/u8nI9OcJe4moXRREEiW1gud67tvRXHWdQXeoEbiqT0ryin7KMUuwazGeMxQ8DoOcgtWfUIvU5d2QtMiZYc4qAv68J7N9P5fOXoHk1W23J35yR2LDUA5aX6r+pr7nvq1zRui/VGz2AtM66INqwMz4=;
X-UUID: e7db8257aa524ae18796d9918ace627c-20200709
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1777488309; Thu, 09 Jul 2020 00:11:26 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 01:11:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 16:11:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jul 2020 16:11:28 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only core
Date: Thu, 9 Jul 2020 16:10:50 +0800
Message-ID: <1594282250-25544-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: E13421386F9A3D99A6F76BE1A8A8E25F83593278EF8CA57E9EC0A00D10D06AE22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_041142_490824_51FDE28A 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The maximum_speed will be USB_SPEED_SUPER_PLUS, but the
maximum_speed check for usb2.0-only core doesn't consider it,
so fix it, and move the ckeck into dwc3_check_params().

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Note:

When I look at the code, find that this may be a problem, but no
platform to test it.
---
 drivers/usb/dwc3/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a7..ffd5ab3 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -930,13 +930,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 */
 	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
 
-	/* Handle USB2.0-only core configuration */
-	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
-			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
-		if (dwc->maximum_speed == USB_SPEED_SUPER)
-			dwc->maximum_speed = USB_SPEED_HIGH;
-	}
-
 	ret = dwc3_phy_setup(dwc);
 	if (ret)
 		goto err0;
@@ -1426,6 +1419,13 @@ static void dwc3_check_params(struct dwc3 *dwc)
 
 		break;
 	}
+
+	/* Handle USB2.0-only core configuration */
+	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
+			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
+		if (dwc->maximum_speed > USB_SPEED_HIGH)
+			dwc->maximum_speed = USB_SPEED_HIGH;
+	}
 }
 
 static int dwc3_probe(struct platform_device *pdev)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
