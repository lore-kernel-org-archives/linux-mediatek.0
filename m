Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A5FC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F5164E16
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F5164E16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk7EogIV5DKiXWu987QEdoFJUl/vEkFTdl2ZpgJNV0M=; b=DWnzAqjaAovIUI88GOZJxETzK
	U1QHrUjVk2ayt0xxu+MUUiLu+jEwEHoK9M+qmhoMktymkdcR83VCNKlKRteM4ge+sU3xxy9L5aE8P
	mVGQbXNsZCuhogxK9ImwXnj6dMSiagrUQNSkg1LZeqhRDqYaOG8w5uHpbbZxb6xvudvbqZRuTKBOo
	BnQKgVBRqz2EBz8pzt1IM7F6gPweJLHOiRXWoyZOAlkNx4XzNLLvXlihsg8HxCtDgQAljjTWhkT9Z
	d7aw5YIoIvdRhTM/L6SVzrNX7wNYGR/rXNNwvTT+rZtxuJqG+kTzgYitYIs7gOOez2ci+jx/rl7vA
	FC6filAyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PzY-0005SH-Mk; Fri, 29 Jan 2021 09:23:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pyy-0005Dq-UU
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id o7so6269514pgl.1
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0h4quZuC4F5HNVsDUMAeYMP8ho/esw91C3FAHMxcO6E=;
 b=oDMr+pKoZXvG8wT6sKC2gP3UZKc9rx0kwdby4gAcz3Nw/eQXxJ9oqmHfIKKD2tVA4I
 SYXVg+bZNt85r3aksERutHE61QekHmmAIGohFhRALJsr0nGGToU23m/DUSQbNHtSKrR7
 pklRV254MIidy05XK6kXvFCLyBP7zGuabq+vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0h4quZuC4F5HNVsDUMAeYMP8ho/esw91C3FAHMxcO6E=;
 b=UzXpyZj7nF3sotxVfCP11niyE1uFjIF9ZEX8O7XNIU4VFiTt4gsr3sZXXanJO0jD/s
 +w5CUUQFxvh96SuvQH8l6g363oMlsx0V/nUtbPJWscrgKQTGrzB2+4IZu6XNHQFZR66a
 DORkVIvs/IFbGmTmoIZ4t7ZNdw4BMwacoO5z0XlNAht7DB0CjAp/Og9GfcIX8hIruGn7
 YdYA34P7un1R81jLrLHzFvjL8BjcdnNTXSW2pSuJ0MSrfUjq3SAXykex8YEcRqsk8qO5
 Es2Phl4U0+LoIh4rwLDdgc34aweURws4e97RRLjl1JRISHAsL8K2zDT+mB4/6LFUx4va
 A5dA==
X-Gm-Message-State: AOAM531cpjtYadxW8MfVwjsLtlA1Lph1XC5jAonDorI2sVp0N1T+O1+y
 heciKUCwjR8PMWq9fucx/KZ1eA==
X-Google-Smtp-Source: ABdhPJzp1zw42owccMj0gnnUmJD+BS39weotSS3Zoi5ZnQBTbfBhymhefJhkEN6E8wXF+ErkrzQzUA==
X-Received: by 2002:a62:2b54:0:b029:1c3:197d:1f9b with SMTP id
 r81-20020a622b540000b02901c3197d1f9bmr3689657pfr.72.1611912142565; 
 Fri, 29 Jan 2021 01:22:22 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 3/8] drm/mediatek: add mtk_dither_set_common() function
Date: Fri, 29 Jan 2021 17:22:04 +0800
Message-Id: <20210129092209.2584718-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042225_243630_6C8C5C6A 
X-CRM114-Status: GOOD (  13.21  )
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

Current implementation of mtk_dither_set() cast dev data to
struct mtk_ddp_comp_dev. But other devices with different dev data
would also call this function.

Separate necessary parameters out so other device components (dither,
gamma) can call this function.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 ++++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 46d199b7b4a29..9e5537f76b22a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_color_start(struct device *dev);
 
+void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
+			   unsigned int bpc, unsigned int cfg,
+			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
+
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 7b5293429426d..07804ab16f44d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -151,33 +151,42 @@ static void mtk_ddp_clk_disable(struct device *dev)
 	clk_disable_unprepare(priv->clk);
 }
 
-static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
+void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
+			   unsigned int bpc, unsigned int cfg,
+			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt)
+{
 	/* If bpc equal to 0, the dithering function didn't be enabled */
 	if (bpc == 0)
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
+			      cmdq_reg, regs, DISP_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
-		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
+			      cmdq_reg, regs, DISP_DITHER_16);
+		mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
 	}
 }
 
+static void mtk_dither_set(struct device *dev, unsigned int bpc,
+		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
+			      DISP_DITHERING, cmdq_pkt);
+}
+
 static void mtk_od_config(struct device *dev, unsigned int w,
 			  unsigned int h, unsigned int vrefresh,
 			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
