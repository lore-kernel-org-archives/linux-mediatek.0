Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A0EC43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:23:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0379D61355
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0379D61355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9kqdxgp83EK6yiYrD2ohzUEOOVq2oK8GU+LdBAZEmg=; b=USmRZ4yHHEgbsFYH+slZu+Kbd
	sBByOsTS2dyepomU6XJ4fZI+GjS83o6ZHGrCJKWwV+UXXVT4KHC4vul7FMtnMQW14hVx5tM+XK9Hq
	09lOsVLYSENL2RSWW4Qmx5BaW0m91Th3uYPu5T//1iteNLB0eBfSx2ryznazIz6r9Zc6FQjkwOMC1
	khHWc3jNm06s1FtnXAYZSqe/4iOD/5mooWQGjJyTW+twRyVtXL5qerDZ0kQWeN/zF7+BOdLoC5vmB
	YsQggIW+vvPJZGNDy9UWnEdcqfrwTNAwYMuunBKIEE+dAW4xaXFoHW3kbSr2polMYFOELeUj/BwRi
	XiIwYC3UQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxT5-006xIB-QH; Mon, 12 Apr 2021 14:23:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRz-006x3x-8O; Mon, 12 Apr 2021 14:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=JbUcHI/6Fy5+0rbP1amYkFANR+AjllNPkjCKZAHi1Y8=; b=FVtTgsDLRF1LFUPnWW+VGYpSWn
 yNPuAk3rCM1/wRz1X7uh8t9ds8/cwnE7G1T0v9ZFLMaTm1AWoBwASZgpSpnkGEZ+ypfYqE/3jTKEg
 Of0LG3K4ZiXjqx/rhjE6t6wT8Nc/xj+kTEbTCeImWWcsuEiUZ9LHLroC2VLbzyHMXLQ/7DqICsnbQ
 tjzTVXdOsNksewgjy1psdXlLH8QZdQRC4LkSXviM0v+T0xH53OfP7AYJbCm20Q4xYQnZ6oleMiZWl
 zTzrTD/B5bz64IK2ochE4FSh7Tl18mi9IC4TedHUcUDeamKVsv8ADfSNyRspR3RX2dMOsPbhX/gPZ
 +FidJCxg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRv-006IjA-Du; Mon, 12 Apr 2021 14:22:02 +0000
X-UUID: 6059f6c211724e41b556457b3f691288-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JbUcHI/6Fy5+0rbP1amYkFANR+AjllNPkjCKZAHi1Y8=; 
 b=R4k/n8VPs66Hhe4B1jK2EOwrHfmjtRnC4AUQ0+vc33k0O8PBgsBSoQlfkB8OacG/4sMk4S+f/n8NbCIbWHScdZ+nHH6WYcbAI9b8lwtXh++y88BX0Ow2ZpzkSrV95RTUfMY4IzaqPlV+Ymutq2Tu+YU0VU7V5b7ErMGFjgOL/t4=;
X-UUID: 6059f6c211724e41b556457b3f691288-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1053656982; Mon, 12 Apr 2021 07:21:53 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:21:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:21:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:21:49 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v7, 2/5] drm/mediatek: add component POSTMASK
Date: Mon, 12 Apr 2021 22:21:43 +0800
Message-ID: <1618237306-17670-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618237306-17670-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618237306-17670-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95B6564B1D498D14BF70413A83692607467B9977254DD8B68BB6B7652F9725D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_072159_507838_45B0E1A6 
X-CRM114-Status: GOOD (  14.02  )
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

This patch add component POSTMASK.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 2 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b564513..17309ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -50,6 +50,12 @@
 
 #define AAL_EN					BIT(0)
 
+#define DISP_POSTMASK_EN			0x0000
+#define POSTMASK_EN				BIT(0)
+#define DISP_POSTMASK_CFG			0x0020
+#define POSTMASK_RELAY_MODE			BIT(0)
+#define DISP_POSTMASK_SIZE			0x0030
+
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -190,6 +196,32 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
+static void mtk_postmask_config(struct device *dev, unsigned int w,
+			unsigned int h, unsigned int vrefresh,
+			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
+		      priv->regs, DISP_POSTMASK_CFG);
+}
+
+static void mtk_postmask_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
+}
+
+static void mtk_postmask_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
+}
+
 static void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -321,6 +353,14 @@ static void mtk_dither_stop(struct device *dev)
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_postmask = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_postmask_config,
+	.start = mtk_postmask_start,
+	.stop = mtk_postmask_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.clk_enable = mtk_rdma_clk_enable,
 	.clk_disable = mtk_rdma_clk_disable,
@@ -356,6 +396,7 @@ static void mtk_dither_stop(struct device *dev)
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -365,36 +406,37 @@ struct mtk_ddp_comp_match {
 };
 
 static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
-	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
-	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
-	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
-	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
-	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
-	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
-	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
-	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
-	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
-	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
-	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
-	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
-	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
-	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
-	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
-	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
-	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
-	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
-	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
-	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
-	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
-	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
-	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
+	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
+	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
+	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
+	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
+	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
+	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
+	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
+	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
+	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
+	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
+	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
+	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
+	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
+	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
+	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
+	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
+	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
+	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
+	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
+	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
 };
 
 static bool mtk_drm_find_comp_in_ddp(struct device *dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index bb914d9..cd1dec6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DSI,
 	MTK_DPI,
+	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
