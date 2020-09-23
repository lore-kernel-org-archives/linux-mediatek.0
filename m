Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188DEC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A501C21BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mcmim0nN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A501C21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Zj+r0lzaqTOnrD8ZXVt21vJsNxGDukNYLHGIIvY3Z8=; b=mcmim0nNRNWj1xOfGZhv9glLv
	TXh++0/HCrTletqMDjjqX4OZd4UdoK7ihNUjwCZrttAjCduCoZBFdvhPZOCTCJDqLG0sNG/PoV+gZ
	QF7+/ryjcA3kpukepnudd9d9UgMeSyG+5cCo7DjDqjUNJ1PIRU+jUAyTATh/Bc4jA/7Q4bgNJc2V+
	OXWylvL8mBbEWLX7VFTKjcA/Fvl+mo7/QLXtmg+GppXjI4HmHVd38lwtOR0Je97Nfrw2Z9PCz7PSc
	3ZgTqntvL2cDRrk8yYErdeklb3KK/3MC/+kEQfbNdZH2p8rsFrTnotyw1lUgpsWWCLcpuvZUzJJaZ
	cUWZ7/LNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL1vr-0005fT-Bw; Wed, 23 Sep 2020 10:23:27 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL1ub-0004r6-0i; Wed, 23 Sep 2020 10:22:16 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7562DB287;
 Wed, 23 Sep 2020 10:22:44 +0000 (UTC)
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
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: [PATCH v3 06/22] drm/i915: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:43 +0200
Message-Id: <20200923102159.24084-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_062209_331228_A1BE3C9A 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: linux-samsung-soc@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-arm-msm@vger.kernel.org,
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
per-instance callbacks in i915.

v2:
	* move object-function instance to i915_gem_object.c (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 ---
 drivers/gpu/drm/i915/i915_drv.c               |  4 ----
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 ---
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c8421fd9d2dc..3389ac972d16 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -39,9 +39,18 @@ static struct i915_global_object {
 	struct kmem_cache *slab_objects;
 } global;
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs;
+
 struct drm_i915_gem_object *i915_gem_object_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	struct drm_i915_gem_object *obj;
+
+	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	if (!obj)
+		return NULL;
+	obj->base.funcs = &i915_gem_object_funcs;
+
+	return obj;
 }
 
 void i915_gem_object_free(struct drm_i915_gem_object *obj)
@@ -101,7 +110,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
 }
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
+static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem);
 	struct drm_i915_file_private *fpriv = file->driver_priv;
@@ -264,7 +273,7 @@ static void __i915_gem_free_work(struct work_struct *work)
 	i915_gem_flush_free_objects(i915);
 }
 
-void i915_gem_free_object(struct drm_gem_object *gem_obj)
+static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -403,6 +412,12 @@ int __init i915_global_objects_init(void)
 	return 0;
 }
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs = {
+	.free = i915_gem_free_object,
+	.close = i915_gem_close_object,
+	.export = i915_gem_prime_export,
+};
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d46db8d8f38e..eaf3d4147be0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -38,9 +38,6 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file);
-void i915_gem_free_object(struct drm_gem_object *obj);
-
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
 struct sg_table *
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index acc32066cec3..45e719c79183 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1750,12 +1750,8 @@ static struct drm_driver driver = {
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = i915_gem_prime_export,
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 397c313a8b69..79664046c622 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -87,9 +87,6 @@ static struct drm_driver mock_driver = {
 	.name = "mock",
 	.driver_features = DRIVER_GEM,
 	.release = mock_device_release,
-
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
 };
 
 static void release_dev(struct device *dev)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
