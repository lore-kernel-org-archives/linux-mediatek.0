Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 19:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC39461462
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 19:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC39461462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXfSTD7yt5wxttXZFR/usGOrOlAHHg6qxsQxDhpE7UE=; b=qFFBbzZud/RhBW
	rHuVH0sjHNKIV3QiGlDn/ic8tvLoA6RbrhMOrljqZCIlJuWFCOECVwCySIK47FGjp+I9aLUmG3iRD
	1pTVu3vYodj6X2oir72kYv9Qo4txSIvyfg5EeJiv6ym/qGmw4qEQow2YOZDfBzr/TeV3JqjVjMQiC
	G9leCxRnRkPT+4vH0wOvWrjBbFN/2sLwjffRcwfh1luIdy8Q2+q7j8gRpDjVmBsLcKMV4vr+5/LX9
	cjgxznzQWWbtKc6Q3vwXZ/lmbZrjgxRveU3IvyQy4ice9Y6gp/WlUAe2jUNrBtaWtM3cbiSHSONdd
	JLQznSJB/pNtHR/PIdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVfRb-00CCSv-Nc; Wed, 29 Sep 2021 19:40:43 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVfRX-00CCR2-SB
 for linux-mediatek@lists.infradead.org; Wed, 29 Sep 2021 19:40:41 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 11so2137507qvd.11
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Sep 2021 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF633gou+bl3sCpIJ8wv85xDA5ZlnT4KC1I1tt3b3Dw=;
 b=h7pT+4lZyr9pCDyJbrAsH5Y5h6S4YUyYmsnrKRK9b024dTy0SWgieLBPe6oHRIP57g
 tACIdjc8P5aqUla/jrS++A039Nb6t3lQlMoVATBxiYU0jBjn6EaANh/anNYlD+iClCLb
 HjDPAyteVgB2CXzeoP0en0yZysG0JqIQlh/QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF633gou+bl3sCpIJ8wv85xDA5ZlnT4KC1I1tt3b3Dw=;
 b=EzpANvOQtneGl7jenXSo6ai+2B43KhfH+nmQYdxQygATScs250E7b8HUGxO1ZqJd4q
 XVvq1z774IpmBuhyY4BeO6/Y3sDYXvQknpFoFiBrw5H4xPuvAhJ83eL/BU2hegnpLAgQ
 dY+ArxrTpRcCf8QhlE4oagEVca9Zey+Y2m0cde2UQwzu1wz/Aq3OUGlyscrtcJ3z4McM
 /pKRLyWrVMp/26HjZkMQ0zQnZqQK8IDgIn/7he2GGLksRu0TXSeG5usPDFzgvCAvLXWp
 PB2zc2yLIbUQpEtlU0H8RMrHXP2nAAM02Ha6NTSpp8N627f8a261rFnT2CQ3k1XTRooT
 1CPQ==
X-Gm-Message-State: AOAM531Ij9FCFwalGQRM0svUNvVGxpM8QAo1mKpyU9CXMcsAgFn9D8e5
 6OgGgKQYNaLbNlyGD02rhU2NbA==
X-Google-Smtp-Source: ABdhPJz2jnoGe84xsN5bbYup7kT30gQg9aDhyQ18dDkvFdc4nX3/qf7bpM20C7AqYvDQ0SnkqJIDjA==
X-Received: by 2002:ad4:5554:: with SMTP id v20mr224403qvy.16.1632944432914;
 Wed, 29 Sep 2021 12:40:32 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:15c:6c:200:db75:cbbd:56c0:9891])
 by smtp.gmail.com with ESMTPSA id c4sm395064qkf.122.2021.09.29.12.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:40:32 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: seanpaul@chromium.org, Rodrigo.Siqueira@amd.com, anson.jacob@amd.com,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes props to drm_crtc to
 validate.
Date: Wed, 29 Sep 2021 15:39:25 -0400
Message-Id: <20210929194012.3433306-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_124040_137552_C8CA1827 
X-CRM114-Status: GOOD (  18.28  )
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
1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
or Degamma props in the new CRTC state, allowing any invalid size to
be passed on.
2. Each driver has its own LUT size, which could also be different for
legacy users.

[How]
1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
assigned by the driver when it's initializing its color and CTM
management.
2. Create drm_atomic_helper_check_crtc which is called by
drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
they match the sizes in the new CRTC state.

Fixes: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
Tested on Zork(amdgpu) and Jacuzzi(mediatek)

Signed-off-by: Mark Yacoub<markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 56 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_color_mgmt.c    |  2 ++
 include/drm/drm_atomic_helper.h     |  1 +
 include/drm/drm_crtc.h              | 11 ++++++
 4 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c0c6ec928200..265b9747250d1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -930,6 +930,58 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_planes);
 
+/**
+ * drm_atomic_helper_check_planes - validate state object for CRTC changes
+ * @state: the driver state object
+ *
+ * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
+ * state holds them.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_check_crtc(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->gamma_lut) {
+			uint64_t supported_lut_size = crtc->gamma_lut_size;
+			uint32_t supported_legacy_lut_size = crtc->gamma_size;
+			uint32_t new_state_lut_size =
+				drm_color_lut_size(new_crtc_state->gamma_lut);
+
+			if (new_state_lut_size != supported_lut_size &&
+			    new_state_lut_size != supported_legacy_lut_size) {
+				DRM_DEBUG_DRIVER(
+					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
+					supported_lut_size,
+					supported_legacy_lut_size,
+					new_state_lut_size);
+				return -EINVAL;
+			}
+		}
+
+		if (new_crtc_state->degamma_lut) {
+			uint32_t new_state_lut_size =
+				drm_color_lut_size(new_crtc_state->degamma_lut);
+			uint64_t supported_lut_size = crtc->degamma_lut_size;
+
+			if (new_state_lut_size != supported_lut_size) {
+				DRM_DEBUG_DRIVER(
+					"Invalid Degamma LUT size. Should be %u but got %u.\n",
+					supported_lut_size, new_state_lut_size);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_crtc);
+
 /**
  * drm_atomic_helper_check - validate state object
  * @dev: DRM device
@@ -975,6 +1027,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_atomic_helper_check_crtc(state);
+	if (ret)
+		return ret;
+
 	if (state->legacy_cursor_update)
 		state->async_update = !drm_atomic_helper_async_check(dev, state);
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6c..72a1b628e7cdd 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (degamma_lut_size) {
+		crtc->degamma_lut_size = degamma_lut_size;
 		drm_object_attach_property(&crtc->base,
 					   config->degamma_lut_property, 0);
 		drm_object_attach_property(&crtc->base,
@@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   config->ctm_property, 0);
 
 	if (gamma_lut_size) {
+		crtc->gamma_lut_size = gamma_lut_size;
 		drm_object_attach_property(&crtc->base,
 					   config->gamma_lut_property, 0);
 		drm_object_attach_property(&crtc->base,
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11c..3eda13622ca1e 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -38,6 +38,7 @@ struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
 
+int drm_atomic_helper_check_crtc(struct drm_atomic_state *state);
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750af..c602be2cafca9 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1072,6 +1072,17 @@ struct drm_crtc {
 	/** @funcs: CRTC control functions */
 	const struct drm_crtc_funcs *funcs;
 
+	/**
+	 * @degamma_lut_size: Size of degamma LUT.
+	 */
+	uint32_t degamma_lut_size;
+
+	/**
+	 * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
+	 * X, which doesn't support large lut sizes.
+	 */
+	uint32_t gamma_lut_size;
+
 	/**
 	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
 	 * by calling drm_mode_crtc_set_gamma_size().
-- 
2.33.0.685.g46640cef36-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
