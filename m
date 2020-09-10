Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E06C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C3B20770
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sBmiz92H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e30xf16H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C3B20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Ls7v58J5BtrsO76xOrLWSSC3ljqq1i8LlAc7Xxz34Y=; b=sBmiz92HyCptNzBmV/5nb5g5/
	X3Rp/ALPBeZ0/iX6rDII6XajnQ930hACmU+fvSbBr7QrwXezQus/pNbY4E2KDXlj6N67uEanhogMK
	a8GeIWvyKX+d3ZSmh81zKiKo4Kc47bD3bYMOl0o7L7yQ5g2F33ZdSn9d4ivc4rBQ0r7bKL8YwDS0O
	tpDgHxnvu4m3+p1lxS7JjxrA2CavRaIHjl5WthOrzJuGnLV1Z7lNYXjsDxSptC3GzhROyDX4dfSpt
	zINJLFKRSPqWtp6ygUc/dp7A1LCHAC4rm2/xn0m3TVK6no5SO3sEEt9v4mh1pYi8PijWCzLcLICqS
	Ps4Kyv/6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHzB-0004Rg-06; Thu, 10 Sep 2020 08:31:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHyh-0004BM-Gr; Thu, 10 Sep 2020 08:30:48 +0000
X-UUID: be919a1159c441e3900083d89317842e-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RiKpsCZJex/4PNC9PXP3CBjdPJWYcy6TOG9QBDJhfJg=; 
 b=e30xf16HfRVQDlc9BzHFkGd/E8STfMyEMtOdC+aZ4A5PZ0VY3r3LhGv2MwSlJ2DGBupaeyXr8b/43aJ3S8bDwA5FOEKDKWXhvX3bts36vqj5nZpy0hIrPf73crIbEBRF1E7pcu/7qWnLevLIYp7DCr3pX0ljMaR5U3n5wqJVfa0=;
X-UUID: be919a1159c441e3900083d89317842e-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 856505944; Thu, 10 Sep 2020 00:24:26 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:24:10 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:50 +0800
Message-ID: <1599726112-4439-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9E9FC7DF85F7DECF1FBA81FC92D4B5528B3C18E67E2F8B37039BCCB0CD400C822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043047_709690_82BC66C0 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org
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
