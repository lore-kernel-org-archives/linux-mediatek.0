Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AAACDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xhleiw11bGsl6zM1decihz0tTeo/WuUswqx/sQvon5c=; b=i+etBOA7SxH5KU0EkgSP7UjzOK
	xqi67qCEznnWRruitDfJMNR7wGEtXiYxiZUyjqdMIka2T87O/K77XGe7aYqk+Df8XA6CzknsCm+cz
	hxfmgeEXzoIMXuaBGBVf80X5BOWH1KXDt0Hqjg7d1rtPnmTZMlwdpX/4TyorCF+x8VDvD7AEv1Sy6
	212UkImn4kJ2DQmnSzt1AzamLcUWxTYR5AfImRPMYILTta33eRBbRUysJqtMT6QA9OYfnPHyDxpWq
	fEfWM9T6OFAKQc56Jcb1yCSjWEjYgJ5wpdQ4aTidVX1ojd2lQMWa9HH7vAmhjKLNr64VFAFihDoDe
	L8wvbtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7p-00GZRc-2w;
	Thu, 19 Oct 2023 07:07:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7m-00GZPs-38
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:20 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 351C866072FF;
	Thu, 19 Oct 2023 08:07:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699232;
	bh=I4hBGs/HJ8k3t8nfnj4dAkAmQbAnaSwbAUThvvkg8jk=;
	h=From:To:Cc:Subject:Date:From;
	b=AakY+UE1mc5G+tAnTqM7HiXheibOrcmjs+RLmSecJq8IzBN9A2MCrV2Am3kkVgsQo
	 pWAL3vEwtF8LUi280O2p5oPsV0pJnNlicci01VEDCTGG8e8Uvscu4QSU8ZKPzaG96J
	 rixx/tXD2Skv6C+cBmzA+PDS6qtRwU5KyZQzCglkyq1u2KcQ0a/JBISgffKx4sQQba
	 qjVbocZGvTaTn6f8m5UmGd0Fn0XyVvFt0bpXLOZVAxHM9+I3Ktvvwriz/fy76z6Ell
	 dqYnYH0IimrZiynT0wGMWuEVgv+xmYmHBgpushbri71Oq/L5eOCoduKz2wvtxo/c4B
	 pVkS8L++Vqv8w==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/9] drm: ci: fixes
Date: Thu, 19 Oct 2023 12:36:41 +0530
Message-Id: <20231019070650.61159-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000719_225731_ECFBA4D3 
X-CRM114-Status: GOOD (  15.44  )
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

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.

This series depends on the below patches,
[PATCH 0/9] drm/ci: fixes and improvements
https://www.spinics.net/lists/kernel/msg4959629.html

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  - Reworded the commit message for enabling jobs
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
  - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
    This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
  - Added a new patch in the series to make artifacts available for virtio jobs
  - Added a new patch in the series to add pipeline url to fails and flakes files
  - Generate fails and flakes file with the updated xfails script - https://www.spinics.net/lists/kernel/msg4959630.html
  - Drop 'virtio: Update ci variables' patch as the tests which causes the malloc issue are skipped

Vignesh Raman (9):
  drm: ci: igt_runner: Remove todo
  drm: ci: Force db410c to host mode
  drm: ci: Enable regulator
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs
  drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
  drm: ci: virtio: Make artifacts available
  drm: ci: Add pipeline url to fails and flakes files
  drm: ci: Update xfails

 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/build.sh                   |  16 +-
 drivers/gpu/drm/ci/igt_runner.sh              |   5 +-
 drivers/gpu/drm/ci/test.yml                   |  13 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  24 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   9 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  17 +-
 drivers/gpu/drm/ci/xfails/update-xfails.py    |   6 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  65 +-
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   | 632 +++++++++++++++++-
 10 files changed, 704 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt

-- 
2.40.1


