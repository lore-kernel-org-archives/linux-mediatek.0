Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4AC43617
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5178F2078B
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="11hXfDyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5178F2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5nxFXuogu0cUiGyuxjvBjrig5ENk91Tb5BW0KbUu3ZY=; b=11hXfDyUqXB4TvXfO7ui/rSFJ
	SQeCjS3CsWlKmkbMgxLwet5k+u6aA1zK0Duu0tx85Gc0svvN23IgjhNr4/bwtzFgKGwVKaHqkXXov
	TsXVL+OZuhNlPKqS25rQLGXQxLmUOcdoTD9IJxkZnOLoCaSwATlrLk7go/aZiJzp6YmypbUEgz8Hd
	nP+xZTXk8bxOjijFfbnqHr9KTHFoHrjj71gRF3kyUwdTNv8++a7htIP2wPKFVcSin6zdCvCaNNX5/
	eSMBGHHzpVoScLUaHOJtzatV9ZeZkFoZpLjglTjzUaT6ZshgnTPimLK2yrSY4Du/TJn7xyttCwdwY
	TunhiaUhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68jo-0002FK-Lm; Thu, 13 Aug 2020 08:37:28 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68jM-0001tb-5Z; Thu, 13 Aug 2020 08:37:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10A75AFB0;
 Thu, 13 Aug 2020 08:37:21 +0000 (UTC)
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
Subject: [PATCH 09/20] drm/nouveau: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:33 +0200
Message-Id: <20200813083644.31711-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_043700_505486_C3199F22 
X-CRM114-Status: GOOD (  14.44  )
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
per-instance callbacks in nouveau.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  9 ---------
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.h   |  2 ++
 drivers/gpu/drm/nouveau/nouveau_prime.c |  2 ++
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..dc2388efc857 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1207,16 +1207,7 @@ driver_stub = {
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_pin = nouveau_gem_prime_pin,
-	.gem_prime_unpin = nouveau_gem_prime_unpin,
-	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
-	.gem_prime_vmap = nouveau_gem_prime_vmap,
-	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
-
-	.gem_free_object_unlocked = nouveau_gem_object_del,
-	.gem_open_object = nouveau_gem_object_open,
-	.gem_close_object = nouveau_gem_object_close,
 
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = nouveau_display_dumb_map_offset,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 81f111ad3f4f..b04b8f6bb9d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -169,6 +169,17 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	ttm_bo_unreserve(&nvbo->bo);
 }
 
+const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
+	.free = nouveau_gem_object_del,
+	.open = nouveau_gem_object_open,
+	.close = nouveau_gem_object_close,
+	.pin = nouveau_gem_prime_pin,
+	.unpin = nouveau_gem_prime_unpin,
+	.get_sg_table = nouveau_gem_prime_get_sg_table,
+	.vmap = nouveau_gem_prime_vmap,
+	.vunmap = nouveau_gem_prime_vunmap,
+};
+
 int
 nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		uint32_t tile_mode, uint32_t tile_flags,
@@ -194,6 +205,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
+	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
+
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index 978e07591990..b35c180322e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -5,6 +5,8 @@
 #include "nouveau_drv.h"
 #include "nouveau_bo.h"
 
+extern const struct drm_gem_object_funcs nouveau_gem_object_funcs;
+
 static inline struct nouveau_bo *
 nouveau_gem_object(struct drm_gem_object *gem)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index bae6a3eccee0..30f616aa251e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -79,6 +79,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
 
+	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
+
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
