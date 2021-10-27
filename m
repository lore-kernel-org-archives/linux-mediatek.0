Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 16:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F035E610A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F035E610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JCbbNVHJww2w6Tmssel3s3gdq7OOShpsveS2Q25Ovp0=; b=os5y5tC76hNi21
	Frsx9ZMRgD53AgcN4GArD1TI48QKTdUraErF8dQMOaK6CSuwmgMW2TikRbTPBvt2hbqBIrTwkno+z
	akli+GwB/20NYZi2NJkXiLlSH1t5anTO8X0CAyZPMWsFfwn3fPyZaxCTSCJnVSNP13Xpsfs/aHtIv
	QzQ56WL6GvacG2GUkem9XUPL+l97H9mnhacXKYhoiFKnGDTQEWelK+MgccTMBjiC2NuTBCK1Wx3bL
	//4P7HzrY9IXG28BDVGjspA4qVzqK3VW+rVEPrDEEJtN+WVki45RJN4vjL/GY1QoL2zPs85t59rQm
	5jsBD9kQCznfSgyjO5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflsv-005U5M-0o; Wed, 27 Oct 2021 16:34:41 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflsr-005U4N-MQ
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 16:34:39 +0000
Received: by mail-qk1-x732.google.com with SMTP id d15so2969838qkj.10
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzEz2Tw9Lfz5TOURnPsgcxiiiKcelHawM6M06oI35wU=;
 b=gcRorwC7RJAqNvB7/sLymu7rx6X+O1XtByB+a+Kn+pZd3/Iiplo/FoBRQFBCNSKabP
 bGhaHY2iEz1rZS6GpD5S/JGKwxkOVgVUQjKgrDJjALr4EG9Np8HAWWYh8aDK2Ci5NMlQ
 FacI5apkn6GWgiQ14F/p1pyfSM+jwmHgrR+dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzEz2Tw9Lfz5TOURnPsgcxiiiKcelHawM6M06oI35wU=;
 b=N//F7o9wM0GZ2/IJ3/f+H/5LUm5ZIrFIhhacjdSFqLrZW27XS/nPFjHSSxZJ/La7Qv
 iWo9A5OkNB22j2IqLcUqUNL510WmWVVdeiZFGa6E8yXWTD5UYzTaiXUAF9ng0ZLea79z
 GwKjQ5ZEQRXWyatdfVeUZe86iDHYKPZrBia7o78gxdFKFGsoMkjiJFxcyaHN5z7UP0qV
 1snvxs802G4FMK9wWx1L/CAPb66Ee2qYv2/hNO2jiGtq+d381Ht01jorK6rtfoKiMEct
 JDD6VXsIp58OLhJQ8D2uR+TnsBXO65+jVqx14oUbR+nuwlkt0z5R11p3RsLIq4LwTDZb
 rFvw==
X-Gm-Message-State: AOAM530wfI3g3AjWFuLI+cRv09pfBIrmqu1Srbrr+Z+S82VwjL43m9U+
 51Hm2iJOXVlwlYs3YTXAGIvQLA==
X-Google-Smtp-Source: ABdhPJxG7Rr5qnj7oR0gtCLURtoKJQbXg1qgWb+ARuyyWRimCB6s7AMBNpQzrOt44941nGvLb9EdlQ==
X-Received: by 2002:a05:620a:108d:: with SMTP id
 g13mr2612236qkk.387.1635352476820; 
 Wed, 27 Oct 2021 09:34:36 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:121e:94ae:f1a6:940c])
 by smtp.gmail.com with ESMTPSA id a20sm249675qtb.15.2021.10.27.09.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:34:36 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Do not overwrite user state rotation value.
Date: Wed, 27 Oct 2021 12:34:31 -0400
Message-Id: <20211027163433.2017401-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_093437_779035_6EE0E955 
X-CRM114-Status: GOOD (  14.25  )
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
The rotation property must have a valid bitmask value. 0 isn't a valid
value.
The state should not be overwritten when performing an overlay value
check.

[How]
Do not overwrite state during the check.

Resolves: IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 20 +++++++-------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b11..2fc566964f68e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,7 +64,7 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state);
+			const struct mtk_plane_state *mtk_state);
 void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			  struct mtk_plane_state *state,
 			  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index ea5760f856ec6..13999564304bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -190,19 +190,15 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
 }
 
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state)
+			const struct mtk_plane_state *mtk_state)
 {
-	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
+	const struct drm_plane_state *state = &mtk_state->base;
+	unsigned int rotation = drm_rotation_simplify(
+		state->rotation,
+		DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	/* We can only do reflection, not non-zero rotation */
+	if (((rotation & ~DRM_MODE_ROTATE_0) & DRM_MODE_ROTATE_MASK) != 0)
 		return -EINVAL;
 
 	/*
@@ -212,8 +208,6 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && rotation != 0)
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1b582262b682b..530bdd031933f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -53,9 +53,8 @@ struct mtk_ddp_comp_funcs {
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
-	int (*layer_check)(struct device *dev,
-			   unsigned int idx,
-			   struct mtk_plane_state *state);
+	int (*layer_check)(struct device *dev, unsigned int idx,
+			   const struct mtk_plane_state *state);
 	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
-- 
2.33.0.1079.g6e70778dc9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
