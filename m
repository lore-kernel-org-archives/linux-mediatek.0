Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3151BC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4942206ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caf3jXQI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eURTsWlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4942206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I0ZHLxKT4XCcQ9vyJLT3K3xXs6hmT1bmqQUv6Nhc4j4=; b=caf3jXQITAP1NsUBewhMzY+vx
	gXFj2Q+YhBzkDUnIrZ3Jb8qhvho5p/Nq6ScyfXOv5qHn3cvyDJNd/4TmXLJAm+U72gIBZ3b9io22+
	tWHXGjTttgng0D1KYWncUTSp4IcpIkchon6M5XHCPLm0i5/RmJgAplcm4+DtBV5YvI3vlbqEoxDxt
	0QxhQ2dVKw2QnwqAykq3W8qM6p1jGF34mZvpulZZ8DIP7nOg+R6StTeUzj+ij5ShhetIYuH+Knvkr
	/J8+xG4ftxjaxPgGdH4nXDRKjl36n2LFCZOrt8DExQ5/wORflvYVEMK8sb0JJpc5vwKK/b5IVkE/h
	9CS0YFVpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwYo-0003I6-Pj; Mon, 09 Nov 2020 02:05:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwXQ-0002Q5-MM; Mon, 09 Nov 2020 02:04:11 +0000
X-UUID: 80ddaacbfc604d049e86c0f08ec4c147-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t6abyv7GQaCstliXITKrDOnJbXdw7pIR+rkQrfnHEvI=; 
 b=eURTsWljrACT4cc0oIz2kutlB56jDOD8arqU3QIS/kgH4u5aIlRLl0bDB8o5zkNEjQQEdtUvm73YoOloLagIvZHiy6B2HZYfqqVDGDc7P8EtxbNLUv8Aed/bQ5XrtOldx+fBF2EGjcnwjxq+vadBsqURk6T8VMqI9Xgy5MSQJ48=;
X-UUID: 80ddaacbfc604d049e86c0f08ec4c147-20201108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1270577397; Sun, 08 Nov 2020 18:03:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:03:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:52 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 09/24] clk: mediatek: Add mtk_clk_simple_probe() to
 simplify clock providers
Date: Mon, 9 Nov 2020 10:03:34 +0800
Message-ID: <1604887429-29445-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_210409_032639_F264C9AE 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Most of subsystem clock providers only need to register clock gates
in their probe() function.
To reduce the duplicated code by add a generic function.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 23 +++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cec1c8a..67693b7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -13,6 +13,7 @@
 #include <linux/clkdev.h>
 #include <linux/mfd/syscon.h>
 #include <linux/device.h>
+#include <linux/of_device.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -286,3 +287,25 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			clk_data->clks[mcd->id] = clk;
 	}
 }
+
+int mtk_clk_simple_probe(struct platform_device *pdev)
+{
+	const struct mtk_clk_desc *mcd;
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	mcd = of_device_get_match_data(&pdev->dev);
+	if (!mcd)
+		return -EINVAL;
+
+	clk_data = mtk_alloc_clk_data(mcd->num_clks);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, mcd->clks, mcd->num_clks, clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c580663..2f61fba 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -10,6 +10,7 @@
 #include <linux/regmap.h>
 #include <linux/bitops.h>
 #include <linux/clk-provider.h>
+#include <linux/platform_device.h>
 
 struct clk;
 struct clk_onecell_data;
@@ -250,4 +251,11 @@ void mtk_register_reset_controller(struct device_node *np,
 void mtk_register_reset_controller_set_clr(struct device_node *np,
 	unsigned int num_regs, int regofs);
 
+struct mtk_clk_desc {
+	const struct mtk_gate *clks;
+	size_t num_clks;
+};
+
+int mtk_clk_simple_probe(struct platform_device *pdev);
+
 #endif /* __DRV_CLK_MTK_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
