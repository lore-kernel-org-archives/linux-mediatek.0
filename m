Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D54C2D0AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8402080C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TWLGG5eX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E8402080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yTxo4e/J6IMv9URbs7h/zsefhDSvgPnCVhZRjLE0l6A=; b=TWLGG5eXLvr6bfk/SKfWMhYBy
	Tqp08Hi4N3ggUAnZGZ8PyGYP870HMP0IE7SF+RWXuzqmeKucPzKLroAP6IWWqCIRF11OqKu48+X75
	4IWknoKKtM/+ho2pfiZwAfYyepC1B/clNOJT2qdrJ7yGSuz75LhUKW4xO0N+Q6K2lRlZpsurp7U1e
	FUgTfofYTHC5J8TP/00Mck+KyhCQ66/VYr4b9bOBUynN+vNbrjs1xF0fZcS0aRXYB7Ool7KVTwbN6
	V/8vd680Og2cQTPZqk4dLRs95z07+j6ncCxJXH+Oz2bB5fHQieWxoLMpRuF2pxwSN9s8q3mE+1EPN
	QkgVDN06w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68jw-0002L6-S3; Thu, 13 Aug 2020 08:37:36 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68jO-0001vG-Vj; Thu, 13 Aug 2020 08:37:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C77FAB598;
 Thu, 13 Aug 2020 08:37:23 +0000 (UTC)
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
Subject: [PATCH 12/20] drm/radeon: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:36 +0200
Message-Id: <20200813083644.31711-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_043703_295196_37931CD9 
X-CRM114-Status: GOOD (  15.86  )
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
per-instance callbacks in radeon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_drv.c    | 23 +----------------------
 drivers/gpu/drm/radeon/radeon_object.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 4cd30613fa1d..65061c949aee 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
 int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
 void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
 irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
-void radeon_gem_object_free(struct drm_gem_object *obj);
-int radeon_gem_object_open(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-void radeon_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
-					int flags);
 extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int crtc,
 				      unsigned int flags, int *vpos, int *hpos,
 				      ktime_t *stime, ktime_t *etime,
@@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
 int radeon_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
-struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 							struct dma_buf_attachment *,
 							struct sg_table *sg);
-int radeon_gem_prime_pin(struct drm_gem_object *obj);
-void radeon_gem_prime_unpin(struct drm_gem_object *obj);
-void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
-void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
@@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
 	}
 
 	ret = drm_ioctl(filp, cmd, arg);
-	
+
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
@@ -609,22 +597,13 @@ static struct drm_driver kms_driver = {
 	.irq_uninstall = radeon_driver_irq_uninstall_kms,
 	.irq_handler = radeon_driver_irq_handler_kms,
 	.ioctls = radeon_ioctls_kms,
-	.gem_free_object_unlocked = radeon_gem_object_free,
-	.gem_open_object = radeon_gem_object_open,
-	.gem_close_object = radeon_gem_object_close,
 	.dumb_create = radeon_mode_dumb_create,
 	.dumb_map_offset = radeon_mode_dumb_mmap,
 	.fops = &radeon_driver_kms_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = radeon_gem_prime_export,
-	.gem_prime_pin = radeon_gem_prime_pin,
-	.gem_prime_unpin = radeon_gem_prime_unpin,
-	.gem_prime_get_sg_table = radeon_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
-	.gem_prime_vmap = radeon_gem_prime_vmap,
-	.gem_prime_vunmap = radeon_gem_prime_vunmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index bb7582afd803..882390e15dfe 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -45,6 +45,19 @@ int radeon_ttm_init(struct radeon_device *rdev);
 void radeon_ttm_fini(struct radeon_device *rdev);
 static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
 
+void radeon_gem_object_free(struct drm_gem_object *obj);
+int radeon_gem_object_open(struct drm_gem_object *obj,
+				struct drm_file *file_priv);
+void radeon_gem_object_close(struct drm_gem_object *obj,
+				struct drm_file *file_priv);
+struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
+					int flags);
+struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
+int radeon_gem_prime_pin(struct drm_gem_object *obj);
+void radeon_gem_prime_unpin(struct drm_gem_object *obj);
+void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
+void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+
 /*
  * To exclude mutual BO access we rely on bo_reserve exclusion, as all
  * function are calling it.
@@ -180,6 +193,18 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 	}
 }
 
+static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
+	.free = radeon_gem_object_free,
+	.open = radeon_gem_object_open,
+	.close = radeon_gem_object_close,
+	.export = radeon_gem_prime_export,
+	.pin = radeon_gem_prime_pin,
+	.unpin = radeon_gem_prime_unpin,
+	.get_sg_table = radeon_gem_prime_get_sg_table,
+	.vmap = radeon_gem_prime_vmap,
+	.vunmap = radeon_gem_prime_vunmap,
+};
+
 int radeon_bo_create(struct radeon_device *rdev,
 		     unsigned long size, int byte_align, bool kernel,
 		     u32 domain, u32 flags, struct sg_table *sg,
@@ -209,6 +234,7 @@ int radeon_bo_create(struct radeon_device *rdev,
 	bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
+	bo->tbo.base.funcs = &radeon_gem_object_funcs;
 	drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
 	bo->rdev = rdev;
 	bo->surface_reg = -1;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
