Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B279C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJHn8+pSpwglQ2ylL3huswEVRt2vpqL4jH6sVFjg9vY=; b=gGrHiqvZN39c3RBsVKP5OOD29N
	cUMj2NGebAgAx/6WnDPFlO/9OoazCjpopbv2cvBPPrZFpKnDwUbKsP9odWZzxdnz3QFDjjIaSWOzh
	w/tcLoDc3Pz7ZpcuSiVLgdAH4u7GzR/UbeUfXSIafwoQSmg5Sb8NGEQWuZEy/VsOGHun8/99xw8Ff
	gagxKbSYcWBpFz3H1R/SeA5Bt9XJT0UG2RosDehW9/MvXkOij3HiuZ47Ll6LEy4eJ/3yWnXWvr7J6
	lieIg+icHC+1dkvNyNRAHwRFI7nfTbDpfu+xvMsgU/xlGWf1qG0Kgz4y7UzHHrDsJQWsIQ9beHMxk
	tF402YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRzQ-00Fpbm-On; Fri, 27 Jan 2023 16:54:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRzM-00FpZh-Ft; Fri, 27 Jan 2023 16:54:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id o13so5152383pjg.2;
        Fri, 27 Jan 2023 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJHn8+pSpwglQ2ylL3huswEVRt2vpqL4jH6sVFjg9vY=;
        b=kk0OOlr625FNfEaHBDqd0XDNDVjNqpiWEqLLgn/fC4Qrqb/VCsyTTtUlWSa9r/z5N0
         jUo+S93D/xHrJiiUw5OlfRmg2Qb7eYqSrvqF+6vwqjzOjLXFxlR0y26v5ruRu8D9qPOu
         AX97MQTJX3KX6JSnXTdwDgUxmp0ZPLguoQhSfCCouy1ha2VZdluDW4CoH7BK6EBpSus9
         t9cmqkChU3WN8hsU2hwy2v4rJ2JQaKPeY8TuARXnsE+qEu3TVKRh6WvpwhN+4eMaTrrD
         lZ6CyRcSEedX/rbGSxU02JgoCn20QKcs4fqzC5ZSSYeVL9CLzuQyPTD7dEtLUDPNkYu6
         HZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJHn8+pSpwglQ2ylL3huswEVRt2vpqL4jH6sVFjg9vY=;
        b=JH8iXgrPzMJ4uKGyf9ZqkDw87SaIYXfY516uZCUrM0lD4jjivNmvndszx5wL/PIdl5
         c80uOCn0xnSrs8K+fH1Kf+OgCxv+w3uyU2QMtGOXiqObfh4dyrVg/KvdaA9NXKzdyGfo
         Gs27aQ9PNqKLgB1l0fsVISyjrgZwAIzSjbjMuz5q/o2idBkIQPBlsEinOYWrY6Fy7chL
         UyK6QDdF9iwORkqxLFB6gDbqL5ddcX8bM3y0Q4McnOdXEXZaV5W1cwNt6PLgdFUnuh4q
         hWxGrmZkXX0H2IeOWoeYhwUTXzM3qXWthIaRatkXSnmLJKNFZr3V7GRpDe1OyJ23EsYY
         fMKA==
X-Gm-Message-State: AFqh2kpFXw32nbMM853+GmT5TNTwClBXNeGve0oWOzuU9vJQtQt3erFM
	a24alXrsl+MjN7QcNprL64o=
X-Google-Smtp-Source: AMrXdXvbJYAaCNdJ8tWPyVy0sutAAlq8id5Jor0UBuLb4ou1Ou/KYQMgNdG31Nv8a6j0csqDu9fGGQ==
X-Received: by 2002:a17:903:2349:b0:195:e373:4c60 with SMTP id c9-20020a170903234900b00195e3734c60mr35905710plh.40.1674838444754;
        Fri, 27 Jan 2023 08:54:04 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902edd000b00196503dba7bsm1904267plk.293.2023.01.27.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:54:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Doug Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/mediatek: Remove unused GEM DMA header include
Date: Fri, 27 Jan 2023 08:54:09 -0800
Message-Id: <20230127165409.3512501-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_085408_569197_5AFB9007 
X-CRM114-Status: GOOD (  10.82  )
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

From: Rob Clark <robdclark@chromium.org>

No longer needed since the removal of dependency on DMA helper.

Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..7e2fad8e8444 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -20,8 +20,8 @@
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-- 
2.38.1


