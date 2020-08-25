Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225BDC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDEB820639
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEp9CmgX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Dueopv+T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDEB820639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXc+igSasC90hjAcOcZrBRGy07Sx344slpSTQhiog9A=; b=kEp9CmgXT3NGqj3AbwhQ84KDUF
	bVX3VnHrz7nKHJD9qlPVslzbhEeRP5xPECU24dUPi7EhBb1ZNpAhD1FdpSD4IBajKeSMsKnrWmCd7
	hV0mi7S/GN1wym635zpEuEbDqaHyx1sMds8dLkVejPaW6FZkeOA56yC07sRVapl+apqfsqUmBeyhq
	DS9zApELJWWwFC9idJ222T/PZGP8YuTdVMqXvapK70JLvrSK7zyp4mSjz9LFYcq1XFXZx7rnfrG2b
	OMoRjqMM73NMCZqxT/JjAvJ5zyp4iZt7MkUC4WO031E7Ft9UMUg0X6zbq10qVaiN/b5NPalCcybtk
	8SiH87KQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOUq-0006q5-Ga; Tue, 25 Aug 2020 02:15:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOU3-0006W6-O6; Tue, 25 Aug 2020 02:14:49 +0000
X-UUID: 5bd90906fcdb4d0b9d16cf4862eb1bbf-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=g1Itluz73PRMbaOGBVSexglNqPqxFWB0xKgwYbBMPYg=; 
 b=Dueopv+TvRNSOF0uAHrYFp+VbfRNHroDq7NMMW9yFiILLhO+7y6bRmJMZ7NqhFE/tUFdIFmQngn0aTc72lOz75sGdWb6DA0pVOIqV4pL3QJHoGG+hzPux0UyZdDiixlLSnICdxmc4c4jW3M0WgaBlDaY0nHr37XIJeE9rHgKpmM=;
X-UUID: 5bd90906fcdb4d0b9d16cf4862eb1bbf-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 689885790; Mon, 24 Aug 2020 18:14:43 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:33 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 1/6] phy: phy-bcm-ns-usb3: convert to
 readl_poll_timeout_atomic()
Date: Tue, 25 Aug 2020 10:03:02 +0800
Message-ID: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3EA5F72587F0E7679915674B6362ACC1B90384DA174A992330AA4FB1FA65C9752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221448_015270_E5025F24 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rikard
 Falkeborn <rikard.falkeborn@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/broadcom/phy-bcm-ns-usb3.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index 14f45bc..47b029f 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -13,6 +13,7 @@
 #include <linux/bcma/bcma.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -258,29 +259,24 @@ static int bcm_ns_usb3_mdio_probe(struct mdio_device *mdiodev)
  **************************************************/
 
 static int bcm_ns_usb3_wait_reg(struct bcm_ns_usb3 *usb3, void __iomem *addr,
-				u32 mask, u32 value, unsigned long timeout)
+				u32 mask, u32 value, int usec)
 {
-	unsigned long deadline = jiffies + timeout;
 	u32 val;
+	int ret;
 
-	do {
-		val = readl(addr);
-		if ((val & mask) == value)
-			return 0;
-		cpu_relax();
-		udelay(10);
-	} while (!time_after_eq(jiffies, deadline));
+	ret = readl_poll_timeout_atomic(addr, val, ((val & mask) == value),
+					10, usec);
+	if (ret)
+		dev_err(usb3->dev, "Timeout waiting for register %p\n", addr);
 
-	dev_err(usb3->dev, "Timeout waiting for register %p\n", addr);
-
-	return -EBUSY;
+	return ret;
 }
 
 static inline int bcm_ns_usb3_mii_mng_wait_idle(struct bcm_ns_usb3 *usb3)
 {
 	return bcm_ns_usb3_wait_reg(usb3, usb3->ccb_mii + BCMA_CCB_MII_MNG_CTL,
 				    0x0100, 0x0000,
-				    usecs_to_jiffies(BCM_NS_USB3_MII_MNG_TIMEOUT_US));
+				    BCM_NS_USB3_MII_MNG_TIMEOUT_US);
 }
 
 static int bcm_ns_usb3_platform_phy_write(struct bcm_ns_usb3 *usb3, u16 reg,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
