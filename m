Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95248C43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4352220735
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yvv7yKro";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hAsT6uFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4352220735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Ge8cXWg17UlfFxp7r2vtibzCtC8bRvXDcR32jExMwQ=; b=yvv7yKro0K3G9mN3vze0a3OBu
	71UTQLtncyDlgJcQonfjR/FriddVJDYMYiDhiujX0bR5lZ2JkSB0rNwTYZGfUk6gNCTEWtHxmm3cM
	i/1oIAIKO2WUkRXHBlza9h/68YWNLP6xfG19ixHFrDvw14E0fy0otp/bNwSc50lji7BZsC1lw13ht
	VszMCUlR1EOcvsW961sD7b/dc3SxE3uBahEA1492J5hE/8twp3jOmeX830G1f+EsBQIJY6gDEPeUE
	EflnG1YImDDf3tUvo7AK4rb0cXs7o/9vQslyx1oAJIeUnL25DB/s3Fdb3M6r+fjwzk0vCHzwlNlvW
	Uxt3g5XjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFGY-0005or-Qr; Mon, 21 Sep 2020 06:25:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFFi-0005Tk-F2; Mon, 21 Sep 2020 06:24:46 +0000
X-UUID: 2b1b23fa444c44f7bebeb518c292825c-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fhoC7nd4R36M3issGh+SxVPkb1Qjg4iuhqpKgwaNaKE=; 
 b=hAsT6uFScZzYn1TFbtx1oo5dO16HTZegY8tY2EKHoSPWy6NcBFKqrI3rH5V9f8zbzwwi7bWfO29BeMf3wyCK+JIxAuRdJKSc1gzKNz5JEgIq1JvQDuKPM2eDFDbW3wgKwZgHYv46dED1jYXtePEErZHfhKdlCxukIgN/1O2tbFI=;
X-UUID: 2b1b23fa444c44f7bebeb518c292825c-20200920
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 410405657; Sun, 20 Sep 2020 22:24:39 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 23:17:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 14:17:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 14:17:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v4 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
Date: Mon, 21 Sep 2020 14:13:33 +0800
Message-ID: <1600668815-12135-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F9FBD9981B001EA895A14F6E8D251A0B594F6BC5073CA2F55F375A17B5E66502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_022442_684561_95131AEE 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Jann Horn <jannh@google.com>, Jason Yan <yanaijie@huawei.com>,
 Chuhong Yuan <hslester96@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, "Ben
 Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 linux-mediatek@lists.infradead.org, "Eric W.
 Biederman" <ebiederm@xmission.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: no changes

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
