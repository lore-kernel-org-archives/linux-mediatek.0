Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60391C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:17:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0432D20719
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skOMWcwx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JEsyUbsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0432D20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3M7FEQaoEZDzsLDsBEuawHMRHNhhy2ZKIIW79Vv+0RI=; b=skOMWcwxIYMomrASegcoXMOgj
	E2+OrDVpEYizKu0zK9BA8g9TgIUIKDyzpXldV+iBK7FQcNNIk9P8v3sOMDgOtMCWoALIxkb0mJ/Xe
	UCbZlwGTNOQJiYmYTZ1sPr2sJn8+SKvAiLvSZ+ZC2hwloQcUI+Ug8VDrz/wv8iuWsCxZn3GG2N4YT
	JVN8f3WU8CIZUDDCTLF7mK8/SDpw04YyBZd1mIsO67Z0QOgT0AAYxmTBcqQ1Hepkd54Uw5yi5Xu26
	dQrLaRylqkarV2VhYVulvJEkyOiCm76QANfiic+YU+RtBoIBi66cqI64qxlwTc/ZkXNrBHQADizTS
	ITKtUNXvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKF8e-0004ZR-SL; Mon, 21 Sep 2020 06:17:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKF8W-0004WM-FJ; Mon, 21 Sep 2020 06:17:17 +0000
X-UUID: 74632dd37f4745618212c9f4f06068e8-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M+jMphpitAdQKmTgncue8DLUuiChzBueaSc64a9GuJ4=; 
 b=JEsyUbsljaoTfV4vfkOwqthqpXrB98bAWmFUDWhXSd26tt6t9wDwn5NDhb6OS87r4KoPEfb1asWzkq4WJf2AUic/jDgnY7UpFZxw5Xf7WixlnN59C0ZJOS/WU6sjBJhVHbRQBPVNH9ndr7EpxQk8AwJ0e63WWM0l8ckMaFxiLN8=;
X-UUID: 74632dd37f4745618212c9f4f06068e8-20200920
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1723260504; Sun, 20 Sep 2020 22:17:12 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 23:17:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 14:17:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 14:17:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v4 08/11] usb: phy-ulpi-viewport: convert to
 readl_poll_timeout_atomic()
Date: Mon, 21 Sep 2020 14:13:32 +0800
Message-ID: <1600668815-12135-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EEA5F66F385D1C22FDC9CCE0641F47060E3C27892C8F6ED0949B2FA6AC1DA61E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_021716_744252_A7C827F1 
X-CRM114-Status: GOOD (  14.06  )
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
v2~v4: no changes
---
 drivers/usb/phy/phy-ulpi-viewport.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-ulpi-viewport.c b/drivers/usb/phy/phy-ulpi-viewport.c
index 7a14e0e..0f61e32 100644
--- a/drivers/usb/phy/phy-ulpi-viewport.c
+++ b/drivers/usb/phy/phy-ulpi-viewport.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/usb.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
 
@@ -20,16 +21,9 @@
 
 static int ulpi_viewport_wait(void __iomem *view, u32 mask)
 {
-	unsigned long usec = 2000;
+	u32 val;
 
-	while (usec--) {
-		if (!(readl(view) & mask))
-			return 0;
-
-		udelay(1);
-	}
-
-	return -ETIMEDOUT;
+	return readl_poll_timeout_atomic(view, val, !(val & mask), 1, 2000);
 }
 
 static int ulpi_viewport_read(struct usb_phy *otg, u32 reg)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
