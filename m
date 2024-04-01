Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71FECD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RLtgEvSgEsLWc4apqXc8RJuAyir0guXlfUYte6qX0uM=; b=qiftfsSA9e94tVJvCuSxxsi/rc
	Pca9PY8pYd1/SUtG5uE0QxOWnHZPKdrKKnV+BRjXe6Y4t2+bICCCgn3TqntfJ1DQvdIJShE9ih/5e
	hpyxklX+6ccdI9UgdUdAEa1C3JKKdkU4c60Z/Gxz9FPFMmUmAIwhxxmmVMdmdpmONhCkCY3KKpyyc
	ARy4PQ1xPhXoXDdT3ULKZeRaU63Y5fBoctWQo2Y+8Trm4TwZLhgwNq0ZYsdL8clUADpcAJ0gQ7EXv
	rwclTQoc6IAwqOSH3LugDCfweQfHxJKqu/ALugD6IQI7nRaE+9gfl2ISukPOfn2nA4YQcQ2YNZcoO
	v6jnOARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAvN-000000071Lj-36d4;
	Mon, 01 Apr 2024 06:13:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAvH-000000071JS-3eM2;
	Mon, 01 Apr 2024 06:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711952009;
	bh=/x4kBCuY+ccxV+JdiuLGZjMTNXMcjW/HgSMYytFO9ik=;
	h=From:To:Cc:Subject:Date:From;
	b=F/QFKQRtdRPVizgrcaJWAlxYVtohziHdyu/AmgMpdoIP7elCwdztc7XL9psW7i7u3
	 aD+wKiMNETxiEYYiOXSFsuZPC8BgsvJwirv8ZhR8rtuAg3d0gDkmpObIlEroLp2pOR
	 E/GGTLFOQLFB0JvUOPic9KnBJCNwueqADiFThdT8OPTGq/XHKbW0gFjTOfXtS7yEp7
	 iXvG/GMrlBnStRc5229+XJ8W3oHtR0zaLvxkePKPTONQFHny7OaBltIrYv8cCrCiMH
	 qntmOqHngcl7vx6Ed+YCEtFzi9ZXPuRDmQRrJUKZIzL1QonUyUpKkD9Q7kr2z7MmQH
	 fDl/oHvqPISDQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7749C3781360;
	Mon,  1 Apr 2024 06:13:25 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	mairacanal@riseup.net,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] drm/ci: Add support for GPU and display testing
Date: Mon,  1 Apr 2024 11:42:25 +0530
Message-Id: <20240401061235.192713-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_231336_282345_7ACBFC3D 
X-CRM114-Status: GOOD (  15.01  )
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

Some ARM SOCs have a separate display controller and GPU, each with
different drivers. For mediatek mt8173, the GPU driver is powervr,
and the display driver is mediatek. In the case of mediatek mt8183,
the GPU driver is panfrost, and the display driver is mediatek.
With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
display driver is rockchip. For amlogic meson, the GPU driver is
panfrost, and the display driver is meson.

IGT tests run various tests with different xfails and can test both
GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
This leads to incomplete coverage since the display is never tested on
these platforms. This commit series adds support in drm-ci to run tests
for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
Meson platforms.

Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
tests to testlist. Add testlists to the MAINTAINERS file and skip
driver-specific tests.

This series also includes patch to add vkms testing to drm-ci.

Working pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1140647

Vignesh Raman (10):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: uprev mesa version
  drm/ci: uprev IGT and update testlist
  drm/ci: mediatek: Refactor existing mediatek jobs
  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
  drm/ci: meson: Refactor existing meson jobs
  drm/ci: meson: Add job to test panfrost GPU driver
  drm/ci: rockchip: Refactor existing rockchip jobs
  drm/ci: rockchip: Add job to test panfrost GPU driver
  drm/ci: add tests on vkms

 MAINTAINERS                                   |  11 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/build.sh                   |   2 +-
 drivers/gpu/drm/ci/container.yml              |   6 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  18 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  16 +-
 drivers/gpu/drm/ci/image-tags.yml             |   5 +-
 drivers/gpu/drm/ci/test.yml                   | 138 ++++++--
 drivers/gpu/drm/ci/testlist.txt               | 321 ++++++++++++++++++
 drivers/gpu/drm/ci/x86_64.config              |   1 +
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  25 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   9 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   9 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  15 -
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  13 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   6 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   8 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   6 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   5 -
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   6 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   5 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   8 +-
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   6 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   6 +
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   6 +
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   8 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   8 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   8 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   8 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  50 +--
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  15 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  38 +--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  11 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   9 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  33 ++
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  20 ++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |  23 ++
 52 files changed, 890 insertions(+), 144 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

-- 
2.40.1


