Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15559C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13246101A
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D13246101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxOOy0d+aVAY1DdU/gwq5VAEM+QbaD6dZYBkf9iHZ4I=; b=tBZvTAhG54arsX
	2Ty4oMG/DC4vfeHzGPi4ImalA60CQa92F2LPU1dmIwARu7CAKYRzzCfFdYSOIRo8mxjUkFKMmyDYS
	k4+dmVyZWfCcwKzH4GAuYjwdoD51Z4cE/EbQOn768+uzb92I/ZnUF6ULPhFTOFUAfN3wRs8B2iMv/
	E5oeD3PwgVtaDqafY1w/7/93Uh8Ab4qXhvoqkPcdMiwfhq3j0NJdCGpe/arg1GKAjMF4FhPLaEXX6
	mvJFmT8/3G26Rkg9lodgyziwZcjq6aSX5C7kl3X0NFc9cbLjnW6NAfyzcXvLN5tcOpULPF1fqzfc2
	D6tFLtPrm5iE1EMHPArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM2fE-00B5es-Lo; Fri, 03 Sep 2021 06:27:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM2fB-00B5db-L9; Fri, 03 Sep 2021 06:26:59 +0000
X-UUID: 2d11499017d7499f8c440b2d44520d73-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TjdkwSNpRr19XuDMiPwIl2n2oTEWXbLXHeiLD6UCShM=; 
 b=qgffYWFiGwxfU53OJv3s3gI1txAE4zkYkLol64+0994t2fX6nikwWRq5UlisoNfXpMUO1FI7phZFsv7JpgzJtuPK85dzzCPqNWf3N9QtdZ2SeCTFWD9Zjqh4k5jQGrnJfXDzAETjLjiMrgN3tg3ZzWMtmt1eXI737oVAEa7zb4Q=;
X-UUID: 2d11499017d7499f8c440b2d44520d73-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1413172462; Thu, 02 Sep 2021 23:26:53 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 23:16:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 14:16:50 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 14:16:49 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fengquan.chen@mediatek.com>, <tinghan.shen@mediatek.com>,
 <randy.wu@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <christine.zhu@mediatek.com>, <joe.yang@mediatek.com>,
 <zhishuang.zhang@mediatek.com>
Subject: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
Date: Fri, 3 Sep 2021 14:16:22 +0800
Message-ID: <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_232657_758477_3B94A224 
X-CRM114-Status: GOOD (  12.18  )
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

In some cases, we may need watchdog just to trigger an
internal soc reset without sending any output signal.

Provide a disable_wdt_extrst parameter for configuration.
We can disable or enable it just by configuring dts.

Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993bd009..276b6cb7d225 100644
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
+		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
+
 	return 0;
 }
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
