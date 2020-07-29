Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1B8C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:02:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EED2074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPQEY2Mv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UotqtxYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EED2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ktagR+4L3wzmHTrg5r2EeM7RBGCuvAdLSQnPgZiEbj8=; b=YPQEY2MvR6Nv5ZmHjrGFqMHG1
	iq3zQ6dmW1CW8tVw9+TAHy2piHLriKKRSfoCBBeiGzIgq6JPxz0CP/mjwIGEOhfPxDH4ULgIehizN
	pvtN9yvuIV9iPio4Y38FG1PqlBGC9fiYacUsanf4QE5UvVCKwqO4+eT7rnAHhiYkcYisaX/PWF/d2
	W9FSRkyEZPcDEIjZx6K9XXbOgdJXkuxsC8MFFhXiqlkztKCnqPi6Gb+YkfaEYaiIMAImmkrNQ0M/G
	OJOnikfF7BcMGWK7S2HmghFlF75bFIKGNI8LMQ3TPO9OGA0ZqjevrvDyTjmOe1D1ypv6hxtiml5wg
	N52f+W4Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0iv4-0005iT-66; Wed, 29 Jul 2020 10:02:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0iuz-0005hQ-Oj; Wed, 29 Jul 2020 10:02:38 +0000
X-UUID: 4c77db2f199c46c58efa2d6c48145958-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vh67dDG+PPF5w/5q7NusigBDM+ZZIr+ZRqBQV1zStds=; 
 b=UotqtxYZ19vdsC5qy2/SGNztYUUbhjAeJNhEGKQNZKmg823MAXWHucEIrS4oHBph7Ogg5++8MRwpXlpu05fOezRRdhmvGjBOpL/aUkQGGhraSIQ+/PNPuj/0Wc3ETWHUkdAtbmVa8oUbfmTVg9DtEzakujKr3h6efB3uQy8hss4=;
X-UUID: 4c77db2f199c46c58efa2d6c48145958-20200729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 372185034; Wed, 29 Jul 2020 02:02:31 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 03:02:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:29 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,3/3] watchdog: mt8192: add wdt support
Date: Wed, 29 Jul 2020 18:02:02 +0800
Message-ID: <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_060237_940475_10510BA1 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add driver setting to support mt8192 wdt

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..aef0c2d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -11,6 +11,7 @@
 
 #include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset-controller/mt8192-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -76,6 +77,10 @@ struct mtk_wdt_data {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8192_data = {
+	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
+};
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -322,6 +327,7 @@ static int mtk_wdt_resume(struct device *dev)
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
+	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
