Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811AE7719D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMyDtZteYQi53fIJpuHawiVkfzpZWBcNX96BIIRcVRg=; b=AmpHtif1JWgaWxHOf3gVN6YszW
	BKnJt3GtF39TVdKmAg6iwq+0mUNjUPZpuFcbY12os0/i/bZ3+bpHvk3CXmh3fpsWMF8XuTruSdw9A
	QdBgeq1o+AwwQ+3InHSz1xreVbyHiofJcMuKUqrdHL7hOgkJkXO+LYv3Ru97ttv7eP9E2ibMj9Q8s
	e8pOshm9koWI5bkxYis6qWSImFWy8GmkZsmUn6/L7gXz49EPPjWxeFuw4fD3OnTXk+OqvblobcjnS
	p2LFIF1yVhCz0XWZXZ4UvVgTBPSpJ5PmDerMBa1pvtxlnifk2m75OSwHLqfnzrZSqyUwHq1islcab
	ra6eXoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVu4g-0000000CNDb-23CN;
	Thu, 09 Jan 2025 15:03:54 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVu4G-0000000CMSh-3XKy;
	Thu, 09 Jan 2025 15:03:32 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2B2A2117E;
	Thu,  9 Jan 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMyDtZteYQi53fIJpuHawiVkfzpZWBcNX96BIIRcVRg=;
	b=06km46Gp2nPB0Hy3z1K81dBHV/3Cd4pEaJSeRbdrokm7LUetw42t25vR+z6UzQKGN3g/Q4
	pJDPOjFZU1ZwR1FynNw5N0jwj7jcnjXwtQ4D530g4rWA1NgqIxpLftn9hh82Kb8VDxK/bI
	G0QTHuFtqyQa+YjmvxP0FoFUmfrCcvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMyDtZteYQi53fIJpuHawiVkfzpZWBcNX96BIIRcVRg=;
	b=huZ8ujhVVCssSEmwDdGaUFcPsRZjfAhscwm5nCCS1v6oz8P8jmalBJPPwIKeIsZJqTLgnL
	yA4XkWFXJbuTN4DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=06km46Gp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=huZ8ujhV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMyDtZteYQi53fIJpuHawiVkfzpZWBcNX96BIIRcVRg=;
	b=06km46Gp2nPB0Hy3z1K81dBHV/3Cd4pEaJSeRbdrokm7LUetw42t25vR+z6UzQKGN3g/Q4
	pJDPOjFZU1ZwR1FynNw5N0jwj7jcnjXwtQ4D530g4rWA1NgqIxpLftn9hh82Kb8VDxK/bI
	G0QTHuFtqyQa+YjmvxP0FoFUmfrCcvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMyDtZteYQi53fIJpuHawiVkfzpZWBcNX96BIIRcVRg=;
	b=huZ8ujhVVCssSEmwDdGaUFcPsRZjfAhscwm5nCCS1v6oz8P8jmalBJPPwIKeIsZJqTLgnL
	yA4XkWFXJbuTN4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48D2713A8B;
	Thu,  9 Jan 2025 15:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UHF+ED7lf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:26 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2 21/25] drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:15 +0100
Message-ID: <20250109150310.219442-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D2B2A2117E
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,redhat.com,chromium.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_070329_105514_04B94988 
X-CRM114-Status: GOOD (  11.50  )
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
buffer size. Align the pitch to a multiple of 4.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 5aab588fc400..22cf1cd2fdfd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -23,6 +23,7 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 
@@ -66,15 +67,14 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	struct virtio_gpu_object_params params = { 0 };
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
-	uint32_t pitch;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_4, 0);
+	if (ret)
+		return ret;
 
 	if (args->bpp != 32)
 		return -EINVAL;
 
-	pitch = args->width * 4;
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
-
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
 	params.width = args->width;
 	params.height = args->height;
@@ -92,7 +92,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		goto fail;
 
-	args->pitch = pitch;
 	return ret;
 
 fail:
-- 
2.47.1


