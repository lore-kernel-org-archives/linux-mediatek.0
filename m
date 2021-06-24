Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631DDC49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 07:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCBC613E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 07:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCBC613E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWkiuln10X4NeH7yiqIVCgfE68Km4aQsYdGHSBR6I9c=; b=N80MLkZgg2l/ge
	80JbNMjY9lAHaab4YcGgywdwnPWXmRNdIOgep/BYapHuRZ1VzV41cvNmuIf6LqmxCxbQOBGArUb2j
	zbEvswG+Lu4VTBYWbZN7+Dl4g8CRQPQRRiKVKugOrQ2AQH/IbfPfau/tSx4Uex96xxW87lnL7jt79
	4weNv3F1QgFfdCVRjqh4eIisVpB+NmW/R15P18CveboR1Cnbe/D0hFpetFaE+z08YZnmCRK4nF73c
	KdxsOO3mmBUOfSE2SLL+YqIzXnSv8u8QRCUXXbL5NkqgIyEAaVSUbBB0mEl28uFzV29PE7wzeeZq4
	BHL4OTp7by7NKqAgk+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwJoN-00DCTL-Pa; Thu, 24 Jun 2021 07:30:07 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwJnq-00DBvv-JA; Thu, 24 Jun 2021 07:29:36 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B58421982;
 Thu, 24 Jun 2021 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO6k9K3tdxXVOPCiQ2BE2Bm1K+UEKxtn2PzLQZkgDms=;
 b=fXNyTjuC+71DNsmaCMCEzC0vccSCC3y4MAJhGwhF5COrYdXjmTLoakr9Us5Zou7vsx9Hbk
 Zg7/XCJ8lESsKeI0ebPS55Ji7Q5Jfx1hVXOxXpkIKqSMZ0DzMOVYlaMrKslvK3/635cvkH
 M2dCfrYqOc4mqvTZyLj3htANrQIisT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519773;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO6k9K3tdxXVOPCiQ2BE2Bm1K+UEKxtn2PzLQZkgDms=;
 b=aVFyaEOzRuXSZEIJlapVgpwtSmf2hZG/+2qm1zBUiRM6VSbSB28t5jA79wqtmgR5UNlKt8
 9CXAEfzJHSmdveDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0532E11C9B;
 Thu, 24 Jun 2021 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO6k9K3tdxXVOPCiQ2BE2Bm1K+UEKxtn2PzLQZkgDms=;
 b=fXNyTjuC+71DNsmaCMCEzC0vccSCC3y4MAJhGwhF5COrYdXjmTLoakr9Us5Zou7vsx9Hbk
 Zg7/XCJ8lESsKeI0ebPS55Ji7Q5Jfx1hVXOxXpkIKqSMZ0DzMOVYlaMrKslvK3/635cvkH
 M2dCfrYqOc4mqvTZyLj3htANrQIisT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519773;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO6k9K3tdxXVOPCiQ2BE2Bm1K+UEKxtn2PzLQZkgDms=;
 b=aVFyaEOzRuXSZEIJlapVgpwtSmf2hZG/+2qm1zBUiRM6VSbSB28t5jA79wqtmgR5UNlKt8
 9CXAEfzJHSmdveDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id sCVrAFw01GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:32 +0000
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 11/27] drm/imx: Don't set struct drm_device.irq_enabled
Date: Thu, 24 Jun 2021 09:29:00 +0200
Message-Id: <20210624072916.27703-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_002934_832052_B8016154 
X-CRM114-Status: GOOD (  10.66  )
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
with userspace modesetting. Don't set it in imx.

v3:
	* move dcss changes into separate patch (Laurentiu)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 76819a8ac37f..9558e9e1b431 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -207,17 +207,6 @@ static int imx_drm_bind(struct device *dev)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	/*
-	 * enable drm irq mode.
-	 * - with irq_enabled = true, we can use the vblank feature.
-	 *
-	 * P.S. note that we wouldn't use drm irq handler but
-	 *      just specific driver own one instead because
-	 *      drm framework supports only one irq handler and
-	 *      drivers can well take care of their interrupts
-	 */
-	drm->irq_enabled = true;
-
 	/*
 	 * set max width and height as default value(4096x4096).
 	 * this value would be used to check framebuffer size limitation
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
