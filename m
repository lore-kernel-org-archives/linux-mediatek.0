Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C710C33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 08:59:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420CC24655
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 08:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jgwTUTqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H28O42VN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420CC24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjTOCy2+OOFL85vN5LtH3JjIGQBDIkprtYEOBvHY7Zs=; b=jgwTUTqSt+q5QG
	xFjN/O2g+CBfLGQXWIE9scNa0wL2lfxTddkxHTFBt9H4U4BvLtotI9M6Wt5MKVcjYoIUuWKBOrH5m
	3lbFwwEwk72RMLguec2joAclkoMn8BkaEPrzfTFbkm5EOWR7ngN2rkwbKR6IGHe8agyjjesYqmvGq
	7947kSOAblF2EvXaiPnsmPh85sYvokOycFgsli2DOd/vuph0Qetm6koRseFbP5j+i12pODFq/hlSY
	lvntVhg9Fwi5Oxh+GZNDln4QgjssSxeDbVPJrG0cz4fo7q4/CpigwylXeGjGrsR3ZIDzzDWpO1HIB
	VbvgT07URhm+7WoMw2Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ireW5-0002VG-4s; Wed, 15 Jan 2020 08:59:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ireVr-0002FW-0b; Wed, 15 Jan 2020 08:58:56 +0000
X-UUID: 55a638f386084b2eb81e43225a412326-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=I69ahnkuv6CGMC6vN27rzSxh+MYCoqd9hH5ZoS8vk88=; 
 b=H28O42VNXhRE9/A23YhuHV9ec2tqsYPOemnQG22DXsOA6txFka/FzDwg5oYeN1I5f49OjF6parGGHUGWPs/lwW8Hbg7hLArd8iwRONUPBsrWTPhUplcpJQgW86U1f1WC+lnAapAg37QuyHwFmkgWWj7Y4YTsoGN23RBiMGsbubA=;
X-UUID: 55a638f386084b2eb81e43225a412326-20200115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1506939977; Wed, 15 Jan 2020 00:58:51 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 00:58:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:57:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:46 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <yong.liang@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <chang-an.chen@mediatek.com>,
 <freddy.hsin@mediatek.com>, <jiaxin.yu@mediatek.com>
Subject: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
Date: Wed, 15 Jan 2020 16:58:28 +0800
Message-ID: <20200115085828.27791-5-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200115085828.27791-1-yong.liang@mediatek.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_005855_091179_072F1AB9 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

Add reset controller for 2712.
Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e88aacb0404d..d6a6393f609d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,6 +9,7 @@
  * Based on sunxi_wdt.c
  */
 
+#include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -67,6 +68,10 @@ struct mtk_wdt_data {
 	int toprgu_sw_rst_num;
 };
 
+static const struct mtk_wdt_data mt2712_data = {
+	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
 #endif
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
+	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ /* sentinel */ }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
