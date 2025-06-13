Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700BC71136
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jun 2025 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nac94hdxkmjbXIGfYBettme4VrCrPcKfPsBgNcpu+Uo=; b=kkV+rnVlDel/mcbdnj1LWIpikl
	O1JsqT+EC2qhaWKLIvf+aZazVfEEKYmmJphYjq8eUEjeydi4+sDQiKM9eKLRGXwC2D2hoAlI4pGHW
	Ebbp8n4pz3JNXh+kBbg2BqpbDmyOyuqiJKUjA7rj4a4wdOK27Busnc+DIqZ3Yqr2n8wWBm2w2cIH2
	JqUigHPSoyLU/Kd1uALZ1Vjy0DxQvqL/a7XTIO0f/SqrW2TNT0E1If7y6Epo1tfzrX/77TbhxmnYp
	NnwxwFNFynRTjLVXPizZkybx7qHYrQxriUca6GWODBITkie+Gqeng2iCAjloZPWD1YJsdgCgRDQvI
	Oj2/mXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0O5-0000000FrPv-39yz;
	Fri, 13 Jun 2025 09:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Lx-0000000Fqo2-1jIB
	for linux-mediatek@bombadil.infradead.org;
	Fri, 13 Jun 2025 09:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nac94hdxkmjbXIGfYBettme4VrCrPcKfPsBgNcpu+Uo=; b=j+mb9KaY5T/+Kw/P+nXC5aR7xn
	ebiLfQtlIkTpt8HsXmEM88GWM8TYbfCPU274TAA1FPCtOGaYdL7umUNBq/QjKZKimlvyWjsGF07qE
	bcTPLN3fdp56ARySc4ExqUiZ5W46TpR863cD7KsDtfeKqfuMwDSL/4T21Fpg2E9Tlwb9gXGl7edJI
	4XCtuaySLx4TehgLlaA6H/ymKjLbLLxF6vPTjWKsX4mig0uDi3wHHyfi1qiA505DKPIabQfJiiwKK
	dBuXrqTG/PKf+11O3Z5RwnU18CVvOD0HL0G1KKJ1cueT4besIiSOhYf5mEu+G2G2uXE/shgY11CSo
	ftfNAzWg==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Lv-00000002wiy-1whn
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jun 2025 09:05:37 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 016D11F892;
	Fri, 13 Jun 2025 09:04:45 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54C7D13A9C;
	Fri, 13 Jun 2025 09:04:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mGBYE6zpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:44 +0000
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 13/25] drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:32 +0200
Message-ID: <20250613090431.127087-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 016D11F892
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100535_595802_33CEE0FF 
X-CRM114-Status: GOOD (  12.90  )
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
and buffer size. Alignment is specified in bytes, but the hardware
requires the scanline pitch to be a multiple of 32 pixels. Therefore
compute the byte size of 32 pixels in the given color mode and align
the pitch accordingly. This replaces the existing code in the driver's
align_pitch() helper.

v3:
- clarify pitch alignment in commit message (Dmitry)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2995e80fec3b..dd9d64537cd9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -11,8 +11,10 @@
 #include <linux/dma-buf.h>
 #include <linux/pfn_t.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 
 #include <trace/events/gpu_mem.h>
 
@@ -700,8 +702,29 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
-	args->pitch = align_pitch(args->width, args->bpp);
-	args->size  = PAGE_ALIGN(args->pitch * args->height);
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch_align;
+	int ret;
+
+	/*
+	 * Adreno needs pitch aligned to 32 pixels. Compute the number
+	 * of bytes for a block of 32 pixels at the given color format.
+	 * Use the result as pitch alignment.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	if (!pitch_align || pitch_align > U32_MAX)
+		return -EINVAL;
+	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);
+	if (ret)
+		return ret;
+
 	return msm_gem_new_handle(dev, file, args->size,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }
-- 
2.49.0


