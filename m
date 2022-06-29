Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E4C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 19:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4iLjVUVD01Ec5lhezzfL4b6+r3st8AOk4JH6YYFpua4=; b=nTDo3+qfSO+hfgVdDAR3UAxZ0F
	XY3kqv9eCO1Avj1D6dVxCbmK2b/AwlxbZJIv79YVmy00MAdYDof/6j2outpmCRLVspd2WpH8aWI7b
	hfYsfljNAjlMTQ/Kbnxf5y4oJUzUvd4A/JNBKQlHza8YcjWpfXjzQ3mVlsG5TNlrpddBE3MLvRoNK
	fHXWiCooO9dvT2X9d1WcIy4XsJG06IOynaiRpfnt35BhiWjNk7VylnJw3Gz6ziVFAm6DDHhNJDsjb
	LOZ2VdXQt7M4jReuDJWAcxCsoz5quS58PItdp/TlbNl1u8Q6vC7138/CGSfuLkL3EhqOK3PwhpJXY
	RpnIncjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d0z-00Dglw-Mf; Wed, 29 Jun 2022 19:06:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d0w-00Dgjw-Kv
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 19:06:15 +0000
Received: by mail-pg1-x536.google.com with SMTP id z14so16234632pgh.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4iLjVUVD01Ec5lhezzfL4b6+r3st8AOk4JH6YYFpua4=;
        b=LjxdwGocB300LRlrR3clI8v8Q6E/VOBSmVpRm49ABnVrx64ZPtRJw6AYgvjQrC+zFP
         fnXrQCrsYOVOEJ/GV5LF/hPis5i67QMn6Qq6P7Qkc8gaMByE2H0BaG8PUJq2fAsw5Cqh
         io1ISaJDdagUxdEYmHYGp26m3cHHacY3Aa2M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4iLjVUVD01Ec5lhezzfL4b6+r3st8AOk4JH6YYFpua4=;
        b=ghTOAt4Aqi/ZpQQRJAIGPVds7O7BfuFQYHS/fIKfetbz00zkHjAjVHQshKJqncXRvL
         q60kSqdH7Re1ka74NZnywVShWXnBWYV8oAIJid2R1lKDuOBPcEGjAn0IV9nM9Ii/vMnr
         W2acqTgl2HZUMt84K3mKwxnapVBn6hT1hKV4gxzQsJMB9abb+aLtqqubqvWsUK23sidS
         u1/8CnrhXX7CIUSW1ovy9axlEZRxAiqi6LHU+ltd+n+k9KiE8xZO7GM9jajrDiheiFCr
         ZhmbWGWIKrzMa6K7jXlMmDdavIs2OZt87xQ8KGppesi3jibTC7EEi8iy3dzkhfSt0cEy
         s/yA==
X-Gm-Message-State: AJIora/wWIkFWEciKmzCAbUMN5iwFIo+hd1SZlDJrBiYcUWWO4kppqNV
	eYA0QQ5RKGz0AIZ4PnJ+TXK+STq+RmeIeg==
X-Google-Smtp-Source: AGRyM1tdAZEaXsMXy4WDHw5pEvorBzaveQ/9uCKpadAq4lprCZEMl9Q/ZZY7m+ks6j6sgcZ+ER9EZw==
X-Received: by 2002:a62:82cb:0:b0:525:79d9:ddc4 with SMTP id w194-20020a6282cb000000b0052579d9ddc4mr10478560pfd.48.1656529570846;
        Wed, 29 Jun 2022 12:06:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:9841:721:7d8b:4502])
        by smtp.gmail.com with ESMTPSA id y11-20020a63de4b000000b0040c644e82efsm11572917pgi.43.2022.06.29.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: ensure bridge disable happends before suspend
Date: Thu, 30 Jun 2022 03:05:46 +0800
Message-Id: <20220629190545.478113-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_120614_714432_C3D0F3E8 
X-CRM114-Status: GOOD (  13.78  )
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

Make sure bridge_disable will be called before suspend by calling
drm_mode_config_helper_suspend() in .prepare callback.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
The issue is found if suspend is called via VT2 in several MTK SoC (eg.
MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
bridge disable is called through mtk-drm's suspend, and it needs to be
called before bridge pm runtime suspend.
So we move the hook to .prepare() and .complete().
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 13a1bbe7ead7f..a42812e490007 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -828,8 +828,7 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_drm_sys_suspend(struct device *dev)
+static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
@@ -840,20 +839,21 @@ static int mtk_drm_sys_suspend(struct device *dev)
 	return ret;
 }
 
-static int mtk_drm_sys_resume(struct device *dev)
+static void mtk_drm_sys_complete(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
 	int ret;
 
 	ret = drm_mode_config_helper_resume(drm);
-
-	return ret;
+	if (ret)
+		dev_err(dev, "Failed to resume\n");
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
-			 mtk_drm_sys_resume);
+static const struct dev_pm_ops mtk_drm_pm_ops = {
+	.prepare = mtk_drm_sys_prepare,
+	.complete = mtk_drm_sys_complete,
+};
 
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
-- 
2.37.0.rc0.161.g10f37bed90-goog


