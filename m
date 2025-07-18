Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E69C83F1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJ4+TiGQ2fnh7YqWkW+TfnqTavdYt2yzjakLrybf05g=; b=XNJ60aQB4TYDqJfEZ0iHTTII9R
	lb4NWFNFbJXlARc0mnEpOpe/vfHpOXpwTt6uVr2z6TTaYtwDn7Wrm3GHeTh6DvlfO4BCF9ebkoQRp
	ayyUNtKuF6Tus7Ohd5hNP1yXi4V9oDXy0vBNg8ZXIKcQdpr8yzc9TjxlDDcVE8ewlz07jF7VAsJ01
	RJXhRbdKD1ogK14/umcgtNEKNOa242BUm4Tim2K/fKVLUcCstBQvhvXNDPa2elNUZiCUNAjf0GnyV
	dTNGME9oJS5XKpUAmkAyqoxYpXEDOvLNZV4QDiXTPOtahOoNetePgMP0gUJ2ObMkCQd5c4OLHaSkF
	ZtwZi0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFI-0000000CQmt-3dbk;
	Fri, 18 Jul 2025 11:27:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucijN-0000000CMH0-4AVu;
	Fri, 18 Jul 2025 10:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836059;
	bh=L6w5YicZ+2uJKRKkkVqi5nSVRQuaPvJWVKRWUN4W6i0=;
	h=From:To:Cc:Subject:Date:From;
	b=mBcI985sxjmZ0g1gAq9+isfWxrxF8FJ4PIwmiBbenOAMcNN02eCxnNKJPOnfrAKjj
	 1cvmygrWTvd96UaDJzMRSctEZUobKQTHWXVAQST6HZefkc1Ub3c4mJYqfwBqznsEJi
	 gx/FIehGqRVftwOK7TeUcSk4ZXwHn1K6PsAgVYEbD3LoQ3hqqeq7apfc2xzzi4xa7h
	 HwY6WrV5Vhdl3ODsJadnTAxysi8wg0RXvma50oRYaJ9hEXaFHxOFZjkFjGmKhuOCbR
	 12SPzJLycIPgV6eSIkvVfzT1HyP+CsVcrccu/oH3fq859lEiRedW95p/xUqa7/oaaQ
	 TE3UkY23/Uimg==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4DC417E1522;
	Fri, 18 Jul 2025 12:54:15 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
Date: Fri, 18 Jul 2025 16:23:52 +0530
Message-ID: <20250718105407.32878-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035422_184492_A91B1B9C 
X-CRM114-Status: GOOD (  11.73  )
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

This series introduces new jobs to drm-ci for testing the following
devices:
- rk3588-rock-5b
- mt8192-asurada-spherion-r0

Other updates include:
- Uprev IGT and updating test expectations accordingly.
- Adapting to recent changes in Mesa CI, such as:
   - LAVA overlay-based firmware handling
   - Container/job rule separation
   - Removal of the python-artifacts job
   - Use of the Alpine container for LAVA jobs
   - Various other CI improvements
- Disabling bare-metal jobs for apq8016 and apq8096, as these devices
  are being migrated to LAVA.
- Updating the runner tag for i915: cml (switching from hatch to puff)
  to improve device availability.
- Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
  test resources.

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1473405
MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/180 

Vignesh Raman (7):
  drm/ci: disable apq8016 and apq8096 bare-metal jobs
  drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
  drm/ci: i915: cml: update runner tag
  drm/ci: uprev mesa
  drm/ci: uprev IGT
  drm/ci: add rk3588-rock-5b
  drm/ci: add mt8192

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   9 ++
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/build.yml                  |  23 ++--
 drivers/gpu/drm/ci/container.yml              |  12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  95 +++++++++++---
 drivers/gpu/drm/ci/igt_runner.sh              |   6 +-
 drivers/gpu/drm/ci/image-tags.yml             |  14 ++-
 drivers/gpu/drm/ci/lava-submit.sh             |  99 +++++++--------
 drivers/gpu/drm/ci/static-checks.yml          |   1 +
 drivers/gpu/drm/ci/test.yml                   |  73 +++++++++--
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   2 +
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  11 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   2 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +----
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  83 ++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  10 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   3 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   7 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   5 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
 .../drm/ci/xfails/mediatek-mt8192-fails.txt   |  34 +++++
 .../drm/ci/xfails/mediatek-mt8192-skips.txt   |  14 +++
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |  73 +++++++++++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-mt8192-fails.txt   |   9 ++
 .../drm/ci/xfails/panfrost-mt8192-skips.txt   |  20 +++
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |   5 +
 .../drm/ci/xfails/panthor-rk3588-skips.txt    |  20 +++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  12 +-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   9 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   |  10 ++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   |  14 +++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   4 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   3 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
 49 files changed, 771 insertions(+), 166 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

-- 
2.47.2


