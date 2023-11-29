Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC13C46CA3
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrfiJqDB36OYwpcza26izND9IakYxaqihLn/XR7XBlQ=; b=A+dcqQtHFBgfpdAZjV34v1+R+z
	XGAGN0BAckoQHR3djsAQMqbx4wJoVHhCXEVZOJREszqR7s+ivUEiyand01K/CHei+syFlQ3yhg6fD
	P3UymzPpMLAu7IGMTZAZ9PwEi1oLM465owzUdHxoD9EVU2NS8/ksfk/866SzOXH5GV8IPZNd0p97w
	e1WQ+hBP58hVOs+iWv60L0I4Su7LzQQXC8HoA3eESShKOofXD3xCEXRKOxku3maNPuIW0SlSM27EP
	flf7n66ycbpkI3HxNTF6+60tCJ61JoZXbRpoh+Al47KAl8hyn2hja7NfXkieWKWy0pC3nlFbCWVyz
	h6fUYROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JWv-008HKj-29;
	Wed, 29 Nov 2023 12:19:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JWs-008HJB-1I;
	Wed, 29 Nov 2023 12:19:00 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B67B6602F24;
	Wed, 29 Nov 2023 12:18:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260334;
	bh=jN8jbwm4p0ea0gdVEuR2iDqyeJO1xHgDJGTepzsjTSU=;
	h=From:To:Cc:Subject:Date:From;
	b=fYD0Z6dNAHANwPb/vAW20k/u/sxwT+lr5qqi1I7OCIAEHCfvC0onI8IsTbwVbP3rn
	 KeAn1beCfmdG7PoLwuOe6kLtpqr04PW9pvbSI5croCn3mIwtwyRcN+wDc+Wo9IOGNI
	 pPTZ2JyfQb/eKsfAqQ3Bbkzixw7aa4y7KLrpz6ZsOqVG9NwD+KiE88Yz2WfKU55imk
	 FXYyh2uYgGf0W0t99/obtp6S3oRJSDjf8ehSNN3AL6bIuTyt6jIGS+13ePPMeSdawR
	 yepNe7pf+zt6Uoc+JwcwygkPEggh4MoCoGtJfG1w5YM7ojfwvRsZ95Nz6L2t4Ld8oD
	 /Miwby12MfOLA==
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
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 00/10] drm: ci: fixes
Date: Wed, 29 Nov 2023 17:48:31 +0530
Message-Id: <20231129121841.253223-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041858_610855_F425561C 
X-CRM114-Status: GOOD (  16.05  )
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

v6:
  - Updated commit message for enable DA9211 regulator fix 
  - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173 while setting IGT_FORCE_DRIVER
  - Added a new patch in the series to uprev IGT to fix memory corruption
  - Added a new patch in the series to update drm ci documentation
  - Generate fails file with drm-misc-next

Vignesh Raman (10):
  drm: ci: igt_runner: Remove todo
  drm: ci: Force db410c to host mode
  drm: ci: arm64.config: Enable DA9211 regulator
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs
  drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
  drm: ci: virtio: Make artifacts available
  drm: ci: uprev IGT
  drm/doc: ci: Add IGT version details for flaky tests
  drm: ci: Update xfails

 Documentation/gpu/automated_testing.rst       |  7 +--
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/build.sh                   | 16 +++----
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  5 +-
 drivers/gpu/drm/ci/test.yml                   | 13 ++----
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 13 ++++--
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 ++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 46 +++++++++++++++++++
 9 files changed, 82 insertions(+), 26 deletions(-)

-- 
2.40.1


