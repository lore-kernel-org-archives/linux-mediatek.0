Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A660C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:06:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE2D61244
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDE2D61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=saXws86Vw6cSd3MpAClIvWdzBP1abeqrlEeHehqcYCA=; b=UYlYRi0wY+e2Ilxnb5+9ynNts
	nDUXz0bHPr24si8W7tC8vdAwzwHTkFGvNY0yxiyjemhvXTUnvs8CZE8weNXP5k9tFHCmtJj0ZLmmX
	ZWOiHQ1cXiZ3c68jYIcgkxwq1FMWngB8cbb3UzV7EtMev1tIAqccG7y7eXl4a9EyP8wvSNPOdCqmp
	9afN3D1YGkjjNco5f5wsAaC6vSQ8iprZypIVzQxzE61ejcYzgeE37WjO5pP6+FxwRbPMtPiBOLQpT
	jdSOWAWbz1aGh08QWE+ClM0Msaisyg+hKf8Ho6gRaVKIDFWDaLkqSdACB88WZzC4cFWE0kHSgiIdG
	7fB4bdamg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxCa-006uLW-NH; Mon, 12 Apr 2021 14:06:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBa-006u3O-Cv; Mon, 12 Apr 2021 14:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=d+l0sWY4Rthp9Dp+r0kqJLj5bIKsveLO7IIM/EjvAZI=; b=MQb4VndLJO/yv+IefKMUA8SSFF
 uNEdwnkmTeoukasPZaWEG6gUWhtJmO/8Sbv9U4CgZH40D2YCtuw7RHzHQr5jCgu+1fpJVIl/kqZTv
 eOL0KUYSLPEJ89PduJKpYgMcgTCRzhO+ukJDLFERMGY53+mj9ssm66IhBqtVVXFTkGGvNgg4FBmoC
 tgJ3k2DbI9ODIqTxzSjvNUwI5TOaIWrAkO1SAgBST4EYoGU3QtI+L+ZLOYCAILpIlG+01iAN23EGg
 i+9fZizpqA7Qz0uIaqMb08mz+XVYyocY3hx5KvQEInmLFY4rUlfoyj4PDphlZzgegljLGfW+IvW5s
 L2DgrIgQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBX-006HtM-9k; Mon, 12 Apr 2021 14:05:05 +0000
X-UUID: 08e6131e8e934cb0bf269b0b9c33a874-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d+l0sWY4Rthp9Dp+r0kqJLj5bIKsveLO7IIM/EjvAZI=; 
 b=bV8YK3L01EquZZ+2PXQrEr3L1z95XT4eN0CWbnCSm+qZmbQPueWz95QtQZ9OZGPHhZ8DGUXkfciF5X8XBek8mHHP7QPFRIy9bR8gpEuDcq2KT8nLQxeA4uC4io8tM3ytTb0SX21c0hOQZZ5O7CLY27jfTbAKm3SDxh+D4dQVxrc=;
X-UUID: 08e6131e8e934cb0bf269b0b9c33a874-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1197451425; Mon, 12 Apr 2021 07:05:01 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:04:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:04:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:04:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 4/4] soc: mediatek: mmsys: Add mt8192 mmsys routing table
Date: Mon, 12 Apr 2021 22:04:48 +0800
Message-ID: <1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0975033AEB3AE6EDFE570571C6A6A443A440BA02A495EC6B0C2D33CB1725D2DA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_070503_367501_B2FCE25D 
X-CRM114-Status: GOOD (  14.61  )
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

mt8192 has different routing registers than mt8183

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mt8192-mmsys.h | 68 +++++++++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  7 ++++
 2 files changed, 75 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h

diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
new file mode 100644
index 0000000..3179029
--- /dev/null
+++ b/drivers/soc/mediatek/mt8192-mmsys.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
+#define __SOC_MEDIATEK_MT8192_MMSYS_H
+
+#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
+#define MT8192_DISP_OVL1_2L_MOUT_EN		0xf08
+#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
+#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
+#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
+#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
+#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
+#define MT8192_DISP_AAL0_SEL_IN			0xf38
+#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
+#define MT8192_DISP_DSI0_SEL_IN			0xf40
+#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
+
+#define MT8192_DISP_OVL0_GO_BLEND			BIT(0)
+#define MT8192_DITHER0_MOUT_IN_DSI0			BIT(0)
+#define MT8192_OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
+#define MT8192_OVL2_2L_MOUT_EN_RDMA4			BIT(0)
+#define MT8192_DISP_OVL0_GO_BG				BIT(1)
+#define MT8192_DISP_OVL0_2L_GO_BLEND			BIT(2)
+#define MT8192_DISP_OVL0_2L_GO_BG			BIT(3)
+#define MT8192_OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define MT8192_OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
+#define MT8192_RDMA0_SOUT_COLOR0			0x1
+#define MT8192_CCORR0_SOUT_AAL0				0x1
+#define MT8192_AAL0_SEL_IN_CCORR0			0x1
+#define MT8192_DSI0_SEL_IN_DITHER0			0x1
+
+static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
+	}, {
+		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
+		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L
+	}, {
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0
+	}, {
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
+		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
+
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 79e5515..c755617 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -12,6 +12,7 @@
 
 #include "mtk-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8192-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
@@ -45,6 +46,12 @@
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.clk_driver = "clk-mt8192-mm",
+	.routes = mmsys_mt8192_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
