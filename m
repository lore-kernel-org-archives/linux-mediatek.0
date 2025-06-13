Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D614EC61DB2
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jun 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRwKRV0MN4EshRJlfLi0Dz/wz1XffUkWEszixE41OU0=; b=w9Qw8G7+msvjOG0JJ1Z4LmzsyK
	KX41i7Jvx2OKvULfbntNF57tUOI9YnAUtLbVEvIzt8J+1mfOXp6HsObf00T95dvh4Sr/g9x9D0pk6
	kB/9D5O6H7O0456PH8TuslHGvChJkmGvpk+YliT9K09+zsFONu89tP8HAsNMm7+vq47EVf6kEC1Xn
	SYysv8xlQv3IOUKb0nQEc8+UqIc5AC899MMpyovZ+5ygFhVMvvT7mHyb4YTSxEcdeFgyBgAKpkNyI
	F381J5LSw/zMX8BH12hTt6+G7UlkVxIML+Ih+l0SDIammwqEld+lv4v5RBCqxCyCv5eMumzixq/xv
	LvbHqh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1Lt-0000000G1zW-2Fif;
	Fri, 13 Jun 2025 10:09:37 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0L2-0000000Fq89-1xzK
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jun 2025 09:04:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A00521268;
	Fri, 13 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 785D713A9C;
	Fri, 13 Jun 2025 09:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qH36G6TpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:36 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 01/25] drm/dumb-buffers: Sanitize output on errors
Date: Fri, 13 Jun 2025 11:00:20 +0200
Message-ID: <20250613090431.127087-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 0A00521268
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_020440_646424_C6DAC82C 
X-CRM114-Status: GOOD (  12.76  )
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

The ioctls MODE_CREATE_DUMB and MODE_MAP_DUMB return results into a
memory buffer supplied by user space. On errors, it is possible that
intermediate values are being returned. The exact semantics depends
on the DRM driver's implementation of these ioctls. Although this is
most-likely not a security problem in practice, avoid any uncertainty
by clearing the memory to 0 on errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 40 ++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 70032bba1c97..9916aaf5b3f2 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -99,7 +99,30 @@ int drm_mode_create_dumb(struct drm_device *dev,
 int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 			       void *data, struct drm_file *file_priv)
 {
-	return drm_mode_create_dumb(dev, data, file_priv);
+	struct drm_mode_create_dumb *args = data;
+	int err;
+
+	err = drm_mode_create_dumb(dev, args, file_priv);
+	if (err) {
+		args->handle = 0;
+		args->pitch = 0;
+		args->size = 0;
+	}
+	return err;
+}
+
+static int drm_mode_mmap_dumb(struct drm_device *dev, struct drm_mode_map_dumb *args,
+			      struct drm_file *file_priv)
+{
+	if (!dev->driver->dumb_create)
+		return -ENOSYS;
+
+	if (dev->driver->dumb_map_offset)
+		return dev->driver->dumb_map_offset(file_priv, dev, args->handle,
+						    &args->offset);
+	else
+		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
+					       &args->offset);
 }
 
 /**
@@ -120,17 +143,12 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *file_priv)
 {
 	struct drm_mode_map_dumb *args = data;
+	int err;
 
-	if (!dev->driver->dumb_create)
-		return -ENOSYS;
-
-	if (dev->driver->dumb_map_offset)
-		return dev->driver->dumb_map_offset(file_priv, dev,
-						    args->handle,
-						    &args->offset);
-	else
-		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
-					       &args->offset);
+	err = drm_mode_mmap_dumb(dev, args, file_priv);
+	if (err)
+		args->offset = 0;
+	return err;
 }
 
 int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
-- 
2.49.0


