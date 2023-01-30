Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9756BC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecowfVD9CiDcwCPBFyyEY+IiK8o2lLBsvJWCE5dxfDo=; b=p7A4eLcZS/P1d9rDepSGe7aFVj
	c/XK5igxaZxEoqr8lFgech86OGS9gy1xOotVb1gyv7kagponWX3XsN7O4nfunggY0nPZFFAyrbcmR
	4uVxSiQT9D/lLc/N4TcxegBmuFaq+8lHFDU4gl7TlbzWfnlF7rfhTgWDHTDeocGnMHcED4NBiaHTY
	jjoRo+sWBgpcIZdvFnICwPkRa/bXoAXNsC6tMaNxVaEK9BOK2fLJazzniohoeoHEWNCZuWpP1eEzD
	AeTRq5jD7IcH7UFk58R8CrlCIuAjfpjPlnn/3njKpcqFGVnEWV9edYLLoCa0dWcSJFU4Ez7ld64zg
	/qaIW+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTno-003avv-B6; Mon, 30 Jan 2023 13:02:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTjo-003ZhW-4Z
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:58:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70F0560ED8;
	Mon, 30 Jan 2023 12:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE156C433D2;
	Mon, 30 Jan 2023 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675083495;
	bh=h6Q6KjLjI37ic9N53oKoz+rpip0wPOOuPid68b9RUj4=;
	h=From:To:Cc:Subject:Date:From;
	b=cfXx7tj9KaAX3MBpvlg7sHXzAblucRPGU4LjRGyxhyW95wKCcnUuMq8G5kg2PraCw
	 hGBhWGBYl81ttGHsuz0ZKeBoEYG9+mQ94kgBTV73uMR+IDk3WTEzO3B4ll280+AgS+
	 6mVPFocB08WLSEpvU/iPZIEbJ5MVp7zTPF5k4L6YUXlw8dNXRdjRsdIBRTyqCb73h+
	 0E02V56jVFvknUT8drbAV/9BKq6JvDJBtaG+w+iBEHnLOXrY+qZClv/qJN/4OGepuW
	 qr+pVRmsYsCWQ+QFJ76IFtHTPU1aCRDwzVM6+S5iUmEl6G3Zc8R2qjj6DyPs5NzsdM
	 SfA1YoIiq8prg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Xinlei Lee <xinlei.lee@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Deepak R Varma <drv@mailo.com>,
	Rob Clark <robdclark@chromium.org>,
	ruanjinjie <ruanjinjie@huawei.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 6.3
Date: Mon, 30 Jan 2023 12:58:11 +0000
Message-Id: <20230130125811.2567-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_045820_299760_5B826CDF 
X-CRM114-Status: GOOD (  10.06  )
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

Hi, Dave & Daniel:

This includes:

1. Reduce the time of dsi from LP11 to sending cmd
2. Remove dependency on GEM DMA helper
3. Drop unbalanced obj unref
4. Fix the fallback for mediatek,mt8186-disp-ccorr
5. Fixup for error path.

Regards,
Chun-Kuang.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.3

for you to fetch changes up to 137272ef1b0f17a1815fec00d583515a0163f85e:

  dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr (2023-01-29 02:19:13 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.3

1. Reduce the time of dsi from LP11 to sending cmd
2. Remove dependency on GEM DMA helper
3. Drop unbalanced obj unref
4. Fix the fallback for mediatek,mt8186-disp-ccorr
5. Fixup for error path.

----------------------------------------------------------------
Allen-KH Cheng (1):
      dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr

Deepak R Varma (1):
      drm/mediatek: dp: Remove extra semicolon

Miles Chen (2):
      drm/mediatek: Use NULL instead of 0 for NULL pointer
      drm/mediatek: Include missing headers

Nathan Lu (1):
      dt-bindings: display: mediatek: modify VDOSYS0 display device tree Documentations for MT8188

Nícolas F. R. A. Prado (1):
      drm/mediatek: Clean dangling pointer on bind error path

Rob Clark (3):
      drm/mediatek: Remove dependency on GEM DMA helper
      drm/mediatek: Drop unbalanced obj unref
      drm/mediatek: Remove unused GEM DMA header include

Xinlei Lee (3):
      drm/mediatek: Set dpi format in mmsys
      drm/mediatek: Add mt8186 dpi compatibles and platform data
      drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd

ruanjinjie (1):
      drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc

 .../bindings/display/mediatek/mediatek,aal.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  3 +-
 .../bindings/display/mediatek/mediatek,color.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |  1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  1 +
 .../display/mediatek/mediatek,postmask.yaml        |  1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  4 +++
 drivers/gpu/drm/mediatek/Kconfig                   |  1 -
 drivers/gpu/drm/mediatek/mtk_cec.c                 |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 32 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  5 +++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 11 +++++---
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |  3 ++
 23 files changed, 71 insertions(+), 9 deletions(-)

