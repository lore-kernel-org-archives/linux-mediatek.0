Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E6A60F58
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63E6A60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfwyDb8hEc2DkqldQoqlnIOgS4y9VLw427p2MTPa5d0=; b=kJpGSSmPOTDZo/
	LzImmlKijM1RubJKZNx5lGRvrJQftre70xRruRznIS/2G1Kg841Msyj4adhZ6wqq4PSSHO39fMF9i
	EUyTT+g5b6mc5HSbQDzYsac2C4oYdDGMZsQj9sW1PzT4vSfpE/IpGCf8DChkXhimCUvl/sggbhDMT
	5fIcCGko93yoWzk4wg+LuEcVZL22wmFAboF0K/GH1XNdgCu8u1cCJMp59TTVXoaeTgA/zXYtWsGP4
	MweT6+1tCxHQ9HBLKADNePjW0euotQxxt9iTjnwgcMIzmcZEkgSgZHzEIUwefYoJxxf1z6EBhAx2h
	5fCGKeXMRp8VgiSzak+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7qj-005krJ-1o; Tue, 14 Sep 2021 12:47:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7o7-005kFX-7i; Tue, 14 Sep 2021 12:45:04 +0000
X-UUID: b5debbf66f234b089728f7282c7dd866-20210914
X-UUID: b5debbf66f234b089728f7282c7dd866-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1058986312; Tue, 14 Sep 2021 05:45:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 05:35:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 14 Sep 2021 20:35:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:34:59 +0800
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
Subject: [v3,2/2] watchdog: mtk: add disable_wdt_extrst support
Date: Tue, 14 Sep 2021 20:34:54 +0800
Message-ID: <20210914123454.32603-3-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
References: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_054503_369862_714F1970 
X-CRM114-Status: GOOD (  11.81  )
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

Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 796fbb048cbe..ceb57ea627cd 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -65,6 +65,7 @@ struct mtk_wdt_dev {
 	void __iomem *wdt_base;
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
+	bool disable_wdt_extrst;
 };
 
 struct mtk_wdt_data {
@@ -256,6 +257,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	else
 		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (mtk_wdt->disable_wdt_extrst)
+		reg &= ~WDT_MODE_EXRST_EN;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -381,6 +384,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
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
