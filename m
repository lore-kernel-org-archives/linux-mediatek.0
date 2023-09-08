Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97260EE8019
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H4z+ybAx8WN4tn4XPgh3wTj3yPv/8OtP+zAQ3Mh1W9A=; b=369IP8nZygBIIlVRxsW7GWASS4
	c85c7CfudKKpQN/IBajnpauqg+Qy9ONRp9DfQcV79ZMlQMQyE/ctSAKcf9ZSaVBi+u8yEJHI9tcux
	VtysoCedQGjStFCBqBD3oISymSlPtsQOa1oWZRol9EWjeK5cXn+VJJUsVNDBUjgyR67bh9mFWG6fM
	Bu2JFWQPsmgh/EuWjAx2XDq/VkGdwRH1N/ZZUNjZBK/TVFMpuNGsc6MjBmAK6x21oWyR4XViiLtW1
	0YgGXd3nOwPir9NvEIQPra5u8/k6ImV3sWUNcaTY6Tu5/0RBTcICmw/ZmuzlOL/6jBXRZ488osrO2
	pNvoqynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedK8-00DzfS-1N;
	Fri, 08 Sep 2023 15:23:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedK5-00Dzeh-10
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:23:07 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 908B16607286;
	Fri,  8 Sep 2023 16:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186580;
	bh=UH7JSXB6n2DATdqfhUnkdU+dfoIlqt8kj0cMfuz0osk=;
	h=From:To:Cc:Subject:Date:From;
	b=igyvzlqK5lTzT29SaRx5bCMKCwY4r6CFAJi1gYFmbWRaZUIY83Itg/T7tDjJxg+Wn
	 +gmlb2G86StkbllazVja93Mzjxf4XsTrgVn8I8N6hw/eDKq/Axc90ABzulch+e8RNS
	 qjMP2pa3vtcjcOeG1g7d7Bqxb+WRUsLG0HGWquZbuXJQBuo2boB/CVSqI6UH8VO/r1
	 idwEN7nFMIxoCttRbLW9Bp+kusAs5wG6Ei2IyR6/x6OZS/32GCIjgRFG119PmOZuFL
	 OB636AUb+930DyYaQwVKApws+/A14fHy4TZnPr2riikJjdg2wMAclhvSTLrEPQJqNr
	 r98mp3sOMYKSw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	angelogioacchino.delregno@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/9] drm: ci: fixes
Date: Fri,  8 Sep 2023 20:52:16 +0530
Message-Id: <20230908152225.432139-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082305_572683_FF8F3859 
X-CRM114-Status: GOOD (  15.22  )
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
This series is intended for drm branch topic/drm-ci.

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  - Reworded the commit message for enabling jobs
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

Vignesh Raman (9):
  drm: ci: igt_runner: Remove todo
  arm64: dts: qcom: apq8016-sbc: Add overlay for usb host mode
  drm: ci: Force db410c to host mode
  drm: ci: virtio: Update ci variables
  drm: ci: Enable regulator
  arm64: defconfig: Enable DA9211 regulator
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 .../boot/dts/qcom/apq8016-sbc-usb-host.dtso   |  8 +++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/build.sh                   | 21 ++++++++++++-------
 drivers/gpu/drm/ci/igt_runner.sh              |  1 -
 drivers/gpu/drm/ci/test.yml                   | 14 ++++---------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  2 --
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 16 ++++++++++++++
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  2 ++
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  4 ++--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  3 +++
 16 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

-- 
2.40.1


