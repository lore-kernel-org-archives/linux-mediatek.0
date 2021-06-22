Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E10C49EA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC16561027
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC16561027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c616YTPdLHukivXMv/y9HPmNrk/tcfiFAFvrsqK7jp4=; b=2innxtFgjvThgE
	nlVZ2DKgIjAeAZrzpSmzDYRO18vGmwSFpPTQVwwqz2ys2lH4QXK1nGkaqENbqcVC+hi4rLbLnDzgQ
	2gsMkwCofh73C31vRE+loeHZhKk5AY7EQq+CmlfeaLTYpLiOJ3Yl5lZjI5tgb3q/lxGohjpQnXzP3
	ROdOSL+nJu/IZkvTGCxqGDfn3RKWx5jDglh57V89OqQBRC8Ow1KRmrEvh8nF8rBQMfd3YCubG8I5C
	Zd2ufU/tqKN09JsOHV7jMj250VfxVxtf3iS0/v7pczDNFC248D6mTe+H4W30Fo6U9RsE6RrDPali5
	FbFBBwTg4p8BFCaL4WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvh6p-007RMS-Av; Tue, 22 Jun 2021 14:10:35 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvh6Q-007QyP-A8; Tue, 22 Jun 2021 14:10:11 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0911FD5F;
 Tue, 22 Jun 2021 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jbsz5Z/7MtxS9OjGI5STR0UHsiBFksF1O+80zt+6jHQ=;
 b=vPTErzmq3uXIdNA7bDU8wMczxTT7Y13OW2TZRKGt5RrvCY3sP/x2vyL+0GA/wMLIAGZbUd
 A3su6kUyQt1JcO2GFlN+9dWF8PUx5kR9jj9doffTJKEIJ7jlSAThHAQnUgiNj2oq2laQsK
 ttpCpBx4dAeyG3Nn7XdRrxQbkE2+DZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jbsz5Z/7MtxS9OjGI5STR0UHsiBFksF1O+80zt+6jHQ=;
 b=1+C7jgnbuuxxnYtJa61pakqbKOq6sS3CpRhVBN545AkZUJEHUJ1IFNh2lYomw8A31ASY/4
 j/Ts+mkP3YknCUBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1B1D118DD;
 Tue, 22 Jun 2021 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jbsz5Z/7MtxS9OjGI5STR0UHsiBFksF1O+80zt+6jHQ=;
 b=vPTErzmq3uXIdNA7bDU8wMczxTT7Y13OW2TZRKGt5RrvCY3sP/x2vyL+0GA/wMLIAGZbUd
 A3su6kUyQt1JcO2GFlN+9dWF8PUx5kR9jj9doffTJKEIJ7jlSAThHAQnUgiNj2oq2laQsK
 ttpCpBx4dAeyG3Nn7XdRrxQbkE2+DZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jbsz5Z/7MtxS9OjGI5STR0UHsiBFksF1O+80zt+6jHQ=;
 b=1+C7jgnbuuxxnYtJa61pakqbKOq6sS3CpRhVBN545AkZUJEHUJ1IFNh2lYomw8A31ASY/4
 j/Ts+mkP3YknCUBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0FpqLj/v0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Date: Tue, 22 Jun 2021 16:09:44 +0200
Message-Id: <20210622141002.11590-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_071010_556008_F68668C1 
X-CRM114-Status: GOOD (  16.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
vblank support. IRQs might be enabled wthout vblanking being supported.

This change also removes the DRM framework's only dependency on IRQ state
for non-legacy drivers. For legacy drivers with userspace modesetting,
the original test remains in drm_wait_vblank_ioctl().

v2:
	* keep the old test for legacy drivers in
	  drm_wait_vblank_ioctl() (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_irq.c    | 10 +++-------
 drivers/gpu/drm/drm_vblank.c | 13 +++++++++----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index c3bd664ea733..1d7785721323 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -74,10 +74,8 @@
  * only supports devices with a single interrupt on the main device stored in
  * &drm_device.dev and set as the device paramter in drm_dev_alloc().
  *
- * These IRQ helpers are strictly optional. Drivers which roll their own only
- * need to set &drm_device.irq_enabled to signal the DRM core that vblank
- * interrupts are working. Since these helpers don't automatically clean up the
- * requested interrupt like e.g. devm_request_irq() they're not really
+ * These IRQ helpers are strictly optional. Since these helpers don't automatically
+ * clean up the requested interrupt like e.g. devm_request_irq() they're not really
  * recommended.
  */
 
@@ -91,9 +89,7 @@
  * and after the installation.
  *
  * This is the simplified helper interface provided for drivers with no special
- * needs. Drivers which need to install interrupt handlers for multiple
- * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
- * that vblank interrupts are available.
+ * needs.
  *
  * @irq must match the interrupt number that would be passed to request_irq(),
  * if called directly instead of using this helper function.
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 3417e1ac7918..a98a4aad5037 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1748,8 +1748,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	unsigned int pipe_index;
 	unsigned int flags, pipe, high_pipe;
 
-	if (!dev->irq_enabled)
-		return -EOPNOTSUPP;
+	if  (drm_core_check_feature(dev, DRIVER_MODESET)) {
+		if (!drm_dev_has_vblank(dev))
+			return -EOPNOTSUPP;
+	} else {
+		if (!dev->irq_enabled)
+			return -EOPNOTSUPP;
+	}
 
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
 		return -EINVAL;
@@ -2023,7 +2028,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	if (!dev->irq_enabled)
+	if (!drm_dev_has_vblank(dev))
 		return -EOPNOTSUPP;
 
 	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
@@ -2082,7 +2087,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	if (!dev->irq_enabled)
+	if (!drm_dev_has_vblank(dev))
 		return -EOPNOTSUPP;
 
 	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
