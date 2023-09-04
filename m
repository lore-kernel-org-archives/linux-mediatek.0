Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57FC88CB2
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtisdXd2jxodd/KcE+MxhwMF0BiAGFlDuhqEogY3whs=; b=IhD5Nwq9v6KsBxQGFmSLR6LGoK
	7qZTGe90LtFD2NJKltF8mDu52Mlg6vCskyeSdd1C4sraiPqZ6Qqgr+xrGL+QmKIBu0oY3qN1AnzMs
	GMZ+0LhFCHsvjkonZGql6ffHPWHdHU2AlQZBrUX3TfPg8hPTca60hS0TJiTRtjPb7AfPMxp+ZpjRH
	kQzaq2F8bcU/7amorAq9565RE4Zp64y/A6D55G4twOmUNahh6/W0y/RNZ9Qfe/YAe9gI9J2uyT6oF
	AyU1EIukbraYillUCScxISa1wJ6CjxkBLKVPxS+xuLzXCntWXouqHC0alfJyzGnmLPaBmu2LaKBIY
	uF9Tn3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFH-004RrQ-2W;
	Mon, 04 Sep 2023 16:16:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFE-004RqG-1Z
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:10 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 696FD660722B;
	Mon,  4 Sep 2023 17:15:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844163;
	bh=xPXtvuiXMDVBWx/0jUHhIWmNJ5ZPDsCSW3gvJrwF0oY=;
	h=From:To:Cc:Subject:Date:From;
	b=k6JZBUwnNWNMmFP4LrNvMsJjMmMG8xtaztfYdO1KfVk7AcmpPoNW5n9A0eWaZUl6R
	 1+9n3PXxe5e/uO1S8i6sfzaxJcyz6dAyT3GGQ4bQ6nmfUC1RwzFK8ij9LdMCe221VL
	 YINmWrOLNMf8jBXVowAScLstpDHGYwV4pM26+xhfEyJNBFKAFYd6e8aZEKTLSQdd7U
	 huHZaSeDa4ajqaOQ+qj4X/0qZ6jWuDYddHaiYTd6wbYzCn3GlaehkDH4wDrlAuQ6j7
	 QmYj0in4HMVY7kOlc+Bdf29oqWskc4qrWG4oeRbwxoYs80F+4ede0LSPlLnPFvOIYq
	 UR96GTDDVNZQg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/7] drm: ci: fixes
Date: Mon,  4 Sep 2023 21:45:09 +0530
Message-Id: <20230904161516.66751-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091608_667569_C3ECF045 
X-CRM114-Status: GOOD (  12.50  )
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

Vignesh Raman (7):
  drm: ci: igt_runner: remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: update ci variables
  drm: ci: Enable configs to fix mt8173 boot hang issue
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 drivers/gpu/drm/ci/arm64.config               |  2 ++
 drivers/gpu/drm/ci/build.sh                   | 19 ++++++++++++-------
 .../ci/dt-overlays/apq8016-sbc-overlay.dts    | 13 +++++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  1 -
 drivers/gpu/drm/ci/test.yml                   | 14 ++++----------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  2 --
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 16 ++++++++++++++++
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  2 ++
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  4 ++--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  3 +++
 16 files changed, 59 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts

-- 
2.40.1


