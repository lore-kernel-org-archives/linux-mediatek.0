Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B859BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2hXo1ZXw+fT7jNTQpjjai6MaQuUlFJ3x4yHM5t/NT8=; b=MQhIr4O88DsNko1XPGfRQhCz2v
	d6CGmbkvk20i/fjLEhRKdRjcwwoDFvCsRkDby6B8PzR6yj0PpF3sn8v0DitBes2nTi4zDTfWvxFb7
	n36TwcV5irYTjJcRdsongLA4+iBtY5Er1Cs/dWISWVhPp/85UDpdeV6nqPo1+TNlQYmCWVwNr0loK
	Y7JBETly/ISJTTUwLj49bgcoAQXSN7X1djsusLCGwaBXvFboX+7Q/4lpvAAgZPF4XI80/sbVEGP4G
	yx2G28roZWU896+AJT1QGDuBbde3XNXqLWVBArmxfWvBFmFnVfHwYUgHIpQzWNnPi38tnhqxS7tYy
	3gV8wO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olU4L-00EGje-NF; Thu, 20 Oct 2022 11:50:37 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olSwD-00Dedz-Rq; Thu, 20 Oct 2022 10:38:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BF8322B4A;
	Thu, 20 Oct 2022 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2hXo1ZXw+fT7jNTQpjjai6MaQuUlFJ3x4yHM5t/NT8=;
	b=mXMxC8OO+HZ8qhzaLE8AfebgTyxZZ9tZZWp4b7x0BMlwJ5x9pus13/9bOEqPMw/ehUZ5Gm
	NMWe1CLs7URfQKXJhFUMtaH9TNDwSCHSAXQngN6KK8AbjJnlteXfw2iY4Wy+qxQ++vc+C3
	i2Xl+bGq47RvpsltfuDrJ24ofhw8TZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2hXo1ZXw+fT7jNTQpjjai6MaQuUlFJ3x4yHM5t/NT8=;
	b=qUQDcrgRCPnFyYcZ51L8SJ9jf3CSuZOp6Fc/Q31scIHuqQyNIFoSnsX5swYKn3WKiqCoB1
	s+8FMBlX9/Tru7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDB6013B72;
	Thu, 20 Oct 2022 10:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kIkbOQwlUWPPYwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:38:04 +0000
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
Subject: [PATCH 16/21] drm/fb-helper: Call fb_sync in I/O functions
Date: Thu, 20 Oct 2022 12:37:50 +0200
Message-Id: <20221020103755.24058-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_033810_098673_61D74EAA 
X-CRM114-Status: GOOD (  10.94  )
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

Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
behavior of fbdev. Fbdev implementations of fb_read and fb_write in
struct fb_ops invoke fb_sync to synchronize with outstanding operations
before I/O. Doing the same in DRM implementations will allow us to use
them throughout DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f6d22cc4cd876..379e0d2f67198 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2246,6 +2246,9 @@ static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
 	if (total_size - count < pos)
 		count = total_size - pos;
 
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
 	if (drm_fbdev_use_iomem(info))
 		ret = fb_read_screen_base(info, buf, count, pos);
 	else
@@ -2327,6 +2330,9 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 		count = total_size - pos;
 	}
 
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
 	/*
 	 * Copy to framebuffer even if we already logged an error. Emulates
 	 * the behavior of the original fbdev implementation.
-- 
2.38.0


