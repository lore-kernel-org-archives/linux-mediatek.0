Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A028606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQDPRZlH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f3tHVCR6;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsUKwdgc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NrDYEklcNqtXALhiWj2mxwxsxekgaDasLuoDRGoiOmU=; b=RQDPRZlHHSeEEH
	GMiV3WZAS9awA1jAKngB6bHFF9YfozAOR5uzMMcdBt3RC8w34rqaRAsYw5KnSVp3lnGN5YWoRleqD
	TiLufKr2M3huSei1fgXhnBAxhKbt/7EOMrtj9u/40ubHUnUXvxslRZ+0C8qGOIPGbhA2zgqJ7ApC9
	CCC30z9JXT9MpGLqqQqsbIZ0rxhk8oY9OL7w/6qgyBw/s/VmCeOpr1/jcELVNaGTwFA+8nvM/oYlS
	yJ6nydTszCaOyinSL9uhGHcKKCjRlxFXvrGKizF9tL3t9KaDdqOHwvYnMqjP4N3awnTH8ox4L0ZaJ
	Dx9N6uHt0Pet96iddTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSskv-00000001iqo-3EYg;
	Mon, 16 Nov 2026 09:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsku-00000001ipw-2AVB;
	Mon, 16 Nov 2026 09:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NrDYEklcNqtXALhiWj2mxwxsxekgaDasLuoDRGoiOmU=; b=f3tHVCR6z5LMEJt5LMSIZKuwRe
	Y/XP8NWv+iuN6Gf5NH3RoK/abU4cMtDL+93dKaScoj5+IbL3lCKGfCn+mt3Z1UMInYsiMoGd79fTZ
	ge/AltoHBatTAoccSZk3Ihk3hU/zmM/V3QI/mTTgar+I7OYrlRzgai/yyvZK3Aa22g0Iwqb6cd26G
	D6q0+jEAg7gsVkdV06oW424wnh/9pFcpxaGC/Glw61HRIX2kUDINVixATr3yyr+yEwhiIxrp9+n+t
	rCep26JTYSTKeg6Jwx3J95mr4OmeLcmnDLMdct6R58vEp1KRvUIX72itjOIQ/UUp1j2A9JPYp7h1r
	2RXQTB9g==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSskp-0000000DXnt-3ImY;
	Mon, 16 Nov 2026 09:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820319; x=1826356319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V0qINld4Q/jbv63AGGXVfg5Qb1nzcot1g6RG8D+B2bI=;
  b=ZsUKwdgc+C5KbemMQcD/7Fpl8to+OGp480nXYG+dTmfPOMIsD/r8jNRR
   Z/3bSUyH+enf0A0RXUi9BgXH+64kOpwz4Rah77l4vtUhhZnfaKmYIX1m6
   RFmDGUAfUaXJcc3pIObauZbTkL6OYM4p1ZpuLpZrrevFQ6Zo72Fpxfqta
   s2oHI/tZS5gxqTBadqzn+ZUBbI7RJt/4TFsZqfI7OP2jNUYm4VIkKZ28s
   SYHvfH3I8kGiElbDcTCUdCJpFIiC2NK+ZFnLeV2dCi/ukBpFT3SpceQhP
   edlycjk4Sjieg6TwtHc+g4llb1/LI8hKg9ZZR2v75+2WeN/D1AsID8crb
   g==;
X-CSE-ConnectionGUID: 6AyVZGJ0S7W9NCG2T5i+qQ==
X-CSE-MsgGUID: RPIxmGEXRBa8+PJ1LGsK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441670"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:52 -0800
X-CSE-ConnectionGUID: UWh9ypXlQsaOXMJK/Z1GcQ==
X-CSE-MsgGUID: jIMoPLvWRfiBfA74S7kVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9636263"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:45 -0800
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
Subject: [PATCH 01/12] drm/atomic: Remove tall tales about tearing vs. "async updates"
Date: Mon, 16 Nov 2026 11:11:19 +0200
Message-ID: <20261116091130.13950-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091200_311560_283AD6CB 
X-CRM114-Status: GOOD (  20.44  )
X-Spam-Score: -2.4 (--)
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

The "async update" stuff has nothing to do with async vs.
sync updates as far as the hardware is concerned (as in
tearing vs. not). What it does is bypass the normal commit
machinery and just let the driver directly perform the
update (as it sees fit) and swap the plane state without
involving the whole crtc commit machinery.

The actual hardware update it does could be an async flip
(as in tearing) or a mailbox flip, depending on how the
driver decides to do it.

I also suspect some drivers abusing this for async flips might
be performing mailbox updates under the hood, which is
very broken because the commits complete in completely random
order and userspace has no idea when the hardware has stopped
scanning out from the old framebuffer. That means userspace
thinks it can start rendering new stuff to what is still the
current hardware scanout buffer. That will lead to incomplete
live rendering appearing on the screen, which is never OK.
Effectively one is performing front buffer rendering at that
point. This kind of fake async flip implementation would
immediately fail igt/kms_async_flips/crc, but that test
requires the driver/hardware to have working CRC support.
To make mailbox updates actually correct we would need
out fences, and a mechanism to signal them in the correct
order.

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
 drivers/gpu/drm/drm_atomic_helper.c      | 9 ++++-----
 include/drm/drm_modeset_helper_vtables.h | 6 ++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ccfe3840d505..f81eb29d9ac8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2187,11 +2187,10 @@ EXPORT_SYMBOL(drm_atomic_helper_async_check);
  * @dev: DRM device
  * @state: the driver state object
  *
- * This function commits a state asynchronously, i.e., not vblank
- * synchronized. It should be used on a state only when
- * drm_atomic_async_check() succeeds. Async commits are not supposed to swap
- * the states like normal sync commits, but just do in-place changes on the
- * current state.
+ * This function commits a state asynchronously. It should be used on a state
+ * only when drm_atomic_async_check() succeeds. Async commits are not supposed
+ * to swap the states like normal sync commits, but just do in-place changes
+ * on the current state.
  *
  * TODO: Implement full swap instead of doing in-place changes.
  */
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 60b30cc26940..c2431c08a60a 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1424,8 +1424,7 @@ struct drm_plane_helper_funcs {
 	 * @atomic_async_check:
 	 *
 	 * Drivers should set this function pointer to check if the plane's
-	 * atomic state can be updated in a async fashion. Here async means
-	 * "not vblank synchronized".
+	 * atomic state can be updated in a async fashion.
 	 *
 	 * This hook is called by drm_atomic_async_check() to establish if a
 	 * given update can be committed asynchronously, that is, if it can
@@ -1449,8 +1448,7 @@ struct drm_plane_helper_funcs {
 	 *
 	 * Drivers should set this function pointer to perform asynchronous
 	 * updates of planes, that is, jump ahead of the currently queued
-	 * state and update the plane. Here async means "not vblank
-	 * synchronized".
+	 * state and update the plane.
 	 *
 	 * This hook is called by drm_atomic_helper_async_commit().
 	 *
-- 
2.56.0


