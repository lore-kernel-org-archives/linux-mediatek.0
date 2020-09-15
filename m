Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1AEC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:02:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D0C20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3LKb52vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D0C20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hg2nGjkHUZ1HdNUwhwvNvTyxRBfr19i6DxTA9V6F7zQ=; b=3LKb52vyZL0xGjDEmc/LOlySU
	GvhARa0VYGycTFDN8ARSWJh8m6U4lySkdOja/3QwDc3WMz7yoTodDv2XVxvjAWuMo76P1nIyGP/7G
	czyoEpw2WfFJ24b1T1qvoTkRyro0STqUDfN3C5FzCSMwVWqUO/VdqqYNYtzcWwbReqcYJMg8s7ltG
	sMpUWXk6iu+SFCVjfCek1QzOHAtvU4oYhb8bo5CQYGQe4J0aplnl6bOgN0zGYUo0nH5R+3jmVAKcH
	Sa8D2DMzt61eZsguXc3eAfalWOy34x6SX0saGCaa6lacCZLeLJu6Q62UYmCs15lh49PC1uF50Ot7L
	GVDLnLBwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICSx-0004hy-Px; Tue, 15 Sep 2020 15:01:55 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICRO-0003fw-R2; Tue, 15 Sep 2020 15:00:20 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FA55B2B1;
 Tue, 15 Sep 2020 15:00:32 +0000 (UTC)
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
Subject: [PATCH v2 18/21] drm/vkms: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:55 +0200
Message-Id: <20200915145958.19993-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_110019_159333_9FCCB882 
X-CRM114-Status: GOOD (  14.34  )
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
per-instance callbacks in vkms.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
 drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index cb0b6230c22c..726801ab44d4 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
 	.release	= drm_release,
 };
 
-static const struct vm_operations_struct vkms_gem_vm_ops = {
-	.fault = vkms_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
@@ -98,8 +92,6 @@ static struct drm_driver vkms_driver = {
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	.dumb_create		= vkms_dumb_create,
-	.gem_vm_ops		= &vkms_gem_vm_ops,
-	.gem_free_object_unlocked = vkms_gem_free_object,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index a017fc59905e..19a0e260a4df 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -7,6 +7,17 @@
 
 #include "vkms_drv.h"
 
+static const struct vm_operations_struct vkms_gem_vm_ops = {
+	.fault = vkms_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
+	.free = vkms_gem_free_object,
+	.vm_ops = &vkms_gem_vm_ops,
+};
+
 static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 						 u64 size)
 {
@@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
+	obj->gem.funcs = &vkms_gem_object_funcs;
+
 	size = roundup(size, PAGE_SIZE);
 	ret = drm_gem_object_init(dev, &obj->gem, size);
 	if (ret) {
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
