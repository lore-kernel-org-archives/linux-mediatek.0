Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89389C5DF62
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4388B21882
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lMzgVoSm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="CWNIiMSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4388B21882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLXzSdaCLs4m1bVx12pAJ0HK1MhkBRnuCiVUEMNLucw=; b=lMzgVoSmY5AiIH
	FvE6bF8DQAz454aleUuHFaNX3l+mmovyVNPpbebd1wXqnFihGUotN4MIk957y4EhRFto0/jPbunzT
	lNHFK+TIEOeVkUvOwbVqFKbc6uhTy2FipbDuk5acxMrvsavsQ7bOxBchsJLJ3Zo99jue32AdEXTJP
	nBud4MQWQOtIHWKVpeXKctEgsNWBsTiMzrX/QTGT2Th3zbCos5+4NfGay3gxg19wQSTq7GeAx8H/e
	F4AL4yFpAru8ttq/m0Ow8v0AxSL5Z0TlqZQQA93ncYrNkDRrRuF7tySi/+PgpKjLSJg+HGzYZGvlb
	njYCda4z6vo3vOQ/I5rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6AG-0007eO-O5; Tue, 05 Nov 2019 21:15:00 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66J-0002xj-IP
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:10:59 +0000
Received: by mail-yw1-xc41.google.com with SMTP id y64so5981281ywe.3
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47K5oOg7WLw5/3p9dwg+0DGsBD3xNcb5zwIbofYoaPA=;
 b=CWNIiMSHLVnAufWZgrmvlq1asdA7IwpWS/kZgw6NLjJTJTgeYxEfGOldA6SUYIn36/
 /XlzTYjXGfnqwPIlshx5rIUyuA210kV1lo+8QucYHMdWnRSGIXYOvA0Knm0op+7zFD1s
 nb/3HMlqMnYKEn8KKAcVudt1XHSAyRl2fbpsIehgiznPgxQfgf8grLlQipXhSnACYR87
 QmM1jNs5KHPflI2HM+s/W2tNhTjf0g2GltXN0UlTxDc9yyUYsgia56eXCwNEiTchzaA9
 q8Ozr+sw2Ric7EQ3d/lulCZyQz8W/oWYyrtDtc8cgQhyIXSA5fmHYQjgalMlgZ5cPgIe
 qTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47K5oOg7WLw5/3p9dwg+0DGsBD3xNcb5zwIbofYoaPA=;
 b=FPWZHaJk65CYbWrAZEdhkcGVMz6NWJqvN9hUWuQcseCsOUQgVcbXIThln+vS0yKLrC
 XpufqshQeOdwC5MJPwswqUNVWqRdxw5a3ntVVvxvzKXonKIo/bMiIxERGwbz2Z8H6Y0o
 uloOkOqVFp1xGQ7MUSunzpebNS76roFyI6W/KU0kylhypXUMFoPkGVNniahMs+9IABGq
 IepMwo88r+TktKmfMQExyR4ZFZH1MDlA347z+6Bb6dWvqAgBANN+AYUHb1MytWxhM7iZ
 5xhrPlZe+6JBhhynKPXVPxabdJbeazzC+32bMkwQCbVsWcoO4FraysGtmYOHWV3xIvWw
 dttg==
X-Gm-Message-State: APjAAAV5usy76nIGEAlqcpDL7ZKqrE7CbSIhPCjwR+1pSXbvPPR2mqK5
 bNLvG9u55XkH5H+JNAezhYdRjA==
X-Google-Smtp-Source: APXvYqwa5e6g0vw3L3tFhW0BtB4ETIxgip1pNsXJmRwcKlnn/4sNZ5kkBKbaTE9F2U4hGDttwHOBxg==
X-Received: by 2002:a81:db07:: with SMTP id u7mr4709820ywm.126.1572988253967; 
 Tue, 05 Nov 2019 13:10:53 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:53 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/7] drm/mediatek: Add plumbing for layer_check hook
Date: Tue,  5 Nov 2019 16:10:20 -0500
Message-Id: <20191105211034.123937-4-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131055_674087_66587B20 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, p.zabel@pengutronix.de,
 frkoenig@chromium.org, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

This allows components to implement a .layer_check callback for their
layers which is called during atomic_check.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 10 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 12 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  6 ++++++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ccf395f17a99..04e7e4bdbdb5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -394,6 +394,16 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	}
 }
 
+int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
+			     struct mtk_plane_state *state)
+{
+	unsigned int local_layer;
+	struct mtk_ddp_comp *comp;
+
+	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+	return mtk_ddp_comp_layer_check(comp, local_layer, state);
+}
+
 static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index fcc134eb00c9..6afe1c19557a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -19,5 +19,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path,
 			unsigned int path_len);
+int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
+			     struct mtk_plane_state *state);
 
 #endif /* MTK_DRM_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 26441f4d1ad3..3de371e28bdf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -80,6 +80,9 @@ struct mtk_ddp_comp_funcs {
 	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
 	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx);
 	void (*layer_off)(struct mtk_ddp_comp *comp, unsigned int idx);
+	int (*layer_check)(struct mtk_ddp_comp *comp,
+			   unsigned int idx,
+			   struct mtk_plane_state *state);
 	void (*layer_config)(struct mtk_ddp_comp *comp, unsigned int idx,
 			     struct mtk_plane_state *state);
 	void (*gamma_set)(struct mtk_ddp_comp *comp,
@@ -152,6 +155,15 @@ static inline void mtk_ddp_comp_layer_off(struct mtk_ddp_comp *comp,
 		comp->funcs->layer_off(comp, idx);
 }
 
+static inline int mtk_ddp_comp_layer_check(struct mtk_ddp_comp *comp,
+					   unsigned int idx,
+					   struct mtk_plane_state *state)
+{
+	if (comp->funcs && comp->funcs->layer_check)
+		return comp->funcs->layer_check(comp, idx, state);
+	return 0;
+}
+
 static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
 					     unsigned int idx,
 					     struct mtk_plane_state *state)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 584a9ecadce6..58b02fffe321 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -84,6 +84,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
 	if (!fb)
 		return 0;
@@ -91,6 +92,11 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 	if (!state->crtc)
 		return 0;
 
+	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
+				       to_mtk_plane_state(state));
+	if (ret)
+		return ret;
+
 	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
