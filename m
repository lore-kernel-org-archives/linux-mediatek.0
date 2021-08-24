Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4539C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 06:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E7461076
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 06:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64E7461076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hmYhPE/DNHQJjUukP991bEcomSqJLXAFgJakLqk6Og=; b=j4VsFdbHLJJfau
	NF/ULgC4t0cVkhgA8UYY5Jq8ntXwKBSqlkffRv9PxxZge4VaMYlbexVuDRjzTHgoBVVHE1BbVJ7cf
	u3ScvRmi7PXQHNeFcHs05U7nNC9VuL3arAANWKw5AMF05kUmCJLdHXNTtSQvEb9xPjg+4JtuZB5rz
	Ka1ZBLHhCusoJvAIyWvkd8J0vPoCJrolwY0WzQR9osJSkxU4c3VW1fsAIgHfIuwi3Qwy2EGvRyF+t
	QJzj+Pe8shj837n879/gVjldAvKAp6PdB/uyU5HdGnmzgz/g7MF9VFIDMcD7cEWZIfWHhRi2fHdeq
	n96wUl6uF5k2wIm5AUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPvI-001qzP-EO; Tue, 24 Aug 2021 06:28:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIPul-001qnW-0X; Tue, 24 Aug 2021 06:28:06 +0000
X-UUID: b600bcc3f9d147d1acd211e7270139f3-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VWPWXBEzzxPRS4qzpkrx1ivMt0Ms8prDfIPHH4tgQwk=; 
 b=hLmw+gb83QLcFcPmR5BUcXxTgqQqvQF5dHjCgyv4+qAcOM2uZ+Jc7RFpYWGM/FXA74bLt5QnUgykFH3MZ4OFAu0IQP/JUCTfJimLtaNzUxYq5syQ4sFAl5fSXe9C0SepHR9F5Si6p4cu9bnLXrRZNPhtkA4uTTpT+mnLMUACcXg=;
X-UUID: b600bcc3f9d147d1acd211e7270139f3-20210823
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1709757429; Mon, 23 Aug 2021 23:27:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 23:27:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 14:27:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 14:27:52 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <seiya.wang@mediatek.com>, Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [RESEND v8,2/2] watchdog: mediatek: mt8195: add wdt support
Date: Tue, 24 Aug 2021 14:26:36 +0800
Message-ID: <20210824062633.14374-3-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
References: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_232803_091614_50C4475A 
X-CRM114-Status: GOOD (  11.40  )
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

Support MT8195 watchdog device.

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 16b6aff324a7..796fbb048cbe 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/reset-controller/mt8192-resets.h>
+#include <dt-bindings/reset/mt8195-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt8192_data = {
 	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8195_data = {
+	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
+};
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -408,6 +413,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
+	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
