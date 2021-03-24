Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF544C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:51:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A44061993
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A44061993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=57e4TSF8oETx0i/UeQBgaXoVm6QZwU0LItBRS7v63qw=; b=Qt+Fp761Kw9r6iSGh0bdvQgMz
	gzfxHMz916Yo6uuwu47iLJ3McOI2IsBZho/WOj+Tbe0CJwkinsG4Jmts4IuCnPKVkrtf3TD7vSJAw
	HIbE6wYAxFKssJUcvQqduGQD48F334rIvhUy3wH1oPewB2qLu+fbueE0XCs2ygDZjzlWpcLGY0Tbv
	8ZWRojYCNV60Kt+Bltn+kOF8U1qvkumkXPaoneerorjTDyBtyrZpuuCF6KJ7eBxCJ0HFucPQt+nZU
	wU0AKuMYMBD1KBPtExshoFPs1/SX4X3Sb3zbdZ51be1fxLi0RRDJoURtDx3rG9uzO8vQ41lcPUu0B
	/D2voWc3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP16H-00GuKL-6R; Wed, 24 Mar 2021 10:50:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP15V-00Gu1J-6I; Wed, 24 Mar 2021 10:50:11 +0000
X-UUID: bbaf27df082f4737b00450860f66a303-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cSeuf1RW0pGya77lGCR5R7iAnfaqPMyugQVG8l7CC6w=; 
 b=ZHiKoIUB0DwtiMwi+II3QR9jbSz6utnZCKBLsGPESLH2C+LmF95uXtbsX5p3fxL89ag6WKtv2RoNlkf/7Sh2hdVaCgSoHJJxuWV2mJn7WYNenDFU77oKZmha0b7QtgQvumZ/TjzZ3q3V57Yz7u2tBLR1PHzyWHk7RrrX17RVSSY=;
X-UUID: bbaf27df082f4737b00450860f66a303-20210324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214732103; Wed, 24 Mar 2021 02:49:52 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 03:41:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 18:41:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Mar 2021 18:41:25 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [RESEND PATCH v7 09/22] clk: mediatek: Add mtk_clk_simple_probe() to
 simplify clock providers
Date: Wed, 24 Mar 2021 18:40:57 +0800
Message-ID: <20210324104110.13383-10-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
References: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_105010_025780_F7A95991 
X-CRM114-Status: GOOD (  13.73  )
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

Most of subsystem clock providers only need to register clock gates
in their probe() function.
To reduce the duplicated code by add a generic function.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 23 +++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cec1c8a27211..67693b7d66b5 100644
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
index 31c7cb304508..7de41c3b3206 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
