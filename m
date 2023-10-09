Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59084E95A95
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 00:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sy2wPEXS3Q8UqjhFT65RZjD84A34utTZ4T77roM7avU=; b=qqijH4x7GBxlqMldrJHFmEVaXN
	35jmFHetQisrZS4CykUKgicdPwPgrPfSjHPTsAPBqAdU3LcsLkl+TTtDL0PEhzgeDHY9fiKfPab+A
	pTbbfNVBVByFXSjI5j+hYgn/szopr50BdaWxRB5gKU+p7rKxGWPx1M69o+/Fr6NmcxZi2j2Szma90
	oSQdPdPJ+Pd68si7VRJOteqAhAuQRBZvNzjRZCUjtivP+jPLY1XuIaL7aJdoxaf0U4Ex5URhBLPyO
	rIvr9yfBulFR9If0Uo5Cua0A6bJjFbYVEuir4ss3PjQyL6Gv98TtkBlTxPsvtoVY08lgksHIVJqAf
	ntj/KDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpeaK-009YzB-15;
	Mon, 09 Oct 2023 00:57:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpeaF-009YyT-0x;
	Mon, 09 Oct 2023 00:57:21 +0000
Received: from localhost.localdomain (unknown [179.221.49.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A7D3660708F;
	Mon,  9 Oct 2023 01:57:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696813037;
	bh=36KY2QEkuekKCMScZo5y6Lh+3n9nQdvTMqIaLNyaUiY=;
	h=From:To:Cc:Subject:Date:From;
	b=Wli7LhRFygJzUrdrsEV/VNagJ5syDI7JfalSqDMvsnpDt6/Nmgq5ic6jn9lRCkhdy
	 RkBhbp90y0p92y2TSTuoyIKhL50cYt9dh9V+D+zUdFEujHyQPt+uV3kQJxAWQORg/K
	 m+nPKctB6BmmSM9OpHecfOw5AwuZezHFW/59GIt/wuzNM9BjZ6sZbbiHSQVOWXSAN0
	 D6yYaoVUJRh1Or+nKri1OIyR29sqaMWqxHOj1+o8Ud+t1ONgbd8hn3sWQp6Fww6m/5
	 avcw+xE6hyoDkRfz8miHlpOYnbfNC8YC+tLyOQjnaHz893WSLLAIZ2NxAjMK+llNKS
	 Km6hB0kAb421Q==
From: Helen Koike <helen.koike@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	Helen Koike <helen.koike@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] drm/ci: fixes and improvements
Date: Sun,  8 Oct 2023 21:56:41 -0300
Message-Id: <20231009005642.207248-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_175719_644599_87F222B5 
X-CRM114-Status: GOOD (  11.44  )
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

This series contains the following several fixes, making drm/ci much
more reliable and useful.

To work properly, the following patches are also required:

[PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
https://patchwork.kernel.org/project/linux-arm-msm/patch/20231008132320.762542-2-dmitry.baryshkov@linaro.org/

[PATCH] drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
https://patchwork.kernel.org/project/dri-devel/patch/20231002164715.157298-1-robdclark@gmail.com/

Helen Koike (9):
  drm/ci: uprev mesa version - fix container build
  drm/ci: fix DEBIAN_ARCH and get amdgpu probing
  drm/ci: add helper script update-xfails.py
  drm/ci: uprev IGT and make sure core_getversion is run
  drm/ci: clean up xfails (specially flakes list)
  drm/ci: adjust the number of shards
  drm/ci: export kernel config
  drm/ci: do not automatically retry on error
  drm/ci: docs: add step about how to request priviledges

 Documentation/gpu/automated_testing.rst       |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   3 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  31 ++-
 drivers/gpu/drm/ci/igt_runner.sh              |  31 ++-
 drivers/gpu/drm/ci/image-tags.yml             |   4 +-
 drivers/gpu/drm/ci/lava-submit.sh             |   6 +-
 drivers/gpu/drm/ci/test.yml                   |  21 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  13 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  20 --
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   9 +
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  32 ---
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  11 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  15 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  38 ----
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  17 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  41 ----
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   7 +
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |  26 ---
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   1 -
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   5 -
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   1 -
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   0
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   5 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  14 --
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  14 +-
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |   4 -
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |   4 -
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   2 +
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   4 -
 .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |  15 +-
 .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |  24 ++-
 .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |  18 +-
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   9 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |  20 +-
 drivers/gpu/drm/ci/xfails/requirements.txt    |  17 ++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   6 +
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |   9 -
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  40 +++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +--
 drivers/gpu/drm/ci/xfails/update-xfails.py    | 203 ++++++++++++++++++
 .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |   0
 42 files changed, 445 insertions(+), 331 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt

-- 
2.34.1


