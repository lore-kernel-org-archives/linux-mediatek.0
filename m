Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A833CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otLZTlXQs3lS98jbgn2cwZ6QYH6xDeRXlcMO9hILBzA=; b=lAuy0tMeJUteUgzzEYT117fL4U
	vVjJvbKvjh1saL5Y8HZAZETuswo7zMyjdUJ5CXMpADiiUF2TQCvUgFa5Z1+hyVD+qjL7QKL8lnp8h
	Gt0RCuhYqfwlWS5UYA0UkcHhT3ia0Pi/fjMS5I0+bitZTYKCrFBGElMFXE5KmjCuVmRpGTtDRamUS
	NuDvaj4AxalrMx+C/DTXKy+PTuvxldb2DVmQE82FdwTtP+7T10XCTlMmWgT17VlYuZO3qnTSR5S5S
	1JIzgLchwyVnwuayu2aKx3aknBXHbGyc2IhihMdtz9Ltjkr3zQ9x4bU3/dTrMpoSKzFNMPp5IijWT
	hr09rgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06Ag-00B11M-Qq; Tue, 29 Nov 2022 19:21:34 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0695-00Azru-Be; Tue, 29 Nov 2022 19:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1669749593; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otLZTlXQs3lS98jbgn2cwZ6QYH6xDeRXlcMO9hILBzA=;
	b=Vcu3dIzy72Pv8eXVbs2yPpjXGsVi/HZwA8f23CDsiNB1+5Vlkva4ITx2p+y2ViTdLAM1pF
	rn5lFJkUSY9TvZKr8uTb8ojxS3DxWzWNKRPGr2jBTJ/b2jZURNMv1xCCkMGeIlFcimGpEy
	eh0vMm9lfbzOiINuvLLqezm1OwMxK0Y=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 14/26] drm: mediatek: Remove #ifdef guards for PM related functions
Date: Tue, 29 Nov 2022 19:19:30 +0000
Message-Id: <20221129191942.138244-1-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_111955_577776_79675491 
X-CRM114-Status: GOOD (  14.30  )
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

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dp.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9d085c05c49c..00861a914855 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2590,7 +2590,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_dp_suspend(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
@@ -2613,9 +2612,8 @@ static int mtk_dp_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
@@ -2650,7 +2648,7 @@ static struct platform_driver mtk_dp_driver = {
 	.driver = {
 		.name = "mediatek-drm-dp",
 		.of_match_table = mtk_dp_of_match,
-		.pm = &mtk_dp_pm_ops,
+		.pm = pm_sleep_ptr(&mtk_dp_pm_ops),
 	},
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..52f77a6af10f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1755,7 +1755,6 @@ static int mtk_drm_hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
@@ -1778,9 +1777,9 @@ static int mtk_hdmi_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
+				mtk_hdmi_suspend, mtk_hdmi_resume);
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
@@ -1810,7 +1809,7 @@ static struct platform_driver mtk_hdmi_driver = {
 	.driver = {
 		.name = "mediatek-drm-hdmi",
 		.of_match_table = mtk_drm_hdmi_of_ids,
-		.pm = &mtk_hdmi_pm_ops,
+		.pm = pm_sleep_ptr(&mtk_hdmi_pm_ops),
 	},
 };
 
-- 
2.35.1


