Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFB9C021AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2025 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdY05RGpAGplzZ4tLpVPI7IOVTC1fiPSy8jcYt8fBIg=; b=l2MU4ZWxGVio9a//qX6nz1WHhI
	pQl8q0ojG528Y9014rwNlFMx9bJvm8C81SqoGbyQqTtuxQ6w/13KZ58GpLZPqktUDI8gmZyP4ZgkR
	iXI1MUK24wH+LkYmsWH2T8OOb/2IgMZocX05fmqfa6tz0+v/KZspMhSAZyk8K9b6w2+zJ5ZK47R1J
	iafYY7UpXLzFNoJClTFbei3nUxIg9/0qk1AoWOitl0u/G9B/PX41O9J0yn7aado3fDrvg5Ovg4J7P
	RYAD33jeUhTwfLm3yoDT4biXH20L3s0uf7kMoaSCMCoG5ga/kWU28/5G786NlzItHkzdPk1nfUV/I
	A1nfdJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOYY-00000008Vc8-2nt8;
	Tue, 18 Feb 2025 14:26:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOXm-00000008UqC-2T16
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Feb 2025 14:25:52 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD5AA1F396;
	Tue, 18 Feb 2025 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdY05RGpAGplzZ4tLpVPI7IOVTC1fiPSy8jcYt8fBIg=;
	b=V4MRDgLHluTPaep5Eld3sMttIiJlaYoZshtQNijKKuk6rWlkIwrBAdXqyX0msqf+/qUlVI
	KJeY6H6GiHFVIAH+G4JxHnvo7uvVPqtPSCEybwMNtlzfvU7D9JiCZr2mtmTVpcwwJ+wmBB
	0P9Umf6IrOQbTwc/nPcl+EbFqGRkg3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdY05RGpAGplzZ4tLpVPI7IOVTC1fiPSy8jcYt8fBIg=;
	b=nU8PXHkW8/AU5NxBeWhDv+FVX83bBrwHlOx+OKYl+EZIE9fMp+uY77dRrqU4orkCzKQdk4
	WoBw3Y8yijUGulBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V4MRDgLH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nU8PXHkW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdY05RGpAGplzZ4tLpVPI7IOVTC1fiPSy8jcYt8fBIg=;
	b=V4MRDgLHluTPaep5Eld3sMttIiJlaYoZshtQNijKKuk6rWlkIwrBAdXqyX0msqf+/qUlVI
	KJeY6H6GiHFVIAH+G4JxHnvo7uvVPqtPSCEybwMNtlzfvU7D9JiCZr2mtmTVpcwwJ+wmBB
	0P9Umf6IrOQbTwc/nPcl+EbFqGRkg3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdY05RGpAGplzZ4tLpVPI7IOVTC1fiPSy8jcYt8fBIg=;
	b=nU8PXHkW8/AU5NxBeWhDv+FVX83bBrwHlOx+OKYl+EZIE9fMp+uY77dRrqU4orkCzKQdk4
	WoBw3Y8yijUGulBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39DDE13A82;
	Tue, 18 Feb 2025 14:25:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2HvWDGuYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
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
Subject: [PATCH v3 01/25] drm/dumb-buffers: Sanitize output on errors
Date: Tue, 18 Feb 2025 15:23:24 +0100
Message-ID: <20250218142542.438557-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD5AA1F396
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_062550_775058_EB318ACA 
X-CRM114-Status: GOOD (  13.43  )
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
2.48.1


