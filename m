Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+EqgSQCoo+rikYKetVNnjjr7Elp8f1F5thWNuT9gtE=; b=IgZObe1x9nHS2S
	eG2eV5UgjayNbX/2bWcfMEYYNaDnZ1lp+JoL71DYpfFHn0jK9mPo0Z5HE9W0aaD/hYxX3ivemjOM4
	pljm2jAlbuHfKUkyk2m9XXz0YwxAbuj/wqiWHAxlaL8q+w0xYfOJmvPNoRhT+6osEBqLvuptWO/kh
	Eiwwu8WVKsYcWjnn0vyKpvI5kG9G5HO2tb0V5/igHjOyenOEs2OdpcuORh2lsiWQLZiHpGJBCubry
	FyibJb5Cc97Me3FdYrppANeBPb/SP/YCyFo95UUnap9c7wUC7ALlUJ6oNk6d4dEwH3cGwjs3/6VES
	ZK3Td4odFyaLvKXFfhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL50f-00F2Qh-M0; Fri, 18 Feb 2022 15:17:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4gW-00EsRQ-IS
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6613801wmj.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyf8Lgz3CGRP90NmEMFSmZ4sowvuSJF2fJjaNq/1oHo=;
 b=3+Bgb08C7VBTeMDKtyxnSNW4MTo/FoqcRvsKM9o7sBdCQrffwQDuUiUHTeQiT0zV7D
 SdsU02OPg8z0wKAdUnpsdvJ13iRHqFyB4izp0ejqW1Cdh1393CxCWGgE7YWJpQU1tFSL
 wpllP/eMvXlWGjt3TU52UJa9wfTMMFy4hZSgNC0wegAkbURh+udXbuodP36LyGD+QK4v
 cAOEYI8S33XeahoHUhCfEHNkcXL+subtTrgzrEdW5EDOewi2aKibwAe9AZcXEzL8Vuc0
 EdWur2NsIb5dKx4Mt/a6LxePfco6A7jeJJp9M/u5c6aSJ394dGN4BGOe6EHp+XFjnRRa
 G4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyf8Lgz3CGRP90NmEMFSmZ4sowvuSJF2fJjaNq/1oHo=;
 b=5skXjcuk4Sy4ZtI8XGcdYLJXlkOnLUDOKSzNQ05FTyJnTsYIENm2vNt9y0LlC3xBqn
 ojoGBsKWQx0v+SwYZLz5kw4uGuWQD+mc2xM3LXh9kQ3DzhqFDWOtEqMq+oQVaXpXR0G9
 m09/kxOjFvrdCy69z+FviSVZQJGz/nGKZm3YSrKbczjsnKp2mvAP8X76RPVRRm1lQIkU
 jvi/AUKcWAayKfTJkwCCbliMpBR+/dsKbyIYmgq0rJ2AX3RfUWnj5pOeVLmJuF75+HRF
 yR7zGykbPwBKGBguaC7PsltYrAbVowEIGRr+rktnGXtTsH357e5DTODIEV07vTtsKA9D
 eMMg==
X-Gm-Message-State: AOAM532cIZQjJhCvRpnnISCC4V8uaK6WuHJpUvUHJsZWwP3Gbs6ihcpr
 CuOFECge0NT0BUwYEa3I3U8SlA==
X-Google-Smtp-Source: ABdhPJx6rXykt2bBihoV1EGcUO8vEHbX7rmGjB/O/cyCDfQdLOoG+5xvSnvWdYVaVgsxH15CXqrdFw==
X-Received: by 2002:a05:600c:3b1d:b0:37c:2d38:945e with SMTP id
 m29-20020a05600c3b1d00b0037c2d38945emr11411054wms.60.1645196194799; 
 Fri, 18 Feb 2022 06:56:34 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:34 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v8 17/19] drm/mediatek: add hpd debounce
Date: Fri, 18 Feb 2022 15:54:35 +0100
Message-Id: <20220218145437.18563-18-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065636_740394_EB1AAFD7 
X-CRM114-Status: GOOD (  14.01  )
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

From: Jitao Shi <jitao.shi@mediatek.com>

Implement the DP HDP debounce described in DP 1.4a 3.3.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2a3d5f15b651b..fe91ab8b2fd89 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -178,6 +178,8 @@ struct mtk_dp {
 	struct device *codec_dev;
 	u8 connector_eld[MAX_ELD_BYTES];
 	struct drm_connector *conn;
+	bool need_debounce;
+	struct timer_list debounce_timer;
 };
 
 static struct regmap_config mtk_dp_regmap_config = {
@@ -1698,6 +1700,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	if (event < 0)
 		return IRQ_HANDLED;
 
+	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
+		msleep(100);
+
 	if (mtk_dp->drm_dev) {
 		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
 		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
@@ -1776,6 +1781,13 @@ static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
 	}
 	train_info->cable_state_change = true;
 
+	if (train_info->cable_state_change) {
+		if (!train_info->cable_plugged_in) {
+			mod_timer(&mtk_dp->debounce_timer, jiffies + msecs_to_jiffies(100) - 1);
+			mtk_dp->need_debounce = false;
+		}
+	}
+
 	return IRQ_WAKE_THREAD;
 }
 
@@ -2239,6 +2251,13 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.detect = mtk_dp_bdg_detect,
 };
 
+static void mtk_dp_debounce_timer(struct timer_list *t)
+{
+	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
+
+	mtk_dp->need_debounce = true;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2319,6 +2338,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	else
 		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
+	mtk_dp->need_debounce = true;
+	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -2332,6 +2354,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	platform_device_unregister(mtk_dp->phy_dev);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
