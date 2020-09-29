Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6911DC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:23:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE83F21734
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ep91jQID";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZALbqekW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE83F21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlqANT1P4jagxncbZCIG4c/7ri4Ms1R8GMAiPRJ4rrw=; b=ep91jQIDIOjOlM9oviMzOsOQC
	gbCMx6K161Hx2egdgznQqkQrDRoA/jLTm9TixkhYGiBOa677AedD91atUu0/2jadvpBZ9aG0FTJ1c
	gGG35BfJu5uK1U40yEFkxjSrVMXe7eKvZpZaErrw4jNhCKk7dFEwt9k8NzutDbGFfPg540lMzuQ3S
	tymVA0aD7Kz2KT3cqZeLkEHqwElfDBJRNTpi7durWbLcgCYqCig1CHQDr4IDDMbnU5x6wUCJJo8Up
	VYW7A6NaHs+3ssR3rMw2KqG3lk4vL6apzR2otw8V4w22L09eNWk5JfOnnL5tIgWVlouSwDrRfEmr1
	sg8J5GZXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN6Ez-0002Z5-CJ; Tue, 29 Sep 2020 03:23:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN6Es-0002WH-US; Tue, 29 Sep 2020 03:23:39 +0000
X-UUID: dff6b3e84ca04a92a087cbfed95db23a-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MSvWctba+IbOd/a2WBji6T1/shGFuBINQUNZk7gS9c8=; 
 b=ZALbqekWnEchaxuxeBM4Qw+arq0ZG4wAvNuvY/i5diezCQaFjIBX07eYS6yfiWWscXHeH5g4hKRqH7h+X0fR8nEt2gnHnkK+h9iy6i4+qb5CNB/yVMEgiWfJZGCsv6qWrFIAu8jPCiiC0NwLRqqM4KWvb5FsDTNHJ7EyO3ur2gE=;
X-UUID: dff6b3e84ca04a92a087cbfed95db23a-20200928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 748228179; Mon, 28 Sep 2020 19:23:34 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 20:22:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:43 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:43 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5,4/4] watchdog: mt8192: add wdt support
Date: Tue, 29 Sep 2020 11:20:05 +0800
Message-ID: <20200929032005.15169-5-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_232339_107943_9B3491D9 
X-CRM114-Status: GOOD (  14.08  )
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
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for watchdog device found in MT8192 SoC

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393f609d..aef0c2db6a11 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -11,6 +11,7 @@
 
 #include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset-controller/mt8192-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -76,6 +77,10 @@ static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8192_data = {
+	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
+};
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -322,6 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
+	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
