Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGe8TKRR6kABenqsenHWSfPl09TqdpeFZWUTERz71vQ=; b=2TLiXHwS9+HaX7
	xcJ9MPTIepAMWindC3WnzAYp9fSGPJSSH+s8ViczoMyjd4shwEwEVSsQJE9RoTGjAHFQl526WDG6c
	+zYdAwBi+0DIMm+ELEdDYQTgYMRMdGWXJ+rQJir0WmyoVOYdHJcCPrFWnLQiWQw5vFgZmw/TKpNkq
	g1Pp1hkf7sNi52zFvHIcRdmwgiAEbq9zlLtlg9wHo2YRm7mGvAMLsVFNSqX453ZpRlTZpcznLVpXN
	N2dYS/r/JUP41j9tmtZHBI7MeGqH7a7lbzy/ZUzLV3iLy0XWZ0uSxO5zp8yUH6IQXjNtxDc0CxbI0
	vlwoFeWsN7fN2kLrLzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fxD-00AwZZ-58; Tue, 04 Jan 2022 09:18:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fwa-00AwJR-Su; Tue, 04 Jan 2022 09:17:26 +0000
X-UUID: 94535abf1a5045099963334c6ac47882-20220104
X-UUID: 94535abf1a5045099963334c6ac47882-20220104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 842642437; Tue, 04 Jan 2022 02:17:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 01:17:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 4 Jan 2022 17:17:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Jan 2022 17:17:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <moudy.ho@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v11 1/4] soc: mediatek: mmsys: add CMDQ write register function
Date: Tue, 4 Jan 2022 17:17:09 +0800
Message-ID: <20220104091712.25670-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220104091712.25670-1-moudy.ho@mediatek.com>
References: <20220104091712.25670-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_011725_000535_08326FDC 
X-CRM114-Status: GOOD (  20.02  )
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

Adding the interface of writing MMSYS register via CMDQ,
users do not need to parse related dts information.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/soc/mediatek/Kconfig           |  1 +
 drivers/soc/mediatek/mtk-mmsys.c       | 30 ++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h       |  1 +
 include/linux/soc/mediatek/mtk-mmsys.h | 50 ++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index fdd8bc08569e..172bc7828aca 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -69,6 +69,7 @@ config MTK_MMSYS
 	bool "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
 	depends on HAS_IOMEM
+	select MTK_CMDQ
 	help
 	  Say yes here to add support for the MediaTek Multimedia
 	  Subsystem (MMSYS).
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1e448f1ffefb..d2994f717cc1 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -8,9 +8,11 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
@@ -54,6 +56,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
+	.has_gce_client_reg = true,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -73,6 +76,8 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
+	struct cmdq_client_reg cmdq_base;
+	phys_addr_t addr;
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
@@ -112,6 +117,17 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_write_reg_by_cmdq(struct device *dev,
+				 struct mmsys_cmdq_cmd *cmd,
+				 u32 offset, u32 value, u32 mask)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	cmdq_pkt_write_mask(cmd->pkt, mmsys->cmdq_base.subsys,
+			    mmsys->addr + offset, value, mask);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_write_reg_by_cmdq);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
@@ -170,6 +186,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	struct mtk_mmsys *mmsys;
+	struct resource res;
 	int ret;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
@@ -195,6 +212,19 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (of_address_to_resource(dev->of_node, 0, &res) < 0)
+		mmsys->addr = 0L;
+	else
+		mmsys->addr = res.start;
+
+	if (mmsys->data->has_gce_client_reg) {
+		ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+		if (ret) {
+			dev_err(dev, "No mediatek,gce-client-reg!\n");
+			return ret;
+		}
+	}
+
 	mmsys->data = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, mmsys);
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 8b0ed05117ea..9fce400507d2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
+	bool has_gce_client_reg;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4bba275e235a..7f8ecc98d023 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -7,8 +7,14 @@
 #define __MTK_MMSYS_H
 
 enum mtk_ddp_comp_id;
+enum mtk_mdp_comp_id;
 struct device;
 
+struct mmsys_cmdq_cmd {
+	struct cmdq_pkt *pkt;
+	s32 *event;
+};
+
 enum mtk_ddp_comp_id {
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_AAL1,
@@ -45,6 +51,46 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+enum mtk_mdp_comp_id {
+	MDP_COMP_NONE = -1,	/* Invalid engine */
+
+	/* ISP */
+	MDP_COMP_WPEI = 0,
+	MDP_COMP_WPEO,		/* 1 */
+	MDP_COMP_WPEI2,		/* 2 */
+	MDP_COMP_WPEO2,		/* 3 */
+	MDP_COMP_ISP_IMGI,	/* 4 */
+	MDP_COMP_ISP_IMGO,	/* 5 */
+	MDP_COMP_ISP_IMG2O,	/* 6 */
+
+	/* IPU */
+	MDP_COMP_IPUI,		/* 7 */
+	MDP_COMP_IPUO,		/* 8 */
+
+	/* MDP */
+	MDP_COMP_CAMIN,		/* 9 */
+	MDP_COMP_CAMIN2,	/* 10 */
+	MDP_COMP_RDMA0,		/* 11 */
+	MDP_COMP_AAL0,		/* 12 */
+	MDP_COMP_CCORR0,	/* 13 */
+	MDP_COMP_RSZ0,		/* 14 */
+	MDP_COMP_RSZ1,		/* 15 */
+	MDP_COMP_TDSHP0,	/* 16 */
+	MDP_COMP_COLOR0,	/* 17 */
+	MDP_COMP_PATH0_SOUT,	/* 18 */
+	MDP_COMP_PATH1_SOUT,	/* 19 */
+	MDP_COMP_WROT0,		/* 20 */
+	MDP_COMP_WDMA,		/* 21 */
+
+	/* Dummy Engine */
+	MDP_COMP_RDMA1,		/* 22 */
+	MDP_COMP_RSZ2,		/* 23 */
+	MDP_COMP_TDSHP1,	/* 24 */
+	MDP_COMP_WROT1,		/* 25 */
+
+	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
@@ -53,4 +99,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
+void mtk_mmsys_write_reg_by_cmdq(struct device *dev,
+				 struct mmsys_cmdq_cmd *cmd,
+				 u32 alias_id, u32 value, u32 mask);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
