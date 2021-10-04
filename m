Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B39FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:32:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26A661373
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E26A661373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZEOdMeeLcH7RuYMkAqJ7lPOnQTOmaAoTzOKVa6C+q8=; b=ZcCOdHNd/KZfCn
	OTOwbCrZc/pBZGXWL3K1W2lsZx3SdGvKYsIn5D4UQm52Fn2cIRlmVJ+fdzwf3NU0LuH7CMkYzEmkj
	fhgZd6EIGiot40PoVWeF51hZVNgl6xnz6olt14d8ZLBz+ly02WGsVriihiHMottdoFU42pt0SB0Zv
	LEXUYy3Uuz06el0d5v8Lj67Sxh4uGsrQznVoH7Mp0rrKGisiA1KRiFpZVJbmzkrHvcL/XWmnF88vT
	hj+CwxJqksa5RtIXKHysfDvLq8y29TW2HpET5QvrT2QUw60fuWldOAvZwbUpTHKegFiIYOzzx0glj
	fLf6leVKXCT62IFlWqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXHWO-005Jf1-Vp; Mon, 04 Oct 2021 06:32:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXHVy-005JXY-SZ; Mon, 04 Oct 2021 06:31:56 +0000
X-UUID: ab40641a9d12400da2e04fe4c268f6fb-20211003
X-UUID: ab40641a9d12400da2e04fe4c268f6fb-20211003
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1166807948; Sun, 03 Oct 2021 23:31:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 Oct 2021 23:21:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 4 Oct 2021 14:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Oct 2021 14:21:44 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v6 08/16] soc: mediatek: add cmdq support of mtk-mmsys config
 API for mt8195 vdosys1
Date: Mon, 4 Oct 2021 14:21:32 +0800
Message-ID: <20211004062140.29803-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211004062140.29803-1-nancy.lin@mediatek.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_233154_944221_C6CA616E 
X-CRM114-Status: GOOD (  18.53  )
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

Add cmdq support for mtk-mmsys config API.
The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.

If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. The first command in the packet is "wait stream done",
and then following with all the HW settings. After the cmdq packet is
flush to GCE HW. The GCE waits for the "stream done event" to coming
and then starts flushing all the HW settings. This can guarantee all
the settings flush in the same vblanking.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 29 ++++++++++++++++++++------
 include/linux/soc/mediatek/mtk-mmsys.h |  6 +++++-
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f9f18ee81efb..7802c2239874 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -88,6 +88,7 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
+	struct cmdq_client_reg cmdq_base;
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
@@ -181,7 +182,7 @@ static const struct reset_control_ops mtk_mmsys_reset_ops = {
 };
 
 void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
-			  u32 id, u32 val)
+			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_config *mmsys_config = mmsys->data->config;
@@ -189,7 +190,6 @@ void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
 	u32 mask;
 	u32 offset;
 	int i;
-	u32 tmp;
 
 	if (!mmsys->data->num_configs)
 		return;
@@ -205,10 +205,20 @@ void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
 	mask = mmsys_config[i].mask;
 	reg_val = val << mmsys_config[i].shift;
 
-	tmp = readl(mmsys->regs + offset);
-
-	tmp = (tmp & ~mask) | reg_val;
-	writel(tmp, mmsys->regs + offset);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_pkt && mmsys->cmdq_base.size) {
+		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+				    mmsys->cmdq_base.offset + offset, reg_val,
+				    mask);
+	} else {
+#endif
+		u32 tmp = readl(mmsys->regs + offset);
+
+		tmp = (tmp & ~mask) | reg_val;
+		writel(tmp, mmsys->regs + offset);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	}
+#endif
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
 
@@ -244,6 +254,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 
 	mmsys->data = of_device_get_match_data(&pdev->dev);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+#endif
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index b2d2310d7e7a..3e998bfb795a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -6,6 +6,10 @@
 #ifndef __MTK_MMSYS_H
 #define __MTK_MMSYS_H
 
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
 enum mtk_ddp_comp_id;
 struct device;
 
@@ -78,6 +82,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id next);
 
 void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
-			  u32 id, u32 val);
+			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt);
 
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
