Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D74C35FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOAUXmxWWYWue8W9uXzLairNwlIkBc25BZany2mwl5w=; b=2I2Ljoju+DfGbnzDDnVnt6F+5+
	O2pxXyhF+h82BALBFUBkwRq2l4POQTZCxmuHDhYYrvEXtG9bnm7pRP8GaksPr8RTEhaYZaajIso/J
	RA1a7JUW0opHJF2isBN8UGrnikUcKSWo7qM7OS2nrKxBdMLGUNb9FJTvFSUO2CX1xqNpv8Ez3DN07
	S9pX9VKKd18wWuD99AGZBF6XQoi+nYYXjFlEwn8Ht483YmaAmwPm8fOFj0svRGipcI2NZqYjzdFdJ
	X1+QX1Yf6MMiphVoN8cOHD3H+VRiw6l98HB9Nur0VGlb26oVylcIkLkDKVDnOWQlHNJ97+7M45Eeg
	zu8lo4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0su-0000000DaUf-2BUk;
	Fri, 14 Mar 2025 08:59:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0sr-0000000DaTt-2Ugx;
	Fri, 14 Mar 2025 08:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741942750;
	bh=im+7eMeBUvMZK5Oih1Sdrmafx3HxHI3s8rS8+2FrRsI=;
	h=From:To:Cc:Subject:Date:From;
	b=V2efJ7/faLqbjg4QqJB+KxtSF80rtVeo7I3qwnD/gRrAcMeBvYqHzthod4M5IvwKi
	 c8UEDD0X+IzuWuYhX5e6htMeNNg/lXYbLSUKLNiGIdY/4727guhdFOztosU8HDI0Of
	 He1rWyV+zDNBK8JawM0IKOJG67Vg1lfxEMfr0uIVlQAHg+5b8MKGaesbIpitgOGc6O
	 k5BpZXzJowIOX36jse+HRJGOlmUyQMT2+C1GyRYO54P5p5NNiHR52NQaWXGLVJR/Pr
	 r8NmnbgiGno2pWtxK5Kz3Vrbg15C2thVqHTjyHdfVKgEDY5S2T5E4iFt4PrBXIj06w
	 s2ZMyJfz2WAAQ==
Received: from debian.. (unknown [103.163.65.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5CB117E0ABD;
	Fri, 14 Mar 2025 09:59:06 +0100 (CET)
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
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	jani.nikula@linux.intel.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: uprev mesa, IGT
Date: Fri, 14 Mar 2025 14:28:49 +0530
Message-ID: <20250314085858.39328-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_015913_778361_E7F4180A 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Uprev mesa to fix lava-test-case argument parsing. LAVA recently fixed
parameter parsing in `lava-test-case` [1], eliminating the need for
repeated quotes in arguments.

Uprev IGT to the latest version. Also update expectation files.

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations. Enable PHY drivers for MediaTek platforms:

[1] https://gitlab.com/lava/lava/-/commit/18c9cf79  

Testing:
MR pipeline for drm/ci changes: https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/13
MR pipeline for kernel changes: https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/14
Scheduled pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1384221
Branch pipeline:
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1384158 (with lockdep patches after rebase with latest drm-misc-next)
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1383492 (without lockdep patches)

Vignesh Raman (3):
  drm/ci: uprev mesa
  drm/ci: uprev IGT
  drm/ci: arm64.config: mediatek: enable PHY drivers

 drivers/gpu/drm/ci/arm64.config               |   2 +
 drivers/gpu/drm/ci/build.sh                   |  16 +-
 drivers/gpu/drm/ci/build.yml                  |   8 +
 drivers/gpu/drm/ci/container.yml              |  24 ++
 drivers/gpu/drm/ci/gitlab-ci.yml              |  34 +-
 drivers/gpu/drm/ci/image-tags.yml             |   4 +-
 drivers/gpu/drm/ci/lava-submit.sh             |   3 +-
 drivers/gpu/drm/ci/test.yml                   |   2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  20 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   2 +-
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  32 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  13 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   5 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  22 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  20 ++
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   1 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  28 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  21 ++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 -
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   1 +
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |   7 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   4 +
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   7 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   1 +
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   7 +
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 313 ++++++++++++++++++
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   1 -
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  30 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   1 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 +
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  28 ++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   2 +
 56 files changed, 633 insertions(+), 106 deletions(-)

-- 
2.47.2


