Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6DBCF6494
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 23:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kOel1Unbxxr3YDk751ysNmeBQNAgsVDZQMuGKijlvqk=; b=oo3/Np3gx0HEddMVGt+nPmMvrX
	t4glwzpoNYd1AmooMYFO7ENS/+iSUT0uav96vtI1/2vxSIkQh0hwWoTfdFGcaOUcruu0saqOFmKSg
	JE22zKuQFskey6h7DIdc/hRKLNh2W63SQAu8U9ShJUJHWB6ARDDFsvxzBl2jh+3OIbO85x49p8BUc
	zIzs/+xgr/rdNIj5x2UC3U8C2iupMzRqtDfI6o31Z8h/Xn/FYP071sZOikvAjsAzbSFvlnOikjX0j
	YSIt61MydotwUYJ4gYp3+BQ90h8KP2TPmzOvhlnR/GcY0Ls0cwM8VG/KQPh/w/g1cZrpSIhm5MZYA
	/2zf2yVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLrej-00000005qFn-32pu;
	Wed, 19 Nov 2025 23:32:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLreh-00000005qFb-2u4y
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 23:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C42C160010;
	Wed, 19 Nov 2025 23:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FBBC4CEF5;
	Wed, 19 Nov 2025 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763595126;
	bh=laRUt/SfESbpQ9OHY7uw4QNXguFAXSsPBJi0Jw0N/Bg=;
	h=From:To:Subject:Date:From;
	b=Sfc1NAHlJmwQSJtzjRxtJV0xyuer9qwegg9LfjEEGlwc9Zg4bwFC5nYVmFD4JR6OW
	 fjpCu1L5Fx5t8d/ObbEk13k4n1TIrI882d5QRHRsZ0XDaZZl5KbIU/ukTwDeySNohU
	 T3nmXYuxdqYJLRvB/8+0C4XeHa0BzvdMz/6YRiWLjrT7kjW7dVrd5Mtwt6wUGgwl8x
	 YAhegDs6F58nCgAyq/QKpXFJB3w4rrPCRQxJiAE6viF/cMKpWShqsaz9iTBQzXm4FI
	 /SL+d6PJPRvLS4n0wnLGrk++x69Yp0XIDajGpYBjctAiIPaZ8GR6DnXBiOPgFiZXGY
	 PhaOsRqHIasbg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Johan Hovold <johan@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	Jay Liu <jay.liu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>
Subject: [GIT PULL] mediatek drm next - 20251120
Date: Wed, 19 Nov 2025 23:32:02 +0000
Message-Id: <20251119233202.10034-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, Dave & Sima:

This includes:
1. Fix probe resource leaks
2. Add support for MT8195/88 HDMIv2 and DDCv2
3. Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
4. Fix device node reference leak in mtk_dp_dt_parse()

Regards,
Chun-Kuang.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20251120

for you to fetch changes up to a846505a193d7492ad3531e33cacfca31e4bcdd1:

  drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse() (2025-11-19 23:01:28 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20251120

1. Fix probe resource leaks
2. Add support for MT8195/88 HDMIv2 and DDCv2
3. Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
4. Fix device node reference leak in mtk_dp_dt_parse()

----------------------------------------------------------------
AngeloGioacchino Del Regno (9):
      drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
      drm/mediatek: mtk_hdmi: Add HDMI IP version configuration to pdata
      drm/mediatek: mtk_hdmi: Split driver and add common probe function
      drm/mediatek: mtk_hdmi_common: Make CEC support optional
      drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
      drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
      drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
      drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
      drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST

Jay Liu (1):
      drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue

Johan Hovold (5):
      drm/mediatek: mtk_hdmi: Fix probe device leaks
      drm/mediatek: Fix probe resource leaks
      drm/mediatek: Fix probe memory leak
      drm/mediatek: Fix probe device leaks
      drm/mediatek: ovl_adaptor: Fix probe device leaks

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_hdmi: Drop redundant clock retrieval in mtk_hdmi_get_cec_dev

Miaoqian Lin (1):
      drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()

Sjoerd Simons (1):
      drm/mediatek: mtk_hdmi_common: Defer probe when ddc i2c bus isn't available yet

 drivers/gpu/drm/mediatek/Kconfig                |   23 +-
 drivers/gpu/drm/mediatek/Makefile               |    3 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c         |   33 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |    2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       |   23 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |   12 +
 drivers/gpu/drm/mediatek/mtk_dp.c               |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |  539 +-------
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c      |  456 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h      |  198 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c      |  396 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h     |  263 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c          | 1521 +++++++++++++++++++++++
 14 files changed, 2925 insertions(+), 549 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

