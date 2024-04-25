Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40279C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZEazKPcDXBuQ/L/ZGRk6AE3iq14KvSy/h7KlRi0I+s=; b=MXsNBLwaZAzZqonHdlImxyMiDw
	sMt/8/zjMaLoIjCMBvpOQODdBodJmc7R6Wt6JzdnXwyZl0ebnJW7ZeTnYFD5PIA4eP1/UbuHda4YE
	NQogoPyKPIn6dYMqq+Wo/SqJmjuZltWGyOCo7r2C7FZCFx++82J1EeVqeGnXwpA5RqAYDNuJtI0Cp
	2q89L7C2UWexw+9koLYBOjoMWJvVhwDiClRUUQJg4qp/3VYX2IP9roo+wPwX96wIRge8/d19iEl4W
	7kqvEn26/Gu3m/dBWWSZHhM7sKWXN2A2zQqqmE9Fh+ac27M5DXvDreZ4An+g7vz0JH/n/CJErHsJe
	Bzfu072w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Bt-00000009C14-3FRL;
	Thu, 25 Apr 2024 15:39:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Bs-00000009C0Z-2dZt
	for linux-mediatek@bombadil.infradead.org;
	Thu, 25 Apr 2024 15:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+ZEazKPcDXBuQ/L/ZGRk6AE3iq14KvSy/h7KlRi0I+s=; b=cGp42efTb6ozhtHyVFXhWYe5rY
	SoiA6vM9hJ6/Vj/6Xf25n16d4VSmt5ehFePYwG4TMLKos8cjWkyG3LvTuRowrg4tljJqruUT04ezR
	0xY8Mg3xxCowFuupNNYmy7nzYaOgHlLt/W2WXQ9fydsW3P2JYIBsnkgul8sg9wmioB6Na+cXOwbNU
	VrX9mnSmnMxGdUQCZ8hgpKO5LbK8wLV7c0z0ohuSziRkxpkrfJuJg29wzHevENq7yGE2dJMFcRurS
	crNQM0aiFBjndGgK5fdLKIcDwSeZMLSWZej2qhS4vgQ2OcHnkjsZ3X4DQNCYgqesxH3Sc5CqNKqY/
	rusduI1Q==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Bo-0000000Ezex-2NPz
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 15:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9268ECE1AD1;
	Thu, 25 Apr 2024 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75BCC113CE;
	Thu, 25 Apr 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714059544;
	bh=3a2+j1JZDUVjbZREnQkHm3jUlHCl+/8Ud/MU8EZhSr4=;
	h=From:To:Cc:Subject:Date:From;
	b=cNbRwOOUo/rAWZjzz1g/0cfZy2LKy7k9CupiKmcLn5/4SOrvxu/CllNUk4+awGjxN
	 6PweI28WX2HYpQ8FcVGnF0jUaZecOyB2wSwIjAGK67Ndm7FmPRLWAAuHKL14YfgH/O
	 YwsrjqOP6fP4kOH5cU8LA0Yyq8geKlVvX7ryxHVy7IbtgJK1EGaH411jLI59ZcErRa
	 6R8iiKcH6jV21OJthTXmHIpsRtoHRwyMvk9gv8cmMFBBy2thFicWKWQsp8INvU84n+
	 6GhVoGmjPyiKMPiJMhOFzLjJpn6udKMoPamtMVzXk9LcnPXaj5SAxVV9H36a9pqr9g
	 zWEqUl0tsPmnw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Justin Green <greenjustin@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wojciech Macek <wmacek@chromium.org>,
	Shuijing Li <shuijing.li@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 6.10
Date: Thu, 25 Apr 2024 15:38:59 +0000
Message-Id: <20240425153859.3579-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_163913_440687_62E0384B 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi, Dave & Daniel:

This includes:

1. Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
2. Add GAMMA 12-bit LUT support for MT8188
3. Add 0 size check to mtk_drm_gem_obj
4. Init `ddp_comp` with devm_kcalloc()
5. Rename mtk_drm_* to mtk_*
6. Drop driver owner initialization
7. Fix mtk_dp_aux_transfer return value
8. Correct calculation formula of PHY Timing

Regards,
Chun-Kuang.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.10

for you to fetch changes up to 417d8c47271d5cf1a705e997065873b2a9a36fd4:

  drm/mediatek: dsi: Correct calculation formula of PHY Timing (2024-04-22 13:40:34 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.10

1. Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
2. Add GAMMA 12-bit LUT support for MT8188
3. Add 0 size check to mtk_drm_gem_obj
4. Init `ddp_comp` with devm_kcalloc()
5. Rename mtk_drm_* to mtk_*
6. Drop driver owner initialization
7. Fix mtk_dp_aux_transfer return value
8. Correct calculation formula of PHY Timing

----------------------------------------------------------------
Douglas Anderson (1):
      drm/mediatek: Init `ddp_comp` with devm_kcalloc()

Hsiao Chien Sung (14):
      drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
      drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
      drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
      drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
      drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
      drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
      drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
      drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
      drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
      drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
      drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
      drm/mediatek: Rename mtk_ddp_comp functions

Jason-JH.Lin (3):
      dt-bindings: display: mediatek: gamma: Change MT8195 to single enum group
      dt-bindings: display: mediatek: gamma: Add support for MT8188
      drm/mediatek: Add gamma support for MT8195

Justin Green (1):
      drm/mediatek: Add 0 size check to mtk_drm_gem_obj

Krzysztof Kozlowski (11):
      drm/mediatek: aal: drop driver owner initialization
      drm/mediatek: ccorr: drop driver owner initialization
      drm/mediatek: color: drop driver owner initialization
      drm/mediatek: gamma: drop driver owner initialization
      drm/mediatek: merge: drop driver owner initialization
      drm/mediatek: ovl: drop driver owner initialization
      drm/mediatek: ovl_adaptor: drop driver owner initialization
      drm/mediatek: rdma: drop driver owner initialization
      drm/mediatek: ethdr: drop driver owner initialization
      drm/mediatek: mdp_rdma: drop driver owner initialization
      drm/mediatek: padding: drop driver owner initialization

Markus Elfring (1):
      drm/mediatek: Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()

Shuijing Li (1):
      drm/mediatek: dsi: Correct calculation formula of PHY Timing

Wojciech Macek (1):
      drm/mediatek: dp: Fix mtk_dp_aux_transfer return value

 .../bindings/display/mediatek/mediatek,gamma.yaml  |   5 +
 drivers/gpu/drm/mediatek/Makefile                  |  12 +-
 .../drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c}    | 218 ++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_crtc.h                |  28 +++
 .../{mtk_drm_ddp_comp.c => mtk_ddp_comp.c}         |  51 ++---
 .../{mtk_drm_ddp_comp.h => mtk_ddp_comp.h}         |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   5 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |  30 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  34 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  33 ++--
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |   5 +-
 .../gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c}  |  68 +++----
 .../gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h}  |  23 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  14 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   1 -
 drivers/gpu/drm/mediatek/mtk_padding.c             |   5 +-
 .../drm/mediatek/{mtk_drm_plane.c => mtk_plane.c}  |  26 +--
 .../drm/mediatek/{mtk_drm_plane.h => mtk_plane.h}  |   4 +-
 30 files changed, 305 insertions(+), 314 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (95%)

