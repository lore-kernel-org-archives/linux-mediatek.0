Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88491C27C43
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 02:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wv3KVCZfkCZSvvRvZCkgZN0eVxBFiiooEdPdczilEWA=; b=jLwp6kmvY5MUAWwejPExMT23xd
	t22h2wC26t29ppGQ4gQ5/wKrV+gTM+mHTR+kmFQtxTzM/wB3V4ClAs43rjrLQwjuiKI/OD2ceeCLe
	86zgMBd1HydX0ezDctVFPNOUzaWayeP5KbIC1hKk/Cmu4mG+b7cepe9Sp5gbE6l+q+z1/UEUg9rvA
	5Se+bkpB2G9vmC+HNn+63PVg1jTLtwGnwww05z3yZKlHOnzYcPnj6xo5D5YTBDUJkYgM7/Tv7ckJg
	wjE6Zbt4bJ1cpvR7i7Rw1/i6nnt23xNiGa0oidZKTlwhWWGgUAnGt4hQFIY9Lth/uYYlbiN0tbw27
	12lj2WGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9G8-00000002cTQ-3Pkt;
	Wed, 29 May 2024 02:41:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9G4-00000002cRK-2cjH;
	Wed, 29 May 2024 02:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716950498;
	bh=8I5N/bPH995IFvJcI2gT3VcEir2faP4m3D/1Jo2TbsI=;
	h=From:To:Cc:Subject:Date:From;
	b=LHd3UvExj3TjVSuh8o857nGSYP8gUy2nERuemFdb7ldwmZX/mxGl3dCc/nAlMV2yo
	 JTll4zrW2byD3wN4nNISCW6P7TpWspg4zvklT/yKNeGRimFMoLunEglZTsdhYVvlcv
	 /oaBaEAGtx/lGz8PzEFJpU3mSdP1HKgJSKCBWysMvBmT9X2VqEvCq3tKGxarTYAIKH
	 7Rt80MfjzqNsva1NrnyNfGKacDBQiRek1aoKboGMLvCgJSR6QzAFJhjHhpdoloLc/c
	 eS6pFt4dwT481gNDolKtc0cr3fptmgpkCYRSbfckbwhxwyz1tqimzMolyhJGTTbRES
	 4HxN0OWDIq9Pw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B337E3781FE6;
	Wed, 29 May 2024 02:41:33 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/ci: uprev mesa/IGT and generate testlist
Date: Wed, 29 May 2024 08:10:43 +0530
Message-Id: <20240529024049.356327-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_194145_159638_3683CF27 
X-CRM114-Status: GOOD (  12.20  )
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

Uprev mesa and IGT to the latest version and stop vendoring the
testlist into the kernel. Instead, use the testlist from the
IGT build to ensure we do not miss renamed or newly added tests.
Update the xfails with the latest testlist run.

Add farm variable and update device type variable.

https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1187556

Vignesh Raman (6):
  drm/ci: uprev mesa version
  drm/ci: add farm variable
  drm/ci: generate testlist from build
  drm/ci: uprev IGT
  drm/ci: skip driver specific tests
  drm/ci: update xfails for the new testlist

 drivers/gpu/drm/ci/build-igt.sh               |   41 +-
 drivers/gpu/drm/ci/build.sh                   |    6 +-
 drivers/gpu/drm/ci/container.yml              |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   46 +-
 drivers/gpu/drm/ci/igt_runner.sh              |    9 +-
 drivers/gpu/drm/ci/image-tags.yml             |    2 +-
 drivers/gpu/drm/ci/lava-submit.sh             |    4 +-
 drivers/gpu/drm/ci/test.yml                   |   17 +-
 drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   41 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |    7 +
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   33 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   31 +
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   46 +-
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   26 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   38 +
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   23 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   41 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |    7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   26 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   42 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |    7 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   36 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   77 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   28 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   63 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   22 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   30 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   11 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   16 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   21 +-
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   18 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   24 +-
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   18 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   12 +-
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   15 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    7 +
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    6 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   26 +-
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |  175 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    8 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   19 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |  175 +-
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |    6 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   16 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   38 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   25 +-
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   19 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   62 +-
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   21 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   83 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   13 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   19 +
 drivers/gpu/drm/ci/xfails/update-xfails.py    |    4 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   94 +-
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   20 +-
 61 files changed, 1348 insertions(+), 3194 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt

-- 
2.40.1


