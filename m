Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACB606A337
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avjPg+hr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zj09dQEo;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BdHrU6YM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TFvQP8aoubAPDYf0wglCKRKdVUTp2ONcSkD8GwBBfng=; b=avjPg+hriZQck4
	NQIeTsYYApMgRMHNMGNVaBvH2tXU9uXTE/E2z1mWE2V7oQWx4xnYPJ6/BgRQsPL5PuXjglIIOauhU
	yH0lZEHa9eOfs8bMrJiq3/xzZ39/YE5vZbw0AbkAGckd8RYkFlj8tsM44IQ5o89ZXy8ufID+pKoah
	gfdv33ixhSBChJ7Wn9PE6xrtnC4GqwTfCmkPV7CI9MejWvqFLCkgYxpWEI8dN06LdlqrwvXn/wIeT
	fGQdxu9kWVMjlm+tuX8AatZPovegoWMLtawltSutjNno/kO8KnrviFKEi9RaWlMe7U8JTqnkPcEkt
	rtq+pIrDpSgmgVH3OSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslP-00000001j2Q-3TOZ;
	Mon, 16 Nov 2026 09:12:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslO-00000001j1C-2bwG;
	Mon, 16 Nov 2026 09:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TFvQP8aoubAPDYf0wglCKRKdVUTp2ONcSkD8GwBBfng=; b=Zj09dQEo3dUj5uy81GAbnKdirI
	ao2vO0DMWXIHQMWFCujinAt4hKCgfXrR1rvtaUA6KLTTHNrBNTd1edG09m29hLvZUEqa+E8H46o4p
	tPn7v7qdao1ftQ+Izrf7Dek1Noo7YQKLa+3u5IFhT+siq3r1aIYuKD+huFZip5mw883RTnJoLVDFF
	tHLsVAKwUkFYUc8WChwR6gc4qeMml2VV+JrbXjUitWVN5rdZqwcDm7Sm5lUw6WXj++AiN6u4jErSd
	c3UhzCrmliZDl4S2f439cD8Q615qIIUe3uM8j3nWGotcbB8Qp1pZ0FI5wXZWBqHsfDU/U7CzK2zNb
	9jDpR7ow==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslJ-0000000DXv2-25EE;
	Mon, 16 Nov 2026 09:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820349; x=1826356349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGdJovIRxiswmzQ/OVHyoYBXcmjw0GscVzdw8XDjrRY=;
  b=BdHrU6YMTM+yr+Lu792JTNaFmhhZTL6D+hdr1hVIfBEBMyVF7DDb72HK
   QHa7+ypgS3tVHv6ingcw5ePk7jD9l0UY7gi9XR9BfUs1jEGeY0P9qpZKQ
   W4M8ZH6ePvzvMawpKZL13Bf4RWt2HOFYI56Qr7j5ccH+eJYldwgT7zJWW
   c2ACFh4nOVOxRmUr5XcauSgZ2Lh/JBFJAdHGol7BHLq3NsgFezjQgG92L
   L5X4A1hXl96j0pexrbcFCBEJR7KOdl6OoP7DUMekaY6D+JdtieK2AGM5e
   Y6gOMg7NuqTbWG5abETh5li/+0e+n1jTSYZb5tR6JOSkeNIZZh2k7yGwu
   A==;
X-CSE-ConnectionGUID: oH+1RYseShe8J24w/M8Z4A==
X-CSE-MsgGUID: StDokaZcRv+V2Ucf2ZddWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3590923"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3590923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:26 -0800
X-CSE-ConnectionGUID: J66DpBJ2RRW4yBSWi6jh6g==
X-CSE-MsgGUID: 0uoTtDp2RV+r35svTUE34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9826077"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:19 -0800
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
Subject: [PATCH 04/12] drm/atomic: Highlight that bypass commits need care
Date: Mon, 16 Nov 2026 11:11:22 +0200
Message-ID: <20261116091130.13950-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091230_019422_C5F14D12 
X-CRM114-Status: GOOD (  11.81  )
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

Document the fact that implementing bypass commits
need actual care and attention to make sure the
effective commit reordering is actually safe.

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
 include/drm/drm_modeset_helper_vtables.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index d28d8ffc66b4..1036744b9922 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1430,6 +1430,12 @@ struct drm_plane_helper_funcs {
 	 * given update can be committed bypassing the atomic commit machinery.
 	 * That is, if it can jump ahead of the state currently queued for update.
 	 *
+	 * Extreme care is needed to make this safe as the already queued commits
+	 * will not be aware of the bypass commit that overtook them. And the
+	 * state that the bypass commit will observe is the final already queued
+	 * state, not the current state at the point when the bypass commit
+	 * will actually execute.
+	 *
 	 * This function is also abused by drm_atomic_set_property() to determine
 	 * if the plane can be flipped in async. The flip flag is used to
 	 * distinguish if the function is used for just the plane state or for a
-- 
2.56.0


