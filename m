Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0770CC43616
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD4620781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+tpMG7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD4620781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3zyMXAwEuptmV31Phwrh4ZqFl0TdhJAoyWwTWGyopo=; b=E+tpMG7YPjwxOHb6/KhGKUfNI
	aCxhO4kAMau5KrNbGWkC6CHFTtgWsmhxdIy1+u57p8hj9foZgki8Nit8zUY8R2pYU1mhMWLmjK7ZO
	WQGYlnz6YI1Y9mbGgOroi/IFYOf260b+5w0GbdPsqlQQR4z2qseedeSYODOJoWaopxMA5ugyKKT9Y
	IxAQWXiycyZwshrsk7vfo5QbQWF+rPbqBQTxHIJ7FlaAdTKzl98jbbKXuXg3Zn6iHxJMoBkWwHodE
	6cjjd3y1gmeYINWcZH9FHRJYDbsa00m0wQ4X3Ddrp8+DgXNuxgVgC36RKc80JJJTZrmjXOY4n1uCk
	XBAexcmOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68jL-0001tu-S6; Thu, 13 Aug 2020 08:36:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68jH-0001qg-0L; Thu, 13 Aug 2020 08:36:56 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE46EAFAC;
 Thu, 13 Aug 2020 08:37:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
Subject: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:25 +0200
Message-Id: <20200813083644.31711-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_043655_335391_BDF6791D 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81a79760ca61..51525b8774c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
-	.gem_free_object_unlocked = amdgpu_gem_object_free,
-	.gem_open_object = amdgpu_gem_object_open,
-	.gem_close_object = amdgpu_gem_object_close,
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_vmap = amdgpu_gem_prime_vmap,
-	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 43f4966331dd..ca2b79f94e99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -36,6 +36,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
 #include "amdgpu.h"
+#include "amdgpu_dma_buf.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
 
@@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
 #endif
 }
 
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
+	.free = amdgpu_gem_object_free,
+	.open = amdgpu_gem_object_open,
+	.close = amdgpu_gem_object_close,
+	.export = amdgpu_gem_prime_export,
+	.vmap = amdgpu_gem_prime_vmap,
+	.vunmap = amdgpu_gem_prime_vunmap,
+};
+
 static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 			       struct amdgpu_bo_param *bp,
 			       struct amdgpu_bo **bo_ptr)
@@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
+
+	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
 	drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
 	INIT_LIST_HEAD(&bo->shadow_list);
 	bo->vm_bo = NULL;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
