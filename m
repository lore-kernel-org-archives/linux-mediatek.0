Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CFFC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 07:30:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 156EB6023B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 07:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 156EB6023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifxhSy7FVIU51LPiPrkTHUK04LQf7iw5J1a0Z7ZmPcY=; b=fG9nghEC6Sj/4z
	Fv/D2x329mK1+PxAV5YUmXwrzD9pfAltJVyHH0wWSXO6WtbzTxM4Nz50Of5LiY5qeVSq1FCOuhtg8
	eBNVz8r7+6GUG89LM8E/bm4OVWLd7X0u8oLm2vyIiBsjkK4sEX1yWnz5DNmzO6ddBFxEdTFL7flzI
	lpzNp+5zF2Rr+DIidas0iAl/8heUUOktXhbeWArs4QQ2XoUsUvSw9vxv+WXHxB5mC5Jy9noC35TdB
	yt8nNjedboULsx5Zze0oDKGTrUo62N1HHSaGgKKHTQdXzAbVATK6zjHZF+u2AI2iNQBTtD/qb8nBC
	Mt0S4YnDDrHFG8Xrpceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwJo5-00DCCs-W1; Thu, 24 Jun 2021 07:29:50 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwJnk-00DBrK-Lu; Thu, 24 Jun 2021 07:29:30 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A1F61FD71;
 Thu, 24 Jun 2021 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ogLEOlbRqAQd2RJqrB9gv196PzgeGQ2osFk6goTStA=;
 b=CY1YzbPa8ReAs8p4kHDM+yaxEBVk5CXqCsu0IySC1RfbwEkY4dKSlInc3L5atuuzWjWG9y
 2rhcnUVZIRIdl7e1RKAsaXKBS8o6DEFnwHaBXtMDKV8EsggH0D5I2PSYe+h7DvXTIIqiqp
 e6GKt42IMCGtpyKD6OugfqxZnkj93iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ogLEOlbRqAQd2RJqrB9gv196PzgeGQ2osFk6goTStA=;
 b=ErFol0Ee/4pC9+kbn4Eui4amW/RaGhBNhVK19emWptQ/sOx9Cnz/28FsK6156STDeGl9Bm
 YSUlrHtk2rMVlRAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 421E411A97;
 Thu, 24 Jun 2021 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ogLEOlbRqAQd2RJqrB9gv196PzgeGQ2osFk6goTStA=;
 b=CY1YzbPa8ReAs8p4kHDM+yaxEBVk5CXqCsu0IySC1RfbwEkY4dKSlInc3L5atuuzWjWG9y
 2rhcnUVZIRIdl7e1RKAsaXKBS8o6DEFnwHaBXtMDKV8EsggH0D5I2PSYe+h7DvXTIIqiqp
 e6GKt42IMCGtpyKD6OugfqxZnkj93iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ogLEOlbRqAQd2RJqrB9gv196PzgeGQ2osFk6goTStA=;
 b=ErFol0Ee/4pC9+kbn4Eui4amW/RaGhBNhVK19emWptQ/sOx9Cnz/28FsK6156STDeGl9Bm
 YSUlrHtk2rMVlRAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id aNVJD1Y01GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:26 +0000
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
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/27] drm/i915: Track IRQ state in local device state
Date: Thu, 24 Jun 2021 09:28:55 +0200
Message-Id: <20210624072916.27703-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_002928_909774_0AC58F00 
X-CRM114-Status: GOOD (  14.92  )
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

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct drm_i915_private.irq_enabled. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 ++
 drivers/gpu/drm/i915/i915_irq.c | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 01e11fe38642..48c1835bd54b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1134,6 +1134,8 @@ struct drm_i915_private {
 	/* For i915gm/i945gm vblank irq workaround */
 	u8 vblank_enabled;
 
+	bool irq_enabled;
+
 	/* perform PHY state sanity checks? */
 	bool chv_phy_assert[2];
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index a11bdb667241..987211f21761 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4488,14 +4488,14 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
 	 */
 	dev_priv->runtime_pm.irqs_enabled = true;
 
-	dev_priv->drm.irq_enabled = true;
+	dev_priv->irq_enabled = true;
 
 	intel_irq_reset(dev_priv);
 
 	ret = request_irq(irq, intel_irq_handler(dev_priv),
 			  IRQF_SHARED, DRIVER_NAME, dev_priv);
 	if (ret < 0) {
-		dev_priv->drm.irq_enabled = false;
+		dev_priv->irq_enabled = false;
 		return ret;
 	}
 
@@ -4521,10 +4521,10 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 	 * intel_modeset_driver_remove() calling us out of sequence.
 	 * Would be nice if it didn't do that...
 	 */
-	if (!dev_priv->drm.irq_enabled)
+	if (!dev_priv->irq_enabled)
 		return;
 
-	dev_priv->drm.irq_enabled = false;
+	dev_priv->irq_enabled = false;
 
 	intel_irq_reset(dev_priv);
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
