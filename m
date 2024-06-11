Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078FDC27C75
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 17:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ek9nYHCEplYURM/7b1b2h5qMkLqR/eL+WowxP0vSWY4=; b=Cnsr7L0pzHwzV/
	/dw9DAnr3WKXYCcRd9eR4r/DCtpbZlDQTZGOYmG7Om4gfa07GomvWAGGNVfmlKjBE6Un/h9cIHNkN
	yeLkRBaa6sNCwX5CWQTjbTIeAzzsP2pNEZW/iX9Gxe40wbO+h/xUH4WgHPHT5pYJBfP/AHp5+TsTT
	GK2EoXAAHUkNzXXUDWyLzDVUno12fZalKAquT2+4wElsuOXAdx81BvfZeq8cEhNSsyW2ME4ClZUPt
	nv84iAYD0dBXT2FTHJGMYIPru23wgr+HmZdoUw8jvFKrdaXjqivqS8KZN9PLv+irX7TnMQSzfKXq5
	AIFcKR60A5gCO/KrHeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5IN-00000009fos-2Mgg;
	Tue, 11 Jun 2024 17:28:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5IJ-00000009fnv-41JI
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 17:28:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6ce533b643dso4510552a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718126905; x=1718731705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek9nYHCEplYURM/7b1b2h5qMkLqR/eL+WowxP0vSWY4=;
        b=dkEGnqlQxu0kirRsuVa8SRVsoZe2gp8yUAlbUTSpDQ5+ibb1tPdrZpmrFIP7o2hUE2
         MUZ5K6GtAmPnIpSxS8ooZr1lxpS3lDlLRWToQwitmDnZBxHccKqcYwUM9y8mOW/5/byI
         9O7pRSfpDlDb9fRb3sCAszIauooPlhVVzvqTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718126905; x=1718731705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ek9nYHCEplYURM/7b1b2h5qMkLqR/eL+WowxP0vSWY4=;
        b=V//UTEFfk9vn2PbTL9ZlFjcYeqoBgEoKAX8fSt4aqq+UnlL8v1tOlv1YT9D4s+fvQ9
         U2va1ETUdZxTukf5R8/oBR7aOcjrRgTSKgSIJu/axUATJdRuzMR59jc3I5ZHtPk/w16/
         z/oKd+KAV7qlSGXqm/sca+2nR0dLWelve/HCn6AMpwow/3GQwK42cL/ehIMbPPIUKgNg
         EEESKzuxWfN3x9BTEPv1Tfbi5yKkzPc/KBgthbLJtyMe949vJSeME9+gqiFbktd1j8SN
         guqxpCgD19rNZMgVQs7kkxGSJx05x3phE1ROOtWsos1j4QACq7KbMPL4I7FJsyTXFOkA
         QW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCfDJGwYeetvlN7Dhj01/S4Ae9I0EK9/VP8+31etG89x3qsyEpmXzFH+wTJHZG/2RI418DkFBe5Z4QBAOE0Z0a8uCI+sEtt80NoXgb5DfvXEYM
X-Gm-Message-State: AOJu0YxSlczGdIMbwtY2+IL7PnJX3C8FrMu3521p1+8InV3qguitnKIG
	cCkFRXI+0IDl/mk3ue2CR5aptc9aYxSV221/UxubrH/nLEmjKXIjel2A6dzVmA==
X-Google-Smtp-Source: AGHT+IFJ4n9j/I8+bwf5nby7cNuNSwpvL75gc72i3EraZAd14f2XpX1hujkn20i8r/RxoP3yzvg2rg==
X-Received: by 2002:a17:903:244d:b0:1f7:eb9:947e with SMTP id d9443c01a7336-1f70eb99809mr68387405ad.63.1718126904826;
        Tue, 11 Jun 2024 10:28:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f410:2f13:37e2:37d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e7858544sm75714375ad.75.2024.06.11.10.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:28:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
Date: Tue, 11 Jun 2024 10:27:44 -0700
Message-ID: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_102828_038120_4DD54407 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
shutdown() is called and as of commit 2a073968289d
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop") we don't need to confirm that "drm" is non-NULL.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1 of this patch was part of a series [1]. It got tested and reviewed
but never landed. Reposting separately in the hopes that Mediatek DRM
folks will land it. If, instead, Mediatek DRM folks want to Ack it I'm
happy to land through drm-misc.

I noticed that this was missing when I failed to add "mediatek" to my
patch series IDing which DRM modeset drivers did this properly [2].
Assuming my patch lands, that means that Mediatek devices will start
getting more warnings printed.

[1] https://lore.kernel.org/r/20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid
[2] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid

Changes in v2:
- Removed NULL check since it's not needed since 6.7
- Rebased on ToT.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b5f605751b0a..de811e2265da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -952,6 +952,13 @@ static void mtk_drm_remove(struct platform_device *pdev)
 		of_node_put(private->comp_node[i]);
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -983,6 +990,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove_new = mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.45.2.505.gda0bf45e8d-goog


