Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3561C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:07:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6A9610A7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6A9610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7h28ImrhbM3PPxov2IRXzguI0ddBksWUNQrhf0zumOs=; b=nBTRT4jCKXZgWIFCL/vETBkWxD
	tX+IEFxREqrDPqKPLJaf6tbI8GQEDf93Ssu6Umu9NCrIMgldNE2OXLHTubl+EFLRZ6TlrBPE00WQ1
	IOEDulMr/JrpTXYxeMgiebMy3V6cxC5UdYDwmfzzkZSj5mYhHB4u0t0Ls33o7aHv+vSLKuWGLRcan
	v7t7qZ11UMTbbZKRkLcsAD9a9glJx2AophElsecEgeArweQCuGZWtsyXErmgBT6e6kOE3z4BDJ5HE
	d7iALQCL4pKViJ0bECytiNlghg4HC1qe/t213KUj6Zbfu0OtfH7ej8hZZhoh20GAonUZxGPYsAXpB
	joXQDsrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhUh-009nII-V4; Fri, 09 Apr 2021 03:07:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhRx-009n4b-0l; Fri, 09 Apr 2021 03:05:30 +0000
X-UUID: cb2827191f994b449d2f17838300a24a-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=n3IAg+7Lq7NPu4tJAsTfeiR8hgRb5nUcr8BttqfUrXc=; 
 b=IDZBgcoctjS2E3CdMdZhMEZE1GAdQquKmCjjSR3yf6UWKm/BaSU1RePI44ZZyZydzFddQD4Rpm3UTY8NgjwFebCQAhx7YsYdeQqgN7tpErQeQI5lZE8x0A4m+PYE+WxKMNR0tQ5nuFVF7p2VF9sGzdgBKWCPDC1RfYM6StG/dKA=;
X-UUID: cb2827191f994b449d2f17838300a24a-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1028959461; Thu, 08 Apr 2021 20:04:43 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 20:04:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 11:04:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 11:04:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] irqchip: gic-pm: remove redundant error log of clock bulk
Date: Fri, 9 Apr 2021 11:04:34 +0800
Message-ID: <1617937474-24630-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 82C02DB886B3FBC54326E2529E8B78A4DEC5522B254D3F3867331FD65CFD9C9A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_040527_425320_8C1540CA 
X-CRM114-Status: GOOD (  11.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is error log in clk_bulk_prepare/enable()

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/irqchip/irq-gic-pm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-pm.c b/drivers/irqchip/irq-gic-pm.c
index 1337cec..b60e185 100644
--- a/drivers/irqchip/irq-gic-pm.c
+++ b/drivers/irqchip/irq-gic-pm.c
@@ -30,10 +30,8 @@ static int gic_runtime_resume(struct device *dev)
 	int ret;
 
 	ret = clk_bulk_prepare_enable(data->num_clocks, chip_pm->clks);
-	if (ret) {
-		dev_err(dev, "clk_enable failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/*
 	 * On the very first resume, the pointer to chip_pm->chip_data
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
