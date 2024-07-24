Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F1C3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2pNOLl3fWjVYX91Bxn7v4inAjsUOX8QspXLb74qaNQo=; b=VIB1UsmKgmo9o0OXqIaVoAxE5+
	zcL4IR0jWAblesK0KnIeIxdUOmqPMe1hGi/jw/8MfWxc051qMXDdhKJjE4n2bBd4H5EOXxgQFDTI4
	QSYOwusHCs8PIqEwek2KSsqFmb0KKGoVbcTxEDJVJ2YgObExowq86y52eRH6P4Bya9mGpROHReW0F
	zLsMBvytZit906CxygV1nocuzKk8yAP9CZBQ/wIpJIJADhNY63LLPOxCHcFeF3tdX6gfyW52LkiCx
	N0LuI5k/eRzaW4AE9wuq+l3AUEMxrmI331M4s+813TmlqYwNCppYH3pklsoPBLzT+NwQ25bkjFYBE
	BrpJg53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyO-0000000F2gK-2m0c;
	Wed, 24 Jul 2024 10:11:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyK-0000000F2er-2CVN;
	Wed, 24 Jul 2024 10:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721815905;
	bh=y5eg6oSlMBrIqzM60aEB9SQlYliam1C5elKMQH5ygwc=;
	h=From:To:Cc:Subject:Date:From;
	b=hkU6BPqRXDOW/mdtaWAspm9aky7N21a7233n8yF9h1F819UjR87WSsYCLc8UIGXxq
	 zkdgnU2TMZp89nDY6LLuOBuL94n096wKXKY0PJfMzd9WyGgr/y1NbHkEA4OSdR7V4G
	 19MfhuBgQ43hYao5h04DldqhgpP98DSHtBST41ljA+zGF488cZ+Q5Euvgvt8+hz6CL
	 A/NLzf9o1nepLAkEm4yQa9NJ1L2dsEP9sZ3R8NkRDY/dXvPWJohmwlzXRZKT+B8Dl2
	 ORam3HCUH1z+UJnYPh77pghZQWUxAC+4Z2VW8RTnKY/67/podB2m7kxTcYgJj0RGd3
	 5HqOz1Q2WmrOw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B36B37820DE;
	Wed, 24 Jul 2024 10:11:42 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/5] drm/ci: Add support for GPU and display testing
Date: Wed, 24 Jul 2024 15:40:03 +0530
Message-ID: <20240724101015.523535-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_031148_736543_BF98646F 
X-CRM114-Status: GOOD (  14.23  )
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
display driver is rockchip. For amlogic meson G12B (A311D) SOC, the
GPU driver is panfrost, and the display driver is meson.

IGT tests run various tests with different xfails and can test both
GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
This leads to incomplete coverage since the display is never tested on
these platforms. This commit series adds support in drm-ci to run tests
for both GPU and display drivers for MediaTek mt8173/mt8183, Rockchip
rk3288/rk3399, and Amlogic Meson G12B (A311D) platforms.

Update the expectations file and skip driver-specific tests.

Working pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1231543

Vignesh Raman (5):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: mediatek: add tests for mediatek display driver
  drm/ci: mediatek: add tests for powervr gpu driver
  drm/ci: meson: add tests for meson display driver
  drm/ci: rockchip: add tests for rockchip display driver

 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |   3 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  10 --
 drivers/gpu/drm/ci/test.yml                   | 123 ++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  27 +++-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  13 ++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   4 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  18 ++-
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   4 +-
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   8 ++
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |  18 +++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  11 ++
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  18 +++
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   8 ++
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |  71 ++++++++++
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   8 ++
 .../drm/ci/xfails/panfrost-rk3399-flakes.txt  |   6 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |  24 ++++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  21 ++-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |   6 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  54 +-------
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  90 ++++++++++++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  50 ++++++-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   7 +-
 25 files changed, 478 insertions(+), 127 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt

-- 
2.43.0


