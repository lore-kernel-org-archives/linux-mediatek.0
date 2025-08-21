Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9C9CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoxRmaxxQADnqcycyoHhSL9xkk4EZyjilDc77Iaw2zM=; b=R0wilh3HDjImo+OPOP5Nw7ne3K
	eSk0KeMIq+/G0ig//JlgXaPoB/lQEbtz/4D+L3UBRdEEeWa6bItDwRftPaj7CGB3wW59cUg/tgbOB
	voJwGy8/i72xLiVJ31mWjLbEYoLtifE6+C6NqU+U8fw6fEPaL6XFpa4rpbY35X2xT/afBPQ1dkggo
	xC8HZ3coBrWjvWDgNmIXFPUDeBRM0JNmIpJsvvWKaSLK+ae5Phq3RFSmIAKslT9sbnq4kj16CeYXq
	Go4v3pEzieaOAJSZBnR8JFPd776PqNU8iMNqZXnJeMbxlsh9lmBJrwHXjzpfM3oUuhB1Pzh5EWD/e
	ja2SVgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2UX-0000000GadW-0rqT;
	Thu, 21 Aug 2025 10:25:57 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0ZC-0000000GE0z-0j4u
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Aug 2025 08:22:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 533F922646;
	Thu, 21 Aug 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoxRmaxxQADnqcycyoHhSL9xkk4EZyjilDc77Iaw2zM=;
	b=g3XHvqvVBEM8AwKbBE2iVr6hPHPzodo5lBLrSozQE4MOsgu/Fea6yDs+gPYBMtx5zQFUVH
	8NZy28ag7qAlBqiImkeT+4NbMTBXr1zbeVPscRj+fEVOEhPKdxAIV8+tJVANJvn4rEoRRl
	zKufUwKQjKFARovGAQSvPOYY44d8+TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoxRmaxxQADnqcycyoHhSL9xkk4EZyjilDc77Iaw2zM=;
	b=PYFhYaz4VPL6J/2QkNGr+lm4k9g3//KnApzck233sh/1eXLL3Gq5qsy1G6OHAxaFIw1/Ui
	pJ8LnsmhTOdytkCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DG22LcCd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BUuel30l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoxRmaxxQADnqcycyoHhSL9xkk4EZyjilDc77Iaw2zM=;
	b=DG22LcCdUIYF7vs2qclR6DRsAqGM5NFivzD0X43NZcP5tqwKFHjLzp/8E3PxlunuVp2kEF
	bavBFT2sP7DsGKivwnfX6WdNT/3rG886zGHOLTLuryfpBooysPSPBpqmiNcjjxkLFYeaOn
	ylQcCPzzMo8YAOXddP23aeZijdPRbdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoxRmaxxQADnqcycyoHhSL9xkk4EZyjilDc77Iaw2zM=;
	b=BUuel30lckd9XJ1QZmWpPepl5cNwTMLQrxT34Koh0W4gkwbvBQ9hA9Mbuw877aCeopyxqc
	TVfw6h67Gi0/zRDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F477139A8;
	Thu, 21 Aug 2025 08:22:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4JKyJTjXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: [PATCH v6 09/25] drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:16 +0200
Message-ID: <20250821081918.79786-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 533F922646
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_012238_504199_7B7F8BAE 
X-CRM114-Status: GOOD (  17.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 128.

The hibmc driver's new hibmc_dumb_create() is similar to the one
in GEM VRAM helpers. The driver was the only caller of
drm_gem_vram_fill_create_dumb(). Remove the now unused helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c         | 65 -------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 25 ++++++-
 include/drm/drm_gem_vram_helper.h             |  6 --
 3 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index dd4537bf63dc..d5a6d5134c55 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -407,71 +407,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-/**
- * drm_gem_vram_fill_create_dumb() - Helper for implementing
- *				     &struct drm_driver.dumb_create
- *
- * @file:		the DRM file
- * @dev:		the DRM device
- * @pg_align:		the buffer's alignment in multiples of the page size
- * @pitch_align:	the scanline's alignment in powers of 2
- * @args:		the arguments as provided to
- *			&struct drm_driver.dumb_create
- *
- * This helper function fills &struct drm_mode_create_dumb, which is used
- * by &struct drm_driver.dumb_create. Implementations of this interface
- * should forwards their arguments to this helper, plus the driver-specific
- * parameters.
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args)
-{
-	size_t pitch, size;
-	struct drm_gem_vram_object *gbo;
-	int ret;
-	u32 handle;
-
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	if (pitch_align) {
-		if (WARN_ON_ONCE(!is_power_of_2(pitch_align)))
-			return -EINVAL;
-		pitch = ALIGN(pitch, pitch_align);
-	}
-	size = pitch * args->height;
-
-	size = roundup(size, PAGE_SIZE);
-	if (!size)
-		return -EINVAL;
-
-	gbo = drm_gem_vram_create(dev, size, pg_align);
-	if (IS_ERR(gbo))
-		return PTR_ERR(gbo);
-
-	ret = drm_gem_handle_create(file, &gbo->bo.base, &handle);
-	if (ret)
-		goto err_drm_gem_object_put;
-
-	drm_gem_object_put(&gbo->bo.base);
-
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
-	return 0;
-
-err_drm_gem_object_put:
-	drm_gem_object_put(&gbo->bo.base);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
-
 /*
  * Helpers for struct ttm_device_funcs
  */
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 289304500ab0..14a018c47c73 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -18,10 +18,12 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_module.h>
 #include <drm/drm_vblank.h>
 
@@ -70,7 +72,28 @@ static irqreturn_t hibmc_dp_interrupt(int irq, void *arg)
 static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_128, 0);
+	if (ret)
+		return ret;
+
+	gbo = drm_gem_vram_create(dev, args->size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->bo.base, &args->handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&gbo->bo.base);
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
+	return ret;
 }
 
 static const struct drm_driver hibmc_driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 2dd42bed679d..1190064f5760 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -98,12 +98,6 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map);
 
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args);
-
 /*
  * Helpers for struct drm_driver
  */
-- 
2.50.1


