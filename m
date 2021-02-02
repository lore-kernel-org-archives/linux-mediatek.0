Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E2364EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E2364EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5io0lS6tyMeSx2RNsHLD+K07xewg66SL5T7YfxwjuRY=; b=sRWPGHFnQ3iYWEELJrW1pZXyr
	36R3Joekba59eGjl3vq0eH3ma2lzv47N3FKNmswWrxuAbAftOnAQYUb+uZsEZ12X+Ykgn1TyZfxN1
	v/7AwS9VhKZDcTogoXg8dRDzaOl7vKkTU5pGU0hHQcsAYlanbhkkqME9eLLqxAnTdAhQmjajWJ470
	sL3aeiMdiPdq3FM1tVB2PKR6TtAPyKZiy+5A1/eaALqEMO9Gut4Bpco/TLau0lXN9ROG8536+IWvO
	NQ7v2UTth9+nrJbzipPmsSDIHN9JGp+74+3kZ4buemMhO96Fg0g7hydfQ9yEGeMNigSbRID1pU7O3
	HfXAG1uKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qoW-0000i7-5k; Tue, 02 Feb 2021 08:13:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qo6-0000M6-4N
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 08:13:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id cl8so504831pjb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 00:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjkiW+XLW06vCU5h8uhk5dbdlk9RBhNk59h0o+CGoEM=;
 b=ZuWPNbeDw480yQyQP3umt7xA8md0itCAkGSGUvJ62NxVCVnlQitV+rvjlMECy49vOO
 SLzVlIOrfZkOfJtYS+wXSmAwKhniY1ZIIR85+nXhz0Ln5q3p9FZ03Ck9l9hyAzXDuxqG
 hDDg7L57lDi4W7c0uxtwPguCnQN7vgIopPvZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjkiW+XLW06vCU5h8uhk5dbdlk9RBhNk59h0o+CGoEM=;
 b=nHMeH69XOfH5QGU9YxnvYsTusx5oin/fHF+QP7sy+gN49CRCVwGVoHtgviUYrtaAvH
 +7+RnXfkBDNZJli7b3EIKiLSpUJqeQPmL4PcqGaHY2wa6476gUhmbCtjxZXzzk/yXWs3
 gQVkhNunrPimul81PmiMDMsPKAuVPLYRUdigL3nqfGMRSLZnj3uGMB9JhERpJ3UI8tKw
 jv1J3K8WekJJhhCfEWmmDnxKjK1cAvqUW89rMRnh4W9jzUg+slXxhgFq9EkASBQO3y24
 gFvirDeXPXco6k3erv4b+wembEUzcQD/FA8VUzhcUypFcKBtTdAWF6RXvNVtaf3o318F
 znSw==
X-Gm-Message-State: AOAM532bMcwaWedmEjPaWelzDeFyXnwu/HDh0Y6LBtO+7bewZW4dNylP
 PqnDecALtK6nwCzqjg5byukwDg==
X-Google-Smtp-Source: ABdhPJygjx/kvPGFD0rmfbQlJZ27a+UNM8xqhYv8IQ9UVMZD+uMUHoui2zAVP55fDlyjYkkAdzdlIg==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr21050949plt.67.1612253567755; 
 Tue, 02 Feb 2021 00:12:47 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:47 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 2/8] drm/mediatek: add component POSTMASK
Date: Tue,  2 Feb 2021 16:12:31 +0800
Message-Id: <20210202081237.774442-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031306_446737_C529DE6E 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add component POSTMASK.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 2 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b6c4e73031ca6..0a84ae53eb72a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -64,6 +64,12 @@
 
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
@@ -204,6 +210,32 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
+void mtk_postmask_config(struct device *dev, unsigned int w,
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
+void mtk_postmask_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
+}
+
+void mtk_postmask_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
+}
+
 static void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -413,6 +445,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
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
@@ -448,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -457,36 +498,37 @@ struct mtk_ddp_comp_match {
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
index bb914d976cf5d..cd1dec6b4cdf2 100644
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
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
