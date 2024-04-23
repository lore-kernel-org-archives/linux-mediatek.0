Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA013C41513
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 04:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNhzVaa0up6uLpfDl8HLPWvCYeLL1bG7SFDN/AYXppc=; b=bNWnK/6g7Hl+SFJANcNs0Wakce
	mkU+VSrUI4Ls+17nyfwHfmim6kL/okAZiDDa4ENqN7OCb8zRGfuwmwC2MuP0we9svI3gzXQ/F6w3V
	HiWQG1Lg6ha+zPpB+o8/t4KmiFXdVhcHzaUpTIt+FsAOArrJTl6vtJeG2NeFgeXv1Xh8EMWCegWzc
	s2L88uZL7fNO+Bg7u7hdmxgYqI9Gixgyo+XSUBD0k3OzbeMcRSuni74pcG51m/b4YXQdOuVXYeVY8
	uvRxIeoGhG8qAxyGSrjDP6uVvBqaOvh0Zt89Lnz5vk9Tl5/KZf8wFH0GDMPcM3gXUwB1kXryM9Ttc
	FT3jhH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7NX-0000000FtpJ-2Ux2;
	Tue, 23 Apr 2024 04:03:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7NR-0000000Ftna-3xE9;
	Tue, 23 Apr 2024 04:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713845006;
	bh=goF/fTNE8wl6AsxxGJwpUshDKR4pSsFtLXytgcbYEpc=;
	h=From:To:Cc:Subject:Date:From;
	b=pzeWLW4MCujJs/GAp2jdHGWku8MU/8lFZnetCkkQJYGcsExtYo+WOp6uQR4b4YNAO
	 fD/dz5wUIe0Dp00hWDfhOypem64p/TWXNDMcblcFN/tFl0ekLsgQt5K4qlAE09Iqc/
	 0tGxE7Egs1RKPBzrqCJ+dyoeBNOMrOGyLX+97Cfgw6HZ+ERKqweCwTxl5ymRVKDEQb
	 KL0F29j9bOqWv7GLG9oac+Z5qYK7le8tKeNsOQwCsCCEvbcFxXMW1ITaR/gEgDBcNF
	 RNJEnjCvmWczgzWSDjkoEJedNFxdKll0tUGVdndK0HswnuvIFX/qNvL5Ltm44Ro/AZ
	 TRYsLI1YLm/kw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E96DA378000B;
	Tue, 23 Apr 2024 04:03:22 +0000 (UTC)
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
Subject: [PATCH v1 0/4] Uprev mesa and IGT
Date: Tue, 23 Apr 2024 09:32:39 +0530
Message-Id: <20240423040243.448091-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_210330_287279_1AAD5DDE 
X-CRM114-Status: GOOD (  13.00  )
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

Uprev mesa and IGT to the latest version. Stop vendoring the
testlist into the kernel. Instead, use the testlist from the
IGT build to ensure we do not miss renamed or newly added tests.
Update the xfails with the latest testlist run.

Also build virtual GPU driver for virtio as module.
This series also includes patch to add vkms testing to drm-ci.

The flakes list needs to be updated upsteam. Will send it
after this series is reviewed.

https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1161026

Vignesh Raman (4):
  drm/ci: uprev mesa version
  drm/ci: build virtual GPU driver as module
  drm/ci: uprev IGT and generate testlist from build
  drm/ci: add tests on vkms

 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/ci/build-igt.sh               |   23 +
 drivers/gpu/drm/ci/build.sh                   |    2 +-
 drivers/gpu/drm/ci/container.yml              |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   14 +-
 drivers/gpu/drm/ci/igt_runner.sh              |   15 +-
 drivers/gpu/drm/ci/image-tags.yml             |    7 +-
 drivers/gpu/drm/ci/test.yml                   |   33 +-
 drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
 drivers/gpu/drm/ci/x86_64.config              |    3 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   45 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   30 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   27 +
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   47 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   24 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   37 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   20 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   37 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   21 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   29 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |    1 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   34 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   27 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   28 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   57 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   21 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   47 +-
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   13 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   18 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |    6 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   15 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   20 +-
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    7 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   15 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   25 +-
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    7 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   15 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    6 +-
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    6 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |  117 +-
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   40 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    6 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   16 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   41 +-
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   11 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   16 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   76 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   26 +-
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   16 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   54 -
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   60 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   79 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   13 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   17 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   99 +-
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   19 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   46 +
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |   21 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   30 +
 64 files changed, 1109 insertions(+), 3308 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

-- 
2.40.1


