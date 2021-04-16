Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5585BC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:58:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B697061166
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B697061166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zh+Uk8mUBDi9XBZk60K/PEjhvL+UNjkRxoMGujx/jPY=; b=qcPy9yuJgpaXasA+72gFV5Swzn
	/IGknsZi709DD6sab5fcd2dsk6a+W22AthST8HLQYCcd/CL1+P+dMCwQdQ/a8ojClU3AeubMCxVAk
	WaQhkLP850yYqfK6R4dwQPuguWNQeOZoK+b0uYh4+MtGS6Vgg8fNZ//h78xKXBMbERqgAPnrICaTQ
	zkv/P1B/6lHhX119BjeTdXbeZZoICbP4qy8u5mQPs5zcuebB4AFDxkR1KUYjH/fpJtm48HkE698+l
	T0p12yxfSgA+4F2OIwtJ3e1psi1XbhYWy6utrX0M3BXNfwE6CRtx/ugYkoi44DXdOuKJNs9AINmCg
	9/20O/4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXIOa-0017EJ-VF; Fri, 16 Apr 2021 06:56:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIHV-0016EG-Rh; Fri, 16 Apr 2021 06:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=APxbJPwScEst6HDBSQ0qGyVJb/o6u1YirI+17FRtBnU=; b=c8nHhlTlDwOLd7Lk4l0ewS2atr
 jhQv9GTs/gCY4cfsCcf1FC1SCAajlX/fQXUSS6Xuiw2+Tm1bbWqvSf5H2yST5EMR7WmPoLWz/n7NV
 5ghSU6byXAvcPTOJfa+RhFfIQP0OL2J57KjCzS4yN9y4w2C8jLST4vt0yNk8AP1zCH3ck5XciV+HV
 MknGFbizq6Sgl3tXKVuMlyLYszruHHI1i8mi+qk5bTm91PT7BWl7upBy7FnWS6Rv69kNKr25Xuz9y
 8xHiT66FjdXBFmoNSpud58tI5bFy1ywuVOLu29r9J9iiXIJalYD7dBAI9FCF1m7CbNiKZkPZ6JgCU
 YnDsk0ew==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIHS-00980w-Fx; Fri, 16 Apr 2021 06:48:43 +0000
X-UUID: b88a8c1758cb420c9690f3040319d0ed-20210415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=APxbJPwScEst6HDBSQ0qGyVJb/o6u1YirI+17FRtBnU=; 
 b=DtDXNNZXYoRHIHkWVUWqmUV1mpzyn0CSqSW/vg6/aB3D/DgugWAT1GwUgWG/gvVt8GmGOSzm0lpxx4ZHV9qVwU7yItKZhAvev8Ppzj3uDczOwUu0dpDcRYzc1tmxq9XtER5OeGaC3qlLfU8cXkK10UnNpmOs9P4hX8Ic18JEYGI=;
X-UUID: b88a8c1758cb420c9690f3040319d0ed-20210415
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 572507490; Thu, 15 Apr 2021 23:48:36 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 23:48:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 14:48:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Apr 2021 14:48:31 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [next PATCH] usb: xhci-mtk: remove bus status check
Date: Fri, 16 Apr 2021 14:48:26 +0800
Message-ID: <1618555706-6810-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F30F745CAD38CD33E7450348FE77EDF66EBF882B5AE109122F72EB4A79340A42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_234842_559563_01744756 
X-CRM114-Status: GOOD (  12.87  )
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

PM will take care of the status of child device, so no need
check each port anymore.

Suggested-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 43 ++-----------------------------------
 1 file changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index d4c455eecb8d..1fdeb315a124 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -654,42 +654,6 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	return ret;
 }
 
-static int check_rhub_status(struct xhci_hcd *xhci, struct xhci_hub *rhub)
-{
-	u32 suspended_ports;
-	u32 status;
-	int num_ports;
-	int i;
-
-	num_ports = rhub->num_ports;
-	suspended_ports = rhub->bus_state.suspended_ports;
-	for (i = 0; i < num_ports; i++) {
-		if (!(suspended_ports & BIT(i))) {
-			status = readl(rhub->ports[i]->addr);
-			if (status & PORT_CONNECT)
-				return -EBUSY;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * check the bus whether it could suspend or not
- * the bus will suspend if the downstream ports are already suspended,
- * or no devices connected.
- */
-static int check_bus_status(struct xhci_hcd *xhci)
-{
-	int ret;
-
-	ret = check_rhub_status(xhci, &xhci->usb3_rhub);
-	if (ret)
-		return ret;
-
-	return check_rhub_status(xhci, &xhci->usb2_rhub);
-}
-
 static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
 {
 	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
@@ -699,11 +663,8 @@ static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
 	if (xhci->xhc_state)
 		return -ESHUTDOWN;
 
-	if (device_may_wakeup(dev)) {
-		ret = check_bus_status(xhci);
-		if (!ret)
-			ret = xhci_mtk_suspend(dev);
-	}
+	if (device_may_wakeup(dev))
+		ret = xhci_mtk_suspend(dev);
 
 	/* -EBUSY: let PM automatically reschedule another autosuspend */
 	return ret ? -EBUSY : 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
