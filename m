Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695DAEDE990
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQYud/KKKiBauk1Wa3Dx6EW7ck9JtGVTsZ1vqq+q9N0=; b=N7aNwQiTtWISezMsWgx1BI1rr7
	ICadIRTcqBJw7TsmEHr1nTY/1pa58q98rnTVgPu5ch/Kt00AOyLM6fn32Stavt+aXZNgA7tzaQR5p
	JMH0rFVJ3pmHCRrvKxHUD2w+c0Y/IFGsus/4XJypCeErlvy1mAjxOB6ciSPFdYvvFhYVl8VJqoLQg
	Nolef3FXbU1X1i+S58Qm2e9AHd8LZmzs3NetkVfOqExIoj9JRxlxckOl444qN+5PkPT0HMTj9t1rm
	HnkQaHnblwqKX1RW982gJe/leV3v/Ybfc0lYNuyMGsRpYmH3m33pUl3BkHr+jxv1HaA0sRVG58mWL
	HFTc9h2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7c-007l94-0K;
	Thu, 14 Sep 2023 08:54:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7Z-007l7j-1y;
	Thu, 14 Sep 2023 08:54:47 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F74E6607344;
	Thu, 14 Sep 2023 09:54:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694681680;
	bh=98i3LIp6vF6jp4ARL3aS2C6+JqUEnLhYgqrDUQrpz/k=;
	h=From:To:Cc:Subject:Date:From;
	b=b0+Z9s5S8ZPs1PfbL9xabGkwGj1RBldiXHA4acs5PaG3nSdo3YU89Vpz0OOcqU7LI
	 4qXuwxIWPD0xLs7hLpj0xDVuegBClk7LkKZJATW94Jjlepj8JUEuVFLEjrjKiGa+0b
	 ewjACR7YGLLJSz0nMdevMHKY5EffQLlfso3DJNYTSuNbNpJTeSLkEB4iFib8XExIUu
	 qOq9qvGHsC4ndt9JcK0JcjWG36LrzCkAu07xStQmVgQDb4Tye7Hs5cNXWkJPn7vOG6
	 fNvPsPs21a1wFbZpCzJkfhjv7RTaNpe7Zr5IS6xQlZ1uTa6PUh6G483hTv69abIa+J
	 yCwUNIrn7a6YQ==
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
Subject: [PATCH v4 0/7] drm: ci: fixes
Date: Thu, 14 Sep 2023 14:24:19 +0530
Message-Id: <20230914085426.883255-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015445_797686_83085F75 
X-CRM114-Status: GOOD (  14.70  )
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
This series is intended for drm branch drm-next.

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

Vignesh Raman (7):
  drm: ci: igt_runner: Remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: Update ci variables
  drm: ci: Enable regulator
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 drivers/gpu/drm/ci/arm64.config                  |  1 +
 drivers/gpu/drm/ci/build.sh                      | 16 ++++++++--------
 drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
 drivers/gpu/drm/ci/test.yml                      | 16 +++++-----------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
 14 files changed, 41 insertions(+), 26 deletions(-)

-- 
2.40.1


