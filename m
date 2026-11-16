Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72F606A335
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QszjZEoo;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K7KYmL/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wfQFJgN09n6YBy/Daf3IIALw6X6KhFq9Ni70FfSI+3Y=; b=QszjZEoo8u1Fxo
	swfM6SOcPMK/qVkISXpTdzi79dRYt0C/mbeu5LXKG1H2SrVDd2g9DX8cMNwX17qG40IXK4Cp2uZQ9
	PO5rCH57Gyg62dOueaRBCbILQS9Ei2rscXIkmReJncMQKgqtnNUj+tUnYxY1dAPTqodzZ8BhunoSv
	aCJtKaytgTjThPckJbVkktEC7PGkqgtZSBeF+hSqA8z++4Cefb4mL3ReRgfpUDvGxpjMkvOotZSKO
	6HmH3b5hR6/aSkLR4iptL3BAQQ73CxkcLuio5bIFmIFyWVcHjg/8PHoeo2dWD7gH5Ai2oksGnWI8r
	v22EXj5etZw5EqIrCneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSslu-00000001jO4-1oa4;
	Mon, 16 Nov 2026 09:13:06 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsls-00000001jMw-0gcP;
	Mon, 16 Nov 2026 09:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820384; x=1826356384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S5+QBdtzFuG1IgfXisOS9Q/+F8LHAa5I2PukkMFG620=;
  b=K7KYmL/+xjJjIzCLOby2YMx8cFhOVAohgbjok0dxd56pyLzYrL+p9tWV
   h3EmuYfLd6rj6MQf4T0GF59olz7x17YAZU2eOB1fqIZtfM4IzvNYMLQUP
   p6EfGhbfjduH1Jc3I13MdKk3S5vOdL6OAqh5q+qIhlU1/sEd9qFmdZYC/
   bBR4YguXYIcP1BEyL/L65ffHuyWun5wmZJ5NeiUrf2ObJyLXGg1bdTMxU
   IzOIeRuURYHfNtkuQJeFumyMx0ucyh43CMv/C8f2Av4Nblz87lVcnaLgE
   F18Hn6gt/xCsmUKA5SUUijKGjZpsKu9LpeJ07gC6uTabYKSIoK/xy73tI
   A==;
X-CSE-ConnectionGUID: ORVBVdDgTq2hUbTzYiowEg==
X-CSE-MsgGUID: sTDwV8EiTESK0wGawqQPZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3443480"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3443480"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:03 -0800
X-CSE-ConnectionGUID: c7lMIM38S3al4Q++ns5YpQ==
X-CSE-MsgGUID: TXHuWpbRTv+ZkikzxiX0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9909191"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:56 -0800
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
Subject: [PATCH 08/12] drm/atomic/uapi: Add a FIXME about colorop vs. async flips
Date: Mon, 16 Nov 2026 11:11:26 +0200
Message-ID: <20261116091130.13950-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011304_246613_EF2D6A51 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

The colorop stuff in the atomic ioctl handler is completely
missing any async flip handling. Add a FIXME in the hopes
that someone will fix it.

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
 drivers/gpu/drm/drm_atomic_uapi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index cf1edcb242cc..7517950d2e51 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1352,6 +1352,8 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		struct drm_colorop_state *colorop_state;
 		bool replaced = false;
 
+		/* FIXME async flip checks completely missing here */
+
 		colorop_state = drm_atomic_get_colorop_state(state, colorop);
 		if (IS_ERR(colorop_state)) {
 			ret = PTR_ERR(colorop_state);
-- 
2.56.0


