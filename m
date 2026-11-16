Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC3606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dCeKxf/G;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdhj0z7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gljLKtd1DY0BbYFXhcXXIEgEeuG4APBeWpQtrZKf0GA=; b=dCeKxf/GUJq901
	yjwqR8Nejc/HshfuKpl9+bACDIBQ/BSY8ShRwzmm629p9sxNgnKdcLd0rIeIqKbFMhFv8Y1p+tqef
	l+cdjzFnXvbOYDWplFLbzQvfHu/ih8aNXTkIs7l5NT31NTA2cePSlZc+Ye9749aSjvJUog7wdMkK8
	HsW/xXhrNge72R5pE3hQIMIVW8Akq1qJsLng+UVBafQnK0mV0p9wVVa+vQXQd7PkjeHXuD78qdF+W
	U1n1dvv7qprosPHFZMnm696rC6GvAZ2zZOrWVvtka6bdRVZIo1IAdUySRGoxMFDlErszWscN6T6c5
	SGqF3TvkR3lcSo8uj+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslb-00000001jAX-1I50;
	Mon, 16 Nov 2026 09:12:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslR-00000001j3E-1YIK;
	Mon, 16 Nov 2026 09:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820357; x=1826356357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RkhyzjuNlXgxmJ1hs/ayERDzfWzK8akCYym0w0pTyDc=;
  b=fdhj0z7lzOaYSJIDDXFaGiMa7TMDQ1nN5DLoX/iOl0hUX1zC3dwAApmT
   o1ZXx3EPaf7TEwKJQLSXbmLtbxmD+7gET61aTVu0jN8jXJ4BnGf0FhJPF
   4rrSP6yi1nViA99m8L3UGia6/07JPfH9gnBrBCKwuYcOf7cY3bao7CdEg
   ci85a+eago+d/qU/3rFREHucWyzmMeib+Pz5GQKMdkpx9CxTbPb7JY/Ux
   5F8l+Ca6mvnvfRdBMT6JLZFeZWi0tZpg+/NjmFkx6GJ31ZuB14iq0oCbu
   dboTPJiaoH15A2AS15LAzPf00QRBzIX9meYqW+8dMZ4bXpBZoqN1tEBDW
   A==;
X-CSE-ConnectionGUID: yKPkR/k6RIGNezVyXo0hrw==
X-CSE-MsgGUID: 8PY7cf2dS5el1cxyikZjWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441744"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:36 -0800
X-CSE-ConnectionGUID: eSWWbGsqQsClMOtxH9qrUQ==
X-CSE-MsgGUID: ujhghr56Si+fr6fdGRMLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9636389"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Erwin Springer <aot.lerwin@gmail.com>,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>,
	nouveau@lists.freedesktop.org,
	Qianhai Wu <wuqianhai@loongson.cn>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Simon Ser <contact@emersion.fr>,
	wayland-devel@lists.freedesktop.org,
	Xaver Hugl <xaver.hugl@kde.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 05/12] drm/atomic/uapi: Eliminate the confusing drm_atomic_check_prop_changes()
Date: Mon, 16 Nov 2026 11:11:23 +0200
Message-ID: <20261116091130.13950-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011238_812525_D5E3D52F 
X-CRM114-Status: GOOD (  15.64  )
X-Spam-Score: -4.3 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_atomic_check_prop_changes() is a very confusing for
many reasons:
- the 'ret' propagation through it is completely non-obvious
- for planes it prints the debug message about rejecting the
  update before we actually decide whether the update needs
  to be rejected or not
- the debug message is also printed if the property doesn't
  exist, which is confusing
- the debug message lacks the KMS object type/ID/name,
  which could be helpful during debugging

Just get rid of the whole drm_atomic_check_prop_changes() and
do things by hand.

Also remove the debug message for the case where the property
doesn't exist as drm_atomic_*_get_property() will already print
its own debug message in that situation.

Cc: amd-gfx@lists.freedesktop.org
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: nouveau@lists.freedesktop.org
Cc: Qianhai Wu <wuqianhai@loongson.cn>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
Cc: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 51 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index eb002799497c..2ea03b4b0be9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1194,19 +1194,6 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_commit *state,
 	return ret;
 }
 
-static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
-					 struct drm_property *prop)
-{
-	if (ret != 0 || old_val != prop_value) {
-		drm_dbg_atomic(prop->dev,
-			       "[PROP:%d:%s] No prop can be changed during async flip\n",
-			       prop->base.id, prop->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 int drm_atomic_set_property(struct drm_atomic_commit *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
@@ -1235,8 +1222,16 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		if (async_flip) {
 			ret = drm_atomic_connector_get_property(connector, connector_state,
 								prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+			if (ret)
+				break;
+
+			if (old_val != prop_value) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
+				break;
+			}
 		}
 
 		ret = drm_atomic_connector_set_property(connector,
@@ -1257,8 +1252,16 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		if (async_flip) {
 			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
 							   prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+			if (ret)
+				break;
+
+			if (old_val != prop_value) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
+				break;
+			}
 		}
 
 		ret = drm_atomic_crtc_set_property(crtc,
@@ -1281,12 +1284,18 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			/* no-op changes are always allowed */
 			ret = drm_atomic_plane_get_property(plane, plane_state,
 							    prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret)
+				break;
 
 			/* fail everything that isn't no-op or a pure flip */
-			if (ret && prop != config->prop_fb_id &&
+			if (old_val != prop_value &&
+			    prop != config->prop_fb_id &&
 			    prop != config->prop_in_fence_fd &&
 			    prop != config->prop_fb_damage_clips) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
 				break;
 			}
 
@@ -1296,10 +1305,12 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			 * decision. Drivers that want this need to just do
 			 * these checks themselves somewhere.
 			 */
-			if (ret && plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			if (old_val != prop_value && plane->type != DRM_PLANE_TYPE_PRIMARY) {
 				/* ask the driver if this non-primary plane is supported */
 				if (plane_funcs && plane_funcs->atomic_bypass_check)
 					ret = plane_funcs->atomic_bypass_check(plane, state, true);
+				else
+					ret = -EINVAL;
 
 				if (ret) {
 					drm_dbg_atomic(prop->dev,
-- 
2.56.0


