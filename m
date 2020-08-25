Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64288C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322D920578
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUJFnZVK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LmWvS4+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322D920578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Lm2PIYQbPxkZZEKgKMOrTv5zmAMqf6kSzOz7ikA8Mo=; b=KUJFnZVKawfl3uOeRFAhi2Yuk
	wd0+GICydonGJjWrOTjwZi2jS3AAjs9EyI9kB4Mlj7t+GqR1uLleoeFxMQ7ZMwXu8qLvj3bbnR1r0
	UUomSPHj7I4aXadkghhZraEG3z35L2wz54VdIPOLT/qdr7+HMV5UsewR4QsXc2S9rPOPPXStqcfVM
	Wn8ahcm60T8euJJrTvO2L9EyBo/Zh1QrH0hxHifg2TQSO5KFB35Ajch34fZ9uB8PJ2tZzx+DnmlmF
	Qt0Y+ticbQBlCszFfD76IbmklF87zG8+dKCV2nG1EBeRyEAJm5Fd2CyrRILS7zgHwFgucf+M9TGXe
	vSsc7t+Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOSs-0005zp-Po; Tue, 25 Aug 2020 02:13:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOSj-0005v6-OU; Tue, 25 Aug 2020 02:13:26 +0000
X-UUID: 1ad309f5b9314b8785e4601a5809a4ab-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=21CT99gVNFEuuNYXRK1dReZRVbPZKir3/U3fY5f7SKg=; 
 b=LmWvS4+oE1bv/R5iHNQEfDM5HVV81nAfdKJnU4TppPOqI62eIgibeEGV5nW+aPoT1PCPNrHJ3g+LmWIW8HadFo/ASBWTcquSJt8w6U3XjpBJU2ZB2pfV3ISfkatMvHB2N3eXKM1V0dM9F0earbRygXF0DLrz+B4iw+8VGpnap90=;
X-UUID: 1ad309f5b9314b8785e4601a5809a4ab-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1626132765; Mon, 24 Aug 2020 18:10:14 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 3/6] phy: phy-bcm-sr-usb: convert to
 readl_poll_timeout_atomic()
Date: Tue, 25 Aug 2020 10:03:04 +0800
Message-ID: <1598320987-25518-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 588180CEE0623FA533389B0780B86B46F91CBD423006F5AC70031FD8AFAC5E452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221325_939105_9B7047A6 
X-CRM114-Status: GOOD (  12.76  )
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
 drivers/phy/broadcom/phy-bcm-sr-usb.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index 77c025a..c3e99ad 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -5,6 +5,7 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -109,19 +110,15 @@ static inline void bcm_usb_reg32_setbits(void __iomem *addr, uint32_t set)
 
 static int bcm_usb_pll_lock_check(void __iomem *addr, u32 bit)
 {
-	int retry;
-	u32 rd_data;
+	u32 data;
+	int ret;
 
-	retry = PLL_LOCK_RETRY_COUNT;
-	do {
-		rd_data = readl(addr);
-		if (rd_data & bit)
-			return 0;
-		udelay(1);
-	} while (--retry > 0);
+	ret = readl_poll_timeout_atomic(addr, data, (data & bit), 1,
+					PLL_LOCK_RETRY_COUNT);
+	if (ret)
+		pr_err("%s: FAIL\n", __func__);
 
-	pr_err("%s: FAIL\n", __func__);
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int bcm_usb_ss_phy_init(struct bcm_usb_phy_cfg *phy_cfg)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
