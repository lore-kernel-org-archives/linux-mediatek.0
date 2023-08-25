Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C414C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JGJNmkNTA3qH0ASmOAI7uKHwiizIGj5Js37p1JrTY7U=; b=1HLk1YaPuvP8zrP70fZ4xEUluF
	xmdmFHPq+Tfxy7wQj2PwWfqISrn+SvP7oIKV2pvH7zmvlYvNMfI3NC+rVJpYlGht+cOiskwAAjXgD
	vUPvwTLk+UJjh4QsJZwBWIK8mVKM0UCQw/uq5KWbqKnE9HZ5Zlm7CMq5pMJIBhcBMfKm7JgaaD/vc
	LcAqcDlYIP7Ywga8Dt5JB792Mt+wRWVAR4QlYKsC2K7/CyF3qAsOovpGxt3nFwp3CRF9eKat6qr0V
	hwNgAg58fGe3XipjzY5YQYybvm6ltx6xNEcicLzIfMTiancIHWIDAKpirSXM81AINpYXQyhAj13nZ
	qhNY2+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsD-005NKm-1A;
	Fri, 25 Aug 2023 12:25:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVs8-005NHu-2j;
	Fri, 25 Aug 2023 12:25:06 +0000
Received: from localhost.localdomain (unknown [171.76.83.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1819A6607283;
	Fri, 25 Aug 2023 13:24:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692966298;
	bh=KTW2XkA7TENvlUjtZxVgz0cTJt8BRHSoHLAxDPCe3/M=;
	h=From:To:Cc:Subject:Date:From;
	b=atR3yLJW3d4/PabzFRiwGIHVX5yPIRv3bnIJQpvAaxuB1jWhWikx9Rkc7j2ZFJn4d
	 b73hUkhgzynNX8aEiXefftccC/IKE8gKQ7GAsmwBhpKhvzxJTVzi0OViisAtSg4LAU
	 Ozr8OLVfH9ZbsTgvSRZ99RdWR4aByxBqbuvK6Sfzg4IojwEXR/4d30coZHDrJq+8YF
	 tBK4niVms8OfEcUo9BK1nFBuOSwqFJ2/oNZo2yNDI+b2OJHvChJwX5Q0pBJTlG4LSx
	 7ZAcPq8tCEQAC66520N4XYo6jVIUyLao0SU6VN8nAy2qbaboSWx0uDioZ9K8nxI2HI
	 oqtqq8AyWLwVQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	gustavo.padovan@collabora.com,
	robdclark@google.com,
	anholt@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	corbet@lwn.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	heiko@sntech.de,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/6] drm: ci: fixes
Date: Fri, 25 Aug 2023 17:54:29 +0530
Message-Id: <20230825122435.316272-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052505_029035_BD5F692B 
X-CRM114-Status: UNSURE (   8.58  )
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

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.
This series is intended for drm branch topic/drm-ci.

Vignesh Raman (6):
  drm: ci: igt_runner: remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: update ci variables
  drm: ci: Enable configs to fix mt8173 boot hang issue
  drm: ci: Update xfails
  drm: ci: Remove rules

 drivers/gpu/drm/ci/arm64.config                  |  2 ++
 drivers/gpu/drm/ci/build.sh                      |  4 ++++
 drivers/gpu/drm/ci/gitlab-ci.yml                 |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
 drivers/gpu/drm/ci/test.yml                      | 14 ++++----------
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
 15 files changed, 38 insertions(+), 18 deletions(-)

-- 
2.40.1


