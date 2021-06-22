Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B64C49EC9
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 916EE60238
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 916EE60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LbQj5aqUxCv2a3fQplVH7z9Q/QRGeFGD58YnzYOQF9Q=; b=semSI2VVOiwLC4
	Sj8kv6tI9QTtirk8NDGgg7hgZ0wgzU8GjECMy7wbzc4n0THItLjZWhT2Ab1drLt0fPS8FdayVL6QA
	3jHgkNMGyKBeFNTb9FkRb+hp+iOJdHPvjjfnSbBnm9mP5vrFtpNcoNARd12HHNqgdBuJWOr2NFwX5
	lTMgc+jkab0VyEwzG92JF1BLmx04roKekA5ZQqk1sRtvGPhZedyHVnlTWbSXXn/GVY897hmYpDcXn
	BX9pQRJUNP2DpW8laYt+6V9Sfbyb/POixUQbkgfL3NSbHH2BlVjU4HWms4EiuElPYJ2MHAIuUqobN
	8cn+GEMpcrQnBHaW5ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvh6V-007R2N-16; Tue, 22 Jun 2021 14:10:15 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvh6N-007Qws-Vq; Tue, 22 Jun 2021 14:10:10 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7973F1FD45;
 Tue, 22 Jun 2021 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zlq4KKsU8/JYDA/ykAeVvIai2ocIqYe99RU3QFbsdmU=;
 b=0v86hE2VTLzEM17qBfcdZmBklmxzS3uxRZV1SGwrgbxnZmAHokY+cxJIQhfHXQDFhWrRxm
 mNSsxsvZmAOjtFc26K0Agh4sKMfhwApmhr0BdQOGEahrzoc9u05XpIb8lp8Vdh3amkGVfl
 uJFaYWGwO7i62UCyoBWD1fE9HlA/Wqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zlq4KKsU8/JYDA/ykAeVvIai2ocIqYe99RU3QFbsdmU=;
 b=sBfw1F8RoZ7krrkKcsNIctjBZau4LKd5m6itT3fA/6O/2sq3gTvZ0OVWEe7BIVFr4IiY6O
 h8HM/7+JiMPvRoBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 74827118DD;
 Tue, 22 Jun 2021 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zlq4KKsU8/JYDA/ykAeVvIai2ocIqYe99RU3QFbsdmU=;
 b=0v86hE2VTLzEM17qBfcdZmBklmxzS3uxRZV1SGwrgbxnZmAHokY+cxJIQhfHXQDFhWrRxm
 mNSsxsvZmAOjtFc26K0Agh4sKMfhwApmhr0BdQOGEahrzoc9u05XpIb8lp8Vdh3amkGVfl
 uJFaYWGwO7i62UCyoBWD1fE9HlA/Wqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zlq4KKsU8/JYDA/ykAeVvIai2ocIqYe99RU3QFbsdmU=;
 b=sBfw1F8RoZ7krrkKcsNIctjBZau4LKd5m6itT3fA/6O/2sq3gTvZ0OVWEe7BIVFr4IiY6O
 h8HM/7+JiMPvRoBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id CKiPGzvv0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:03 +0000
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
Subject: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
Date: Tue, 22 Jun 2021 16:09:40 +0200
Message-Id: <20210622141002.11590-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_071008_219674_30345C35 
X-CRM114-Status: GOOD (  13.77  )
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

Remove references to struct drm_device.irq_enabled from modern
DRM drivers and core.

KMS drivers enable IRQs for their devices internally. They don't
have to keep track of the IRQ state via irq_enabled. For vblanking,
it's cleaner to test for vblanking support directly than to test
for enabled IRQs.

This used to be a single patch, [1] but it's now a full series.

The first 3 patches replace instances of irq_enabled that are not
required.

Patch 4 fixes vblank ioctls to actually test for vblank support
instead of IRQs.

THe rest of the patchset removes irq_enabled from all non-legacy
drivers. The only exception is omapdrm, which has an internal
dpendency on the field's value. For this drivers, the state gets
duplicated internally.

With the patchset applied, drivers can later switch over to plain
Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.

v2:
	* keep the original test for legacy drivers in
	  drm_wait_vblank_ioctl() (Daniel)

[1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmermann@suse.de/

Thomas Zimmermann (22):
  drm/amdgpu: Track IRQ state in local device state
  drm/hibmc: Call drm_irq_uninstall() unconditionally
  drm/radeon: Track IRQ state in local device state
  drm: Don't test for IRQ support in VBLANK ioctls
  drm/komeda: Don't set struct drm_device.irq_enabled
  drm/malidp: Don't set struct drm_device.irq_enabled
  drm/exynos: Don't set struct drm_device.irq_enabled
  drm/kirin: Don't set struct drm_device.irq_enabled
  drm/imx: Don't set struct drm_device.irq_enabled
  drm/mediatek: Don't set struct drm_device.irq_enabled
  drm/nouveau: Don't set struct drm_device.irq_enabled
  drm/omapdrm: Track IRQ state in local device state
  drm/rockchip: Don't set struct drm_device.irq_enabled
  drm/sti: Don't set struct drm_device.irq_enabled
  drm/stm: Don't set struct drm_device.irq_enabled
  drm/sun4i: Don't set struct drm_device.irq_enabled
  drm/tegra: Don't set struct drm_device.irq_enabled
  drm/tidss: Don't use struct drm_device.irq_enabled
  drm/vc4: Don't set struct drm_device.irq_enabled
  drm/vmwgfx: Don't set struct drm_device.irq_enabled
  drm/xlnx: Don't set struct drm_device.irq_enabled
  drm/zte: Don't set struct drm_device.irq_enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
 drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
 drivers/gpu/drm/drm_irq.c                       | 10 +++-------
 drivers/gpu/drm/drm_vblank.c                    | 13 +++++++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
 drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
 drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
 drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
 drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
 drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
 drivers/gpu/drm/sti/sti_compositor.c            |  2 --
 drivers/gpu/drm/stm/ltdc.c                      |  3 ---
 drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
 drivers/gpu/drm/tegra/drm.c                     |  7 -------
 drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
 drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
 drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
 26 files changed, 30 insertions(+), 111 deletions(-)


base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
