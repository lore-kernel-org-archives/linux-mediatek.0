Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62CEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7998A2064A
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7998A2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o5A/SKVm8sPe7ZBZ0G1FaY+f1ZSwoirXj/hZ/ZNg80A=; b=NGg0A67lEzhI6OoGWPLNcKx9J
	K0ITFnYkQ6cNMEDwQ5DUE7FfEgVuoAxPay3hrbqfAJuW39/tRhg10L7Em77v8isDWNYbb6ken+m6a
	TiuTgE53XrFIZxWCZjUaXudA1qMgG1m3Uw44ZD+fW1RRkqjndhFtX5YNnf7QvUNnYHc4svFsGfxYT
	FAC9BS7eh1hyqLFWvUSmuNurzKDWo0vO5662qByZh3K4i0R05/ymeYw3rXfFO/tpXA9Vof4zKg6jq
	oAO2fn9hUy7xMKOv8sCD7zUp/kyJB1cBEWZiOtKJj38rh30NvjJDEiVbwGltoTciunNq9ZIltR+MZ
	ybrIOrfSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4crj-00043T-9H; Wed, 27 Jan 2021 04:55:40 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4cr1-0003hy-Ak
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 04:54:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id t29so395902pfg.11
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 20:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TylT5ylvrSjXZkyDWey49Aq08z8epZnlbLmRvBO6dZo=;
 b=Tc+it0gmwJ+uU8imyifVsbbL0tQbg1r0O7axx2m5PQMU9SsOBEtnFIz7NJrws/tPdI
 sGXJung+g6yOpezvv8bsQ+dzp/YEkvO+r4tRawUuKH7LbV8ps8tSe6A+eNjRiJspo3iG
 AkLDVUg68g1bYXieR5XnjrNugfmkRY9hL3sbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TylT5ylvrSjXZkyDWey49Aq08z8epZnlbLmRvBO6dZo=;
 b=rEFn6tWqK+ZXmRVaKILaD7u/wAhevBwRGDZdU1NeRazNlJim9YviLzdOuJjYJ2s9S3
 VgjJxFLVplAnVSDFTi9Is1IwpfUzWk/bmArd2PQnH2iLdo8MY9VZxXI+eQIs+VyzFv1e
 7mFqZ043J7vecJ4XkRu+IafOpzDtodspYuSxXkW0bSWjiH+I0iiDUTtvxLHvIR1U1CYs
 DCXs/IyMDx/kzPl3Hc/ywoZ+PneBpvsMISRXzrASztHrzHpwzQBIcdZjY+w1jRJMQeNw
 8q2j8h6Y1At5zc36SNlbsELsqiT4aujXBXTdW8ozFZ2RFKa4YA4k/m2MZbbjaEwcX2c/
 HmDQ==
X-Gm-Message-State: AOAM5314vrUp8ZA1qfrJVIvoSl2ERdxflVdfbRbTtZMtA10EzHfilFbb
 2UFMrekmVSUBFlpM0vd0ywdUKg==
X-Google-Smtp-Source: ABdhPJyy01Q5a/LPZ4E7UcdQg5mKkFvVyYvr6fPjvcMa6xvNPlRFx5WzfjRFbv8mXDBUtrtl/OLw0g==
X-Received: by 2002:a62:5c43:0:b029:1bb:9418:b59b with SMTP id
 q64-20020a625c430000b02901bb9418b59bmr8642305pfb.35.1611723293345; 
 Tue, 26 Jan 2021 20:54:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 7/9] drm/mediatek: enable dither function
Date: Wed, 27 Jan 2021 12:54:20 +0800
Message-Id: <20210127045422.2418917-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_235455_429460_9714FB21 
X-CRM114-Status: GOOD (  16.28  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 37 ++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8173f709272be..ee54505412dcd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,7 +53,9 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
+#define DITHER_REG(idx)				(0x100 + (idx) * 4)
 
 #define LUT_10BIT_MASK				0x03ff
 
@@ -313,8 +315,41 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
+	bool enable = true;
+
+	const u32 dither_setting[] = {
+		0x00000000, /* 5 */
+		0x00003002, /* 6 */
+		0x00000000, /* 7 */
+		0x00000000, /* 8 */
+		0x00000000, /* 9 */
+		0x00000000, /* 10 */
+		0x00000000, /* 11 */
+		0x00000011, /* 12 */
+		0x00000000, /* 13 */
+		0x00000000, /* 14 */
+	};
+
+	if (bpc == 6) {
+		mtk_ddp_write(cmdq_pkt, 0x40400001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
+		mtk_ddp_write(cmdq_pkt, 0x40404040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
+	} else if (bpc == 5) {
+		mtk_ddp_write(cmdq_pkt, 0x50500001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
+		mtk_ddp_write(cmdq_pkt, 0x50504040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
+	} else {
+		enable = false;
+	}
+
+	if (enable) {
+		u32 idx;
+
+		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
+			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
+				      DITHER_REG(idx + 5));
+	}
+
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
