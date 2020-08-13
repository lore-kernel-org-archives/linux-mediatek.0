Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6A3C43458
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2781B20781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnbA3AXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2781B20781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GYbSlemTaUcu0SUNvyT3iFYC0VlIViEyVZ4NF6sseI=; b=dnbA3AXowYNliUvB7bgjh03YP
	l5z1i3Y9z+TsvTML64EvM5ZsBLStHZGYaqtXzF+SkkFUzUEU2RYh7NpnHg/JhDE4nwN9iRVNNbk2a
	XkRvhGG9rzAMN8sV9Ea9l8vgj2bvbmN3MGQLfcihrkql93YG8bJS1l80/M86VAZ2xLq6BCnvtlX2K
	35CG5l311iOrvYwoHCBefIWOj5ac1eNOiMYaXV0YOSEuuOR+giO5iK+Pe9N3FvmRGUnwnoNctY77l
	tIq1B69v3tdgUPQka5T/F/dLh3YUNeJWWuG+rZdKeJTMeAq3+UVoUs9rGtTEdEFu4bbRQ38oY23iH
	irl1QKRUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68jW-00020n-8q; Thu, 13 Aug 2020 08:37:10 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68jH-0001qk-IN; Thu, 13 Aug 2020 08:36:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 757D3AFCD;
 Thu, 13 Aug 2020 08:37:15 +0000 (UTC)
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
Subject: [PATCH 03/20] drm/etnaviv: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:27 +0200
Message-Id: <20200813083644.31711-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_043655_861082_66A20B92 
X-CRM114-Status: GOOD (  14.94  )
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
per-instance callbacks in etnaviv. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 13 -------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 19 ++++++++++++++++++-
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a9a3afaef9a1..aa270b79e585 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -468,12 +468,6 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-static const struct vm_operations_struct vm_ops = {
-	.fault = etnaviv_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations fops = {
 	.owner              = THIS_MODULE,
 	.open               = drm_open,
@@ -490,16 +484,9 @@ static struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
 	.open               = etnaviv_open,
 	.postclose           = etnaviv_postclose,
-	.gem_free_object_unlocked = etnaviv_gem_free_object,
-	.gem_vm_ops         = &vm_ops,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_pin      = etnaviv_gem_prime_pin,
-	.gem_prime_unpin    = etnaviv_gem_prime_unpin,
-	.gem_prime_get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
-	.gem_prime_vmap     = etnaviv_gem_prime_vmap,
-	.gem_prime_vunmap   = etnaviv_gem_prime_vunmap,
 	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 4d8dc9236e5f..914f0867ff71 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -49,7 +49,6 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
 int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
 void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index f06e19e7be04..66de9f299c76 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -170,7 +170,7 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	return obj->ops->mmap(obj, vma);
 }
 
-vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
+static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -560,6 +560,22 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
 	mutex_unlock(&priv->gem_lock);
 }
 
+static const struct vm_operations_struct vm_ops = {
+	.fault = etnaviv_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
+	.free = etnaviv_gem_free_object,
+	.pin = etnaviv_gem_prime_pin,
+	.unpin = etnaviv_gem_prime_unpin,
+	.get_sg_table = etnaviv_gem_prime_get_sg_table,
+	.vmap = etnaviv_gem_prime_vmap,
+	.vunmap = etnaviv_gem_prime_vunmap,
+	.vm_ops = &vm_ops,
+};
+
 static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
 {
@@ -594,6 +610,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 	INIT_LIST_HEAD(&etnaviv_obj->vram_list);
 
 	*obj = &etnaviv_obj->base;
+	(*obj)->funcs = &etnaviv_gem_object_funcs;
 
 	return 0;
 }
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
