Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E437D64DDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E437D64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SUoFz5NR+cGihGQ+WmX/0/rjiQyzDFjbZvm/XcfdqyI=; b=L6lPjG53UQ5FfRnIxWkGtI+ZH
	AeVgbVVBNwB+Q2Vl4AIbHai/43wHcuzKeej4WGHof+k3R5wTwcd20wwXc+nFQesMeR9j58rAapoxA
	k70B9R61MCEvxbRBvMNtEGKGTobxTaaO4uOqLsI/7YYTNLGEtVRrYr0PAh0lYWvyMT/Yw3MO7rl3e
	KhW4f/kQMkyabP4WrCEZZ6VQXZXB5WSgByvCKpT4B/FA98qhKvx7Fvsiv0mXEMRR9t83/Ljd35Jne
	/PDZFmn6sluYbLXqNu/bzvX6B0AV3PTvD4g1tlmmRhpf4mJd4mq5O4Z69Decv+jLWQQCIMhx0D76W
	A2JpnmKmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55PT-0000sY-9Y; Thu, 28 Jan 2021 11:24:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55Oj-0000Wk-J0
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e9so3157749plh.3
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JFDIHF7A4xcJQCMZd2qVFd4aLKExesv1nCxMC8zcGnE=;
 b=oCMMsElsQjsYPCn7s2OLoPRchtAGewDclcCB5Q6GrqZA5TKeMKJPxdvzz6h5bJ889o
 dwktzpXo1aQ3vUb5IXfxY18SRSetXL1DRLDBttfCpGcP2Y+vDLMHzjjdVmmDqQSE70ed
 iHV7J2Vf+J+/L9+HQcJ6smMrv1O8bdvOxxEEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JFDIHF7A4xcJQCMZd2qVFd4aLKExesv1nCxMC8zcGnE=;
 b=bzjIHNpfUIL01dIathrU2D44HsjMxYs8JH8AvA5jx8PhdNRLoZnl6vEHlE5/iGaxUp
 Amx7H9Xx3jB7B8jqkBuNHhFzAGKTA6U+cH7HIsEwRTxLecfvwIwOR+vjzlIs+KL5vAJy
 LelD0t9HcGulaaPXyHmJzZzHhlg5ZwbyARt0yXLxUCK8LUGjQx7+aSMqyqju0g0t++fC
 87Tfw2SDLOybbbGKID6V+otQdcfW1eF0G/r1OQ/dlmDnG0i+5LIsEuoIyGveTl3MhCZJ
 t1/UD84wY6ixza99Db9H1/5wj1eMD9zw52wnc9tq6E0nzztp4wb/qIxjpfBPFMHVhLiY
 Z4YA==
X-Gm-Message-State: AOAM532P4Oz2VzbaW1S8xSLzZGKq0AVYLgEtqDsXcMs+vv/aW9c8iKvT
 uNLqfB6onXAvqFiAtUYmif83aw==
X-Google-Smtp-Source: ABdhPJxvKZHW3iC9gdjoGC9Ej9lSJzioxFB5NLyQI/sXvEHdrcLtbheh/V1Xf/BpFNPjD0XrWJfwgg==
X-Received: by 2002:a17:902:8342:b029:e1:6aa:d770 with SMTP id
 z2-20020a1709028342b02900e106aad770mr7671394pln.27.1611833015130; 
 Thu, 28 Jan 2021 03:23:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 6/8] drm/mediatek: enable dither function
Date: Thu, 28 Jan 2021 19:23:12 +0800
Message-Id: <20210128112314.1304160-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062337_814322_14A477C9 
X-CRM114-Status: GOOD (  14.41  )
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

for 5 or 6 bpc panel, we need enable dither function
to improve the display quality

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..6c8f246380a74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+	bool enable = (bpc == 5 || bpc == 6);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	if (enable) {
+		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
+				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
+				      cmdq_pkt);
+	} else {
+		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
+			      priv->regs, DISP_DITHER_CFG);
+	}
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
