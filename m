Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C6E6F07B
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=; b=ocCzeK2voJPMyRMe+n1IVsohpc
	gx7ttSfnBHXSVx9TdIeeYw9nwtZl4az+i+CFkbfCop3Gmu1+7JECGx+N+z/Ls/ZbFp7v2vovlruMo
	jicwjG/pa6XPLQrSVAoBNZs/MqUntHrCJJ/9vhkabH7XJAecs6kuCu1UoKxKkmGJO06NR8NX29xcM
	lOt5diKqzeBkfqpBLR4VUtQR1GNBwRjt8ecoRg1IaPfZTLCHXr3hBgYt3pO3JEp+daT+kMLa51Lcq
	UNxYk9InH9C/TfNU7vQmhwfSBY+MzyWaeTuCVBys0R0eCcxm2hDWItE4EqINa1tlTsZ6SDZonk1el
	f6AtIk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6j-0000000EnhV-1UOx;
	Tue, 23 Dec 2025 09:55:09 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6g-0000000Eng1-0k0W
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 09:55:07 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ba599137cf8so1767692a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483705; x=1767088505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
        b=T1cW5R0peH6cr9+4OlL5SWanGTDEMlYSjidc1pq23/Ai+DoAMqShV4w5r7Q77ZpRVh
         ImVOwO7EnksN7G98/3V9p/p+zpT8wwIrMP4vVOaEwmPb2bkBsok6j5ue7HLTOCKnH9jx
         YxAA9YCHbNlUfqUxWTHTEp3+xpyC0xRoZzL5jFW4EM2SYXv1E8Lb+Nxim7XSYr/wpEbO
         fvqjk4El7i8WqotyeiDEi3l2qMcUWaErn1K6s4FOvt1hPcdQzAuUXpb3uf/xGQUgyaYI
         Gn5Ra8VFwKOv1cCQCUUYiRPWwvLgvnIW/3pw94dO00LvMi+Q0bZta4JJ2HKXwVx7MZzO
         3Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483705; x=1767088505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
        b=gPftmiG9bzx6FxkgD/eQGek3v1lJx75l8lJ7UUzAEYeprAL53Kfq1pT6VYrjBOocUd
         KKqBR8hdSO6n/ijWD2f3pAjmtWCta5CPR6UL+Jik8q+f6NGNtVOjaqwA+WFlyjmkW2Gr
         tcJiXcApCoesUhY9FQli5esB7Ct/bDyfhP0/KockDX9XO3M+gliat58bTsYd3UVX2SER
         oTtkdYniC65Y1FuJTv5J5maJChQ6Wyr84vUAcva0STIBWCkcUMUIN/VVMxcEMLd8mgpl
         y/7V+mZxrs6z/7n/lq98PaimWrPn1d0wCGun3akq9r+U/QqNzwzx9lW/KlfXe8iPKqlw
         6/tA==
X-Forwarded-Encrypted: i=1; AJvYcCXidHpQvFaMZ6T1yNnI0aYZKWMN+Nxf+Nudm7wyVQ8YcF4UcoDO9NJrBUM3Pcy7Eg0Wdfc5hj6TcOVS31AYTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNKKH7b5xrRf99pgX5l2dYBdauuuWRPHo67Ur5/crriiuxWwFW
	cneQylh+uoU/6CT2DTeaSY9DEDG561DZuB4inQEWPzEQ1vBnk/8WBLhi
X-Gm-Gg: AY/fxX4rus8KOcShLS9RW+0GGfgjM5Zs3A9GLkeELu59+Uib8WDrBDnmDUh1ZThE20j
	xNROCc/5LX2Vgj3rMl8rmJUtWsnMnpsYr2cRN60FHBceZk4XmHOMtXVP9i0crDt5ohEvsHdZCOs
	ipJvl4w8q6TdfZ6MITxoXGdwB9Mg/O8g9BauPbSd5B8Da/Sm5x1XImK2YgccArBfXIpeZIVXq+R
	+CwU3fNApcKvH9lxJMBqxh9E1w9Ngjp8+q9Tigh7NAs7R313HaPIrAzMva6pMAMmTAvKy42tgJu
	noLEMM10WQqkvvPEJvkGfAt7FTccbfp5pwGJ1CGXKDJaj4lzn+eVpA6+iaJnCNeaY+Yf+uS5mXd
	wVpBhkcAZi1QdMkask9NCL1hlpbFlZwRDnxQqVJyAymr3zl+dOG/jxdEKULWM01HSPR9hOBUZi6
	qTiN4uKCCeUmXJX+ilrykFCyI7T8h9
X-Google-Smtp-Source: AGHT+IEdzNfnqNUJyDypKzn3dPYc29vkogAq63TVtVQNeWPmClzH/fQB7OhCe8Q/j5leeIRr37dB1w==
X-Received: by 2002:a05:6a20:6a07:b0:371:7666:648c with SMTP id adf61e73a8af0-3769f3351f4mr13306712637.24.1766483704666;
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm124413885ad.99.2025.12.23.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	lkp@intel.com,
	abhiraj21put@gmail.com
Subject: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
Date: Tue, 23 Dec 2025 15:24:34 +0530
Message-ID: <20251223095434.492041-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015506_212649_C0269AB3 
X-CRM114-Status: GOOD (  16.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace DRM_ERROR() and DRM_DEBUG_DRIVER() calls in
drivers/gpu/drm/mediatek/mtk_crtc.c with the corresponding drm__err()
and drm_dbg_driver() helpers.

The drm_*() logging helpers take a struct drm_device * argument,
allowing the DRM core to prefix log messages with the correct device
name and instance. This is required to correctly distinguish log
messages on systems with multiple GPUs.

This change aligns the Mediatek DRM driver with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com/
Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
---
v2:
- Fix unused variable warning when CONFIG_MTK_CMDQ is disabled
- Added Reported-by and Closes tags
Link to v1:
https://lore.kernel.org/all/20251217070303.689913-1-abhiraj21put@gmail.com/
 drivers/gpu/drm/mediatek/mtk_crtc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5f..bca2e40bca54 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -227,11 +227,12 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 {
 	int ret;
 	int i;
+	struct drm_device *dev = mtk_crtc->base.dev;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		ret = mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
 		if (ret) {
-			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
+			drm_err(dev, "Failed to enable clock %d: %d\n", i, ret);
 			goto err;
 		}
 	}
@@ -343,6 +344,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned int width, height, vrefresh, bpc = MTK_MAX_BPC;
 	int ret;
 	int i;
@@ -371,19 +373,19 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 
 	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
+		drm_err(dev, "Failed to enable power domain: %d\n", ret);
 		return ret;
 	}
 
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
+		drm_err(dev, "Failed to enable mutex clock: %d\n", ret);
 		goto err_pm_runtime_put;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
+		drm_err(dev, "Failed to enable component clocks: %d\n", ret);
 		goto err_mutex_unprepare;
 	}
 
@@ -648,10 +650,11 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	struct drm_device *dev = mtk_crtc->base.dev;
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
-		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+		drm_err(dev, "mtk_crtc %d CMDQ execute command timeout!\n",
 			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
@@ -776,9 +779,10 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int ret;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 
 	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
@@ -803,9 +807,10 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int i;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
 		return;
 
@@ -845,10 +850,11 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 									  crtc);
 	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned long flags;
 
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
-		DRM_ERROR("new event while there is still a pending event\n");
+		drm_err(dev, "new event while there is still a pending event\n");
 
 	if (mtk_crtc_state->base.event) {
 		mtk_crtc_state->base.event->pipe = drm_crtc_index(crtc);
-- 
2.34.1


