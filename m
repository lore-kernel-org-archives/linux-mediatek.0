Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE17CA0FF9
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 23:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vomcb5R4YlkPi6yAEBTRSlkjqsgpX/8uar7hs/ep3QM=; b=oOooqsqZd3PnJu07IApOc8mym4
	fYyaOJzH5wc5i44ip5tzsgJ06bcvyxPjRdG7+FlHt7am7ohOAwWIuYHHCOxylZXxLQjcB6CHl4ANj
	hbsh2yTbTw0L0zbWbHkGeEQzTI1iRfAL32TeJz06jwy7AsLqD5xYE3RnI5WOg3DQubUpTpmPkmfeA
	a2N7hsKBqVkDWSVOVpGvpJPtdrVSmRUNVyxtPieuKYB9xSpI1TfVuNLYB2TCawcPYnBSKNhW5Dsnb
	Rdgs/AVdHSCcL+hn0MACCSDd9eFbD4SJgOvXxBbn5jTQiNJp6WsvUHZYxHyyf7Y90iEmQGSVw4Yrg
	HSMxwVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcDmk-000Vrk-09;
	Fri, 01 Sep 2023 23:42:42 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcDmh-000Vpo-2Q
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Sep 2023 23:42:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a88ef953adso1721026b6e.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Sep 2023 16:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693611758; x=1694216558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vomcb5R4YlkPi6yAEBTRSlkjqsgpX/8uar7hs/ep3QM=;
        b=JEEUbTxsfyb4ZZFNIRvigrE91xqcyKcWmlbIfBUGywkkSN5SVq/nw7NnnKI69gZNe4
         jGDFP4/GRgVgGSDimEvSoOlCI2i0xehZjHRsYjtIDtaGIWUVdQDyKdQ+fGkRb4HkumpU
         4AHRrcRMAUlU13WOosYwPX4KeAiOFA7dA5rz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611758; x=1694216558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vomcb5R4YlkPi6yAEBTRSlkjqsgpX/8uar7hs/ep3QM=;
        b=hQBH0L877MzbK61mbOeUf4aeaKBNf8Lrag7ekLJjjnS3cdzr9aYSLCyaBFF8Tw6Kxo
         4N8knmNDZfEWPP4lrAey5vHh81sdYc9WGcqLyh+0/T7CqELaj11XBlgMP/4Sj5nTzzeH
         LT5xKaeYYJoxG3KCaFIMj9UB+R466bOqmFFGc6Qm1YZKmZIkJqPkNYkvIY2KwFLkyLIm
         ySTE40WraVEIrUejbKVZavXuOcPyLhkJzH6YxHjKnMQAO04mE4OeRvfp1M8uy91AvsX1
         9KYVLA9svFJ/tvfOk3fu+Jv8x5KBEyZkumsDPHwU3NZhlA+6YgRwVOD0Zcj6+97krSFV
         gn5A==
X-Gm-Message-State: AOJu0YwCAXvYQIhhdFdRopGvzr8/o00keoRLIZzmAbRy7r2iYBqaKqdL
	auiEoDFZWM+HNPpgEswtcYDEZg==
X-Google-Smtp-Source: AGHT+IH161FDJO4p2lz9ilVRETKBQ5UyI7NChHl4VMZC9iScfWTxID2/lUEJl6hXY/byI5CWz2ElFA==
X-Received: by 2002:a05:6808:28e:b0:3a7:a299:1201 with SMTP id z14-20020a056808028e00b003a7a2991201mr4034449oic.23.1693611755813;
        Fri, 01 Sep 2023 16:42:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
        by smtp.gmail.com with ESMTPSA id o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:42:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	airlied@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de
Subject: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
Date: Fri,  1 Sep 2023 16:41:16 -0700
Message-ID: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_164239_786425_413D8C87 
X-CRM114-Status: GOOD (  19.04  )
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

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

This driver users the component model and shutdown happens in the base
driver. The "drvdata" for this driver will always be valid if
shutdown() is called and we know that if the "drm" pointer in our
private data is non-NULL then we need to call
drm_atomic_helper_shutdown(). Technically with a previous patch,
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop"), we don't actually need to check to see if our "drm" pointer is
NULL before calling drm_atomic_helper_shutdown(). We'll leave the "if"
test in, though, so that this patch can land without any
dependencies. It could potentially be removed later.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 961715dd5b11..8b1c9c992ca8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -921,6 +921,14 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	if (private->drm)
+		drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove	= mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog


