Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39500C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro4+Kd0RltbjMdu4OrI2uib0ho5AqwGxOtBXY8dS7Qg=; b=Ltu8e3zct7rXb7+F0urM+tMAmI
	bHBz1KclPFZ8/2t420wQvFe35jzzcxGDvm6EXknRfe19f7xtjmgfoHus/2LdgY+pYvVPCZEoVpupJ
	E4au62oSJ63t+PLQ/tVzVQDIgraGt0JitiEWeUAFLOyUA9wVCqbZrad9+MBlk946WxYjzrO4NyDKv
	zRGIo5BzPI4F+H30kAtD2ka7NDfLbhKymyUi0q6CGhGkb0+pr10ADSuLPGqrvHYsTDGthJwDV09Zi
	F/uhyMUv15uqHBazUcbPeLDiRel8dEIrKBRyPqDYNb+t+QPlU0pUVZ/oh4b5wQySmqWZAaNXXJYAp
	1BcZGx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olTrE-00E7hg-Bw; Thu, 20 Oct 2022 11:37:04 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olSw8-00DeVi-P4; Thu, 20 Oct 2022 10:38:08 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7C181FA26;
	Thu, 20 Oct 2022 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4+Kd0RltbjMdu4OrI2uib0ho5AqwGxOtBXY8dS7Qg=;
	b=hTN4RHJE1PxuqFN5kOORkafwVSL1AHktl4otDV1rbos5DSJ5D0LXWxzf9Ke/RXxSVAMXJC
	bbEyIjc/qFuqiBk6LPkyF317wUWc8k/1yIswUZHcgLxfE9QsfT+4CEKHPhrtDjJtG6VhFy
	KPo1RuIGxz3LnsPOov3fRzdR4m8wnm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4+Kd0RltbjMdu4OrI2uib0ho5AqwGxOtBXY8dS7Qg=;
	b=WQRBhVwummZkW7YtUvgBUG6C4KPwGlTIFpcexjZJs8nWsclzJ/R0QWj5vc7b/l6wWQm5S1
	usWIWm27yZzJJcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4709113B72;
	Thu, 20 Oct 2022 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IHRqEAUlUWPPYwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:37:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/21] drm/amdgpu: Don't set struct drm_driver.lastclose
Date: Thu, 20 Oct 2022 12:37:35 +0200
Message-Id: <20221020103755.24058-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_033805_041842_912436E4 
X-CRM114-Status: GOOD (  10.59  )
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

Don't set struct drm_driver.lastclose. It's used to restore the
fbdev console. But as amdgpu uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See
the call to drm_client_dev_restore() in drm_lastclose().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 23998f727c7f9..fb7186c5ade2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1224,7 +1224,6 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 
 const struct drm_mode_config_funcs amdgpu_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 };
 
 static const struct drm_prop_enum_list amdgpu_underscan_enum_list[] =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f6a9e8fdd87d6..e9a28a5363b9a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -82,7 +82,6 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
@@ -2810,7 +2809,6 @@ const struct amdgpu_ip_block_version dm_ip_block =
 static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
 	.get_format_info = amd_get_format_info,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = amdgpu_dm_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.38.0


