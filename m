Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1D4C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C1dMcFnsO3/YNvguv8K4wmN+bBUS1cmjeX1f+ePDQnY=; b=UnXNQHc16ZI+LxP8m/tbmF91K/
	kAB6CpyYtFs/vxd2A18eiavsBQhGu6AxU3Muidx+QNLd6s3iRT4zubiMh4rm0tt1gagO+0cDV829t
	4KmPifFvjbNCWw2m5/utoJG4vk3L18DN5IUpfwZgLFLwTeLqjYObE2YvzaFdpOLzPmxaHu7MX3ici
	wISrA8oDzRHF1mDo2+B+UmKxcwSJdN5LuDk1Q/syFyK1qfgv820596ArHfMQeeht8CV0R+v1n0+WX
	HhoLuiQ0Awc1y73zZLqcA/mpU84oNCHH4VJ4kSUuZjOjh3NZJIoQ1V7ThvOIIlBDipld5es3RhPm+
	JT6r5zUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCfe-008LTy-Bs; Thu, 10 Nov 2022 18:53:02 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCcI-008Ims-4r
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 18:49:35 +0000
Received: by mail-qv1-xf33.google.com with SMTP id x15so2057751qvp.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 10:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1dMcFnsO3/YNvguv8K4wmN+bBUS1cmjeX1f+ePDQnY=;
        b=YTL+q7WSt6nqvA0+Gp+LLeUaPOJy6UUN0Ck3Dai7VW6Jmk8S1pQKvUsDdLV/6d+2GG
         SZGybQPB8/BGZU3nZnQ8tPXcMW0sNuIbT0qZwZO2PN9uB8SUl1pSEnqi4cW+LE6XE6HE
         V/ylQrAj91MhnoAdFiHRFqwPErVzUA2yvjEgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1dMcFnsO3/YNvguv8K4wmN+bBUS1cmjeX1f+ePDQnY=;
        b=zxTJKt8tv0mT4eM1tYCCvLDgHpSXnI1YOJ7nS4DXXuU5DVnMYdIsbVhEeClLRRGhFI
         5etiJrNUYQChgMhl8U5muCMaiW6Am2aUdg/lxgTRzMTeIHd4+Y2XnAh+G2LNzk1x5yo/
         sAoH3Ps4AdqQi1J0Bq/zGitbbA/yWlyJv8omZxdu9F0beLhm2INZlPuy2Js0b7WBWMzq
         egxc2dpU9vzo9vhVw9+n5UoZrHWhNZ68rT6jiHkdoREjP53SJVSlztNbij5gbmi3tae5
         C7Oo9QrEtNVnxl7UqGJESJZoIeo7GV5sas6Ys7TgGaIpB+nMjmUBzSnJIJqQrE/SGcDE
         /m4g==
X-Gm-Message-State: ACrzQf28BeChFmsV4H3192wkYqKR8Z1bbRR6q6yHH04k4z1UZIifmGhY
	x73Xt/MSvV3nj9yru4YbG0S0cyjIonRwbQ==
X-Google-Smtp-Source: AMsMyM7Ht/yJHP8jgmDrIOgGAzPU+eq4rXXl9wfQm3tvWINhdjq7vkkTROKX15zc8waTOz9MhJclJA==
X-Received: by 2002:ad4:5cca:0:b0:4bc:5c9:30b2 with SMTP id iu10-20020ad45cca000000b004bc05c930b2mr50504559qvb.121.1668106171754;
        Thu, 10 Nov 2022 10:49:31 -0800 (PST)
Received: from gildekel.nyc.corp.google.com ([2620:0:1003:314:4101:1159:30f8:2e7d])
        by smtp.gmail.com with ESMTPSA id p4-20020a05622a00c400b0039cb59f00fcsm36271qtw.30.2022.11.10.10.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:49:31 -0800 (PST)
From: Gil Dekel <gildekel@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	seanpaul@chromium.org,
	Gil Dekel <gildekel@chromium.org>
Subject: [PATCH v2] drm/mediatek: make eDP panel as the first connected connector
Date: Thu, 10 Nov 2022 13:48:52 -0500
Message-Id: <20221110184852.1848917-1-gildekel@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_104934_298128_9F6DDCDD 
X-CRM114-Status: GOOD (  11.19  )
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

[Why]
Some userspaces assume that the first connected connector is the "main"
display, which supposed to display, for example, the login screen.
For laptops, this should be the internal connector.

[How]
This patch calls drm_helper_move_panel_connectors_to_head() right before
crtc creation to ensure internal connectors are at the top of the
connector list.

Tested by ensuring the internal panels are at the top of the connector
list via modetest -c.

This patch does to mediatek what the following patch
https://www.spinics.net/lists/stable/msg590605.html
did for qualcomm.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
Tested-by: Gil Dekel <gildekel@chromium.org>
---
v2: Fix copy-paste errors in commit message so it's relevant for this
    patch and the mediatek driver.
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..76daaf6a0945 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;

+	/*
+	 * Ensure internal panels are at the top of the connector list before
+	 * crtc creation.
+	 */
+	drm_helper_move_panel_connectors_to_head(drm);
+
 	/*
 	 * We currently support two fixed data streams, each optional,
 	 * and each statically assigned to a crtc:
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

