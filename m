Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB7EC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CD361417
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CD361417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJKUvk7gvBCPpKxRmuvHYsp9IrDfcH5GqQ+aX0kVL6o=; b=4g9z0FPbscMTos
	I6+im5WNXt4Ft8EFbUGJhTubsX0WgD5D3CeKXG3Ly3J8ThHI7TsQaeCp7Gb7n70ra+HRpJ0MaXu1O
	98MmlGm5RiU/Gm2Xkqt/KKYDNZPadLMicepmRy26fR9wgsPT9bdbGqZGpeOQS9y8LVYbmbxK30UL7
	U28yAoPuyugactf2FFjGsHTu9QJY3dd3BCvPOb+1LSTmxP3rL9gRMTlC6+ZJdoLkAhcc1wnmuvmaI
	Ho0BKyM0V4Dmv6/vbp74IZQ1M7h1c7ESdL5IUo23IBB0iNCI6juZKy+d9JEaTPW6KHfn55nN0aBMR
	vGvJQHAMQ0pr8XWP1GvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwhDv-000L0g-Ba; Fri, 25 Jun 2021 08:30:03 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwh6h-000Htd-L3; Fri, 25 Jun 2021 08:22:37 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 131A31FE5B;
 Fri, 25 Jun 2021 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwf7mP0LsMNCN4pPPKF35auE5vJ/S0UeIANplAsdQLk=;
 b=zFOlIzYG+8lPQnRCizcT4lnqYl7YzU/xDCHBnDlY+SQ2kv7ToWvkc5QhmTsqa+LD9QJlD5
 sUNsmKDIw23vBczIU97eLr0uRyWexrND3Av253PqpNSzOZl6qBOjFNhQe7gC4wJ26R8emp
 Ie7mbGrC1rnbTIozJcza4Dt935qBEF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwf7mP0LsMNCN4pPPKF35auE5vJ/S0UeIANplAsdQLk=;
 b=gveraDiQG7/Ag3G3AC3mVWVM9oyDko0ASo6EWhElWVLb8/GXVLcA42L8VNlI1mz2moGScU
 4jEf4aI0R4To5UCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D83C011A97;
 Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwf7mP0LsMNCN4pPPKF35auE5vJ/S0UeIANplAsdQLk=;
 b=zFOlIzYG+8lPQnRCizcT4lnqYl7YzU/xDCHBnDlY+SQ2kv7ToWvkc5QhmTsqa+LD9QJlD5
 sUNsmKDIw23vBczIU97eLr0uRyWexrND3Av253PqpNSzOZl6qBOjFNhQe7gC4wJ26R8emp
 Ie7mbGrC1rnbTIozJcza4Dt935qBEF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwf7mP0LsMNCN4pPPKF35auE5vJ/S0UeIANplAsdQLk=;
 b=gveraDiQG7/Ag3G3AC3mVWVM9oyDko0ASo6EWhElWVLb8/GXVLcA42L8VNlI1mz2moGScU
 4jEf4aI0R4To5UCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MObEM0iS1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:32 +0000
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
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 08/27] drm/malidp: Don't set struct drm_device.irq_enabled
Date: Fri, 25 Jun 2021 10:22:03 +0200
Message-Id: <20210625082222.3845-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_012235_985297_DF964626 
X-CRM114-Status: GOOD (  10.72  )
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

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in malidp.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index de59f3302516..78d15b04b105 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -847,8 +847,6 @@ static int malidp_bind(struct device *dev)
 	if (ret < 0)
 		goto irq_init_fail;
 
-	drm->irq_enabled = true;
-
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialise vblank\n");
@@ -874,7 +872,6 @@ static int malidp_bind(struct device *dev)
 vblank_fail:
 	malidp_se_irq_fini(hwdev);
 	malidp_de_irq_fini(hwdev);
-	drm->irq_enabled = false;
 irq_init_fail:
 	drm_atomic_helper_shutdown(drm);
 	component_unbind_all(dev, drm);
@@ -909,7 +906,6 @@ static void malidp_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 	malidp_se_irq_fini(hwdev);
 	malidp_de_irq_fini(hwdev);
-	drm->irq_enabled = false;
 	component_unbind_all(dev, drm);
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
