Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A95ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t0XM1737ZWX1mhSCQ9gGUR194bfXWMaXzOPq4liWSc=; b=sBc/Ymiu4JDOfdxLaAsAUYLsVl
	ux47qnxtjml0BBz7h/OIC0Ob8pqznyW/zF220kH5IZBHTAY9tRUFSH5OgMJOai9RQ4V25ET+ebW86
	xP9jZGfVuUmU3NRmZVQAuUTIoOfKJNi2upEcRA3acEUALkhFK4vYFP1nO5t6QwlT6xtbE1BDjLHKZ
	1uqhDoCZulpxAnJJYwowBvF2xhlF25abioLXYQoaMNxLMNSfdTs+KS8+lao3OfocuIz3QwayG65md
	GilK/8q8wKkahUH9pF6WklLW4BysQ/OSwgGg4vgBCBXSovAJFT7PRTS26r0tfP6xI4EyOaMrtc1S3
	AQ+I+54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabsn-003XK3-L2; Tue, 20 Sep 2022 11:57:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabsl-003XIQ-9k; Tue, 20 Sep 2022 11:57:44 +0000
X-UUID: 18459acd8cc64b96841db5da3c560e35-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5t0XM1737ZWX1mhSCQ9gGUR194bfXWMaXzOPq4liWSc=;
	b=FeHAa/mLZKMTzbPi6r6RE104jzY13e9CKCbEeUYDJ2o5ywKbk0MmOub4pY0D6WVtT49pxQxR7klrOewFCEaxnCGYDWofFaU6HuNUWe62FraLfmBd5df1IHc9XAtjXKyNzHmzNZI3oFW3SQGJzV5KIEo5HwerCFcvGWPIwwEv+HQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f2fdc341-ec84-4c6b-b7da-fd1eebbc2b37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:92646c70-dafa-4a42-b716-cf2cd4845592,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 18459acd8cc64b96841db5da3c560e35-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1875265649; Tue, 20 Sep 2022 04:57:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 18:56:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 18:56:32 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Runyang Chen" <runyang.chen@mediatek.com>
Subject: [PATCH v3 3/3] watchdog: mediatek: mt8188: add wdt support
Date: Tue, 20 Sep 2022 18:56:22 +0800
Message-ID: <20220920105622.25666-4-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_045743_388506_839260AC 
X-CRM114-Status: GOOD (  10.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Runyang Chen <runyang.chen@mediatek.com>

Support MT8188 watchdog device.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e97787536792..b53763ad90cf 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
+#include <dt-bindings/reset/mt8188-resets.h>
 #include <dt-bindings/reset/mt8192-resets.h>
 #include <dt-bindings/reset/mt8195-resets.h>
 #include <linux/delay.h>
@@ -90,6 +91,10 @@ static const struct mtk_wdt_data mt8186_data = {
 	.toprgu_sw_rst_num = MT8186_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8188_data = {
+	.toprgu_sw_rst_num = MT8188_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8192_data = {
 	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
 };
@@ -429,6 +434,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
+	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
 	{ /* sentinel */ }
-- 
2.18.0


