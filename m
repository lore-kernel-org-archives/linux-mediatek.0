Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7947FC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432D620639
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pV3kjbed";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MiQaJ8bN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432D620639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+KJJCr89OEcwKMDARjyH1xYr2c3nLLG4PuukthZZ8mo=; b=pV3kjbedpGb6k0CVr070nmltK
	im4m91ReBt54cxJ59otuXk/sD2aLyCtDVj71T2CE6hb7Ts7Ylloqgx4743zljyscewL918XWq1pHn
	OuOpfo1qUIFMpPxC/N1rEUWgMI0K5B61gBiTvRpOlfMRXCXzqM9uO8WUtjv5VRb5USv3dhFKyRxY5
	Xppic7s+achHfOE/cXAHQVYnOYbCLLO+LZ5z6ZN6MFrWkJi8UiuBNGIgCRZsxQJdZQ5h8+0G88Xqw
	D4zugbW99p6iACIdLN/bX4c6FhhsHWyK/WAsIr2SaosL1dhPBG+7dIDGXFQg4JzI+Qf0NeprMZaCD
	uWd0Sdjcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOUi-0006lt-1S; Tue, 25 Aug 2020 02:15:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOU3-0006Ve-O6; Tue, 25 Aug 2020 02:14:49 +0000
X-UUID: 07bafb7479e148b1a589cc027fd1e5c1-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DVHRh1RBZU+BcDSktqxKWMvFtrCLwtkjiR8252F3Grw=; 
 b=MiQaJ8bNdYk10LtfgfAtLLllkl9JVyQ7ZshZd1ELuQiDbVZUlwhSj+PBvmHmcOFwDlvzIh3D048ugRXICCYpGClToqule0FPMjzhrLzc5vCN2RGSyvdDt7/BatqLGghQIMQZ0S1psQIwALihtU21OO9IUtE2LRPsbf1k1pK+5vM=;
X-UUID: 07bafb7479e148b1a589cc027fd1e5c1-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2114245911; Mon, 24 Aug 2020 18:14:43 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 2/6] phy: phy-bcm-ns2-usbdrd: convert to
 readl_poll_timeout_atomic()
Date: Tue, 25 Aug 2020 10:03:03 +0800
Message-ID: <1598320987-25518-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EEC3529724919847FA126E25E02BCF7766E0E17551D1EF8D6C698E3376E31CD22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221447_979659_C46F958A 
X-CRM114-Status: GOOD (  13.35  )
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
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 5276259..9630ac1 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -87,17 +88,11 @@ struct ns2_phy_data {
 static inline int pll_lock_stat(u32 usb_reg, int reg_mask,
 				struct ns2_phy_driver *driver)
 {
-	int retry = PLL_LOCK_RETRY;
 	u32 val;
 
-	do {
-		udelay(1);
-		val = readl(driver->icfgdrd_regs + usb_reg);
-		if (val & reg_mask)
-			return 0;
-	} while (--retry > 0);
-
-	return -EBUSY;
+	return readl_poll_timeout_atomic(driver->icfgdrd_regs + usb_reg,
+					 val, (val & reg_mask), 1,
+					 PLL_LOCK_RETRY);
 }
 
 static int ns2_drd_phy_init(struct phy *phy)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
