Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3CEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FD22078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAGyESlk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="We3+v1Nv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FD22078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XMDY1uiiF1mppT6wNgKZWb9g9WTaK8fTUrPcuJRSrjo=; b=lAGyESlkK0fScooICgm/0yTnY
	4RcDNlRipwEj3CDjzIJ+C+IUAz3wor2Gt4pyLzpir+W3Z4g1QsaJpPn46vMbTtXF2S4Lc1NyaGILN
	ssDh9J3dLrxQKRCco+GJhxX66VNqDQSZya3+wlB9g8S5KHVLAk6JLRTr9etHNlxI833uaAY9w9+mb
	ycs7/1/G74R9YA29Yjy1IuI0XQLKL+MPmmNyluUZOQycC6YZyPkkwEoR0hcq48Id6oZpzMEdGamzu
	THKunPCiCSnr2EefAwquU31AA524a5yiKD2rsJrlp9AxFdxCv0fCsngdx2i03GkjBEDkFV52U7CtM
	I7cbsCDXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dcb-0001sf-3X; Thu, 20 Aug 2020 06:00:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8daY-0000Um-P9; Thu, 20 Aug 2020 05:58:28 +0000
X-UUID: 880bbfd5923a4df299893ca7bbd1f361-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mfOPutSE6t3EaQRTKeVOvlEGn3YWjiY/ElOxoormrZk=; 
 b=We3+v1Nvj9oN8DK3QTXuabzhb2rVYTQoIctrmpgvFv9e/LVjzNbv09IZCCcYeY0x1hDIAJOVWrh/AUB/W0IfkVGVa4Qno8+VYvVrJXOWXpJJ9cWVWfwsbembh1SZfc6DngWH9buCDXcrfIWUQCqSqp+dpnsKHyPncg0DDj5P228=;
X-UUID: 880bbfd5923a4df299893ca7bbd1f361-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1503535616; Wed, 19 Aug 2020 21:57:24 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 22:47:22 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 13:47:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 13:47:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
Date: Thu, 20 Aug 2020 13:45:47 +0800
Message-ID: <1597902349-8998-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 536A387A30F093BE5F77A6E11585C2A14747E88712010E4B0B5B9729BCE4B7B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_015815_057330_74D04D7B 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: udelay 10us instead of 20us according to kerneldoc
---
 drivers/usb/phy/phy-mv-usb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index ce767ec..e801569 100644
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
+	ret = readl_poll_timeout_atomic(&mvotg->op_regs->usbcmd, tmp,
+				(tmp & USBCMD_CTRL_RESET), 10, 10000);
+	if (ret < 0) {
+		dev_err(&mvotg->pdev->dev,
 				"Wait for RESET completed TIMEOUT\n");
-			return -ETIMEDOUT;
-		}
-		loops--;
-		udelay(20);
+		return ret;
 	}
 
 	writel(0x0, &mvotg->op_regs->usbintr);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
