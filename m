Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96642C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMTLKqcy8YIUfi0MdPQfYeja6u1LC7xNZzeeM4Nw6Wk=; b=pCm06yAMbiOUTuje4OHa3lUzS5
	psh0DvpjxKRWKVlOjnInI4CZOxdeU7qGbe8h1vJJIb0qse+nQXcBBNoHvFaCvZh70qIMR5ZugR97V
	HtuDOY7HSkGRXM9IYMBiogAeSHULGecn7CRwNzmkHQtNo725PrLUQERd2xyPYBCAzEX0k/iBg+Wmf
	ok3ROr2r0G0Tkoz6uMySil+ej4wu+WNUfchhNAbtHH6c+d9D7Accny4/acbmVcoY1AIQs7Nvib5mU
	9JfkAXpMJoWKOIJTxZqB7xuRJIYDYtLYAi4P3iOP5Hxt4lbWrVnycwH1GAv9pkiZOtjPKC+9R/fHj
	g/b+njtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfb-0000000H5ID-0CKl;
	Tue, 30 Jan 2024 15:05:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfX-0000000H5H0-1tBr;
	Tue, 30 Jan 2024 15:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627095;
	bh=KxxppCtScPleTsQ2kw4mZIMAQ37g6r0K3U2qtG4xi28=;
	h=From:To:Cc:Subject:Date:From;
	b=UvMgL+trW/+tLi0dvGrqIsy2SfA/AI+pdWvP119oX0+1yc2WTLnlD4UM2xXuEt6CE
	 3EdnWoFWNa+gmwBmmkAyzMkdPKV0SZuPVpfWinvPHXUmiCgb92v0+VOcOR7dF0G2lf
	 1ca6XWe/GOiAEIhJ3T7YC//IzELVjjO0S8Tg1z0vcuFt2ZHHM4Cwopxc6JuHg/aNM3
	 YaSd2DiXHmhIlNCUjnLVYFXvEA/IF6wp6hAut7hh325B4r/FwJ/iAjQ9AYuGquH/9q
	 Zek91+t8CtkZFrEissD0I1hgMzkioc7ywVIqd3Pq01SDsaT2lZ6vjMF4G/PYne4OB/
	 92lRVJ1Sh7fOA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8F5CD37811CF;
	Tue, 30 Jan 2024 15:04:50 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] drm/ci: Add support for GPU and display testing
Date: Tue, 30 Jan 2024 20:33:31 +0530
Message-Id: <20240130150340.687871-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070459_648773_3E3DBE18 
X-CRM114-Status: GOOD (  15.49  )
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
tests to testlist. Have testlist.txt per driver and include a base
testlist so that the driver specific tests will run only on those hardware.

Vignesh Raman (9):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: mediatek: Rename exisitng job
  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
  drm/ci: meson: Rename exisitng job
  drm/ci: meson: Add job to test panfrost GPU driver
  drm/ci: rockchip: Rename existing job
  drm/ci: rockchip: Add job to test panfrost GPU driver
  drm/ci: uprev mesa version
  drm/ci: uprev IGT and update testlist

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/container.yml              |   6 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   8 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  34 ++--
 drivers/gpu/drm/ci/image-tags.yml             |   3 +-
 drivers/gpu/drm/ci/test.yml                   | 137 ++++++++++++----
 drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 ++++++++++++++++++
 drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
 drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
 drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
 drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
 drivers/gpu/drm/ci/testlist.txt               |  84 ++++------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  24 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   9 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  10 +-
 ....txt => mediatek-mt8173-display-fails.txt} |  13 --
 .../xfails/mediatek-mt8173-display-flakes.txt |  13 ++
 .../xfails/mediatek-mt8183-display-fails.txt  |  16 ++
 .../xfails/mediatek-mt8183-display-flakes.txt |   8 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  13 --
 .../ci/xfails/mediatek-mt8183-gpu-skips.txt   |   2 +
 ...fails.txt => meson-g12b-display-fails.txt} |   3 -
 .../drm/ci/xfails/meson-g12b-gpu-fails.txt    |   1 +
 .../drm/ci/xfails/meson-g12b-gpu-skips.txt    |   2 +
 .../xfails/rockchip-rk3288-display-fails.txt  |  21 +++
 .../xfails/rockchip-rk3288-display-flakes.txt |  17 ++
 .../xfails/rockchip-rk3288-display-skips.txt  |   8 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  54 -------
 .../ci/xfails/rockchip-rk3288-gpu-fails.txt   |   1 +
 .../ci/xfails/rockchip-rk3288-gpu-skips.txt   |   2 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  52 ------
 ....txt => rockchip-rk3399-display-fails.txt} |  38 +++--
 .../xfails/rockchip-rk3399-display-flakes.txt |  23 +++
 .../xfails/rockchip-rk3399-display-skips.txt  |   6 +
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   7 -
 .../ci/xfails/rockchip-rk3399-gpu-fails.txt   |   1 +
 .../ci/xfails/rockchip-rk3399-gpu-skips.txt   |   2 +
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 -
 39 files changed, 686 insertions(+), 279 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (59%)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => meson-g12b-display-fails.txt} (84%)
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-fails.txt => rockchip-rk3399-display-fails.txt} (71%)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt

-- 
2.40.1


