Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD2CA0FE0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sNe9k0oQJ0ZQgQNEWxG9c9hC2Rshx1X7aHC0D51qPg=; b=eP/j2ZM+lTl84opkzc89G503F5
	jIaz1zdObl2ba0QmPhc0S+hg/cJrMc1bWiRQoSMwhz4ttUAorNei7HzwoZEaRQd5MU5epDDzPqA0Q
	+7dUGCT9lAfziUra8R8ykplIccly4B6OKJqaCffTYR6gflNMB7Bh2sCLwMjToQhDKMYpG3ubSdvrx
	LQHl4/pB2DZ7Pmc5uhaVthEyk14TycTQeNj/FxufNWIPPFtdQT3+ulJiBeYRZMD4cmDun0niu05Xg
	m1Nc7i+jDx4YWb6Q9U2rwToNXpY9vOUsEaLd2+SrIOCq5FMMB0DBfEH7rQuWb1pnMtRxJp3GE5pJ8
	PuIvss1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2UP-0000000GaQQ-1Sd3;
	Thu, 21 Aug 2025 10:25:49 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Yv-0000000GDlq-2MTi
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Aug 2025 08:22:22 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFBCC22640;
	Thu, 21 Aug 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sNe9k0oQJ0ZQgQNEWxG9c9hC2Rshx1X7aHC0D51qPg=;
	b=DEYJMSZ4Ns4VRIaIjQk1litPiCJl7TdquNq4DIz839m9oFE26jquwIHsekcFbb8CQfrSb7
	99Noz6ED0CVXZ65giB4fXvXQnSUE/Zw9ijttmoyPnC2b4ZtJ5xUmTMgCdn8EKunT5YRJ92
	pAplwHdLf8PGB/rTLsrJ0WI509g58WY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sNe9k0oQJ0ZQgQNEWxG9c9hC2Rshx1X7aHC0D51qPg=;
	b=PIOkhJvOzodhFLUDub46rJi8+F64yjJu6cTCF/ZfnFV0eiIKpFA1Q6DfhKy4LevhFwb0in
	Xj3K0nWqtPyn5aAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DEYJMSZ4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PIOkhJvO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sNe9k0oQJ0ZQgQNEWxG9c9hC2Rshx1X7aHC0D51qPg=;
	b=DEYJMSZ4Ns4VRIaIjQk1litPiCJl7TdquNq4DIz839m9oFE26jquwIHsekcFbb8CQfrSb7
	99Noz6ED0CVXZ65giB4fXvXQnSUE/Zw9ijttmoyPnC2b4ZtJ5xUmTMgCdn8EKunT5YRJ92
	pAplwHdLf8PGB/rTLsrJ0WI509g58WY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sNe9k0oQJ0ZQgQNEWxG9c9hC2Rshx1X7aHC0D51qPg=;
	b=PIOkhJvOzodhFLUDub46rJi8+F64yjJu6cTCF/ZfnFV0eiIKpFA1Q6DfhKy4LevhFwb0in
	Xj3K0nWqtPyn5aAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 437BD139A8;
	Thu, 21 Aug 2025 08:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iKBKDzXXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:13 +0000
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
Subject: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:10 +0200
Message-ID: <20250821081918.79786-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BFBCC22640
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-CRM114-CacheID: sfid-20250821_012221_767514_5EA17BAB 
X-CRM114-Status: GOOD (  12.83  )
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
buffer size. Align the pitch to a multiple of 8.

Push the current calculation into the only direct caller imx. Imx's
hardware requires the framebuffer width to be aligned to 8. The
driver's current approach is actually incorrect, as it only guarantees
this implicitly and requires bpp to be a multiple of 8 already. A
later commit will fix this problem by aligning the scanline pitch
such that an aligned width still fits into each scanline's memory.

A number of other drivers are build on top of gem-dma helpers and
implement their own dumb-buffer allocation. These drivers invoke
drm_gem_dma_dumb_create_internal(), which is not affected by this
commit.

v5:
- avoid reset of arguments (Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c     | 7 +++++--
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..ab1a70b1d6f1 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_vma_manager.h>
 
@@ -304,9 +305,11 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 			    struct drm_mode_create_dumb *args)
 {
 	struct drm_gem_dma_object *dma_obj;
+	int ret;
 
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ec5fd9a01f1e..af4a30311e18 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -145,8 +145,10 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	int ret;
 
 	args->width = ALIGN(width, 8);
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = args->pitch * args->height;
 
-	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
+	ret = drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 	if (ret)
 		return ret;
 
-- 
2.50.1


