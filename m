Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD443606A32A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERec6buU;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPj3y5Vs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LaPawNG6lVfcrIoq+MIVkHWBmNB3i0kILRqRDxDrrDQ=; b=ERec6buUnqXInG
	rDSCKBANx4LU6cKYCOHnII71Ozd8zXu37lqclyKjORVRlxSiefjnvjobMyhFvSsqqveEIadLeIeQ5
	2DBjzad8qLbpm9GbCSJrynPMPXsHVTUYQnM3mZTUAWirZdGGY5W90M9cGuxnEGLPUg7oqz6bhpM9X
	xW2QMSfe3K8TTy+qpFddSPmo85aPQptJlWZ7G6Qho2t5Mz72vilcE6UKbeIFAjdZz8haUzISuoYwd
	mC/TReoe8F1O2Kki0pmtSW+RABblvT8TAEQzpmOyVsmxcJwEEFLvvR/BL1GlnXXf4Q7vbniDzkGcu
	NBnD9q5VtbbFB91oZ81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslk-00000001jJ0-2SUI;
	Mon, 16 Nov 2026 09:12:56 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslh-00000001jGS-28nq;
	Mon, 16 Nov 2026 09:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820373; x=1826356373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lgXiNcTty7xTAzrRCls8eXQdKOJV57lUY6JX7ooMS6s=;
  b=RPj3y5VshtFG5SgaEJ+cweHMvY6kWspgC/uGE9a61Ty6Q7xW87sLnQ5t
   4ivOj0hadsymn+1JOsoH3GtLtYmdMDuLZk6thTTtz0GVHHXcN+kGVrA1m
   q28Aj2ZaUGV5asGQd3YH9v66j4npmd04aJ09/ZPTdDqyAeD4aiL/dMpEy
   f2gm7Ndv3FudA46tsVvMVLbJJAshBfZMG6GS7lEr/rsDZaQnG7dIAypJt
   T4RtqOjd6B+BN5qJxsecxXuGZgbZ5g8RR2kSw1VCmFHfuY0/YZPpffkFW
   bL6Dw7V0QFfIcc7AMyoGhKwj4xQ0GT63zOl12O2eZrO0MezlakjpG09+e
   Q==;
X-CSE-ConnectionGUID: Zs22ZcVzQAK2fzuFMmOgZQ==
X-CSE-MsgGUID: AnMo0WAZQdGWqZKaOeA9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3443443"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3443443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:52 -0800
X-CSE-ConnectionGUID: MbF+WPQPQreUpryutwuyyw==
X-CSE-MsgGUID: Mfg8cZhcS0ynPIvV9t4bKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9909164"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:45 -0800
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
Subject: [PATCH 07/12] drm/atomic/uapi: Document the non-obvious fence/fb_id prop behaviour
Date: Mon, 16 Nov 2026 11:11:25 +0200
Message-ID: <20261116091130.13950-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011253_615995_2C941E47 
X-CRM114-Status: GOOD (  10.81  )
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

The atomic async flip checks want to compare the old vs. new
property values. For normal properties that is all perfectly
clear, but for the fence/fb_id properties the old value is
not what one might expect. Add some notes to remind the reader
what is happening.

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
 drivers/gpu/drm/drm_atomic_uapi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index aad71d3e2105..cf1edcb242cc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1225,6 +1225,11 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
+			/*
+			 * Note that for WRITEBACK_FB_ID and WRITEBACK_OUT_FENCE_PTR
+			 * the old value will always be 0. So any commit that sets either
+			 * property to any other value will not be considered a no-op.
+			 */
 			if (old_val != prop_value) {
 				drm_dbg_atomic(prop->dev,
 					       "[CONNECTOR:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
@@ -1256,6 +1261,11 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
+			/*
+			 * Note that for OUT_FENCE_PTR the old value will always be 0.
+			 * So any commit that sets the property to any other value
+			 * will not be considered a no-op.
+			 */
 			if (old_val != prop_value) {
 				drm_dbg_atomic(prop->dev,
 					       "[CRTC:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
@@ -1289,7 +1299,13 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
-			/* fail everything that isn't no-op or a pure flip */
+			/*
+			 * Fail everything that isn't no-op or a pure flip.
+			 *
+			 * Note that for IN_FENCE_FD the old value will always be -1.
+			 * So any commit that sets the property to any other value
+			 * will not be considered a no-op.
+			 */
 			if (old_val != prop_value &&
 			    prop != config->prop_fb_id &&
 			    prop != config->prop_in_fence_fd &&
-- 
2.56.0


