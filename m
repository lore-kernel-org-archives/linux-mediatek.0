Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr52WabQn4KK+bwhCdJXRXC0GHxQRZf3tOH2OwXrlI4=; b=dooKh72wH5dlrIap2VmZQKso7E
	aTqZohQY3CaoOwoY6J0ueNC9vO+BpqBdwIENawNizCtq+qj5cgVy6uSTxSbh2xXuHwLp5PvUxFNHX
	cVRnMNmDPiVX6Et9aaX+7zZxQGdZo5E6M6MwtpVOt3wRRcYnCbmWC2E40SdtHd6fXDYekY8Dwlddn
	6h2usy66gG55ItoDogMvWdrPuT6KW8lhFvA1bHmhhDd8Ec+SNsEFnequbrujMfVAdo+HUlGWAAdt9
	XTUnM8izuuCwcfj8lrcO5QFOMUzEiCQ2fkQX8W9IUBN+WyDXeKnu1heAMfJx+PZGC1whG3e7UWlBu
	EpMv/DyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqc6R-000MDA-LU; Thu, 03 Nov 2022 15:25:59 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbvy-000GFC-Ke; Thu, 03 Nov 2022 15:15:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65D8E1F8F3;
	Thu,  3 Nov 2022 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667488500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wr52WabQn4KK+bwhCdJXRXC0GHxQRZf3tOH2OwXrlI4=;
	b=2IHU9odfZVC/BEosd5kYe2nSLZ0DFNgEeVXJI5zLv+JKV2wN30OSjGQ+p+oRUTcnBI+aSY
	pkhdYXovwCXBs4Bkt8vaHgMYWDzvbQSgHd0WfjuIdzacDrsUKfmLPmD7qtna79oEsJ6XuK
	jJL/sse9X2zXCpuZbC6pTPqYFUYFoHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667488500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wr52WabQn4KK+bwhCdJXRXC0GHxQRZf3tOH2OwXrlI4=;
	b=3Zy/+KY1PXJuswjeMIT6ebHMi8zktn+cASefhirMXLxQQC/cH2yhbAYxRTqiOd8n2gteRF
	me+3Ej2BR8ugj7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAEFB13AAF;
	Thu,  3 Nov 2022 15:14:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kA2nM/PaY2PBGgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 20/23] drm/fb-helper: Set flag in struct drm_fb_helper for leaking physical addresses
Date: Thu,  3 Nov 2022 16:14:43 +0100
Message-Id: <20221103151446.2638-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_081510_928397_C38CD744 
X-CRM114-Status: GOOD (  13.98  )
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

Uncouple the parameter drm_leak_fbdev_smem from the implementation by
setting a flag in struct drm_fb_helper. This will help to move the
generic fbdev emulation into its own source file, while keeping the
parameter in drm_fb_helper.c. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 10 +++++++---
 include/drm/drm_fb_helper.h     |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 95f389433c4a6..105d9c8fe3250 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -74,7 +74,7 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
  * considered as a broken and legacy behaviour from a modern fbdev device.
  */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-static bool drm_leak_fbdev_smem = false;
+static bool drm_leak_fbdev_smem;
 module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
 MODULE_PARM_DESC(drm_leak_fbdev_smem,
 		 "Allow unsafe leaking fbdev physical smem address [default=false]");
@@ -1968,6 +1968,10 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		sizes.surface_height = config->max_height;
 	}
 
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+	fb_helper->hint_leak_smem_start = drm_leak_fbdev_smem;
+#endif
+
 	/* push down into drivers */
 	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
 	if (ret < 0)
@@ -2165,7 +2169,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 	info->var.pixclock = 0;
 	/* Shamelessly allow physical address leaking to userspace */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-	if (!drm_leak_fbdev_smem)
+	if (!fb_helper->hint_leak_smem_start)
 #endif
 		/* don't leak any physical addresses to userspace */
 		info->flags |= FBINFO_HIDE_SMEM_START;
@@ -2564,7 +2568,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		 * case.
 		 */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0 &&
+		if (fb_helper->hint_leak_smem_start && fbi->fix.smem_start == 0 &&
 		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
 			fbi->fix.smem_start =
 				page_to_phys(virt_to_page(fbi->screen_buffer));
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 6581183618b89..3dfb5d1093871 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -199,6 +199,8 @@ struct drm_fb_helper {
 	 * See also: @deferred_setup
 	 */
 	int preferred_bpp;
+
+	bool hint_leak_smem_start;
 };
 
 static inline struct drm_fb_helper *
-- 
2.38.0


