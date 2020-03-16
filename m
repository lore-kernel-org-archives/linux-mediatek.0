Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75238C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 10:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D8B20663
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 10:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a/Zr3Vlf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D8B20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rkrAuyNS3MdnTZt+wzgVGK8h5tcSLdX6ktr2Hy8T+8s=; b=a/Zr3VlfdackNi
	Da6825Cy5NBuzbox6bHRyWJuo2JEnNLj6DVZ5W/C65MztIp/pMWzUHvAfrVCRgSc5FcKUwChOhyPW
	yddXbm5swcxWZqa+lZN6TDU1E9G/eayZFlI8an1wxqKHHYACIuvgirnmqvncHdVQtR07rZQ9RSuh0
	iq/Zdl5Lsphykre2/Y/CGLID/ihMkhAK8DciQ/qAtVBsfcMB+E4gXTYHKodPcJiHWkN14EQG/B+DP
	NwAd0GMxv2TSMHja4nsJTUX72Zi8RlmqM0Ppukl9lJIfFtKJnxlcRv1n2IoAU5171ffOi3jqvJivL
	qrWFwkHzvlgFLqB7Hsfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDnIW-0007iH-2q; Mon, 16 Mar 2020 10:48:40 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDnIN-0007Zd-KU; Mon, 16 Mar 2020 10:48:33 +0000
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 227A9240024;
 Mon, 16 Mar 2020 10:47:18 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
Date: Mon, 16 Mar 2020 11:47:00 +0100
Message-Id: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_034831_807307_FFCEBB5B 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move SIMPLE_DEV_PM_OPS out of #ifdef to fix build issues when PM_SLEEP is
not selected.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 432df9b0a3ac..c2709c1602f0 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -394,10 +394,10 @@ static int mt2712_rtc_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
 			 mt2712_rtc_resume);
-#endif
 
 static const struct of_device_id mt2712_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt2712-rtc", },
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
