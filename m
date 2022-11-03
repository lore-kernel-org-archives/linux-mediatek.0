Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5A2C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Rdbs1K7PrH8FqVsteDFsz2Pg6HAnz17D2gSGEJwptg=; b=Ni70e+9UjEyofw2g6LNVyWDzpO
	th0HnfyghPZfnnZgj6hJtTIF73+nL10O4fMSY3bDCiU8Q2o6vH5J/q0VnqUOVy/xlBPZwgOp6yuIZ
	j0EfeDenKOz/RTZm4I39FEXkXhQx9QQ6wa9opUUVSNm18BSNrQluGIXxn+4TxQuJZbHdtBOb/uzJT
	ejsN3Ocoi2exIGBMNn6zYqPLxUPULrCgQGmDKw9Ky8hK1uacTO3I6Sg8GgNQxKBV4ejaJfz6w+5l9
	YI4hb/G6uJbKtExrQXILsTeF3K2HzVXq9LgpD2/ZUDTEPNbhteG/m9w1HGRpZxCKVDuSC5Fs1YFW2
	47yL3Saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcAH-000NrG-TA; Thu, 03 Nov 2022 15:29:57 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbw0-000GGj-Hj; Thu, 03 Nov 2022 15:15:20 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0FB361F8ED;
	Thu,  3 Nov 2022 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667488498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rdbs1K7PrH8FqVsteDFsz2Pg6HAnz17D2gSGEJwptg=;
	b=1QzEPzAu/XO9DJ7+I1Ls8u6iVJBqVfE0RfLcCGHCvzFb6nbQG7y/8DBvVDIcFJv1lnC+hZ
	VFTTseMsIGFGbvg8BElx17Rw50wWqUakn6xd0cxmAnfTlDeZZ0lw1h6Wt06aRSUVnZwveH
	he9C374VbO9S3fUtNy62s5HXA9q9xCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667488498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rdbs1K7PrH8FqVsteDFsz2Pg6HAnz17D2gSGEJwptg=;
	b=f8pZPqG9V3vdxDoWdtzuNcpX0gB4bZkuJ5Drjrd7WuBVLUdk/140+GTeZY398tPnBeuus7
	WLY+csOh/CkEJuAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6614913AAF;
	Thu,  3 Nov 2022 15:14:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GBP+F/HaY2PBGgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:57 +0000
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
Subject: [PATCH v3 16/23] drm/fb-helper: Call fb_sync in I/O functions
Date: Thu,  3 Nov 2022 16:14:39 +0100
Message-Id: <20221103151446.2638-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_081512_831013_56E139FF 
X-CRM114-Status: GOOD (  11.00  )
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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


