Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB91BC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7577A2072D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxVsszl5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QazGoteN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7577A2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vp0PfCTZn+d3BvEGt5JPg7K5uDp5cD+g0sbwh2/kKhs=; b=WxVsszl53ACjyNX0JznSKbi4h
	2LzH+9n9qL2m+Y/92JVCA10BGOo7g+shKbYLAJGjfKyzrnN0bI3WK9fw9UmdrJY07gusCAcSHGASe
	vLp9YJFBi3ZKqkcw5E5d2Q17bgZPnpAapB5ehH0Wgn0prY2r4LEe2YI3OC5YOePLPGV3cOfAs9NwX
	i834T4xsbK29cNPIObWYtuVhbqTRLGdpdQW+3VtoX20xfpO15jNgralTCF5OvwAUf7mBcy3lpBFQ4
	4bVTnVB9dLCVLNKEYZWjUVgBG0vnURbwvakr5n2W+Xbo6UKTmvv94aDHVAvwjMYeKTDIUXStu3EVt
	lj/CQ12qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8NRc-0002Iv-GM; Wed, 19 Aug 2020 12:43:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NQk-0001sA-FD; Wed, 19 Aug 2020 12:43:09 +0000
X-UUID: 526043864f014d52b9795632dbc9fcb8-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8uPUV+WuJUk2y2D4BlVGYPxJs4zQfi1SnztFfLAGohI=; 
 b=QazGoteNiwD18kEomorQZ0EOcrtmDC/HfBdmV1SD7JbVHnTElOLkfCf5826y4qQxXBPbVKbumnV9mDnv3FU24mcEba0woY3ef5IIM0VjuamST7st+GsuzdqClU5c07Dc3EEYRQfLglN2JldmHngr93KQfgeGsAlJCXP8/S5nZOk=;
X-UUID: 526043864f014d52b9795632dbc9fcb8-20200819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 297135965; Wed, 19 Aug 2020 04:42:59 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 05:43:01 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 20:42:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 20:42:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 09/10] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
Date: Wed, 19 Aug 2020 20:41:04 +0800
Message-ID: <1597840865-26631-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 880C2D39F7C81EB325277EEE0174E037DFB900233850FB14E9242C8AAB137E272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_084302_754240_7DAF94B9 
X-CRM114-Status: GOOD (  15.76  )
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
 drivers/usb/phy/phy-mv-usb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index ce767ec..008ed58 100644
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
+				(tmp & USBCMD_CTRL_RESET), 20, 10000);
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
