Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A290C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB5A2076C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1YY/1sv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lSceOrae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB5A2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ll1ZuahIq7Na8jvGxfkY9WdSbjTFrmZ272UDMkbSxJA=; b=U1YY/1svi35/+Dw5/PK71VTQX
	UH6h0JBDoLopRzkGLvkBhWp56JPBJcnJ7UnuIq6WEhj/fX6cxHyfJKHNXU0jQbF7uSrI5hR2m/vGS
	jV+ivOXi+cJAmLaiXFOppdSdJylBBrhBFsppxHfzcq2cMdB8JyF1X3t8GWWrEbwCeF7fHMSl2qVVi
	YTFBXcwEBgb2B7PmpM4hoYEptp7s/Sui6/hMuiokfMXfVdkPT+2cqx+E/htrhtvRFHaUqPi5J995F
	v3dz7B2QWgCSfxlbnrClJ1hUx2dekZj872heIUIcj6GnCvI8eyMc7lzgfF0AmKVMceMe3zy+enbsn
	cqWCs1n4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHye-00048v-6J; Thu, 10 Sep 2020 08:30:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHyR-000433-Rg; Thu, 10 Sep 2020 08:30:32 +0000
X-UUID: 4fc05ff700bf42b6b00a59eacff21e3d-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=alOtbDy8sNebdE7u73c0CBOo4U8QiV6rJoaa+rnc/yY=; 
 b=lSceOraeIlXJwkvZuua7gxbyYhLdW5lpV8VDBOYuK7vEgVqw+Ws6QeMdZQb0tFf80cbXFiQFlqs61ieDjqPj9p+UYCAkxSAh8KIbksgSHjOX8uhvah812Wo0LkVmc/JjkHvk/HC8MIN06aiPrw+Fcy+NFN42V4Lt0w/rBuPGNBk=;
X-UUID: 4fc05ff700bf42b6b00a59eacff21e3d-20200910
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 381826065; Thu, 10 Sep 2020 00:24:14 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:24:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 08/11] usb: phy-ulpi-viewport: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:49 +0800
Message-ID: <1599726112-4439-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F0E5AEE4A43A08AF82FBC584F94AC36F0023DD0166A4C8724EEB7840B8A51B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043032_072778_6680D9A1 
X-CRM114-Status: GOOD (  13.06  )
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
v2~v3: no changes
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
