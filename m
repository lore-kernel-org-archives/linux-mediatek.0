Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F740C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE096128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE096128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggObxzTD4f6jddZ13vwp81FW7ESOw06I0GGkNfBiNp0=; b=xAJr6pMp4LYdTs
	kNd6wRztI0CrjpEn1a9DypiMm7tvHqlR2Es+ndo0Nc/jEnKQ0vHlni0boZjwGVgBeZFPmaVXdhD83
	QZC7lFpX9SikjGUTmcaduxnyojqg8e1I+AZhYK5hO80jXGYCktR+JBk8g3gaQD3Oc1TsU/Ly4/XJP
	k44r/UWvLS+bz6Mu10EjtP9iK1YtKmN98r/zBSoUm2jZUMbXeYqredYsxiLo5pppPfKAqjA+ctk72
	l4wv8EpA9ly8r7SLV+OJqdqgQ2t2mvjpG72d9N9Y59ORHMCkOkDvRKYuaNKk4yv4yYrYIV1TOaLAW
	rqetOGBGcZb4wP9L5xHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwOv-00DKOl-Bg; Wed, 09 Jun 2021 11:29:37 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwFu-00DHFH-8w; Wed, 09 Jun 2021 11:20:20 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D370E219BC;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
 b=XnWyLcXU2DzGKjVpWY+v6GsFXDEvAnsTBuiSFsLYtDqOuSuQ24o7BZ7onxGf1xLaPad5mU
 918hNEVR8evAVRyMQoWrhChlZiOEb+TV/XShyiMhFRl8SP//hv3k9Igf72r/48f0zcqDEc
 MPAr1LiOPOj6guYJivFP9U39T2osWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
 b=3hlvfUg2sc+GZSp3mXVxRN0jtCQ6ZZAWw26CXhEuVMNAOePsQpDVWMJIvwDLKIJh/YG3fs
 M2puEtDQ2CPjnHBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 354B811A98;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
 b=XnWyLcXU2DzGKjVpWY+v6GsFXDEvAnsTBuiSFsLYtDqOuSuQ24o7BZ7onxGf1xLaPad5mU
 918hNEVR8evAVRyMQoWrhChlZiOEb+TV/XShyiMhFRl8SP//hv3k9Igf72r/48f0zcqDEc
 MPAr1LiOPOj6guYJivFP9U39T2osWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
 b=3hlvfUg2sc+GZSp3mXVxRN0jtCQ6ZZAWw26CXhEuVMNAOePsQpDVWMJIvwDLKIJh/YG3fs
 M2puEtDQ2CPjnHBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2DYmDO6jwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com,
 sean@poorly.run, airlied@redhat.com, kraxel@redhat.com, hjc@rock-chips.com,
 heiko@sntech.de, oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/9] drm/etnaviv: Implement mmap as GEM object function
Date: Wed,  9 Jun 2021 13:20:04 +0200
Message-Id: <20210609112012.10019-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_042018_648943_41BEA5D6 
X-CRM114-Status: GOOD (  13.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective etnaviv functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
 4 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index f0a07278ad04..7dcc6392792d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-static const struct file_operations fops = {
-	.owner              = THIS_MODULE,
-	.open               = drm_open,
-	.release            = drm_release,
-	.unlocked_ioctl     = drm_ioctl,
-	.compat_ioctl       = drm_compat_ioctl,
-	.poll               = drm_poll,
-	.read               = drm_read,
-	.llseek             = no_llseek,
-	.mmap               = etnaviv_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
@@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
-	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
+	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 003288ebd896..049ae87de9be 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -47,12 +47,9 @@ struct etnaviv_drm_private {
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sg);
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..8f1b5af47dd6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 {
 	pgprot_t vm_page_prot;
 
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
 	vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
@@ -154,19 +153,11 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 	return 0;
 }
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+static int etnaviv_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	struct etnaviv_gem_object *obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret) {
-		DBG("mmap failed: %d", ret);
-		return ret;
-	}
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
-	obj = to_etnaviv_bo(vma->vm_private_data);
-	return obj->ops->mmap(obj, vma);
+	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
 }
 
 static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
@@ -567,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
+	.mmap = etnaviv_gem_mmap,
 	.vm_ops = &vm_ops,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index b390dd4d60b7..4d9e8e9b6191 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -34,19 +34,6 @@ int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	return 0;
 }
 
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma)
-{
-	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
-}
-
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach) {
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
