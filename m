Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A42CC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/9p5YKUpDfB/VIccEe/gl5TXkWsNme3I0Rd/ZJSwPZE=; b=DIL3aDqjXZyvOuXj5gwu24nrc5
	1Z8GdYVm06QDIpDLILJbbl2mwDkZ6QjpOaO4Guhq2uSCDGmekhTVxZVA+Hx/lrNHY2Tfg8JGY1S0Z
	lImIOdlU2TOzCONKotR/amBNkRZfXRmY26RIvPspXLBDbTmBmor155nYZZzF2chaAT5ZWc1edk1gO
	UgPutIMtIJD0kGHnbyKyZZDcemez1aULjARAXf6Yu95XHklRBuaCufcKHMPBggkXxDYBAK+qlZPPS
	OoNWaCbUT4dbtXLmvyncnFCMgRAwV38EDVFBHLZKDUU1zn6ilYib3T0TeiLIb1o63TeDvbKPvN+Q3
	NdHb+sIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScCC-009se4-3s; Thu, 16 Feb 2023 11:13:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScBa-009sIm-So
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 11:12:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id o15so1459823wrc.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1676545938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9p5YKUpDfB/VIccEe/gl5TXkWsNme3I0Rd/ZJSwPZE=;
        b=daprNBF2cioSkaV/LaHMvRsLzymaFwYTfmNpbtoHjKT7Sk7wu0MquSVBUXgz7PQnnc
         PrwSpTRvCwpgn/+bHmTCXmQId048ksqxzkl9YY8RcymgN5s2s5Lg5cbLlWtekPM1P35W
         osp8BS7+ZJFdMfWCjabnAp+Ta0+ZH+PNIjT1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676545938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9p5YKUpDfB/VIccEe/gl5TXkWsNme3I0Rd/ZJSwPZE=;
        b=ic4YEfqdrzoYzSgGF7OCr5gTkzW3oujjONc59yo9GJxRez6Z4YAeoDrUy7kwryWbJn
         an6psd462oYIJDUAP2OnGNyxXM/4WI45rKb3ulzj3ShQQF+rTYv+BtN1zO15IOwxpPPo
         PPrHZp/OK7Et3DMoH+ByeUxlh//MBB8qMsx0Yqw8Fryl6wzGzDPeUkd8wHtT3i22aJwB
         ZPK56ZosTE4nkM+DDriFUFST3M0YQgFaAzQlpTeNYTtxEZFy1NfFwnpQpz5/NLuatqgB
         kfUMJOArLXCQ/gzZx8uQNQHEVGMY3yAA9g8pFKUNFoo1wYkP1d/U+0NcRuXj/B/7Tnhq
         SB9g==
X-Gm-Message-State: AO0yUKXLzlxDw+cnJ/eG3+5f3kB0tymaIMt0TE3JKUl3Lg/AMxwEJXuJ
	Le7rsmobbYRGdO0IWSaXqm2VxQ==
X-Google-Smtp-Source: AK7set/V0HgKdwJ6CfD3OOAKl1s05e2DIcRxjV++t26IPN2C/xks2eE9SyhLBLK2KpcVGucfai4f8w==
X-Received: by 2002:adf:dd82:0:b0:2c3:d296:7a94 with SMTP id x2-20020adfdd82000000b002c3d2967a94mr3158589wrl.3.1676545938440;
        Thu, 16 Feb 2023 03:12:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id y12-20020adfe6cc000000b002c3dc4131f5sm1206658wrm.18.2023.02.16.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:12:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <maxime@cerno.tech>,
	mikita.lipski@amd.com,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
	harry.wentland@amd.com,
	Rob Clark <robdclark@gmail.com>,
	"Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Manasi Navare <manasi.d.navare@intel.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Date: Thu, 16 Feb 2023 12:12:13 +0100
Message-Id: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_031222_948800_E2830B08 
X-CRM114-Status: GOOD (  23.03  )
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

The stuff never really worked, and leads to lots of fun because it
out-of-order frees atomic states. Which upsets KASAN, among other
things.

For async updates we now have a more solid solution with the
->atomic_async_check and ->atomic_async_commit hooks. Support for that
for msm and vc4 landed. nouveau and i915 have their own commit
routines, doing something similar.

For everyone else it's probably better to remove the use-after-free
bug, and encourage folks to use the async support instead. The
affected drivers which register a legacy cursor plane and don't either
use the new async stuff or their own commit routine are: amdgpu,
atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.

Inspired by an amdgpu bug report.

v2: Drop RFC, I think with amdgpu converted over to use
atomic_async_check/commit done in

commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Wed Dec 5 14:59:07 2018 -0500

    drm/amd/display: Add fast path for cursor plane updates

we don't have any driver anymore where we have userspace expecting
solid legacy cursor support _and_ they are using the atomic helpers in
their fully glory. So we can retire this.

v3: Paper over msm and i915 regression. The complete_all is the only
thing missing afaict.

v4: Fixup i915 fixup ...

v5: Unallocate the crtc->event in msm to avoid hitting a WARN_ON in
dpu_crtc_atomic_flush(). This is a bit a hack, but simplest way to
untangle this all. Thanks to Abhinav Kumar for the debug help.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <maxime@cerno.tech>
References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
Cc: Maxime Ripard <maxime@cerno.tech>
Tested-by: Maxime Ripard <maxime@cerno.tech>
Cc: mikita.lipski@amd.com
Cc: Michel Dänzer <michel@daenzer.net>
Cc: harry.wentland@amd.com
Cc: Rob Clark <robdclark@gmail.com>
Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c             | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..f6b4c3a00684 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1587,13 +1587,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
-	 /*
-	  * Legacy cursor ioctls are completely unsynced, and userspace
-	  * relies on that (by doing tons of cursor updates).
-	  */
-	if (old_state->legacy_cursor_update)
-		return;
-
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
@@ -2244,12 +2237,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 			continue;
 		}
 
-		/* Legacy cursor updates are fully unsynced. */
-		if (state->legacy_cursor_update) {
-			complete_all(&commit->flip_done);
-			continue;
-		}
-
 		if (!new_crtc_state->event) {
 			commit->event = kzalloc(sizeof(*commit->event),
 						GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3479125fbda6..2454451fcf95 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7651,6 +7651,20 @@ static int intel_atomic_commit(struct drm_device *dev,
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
+
+	/*
+	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
+	 * everything.
+	 */
+	if (state->base.legacy_cursor_update) {
+		struct intel_crtc_state *new_crtc_state;
+		struct intel_crtc *crtc;
+		int i;
+
+		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+			complete_all(&new_crtc_state->uapi.commit->flip_done);
+	}
+
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
 
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..b7151767b567 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -189,6 +189,19 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	bool async = kms->funcs->vsync_time &&
 			can_do_async(state, &async_crtc);
 
+	/*
+	 * FIXME: Convert to async plane helpers and remove the various hacks to
+	 * keep the old legacy_cursor_way of doing async commits working for the
+	 * dpu code, like the expectation that these don't have a crtc->event.
+	 */
+	if (async) {
+		/* both ->event itself and the pointer hold a reference! */
+		drm_crtc_commit_put(async_crtc->state->commit);
+		drm_crtc_commit_put(async_crtc->state->commit);
+		kfree(async_crtc->state->event);
+		async_crtc->state->event = NULL;
+	}
+
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
 	kms->funcs->enable_commit(kms);
@@ -222,6 +235,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		/* async updates are limited to single-crtc updates: */
 		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
 
+		complete_all(&async_crtc->state->commit->flip_done);
+
 		/*
 		 * Start timer if we don't already have an update pending
 		 * on this crtc:
-- 
2.39.0


