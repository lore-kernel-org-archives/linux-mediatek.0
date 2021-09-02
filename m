Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB438C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 08:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9432660FC0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 08:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9432660FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbW/1X3HCToilGrt3AfQiEYSz4XxUJim4+QQQQfgyo4=; b=pPJsH5DzMidRBL
	MlyEe9YQbm7HsUzkw0Gbvfiw0lCyUn0rqv8pKRSkmekwst25e1bdeenrL4KkR5sFo9O5dd+KS8tax
	bQdw4ncWkx5D1QU0WeJyBmNTIZjydGSwqFlBb1mT5Z3L+OM8VqMmSwxdcHnL2baKJyPnhkjtyPl1o
	7LEGmOYOIVhPijndOYkFlWa53g/1fCD2gXj85OKkLVl9qtRVXw29bDlobbQMojOATPthnCi3Jy2d0
	hXaopRE0H+W6N59b7m/vfX08kZl5sHPxARZ4CqXHwoqDFtqFt4KDynIXPCl7eajcpgn1sBTXvNdvt
	I9E0ugUdnEhWdmWQToTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLhsF-008w7B-JY; Thu, 02 Sep 2021 08:15:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLhsB-008w53-4S; Thu, 02 Sep 2021 08:15:03 +0000
X-UUID: 282459114270442197eff7c478cea410-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IZV4PK0aQPL002MqIv0l/ts9TyWjc+WVcj4cDbuTpUg=; 
 b=Br1YIMvmliKZmuziOMosMQpEHGyOdWT23HqokclsXk1RR2M5FqpVWPFLeGr9vZYGePs0z6/8z5D/u36YS6os1lXKUBVAnzAQ80UfDHJgHDdUZWcRojMrwuODO4dHd5OySGNFBdCc43FKDUVrgzDv1vogOY7TJ9T9EabEG5Jsl2g=;
X-UUID: 282459114270442197eff7c478cea410-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 802284627; Thu, 02 Sep 2021 01:14:52 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 01:04:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 16:04:48 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 16:04:47 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fengquan.chen@mediatek.com>, <tinghan.shen@mediatek.com>,
 <randy.wu@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <christine.zhu@mediatek.com>, <joe.yang@mediatek.com>,
 <zhishuang.zhang@mediatek.com>
Subject: [PATCH] watchdog: mtk: add disable_wdt_extrst support
Date: Thu, 2 Sep 2021 16:04:41 +0800
Message-ID: <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_011459_228789_665EE57C 
X-CRM114-Status: GOOD (  12.98  )
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

From: "fengquan.chen" <fengquan.chen@mediatek.com>

In some cases, we may need watchdog just to trigger an
internal soc reset without sending any output signal.

Provide a disable_wdt_extrst parameter for configuration.
We can disable or enable it just by configuring dts.

igned-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..4824c07 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -63,6 +63,7 @@ struct mtk_wdt_dev {
 	void __iomem *wdt_base;
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
+	bool disable_wdt_extrst;
 };
 
 struct mtk_wdt_data {
@@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 
 	reg = ioread32(wdt_base + WDT_MODE);
 	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (mtk_wdt->disable_wdt_extrst)
+		reg &= ~WDT_MODE_EXRST_EN;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 	}
+
+	mtk_wdt->disable_wdt_extrst =
+		of_property_read_bool(dev->of_node, "disable_extrst");
+
 	return 0;
 }
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
