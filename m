Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C52C4743B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF99A21BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVRZIXdP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DAath1ks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF99A21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ixJ431PtOna+ac3AyWD082Qs1SVDPPEnkIJWJ4VQD3M=; b=nVRZIXdPbgDU6487gJA/X/aSZ
	ASKqGocDU4yoAdEDRbGwPOI+/sJ8vWdBCCZJAlROt9w851Me3UwHXITOIRE+S4DN10pcftIg/5HWQ
	kSiLJ2FfPotBwqqU1k4PzdgL36gMJNtS/ts0jDCD4IPjNwzhx94US6/zFUMUHAitWBMKmuWehZZCd
	fUzCzUMizUJ0su3ebiU7sS0OAHBIMoWbM/1bGL00P1+i3P4UfCBv/DZRzKmJZ0woU4FeW6DCJH55W
	MEJHF7BqfLnCoEcYt8t+35p1+Y9LudRLtTuHVm6h541cCVD0gGbjdhsaDVem9CIAPq4G7JQ5Xg2t9
	9JXIgZpvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL1wC-0005zD-BP; Wed, 23 Sep 2020 10:23:48 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL1us-00053C-Og; Wed, 23 Sep 2020 10:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=08tqjrbI9kcG79mEGfnvz7k9I8ehudDlLWiP3MPJ5Ug=; b=DAath1ksU5uzZQE7pW6+WV9TcN
 wgqAXQrDRvgedJ3Dye+6AqQCLAb5KT1MiQX+sjCRfS//LzBJYslQA9utMu5Bx70q2Biq7yakw6ruQ
 wFSlchl/KovAqNGNiEgBp4tEnUZI7U9o2UaFJtGifgyrTynWabLEpQ5vwAdBfWcjxBjBGN3JhS6nC
 VzhfCszLNbH7ywHUWZ0iz2iYfGRv0lEC82NWly/2kz6UKlSrf9kepf9ibFg5dn4es9JXu0p86ltSy
 RhzlXC9SEO9xAjj/FJmhbG0dEYCyIuQsQmbkiIdm1QrA5MDz0bKpj+iq0y5f5w2f5P0u4Tn3qsgQc
 4T9b/sUQ==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL1um-0003H2-UI; Wed, 23 Sep 2020 10:22:25 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D620B27A;
 Wed, 23 Sep 2020 10:22:57 +0000 (UTC)
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
Subject: [PATCH v3 19/22] drm/vkms: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:56 +0200
Message-Id: <20200923102159.24084-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_112221_792271_AE1659A3 
X-CRM114-Status: GOOD (  11.74  )
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
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in vkms.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
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
