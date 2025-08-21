Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BE7CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=; b=PnOYBqRjlPr9+jZa7tzzE7RiPb
	SyVa6LZq0j6DBZNj7gpZ7a053O76TrFenY9MYX3ILB8oWzDLZm4lG1/ptD+qFxojhErlyRWdKZznX
	K5Cp+YN5LEP1hac5QB8q4UCpXzxV/wi9Gdx026NsjGtWyN8c8pcppTXHYBCIpIyT13UfD2KQ5AvVr
	bjwGiWRdpVII5hm4++ut34o/71nN7nC0mCLWCvQubxa+H66q1KJIIbrp7jJWRgIjX2AbFgH4Gw1XM
	Onu7KzOLEykcNUECCcIlTTnJW9eD9ZU2VaGaSg+C/RdeJ4AnJMsHrxpP0bk+PVjaLmTxj0BRTWn2p
	amPKHMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Uj-0000000Gb0c-0oES;
	Thu, 21 Aug 2025 10:26:09 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Zc-0000000GEOp-0wJc
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Aug 2025 08:23:06 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 946E41F853;
	Thu, 21 Aug 2025 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=vi/Te3EaMGkxWne1cDrn7ss5wH3an8cpo5qRGhJwqSvV4zdPDQEysn0Xr94P00xzKbhL5P
	rAuGGknCsO+PQxy2RmWc+NjwUrIS+KHS8HtGtgELNbkrI2JefNOC3f6CuyofRTaF+yzAgD
	PvCjkl+g+4jlIr3GjsOnooCXuito11M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=Ko8NiJHS05xtmCsxqe8GU7aiqtH97ywiCmDn3phzu80rJ2+SG3P04U4b5vZNupcKxO8oeL
	HETIc6If+883LbDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=vi/Te3EaMGkxWne1cDrn7ss5wH3an8cpo5qRGhJwqSvV4zdPDQEysn0Xr94P00xzKbhL5P
	rAuGGknCsO+PQxy2RmWc+NjwUrIS+KHS8HtGtgELNbkrI2JefNOC3f6CuyofRTaF+yzAgD
	PvCjkl+g+4jlIr3GjsOnooCXuito11M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=Ko8NiJHS05xtmCsxqe8GU7aiqtH97ywiCmDn3phzu80rJ2+SG3P04U4b5vZNupcKxO8oeL
	HETIc6If+883LbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06F8E13867;
	Thu, 21 Aug 2025 08:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CFJ9AD3XpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:21 +0000
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
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v6 16/25] drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:23 +0200
Message-ID: <20250821081918.79786-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_012304_399012_ED1B8298 
X-CRM114-Status: GOOD (  10.16  )
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_dumb.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 17df5c7ccf69..1200946767ce 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -23,6 +23,8 @@
  *          Alon Levy
  */
 
+#include <drm/drm_dumb_buffers.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
@@ -35,14 +37,13 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_bo *qobj;
 	struct drm_gem_object *gobj;
-	uint32_t handle;
 	int r;
 	struct qxl_surface surf;
-	uint32_t pitch, format;
+	u32 format;
 
-	pitch = args->width * ((args->bpp + 1) / 8);
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
+	r = drm_mode_size_dumb(dev, args, 0, 0);
+	if (r)
+		return r;
 
 	switch (args->bpp) {
 	case 16:
@@ -57,20 +58,18 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 
 	surf.width = args->width;
 	surf.height = args->height;
-	surf.stride = pitch;
+	surf.stride = args->pitch;
 	surf.format = format;
 	surf.data = 0;
 
 	r = qxl_gem_object_create_with_handle(qdev, file_priv,
 					      QXL_GEM_DOMAIN_CPU,
 					      args->size, &surf, &gobj,
-					      &handle);
+					      &args->handle);
 	if (r)
 		return r;
 	qobj = gem_to_qxl_bo(gobj);
 	qobj->is_dumb = true;
 	drm_gem_object_put(gobj);
-	args->pitch = pitch;
-	args->handle = handle;
 	return 0;
 }
-- 
2.50.1


