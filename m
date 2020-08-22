Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12EAC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:11:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4AF2072D
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZ/RZDSm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Of95Kyv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4AF2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Ls7v58J5BtrsO76xOrLWSSC3ljqq1i8LlAc7Xxz34Y=; b=sZ/RZDSm57qq+F4t8ZMOU89R8
	5qSjx7ETzuXcJGa7JQzW6QJ8Gl5/yIMnUvtHSSMsV8Sj6LYnihnk/bibzS63jR0mRlxT05rnFyUsG
	bSFt2Q6oaoVvJVWiO+RrtuykX/VlcZooWoE4SkCcy8cPPr+qUqoVj0Putl0QFtqYWq7qeSEKyg56r
	pXOQ3ak2l8xEiY1lv0OZoBIKFiLjZXQG5aJwrs9pbAO4HUgYXY4TwtRZIZgIHWpbVa6Dn/0kBYhGA
	0UmuCptMdEFlgxj7uOrlh9bgcftKJMe4SvrT4aKtaj7TJp5rgu3ajR3WgEI2M+O1GDQIuhwGwJ3VF
	LZmCDFpQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Och-0005fx-Ou; Sat, 22 Aug 2020 08:11:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9OcR-0005Zk-SK; Sat, 22 Aug 2020 08:11:20 +0000
X-UUID: de9de3d74b1b465fa5e15a1ebf17dd5b-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RiKpsCZJex/4PNC9PXP3CBjdPJWYcy6TOG9QBDJhfJg=; 
 b=Of95Kyv2mSS7DE2lIaR0cwPQDX9Z89RiVNdPNq4e1zoPDR+Hm9YfKNtmtN/CdNApQ3XtaPOO5uM1x5Tk300xJOBbKPc/1HYbN5ztTZso6NBXuGLymNuhd3zOGV0fnfUexOfZnj8i6xLwAhycIotvsPKhKFbrcX8aMjpgIW/5Z40=;
X-UUID: de9de3d74b1b465fa5e15a1ebf17dd5b-20200822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 138566541; Sat, 22 Aug 2020 00:11:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 01:09:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
Date: Sat, 22 Aug 2020 16:05:51 +0800
Message-ID: <1598083553-31896-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB82458CE3DF942285E05F81EA451D2BF7C3E37234F9B84CF016E41C0EA717E42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_041120_068934_170E63E6 
X-CRM114-Status: GOOD (  14.53  )
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
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: re-align argument of log suggested by Sergei

v2: udelay 10us instead of 20us according to kerneldoc
---
 drivers/usb/phy/phy-mv-usb.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index ce767ec..576d925 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/uaccess.h>
 #include <linux/device.h>
 #include <linux/proc_fs.h>
@@ -135,8 +136,8 @@ static int mv_otg_set_timer(struct mv_otg *mvotg, unsigned int id,
 
 static int mv_otg_reset(struct mv_otg *mvotg)
 {
-	unsigned int loops;
 	u32 tmp;
+	int ret;
 
 	/* Stop the controller */
 	tmp = readl(&mvotg->op_regs->usbcmd);
@@ -146,15 +147,12 @@ static int mv_otg_reset(struct mv_otg *mvotg)
 	/* Reset the controller to get default values */
 	writel(USBCMD_CTRL_RESET, &mvotg->op_regs->usbcmd);
 
-	loops = 500;
-	while (readl(&mvotg->op_regs->usbcmd) & USBCMD_CTRL_RESET) {
-		if (loops == 0) {
-			dev_err(&mvotg->pdev->dev,
-				"Wait for RESET completed TIMEOUT\n");
-			return -ETIMEDOUT;
-		}
-		loops--;
-		udelay(20);
+	ret = readl_poll_timeout_atomic(&mvotg->op_regs->usbcmd, tmp,
+				(tmp & USBCMD_CTRL_RESET), 10, 10000);
+	if (ret < 0) {
+		dev_err(&mvotg->pdev->dev,
+			"Wait for RESET completed TIMEOUT\n");
+		return ret;
 	}
 
 	writel(0x0, &mvotg->op_regs->usbintr);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
