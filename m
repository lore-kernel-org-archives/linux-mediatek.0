Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF7606A338
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCk3ie+A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oa+EEamq;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nte6RQMY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HCZA7h4dhtZFsDeAg5DlvyxhK/gg8Zq5jpN13t+4dmw=; b=kCk3ie+ARrJ18/
	HiV00D2gaRjbIX90j4Icze2VAgVyvoBfq0Kr+KLDzlFj+PfB00II/ZjZdp34bXhwSnsT0a2EH0M5y
	9PRY+BqlWwUPrarhedBXMcA7cRY/EtoN05BVpgfWqODlSMXXQ7/6DIKhiVHQ2EijhoMQfioVPiov4
	VdsMVO+EP+aR9fCILf7ai76MjnZSwVuN7rjS63G3HUwcZyYkTYMh9hY+5gN+oa4TwiU/ekq4FH07A
	jSfY2uEJSnMRP5FloIjTiBtqcc1s1/9Uvh0B+gZDaOIzR9Cv9niNYoLKHx7IL+n3jTM6rz2Z+2HC8
	Y4VNtfs7H/GHCE6839Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslE-00000001iwp-1fdQ;
	Mon, 16 Nov 2026 09:12:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslD-00000001iwE-1x6X;
	Mon, 16 Nov 2026 09:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HCZA7h4dhtZFsDeAg5DlvyxhK/gg8Zq5jpN13t+4dmw=; b=oa+EEamqOqhtbmfRXgbiESguwx
	A4yJhbkxP5YENjKjnMH+WStg/3zmy0D/LpM+2UWGSiO2VMnDx6I9hpuCVxLmUd756IMrI2wN2npba
	yznx9/dqp8i9NNiWPZCtNYWVqSEBYcrZ4AjTd3uxbm86nzEf0HqXqOgarVx0fr737YvdPAros9T3r
	R+bnpmh5LtdvCE/NuNb/Z4dJ99wF1XlpiXAbTF+sbCrLp12TrxS1vB3COZEu7XmMS3vyvmJ6sk7CV
	J9mituyEbOSB138H+yX73IALPt3x7ImloL8UaTZa2W3QY2JcaBRJKLCJmtjaP9oWiaxhGgv1IxTIL
	8IiuqtFw==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsl8-0000000DXsI-0ENl;
	Mon, 16 Nov 2026 09:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820338; x=1826356338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GQ6nvZncaJPWB21Rm55NWdBG4xu4kDWV0iEJex5xTMo=;
  b=Nte6RQMYd5/ZOmlVzh3Asj+kAoXfXI7WYPqxuo1blJQ2FnZ+BWsKJ2zB
   6fVMl2BY5HCvwbLTSEJ2FxkuV/dFceM9ZE4K0cvv/kZaTWlps/XJtDPTp
   FmyWJOARA0sFD6qyffKTATTN/YgREVPEaj4GoaY0k64EzJFTkiqfy/1XU
   Onk+HE89oVwVIbvEYnIid5snqqxMPuwLvqQVHfQqepC/y4Ar1NwhC6aMA
   JyfmacBzjkovGLVM7qFq8kMzuukWtS7GQSjHezGOrc+AuZgiEOckPSTPu
   ehmsf9H5qw8xI9AK9wfj7prJRF4HV/RsP3BSbHtOzx3RDBnmMlCy76qQ5
   Q==;
X-CSE-ConnectionGUID: tx6Mt0KzQaqfDfi9XyZd1Q==
X-CSE-MsgGUID: C05Ni8wfT/SNYXN8KPtqvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3428576"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3428576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:16 -0800
X-CSE-ConnectionGUID: kZCPs1nAQZOSz0ZFfl6zzQ==
X-CSE-MsgGUID: 8V2PE1BoR/CxCzo6AyKZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9486461"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:08 -0800
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
Subject: [PATCH 03/12] drm/atomic: Add FIXMEs around the incorrect use of the .atomic_bypass_check() for async flips
Date: Mon, 16 Nov 2026 11:11:21 +0200
Message-ID: <20261116091130.13950-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091218_731063_2A438BF0 
X-CRM114-Status: GOOD (  18.45  )
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

The "bypass update" stuff has nothing to do with async vs.
sync updates as far as the hardware is concerned (as in
tearing vs. not). What it does is bypass the normal commit
machinery and just let the driver directly perform the
update (as it sees fit) and swap the plane state without
involving the whole crtc commit machinery.

The actual hardware update it does could be an async flip
(as in tearing) or a mailbox flip, depending on how the
driver decides to do it.

The use of bypass updates vs. not is a driver decision, and
the high level atomic code should not be making incorrect
assumptions about it. Toss in some FIXMEs in the hopes
that people will relocate this stuff to a more appropriate
place.

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
 drivers/gpu/drm/drm_atomic_uapi.c        | 6 ++++++
 include/drm/drm_modeset_helper_vtables.h | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 04fcaa72c46f..eb002799497c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1290,6 +1290,12 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 				break;
 			}
 
+			/*
+			 * FIXME this is in the wrong place. Whether to do a
+			 * bypass commit for async flips would is a driver
+			 * decision. Drivers that want this need to just do
+			 * these checks themselves somewhere.
+			 */
 			if (ret && plane->type != DRM_PLANE_TYPE_PRIMARY) {
 				/* ask the driver if this non-primary plane is supported */
 				if (plane_funcs && plane_funcs->atomic_bypass_check)
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index cc511068f53a..d28d8ffc66b4 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1430,10 +1430,10 @@ struct drm_plane_helper_funcs {
 	 * given update can be committed bypassing the atomic commit machinery.
 	 * That is, if it can jump ahead of the state currently queued for update.
 	 *
-	 * This function is also used by drm_atomic_set_property() to determine
+	 * This function is also abused by drm_atomic_set_property() to determine
 	 * if the plane can be flipped in async. The flip flag is used to
 	 * distinguish if the function is used for just the plane state or for a
-	 * flip.
+	 * flip. FIXME this is wrong, and needs to be moved into the drivers.
 	 *
 	 * RETURNS:
 	 *
-- 
2.56.0


