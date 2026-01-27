Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA93BD2D8F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 10:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKp9x7Zod+xzlJJNSAPumvhU3zIofoI+hJrbTcqLyZ8=; b=q8bvYIdEIq1m+yxOKychoF2Idv
	Bu/ez64KTnMCHekaka44bZbWBtldedvDSDCxQqrLcCT1UWV8goewOVW5q9DLR9ezJc2u3aStr34pn
	xeEAq7j6IN99oIpSPr11i8evMqXLcfjErZwSGKZbVgoGngbXumJPNUtPg2ThbjB7UstT8jasEkWA0
	iFcx05VONhrMjR87Y1Kxup0KxSgFpDFTc+24LiXpfjU8821essIbRGQbWvkTXCRi8B8NETWHandWY
	pOC5np7+LGliw0etOYW1OIRVEKbWG9ekFNq6GTGY9QHrAzAoWh7htZr41sRQxLpoRZAd/psQotmML
	dFSWeUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgYc-0000000E4yq-2NEl;
	Tue, 27 Jan 2026 10:44:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgYX-0000000E4xX-2A9G;
	Tue, 27 Jan 2026 10:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510657;
	bh=vrKMHfK+jZccgVy53jFWZbkRm0Iff0NWCOMHyQbgupU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZmuuAy4XR4xaY64h4v0IoNHx3qlVSJHc6IQ2HmPWCtZ5uokj9ZEtgbZeXr3HSTIGU
	 wvumhyLr5qTbPe2EQptpgA6/07ZQNScRK56xJT1QYkgOZ2BX5pNb03zFPKkVKQP8yU
	 j5Owl5XlBW2W3a8UmIWoko3YsRQQ9+1hGK6NJhRX+9ulZ4pCcNo0mkYCSZV2JxqjZP
	 BiB7EmQ3LfMune35mElYW349RfnXJ36qDciWzPzS5zQ2ZJi3VVbchoxUXya6tgtZqX
	 X9QeJJ/9Sx+2fdsMlJjAvkODK7FBFhcy3Eqe4MwYvOwaNXC2PEKwTiRIQu1DNbzTIc
	 12EjiAcHvjEFA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99DE217E00AC;
	Tue, 27 Jan 2026 11:44:13 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
Date: Tue, 27 Jan 2026 16:13:55 +0530
Message-ID: <20260127104406.200505-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_024421_741446_0D7017E3 
X-CRM114-Status: GOOD (  12.45  )
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

This series introduces new job to drm-ci for testing the following
devices:
- rk3588-rock-5b

Other updates include:
- Uprev IGT and updating test expectations accordingly.
- Adapting to recent changes in Mesa CI, such as:
   - LAVA overlay-based firmware handling
   - Container/job rule separation
   - Removal of the python-artifacts job
   - Use of the Alpine container for LAVA jobs
   - Various other CI improvements
- Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
  are migrated to Collabora LAVA farm.
- Updating the runner tag for i915: cml (switching from hatch to puff)
  to improve device availability.
- Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
  test resources.
- Fix issues with rebase with external fixes branch.

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1591806
MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/213

mediatek:mt8183 fails and it is reported upstream - https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/#r
Few intel jobs fails, this will be investigated and a seperate patch to update xfails will be sent.

Link to v1: https://lore.kernel.org/dri-devel/20251114030056.1139570-1-vignesh.raman@collabora.com/

Vignesh Raman (7):
  drm/ci: uprev mesa
  drm/ci: move qualcomm baremetal jobs to lava
  drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
  drm/ci: i915: cml: update runner tag
  drm/ci: add rk3588-rock-5b
  drm/ci: uprev IGT
  drm/ci: disable rebase when pulling *-external-fixes

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   6 +
 drivers/gpu/drm/ci/build.sh                   |  13 +-
 drivers/gpu/drm/ci/build.yml                  |  22 +--
 drivers/gpu/drm/ci/container.yml              |  28 +++-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  98 ++++++++++---
 drivers/gpu/drm/ci/igt_runner.sh              |   6 +-
 drivers/gpu/drm/ci/image-tags.yml             |  22 +--
 drivers/gpu/drm/ci/lava-submit.sh             | 101 +++++++-------
 drivers/gpu/drm/ci/static-checks.yml          |   1 +
 drivers/gpu/drm/ci/test.yml                   | 119 ++++++++--------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  16 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  32 +----
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  65 +++++++++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  24 +---
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +---
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  35 +----
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 131 ++++++++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  37 +----
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  50 +++++++
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   4 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  16 +--
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  13 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   2 +
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |   5 +
 .../drm/ci/xfails/panthor-rk3588-skips.txt    |  20 +++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  14 +-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 +++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  12 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 +++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   |  10 ++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   |  14 ++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  50 -------
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
 49 files changed, 835 insertions(+), 384 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

-- 
2.47.3


