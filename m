Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3532BC2D0F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D8120663
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzLLerL+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D8120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zu1JIgWROn3PFnO9jQ5Xa0sec2xfS4EZdIEX323ZWE4=; b=rzLLerL+XHBcqaXBMszIs1zTl
	ri96Vic0/RC6Mco0qK9aF7PCTRZQ1tHrbl6oll/OsegsvNrwyq9AOwBQQhvt8htliScVtrgfkoV7q
	9vP3xPJfvB4XivBiAeO+EDc3b3LbBocYKAlk1kUvxo33Kiaw+ljN43geFlzclKCQbknxGBM0u4zFA
	OVAj7N0S3fviOMZiK7ci7CpOM1ZaGvBcadZECUGAufZCaXseRyqbRxnz69Ykec29gh4GqCQTn+qFb
	Jhz3XDJA8kjoy9RHdKj8iWjFf7UXGIe0OeHeLWADXs4pPTTv4a4GWrlw/5m92uPpkKHhugdJeyVCJ
	UwXkb7QhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICRN-0003fW-F7; Tue, 15 Sep 2020 15:00:17 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICRC-0003Yy-3Y; Tue, 15 Sep 2020 15:00:07 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA87AAF5D;
 Tue, 15 Sep 2020 15:00:18 +0000 (UTC)
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
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Subject: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:38 +0200
Message-Id: <20200915145958.19993-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_110006_484303_3E53A348 
X-CRM114-Status: GOOD (  17.40  )
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

v2:
	* move object-function instance to amdgpu_gem.c (Christian)
	* set callbacks in amdgpu_gem_object_create() (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 23 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h    |  5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6edde2b9e402..840ca8f9c1e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver = {
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index aa7f230c71bf..aeecd5dc3ce4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -36,9 +36,12 @@
 
 #include "amdgpu.h"
 #include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
 #include "amdgpu_xgmi.h"
 
-void amdgpu_gem_object_free(struct drm_gem_object *gobj)
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
+
+static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
 
@@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 		return r;
 	}
 	*obj = &bo->tbo.base;
+	(*obj)->funcs = &amdgpu_gem_object_funcs;
 
 	return 0;
 }
@@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
  * Call from drm_gem_handle_create which appear in both new and open ioctl
  * case.
  */
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-			   struct drm_file *file_priv)
+static int amdgpu_gem_object_open(struct drm_gem_object *obj,
+				  struct drm_file *file_priv)
 {
 	struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
@@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	return 0;
 }
 
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-			     struct drm_file *file_priv)
+static void amdgpu_gem_object_close(struct drm_gem_object *obj,
+				    struct drm_file *file_priv)
 {
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	ttm_eu_backoff_reservation(&ticket, &list);
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
 /*
  * GEM ioctls.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
index e0f025dd1b14..637bf51dbf06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
@@ -33,11 +33,6 @@
 #define AMDGPU_GEM_DOMAIN_MAX		0x3
 #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tbo.base)
 
-void amdgpu_gem_object_free(struct drm_gem_object *obj);
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
 unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ac043baac05d..c4e82a8fa53f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -561,6 +561,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
+
 	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
 	INIT_LIST_HEAD(&bo->shadow_list);
 	bo->vm_bo = NULL;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
