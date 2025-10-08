Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44ACAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXwWA9b7Az34WMt+WzUBfWXQPqhPq4KhcFlkGuNdNyY=; b=d+1WwsRcczMJXaDgqDyO/dOgaA
	FEykDS208ionWnvPc+BLmvRNXIWOuSFozIJ+X1UwE4WRd/95WSXrsNXgjEf+mifR0P5RGVnWrm+Kc
	o1s6Gp01A8lajoQqXom8FhxSnrLLyLJ4cDVz0j/cVNA9lxyYSxShDjqWwRo9gtZaC5Z2XhrrnMJ2U
	vQ/c9bpqYlw7e6LethJAOd2Bebq6QQAdOjqu/oyNf41DsadaZclAJ355e79857Hpst1xxApXUfEcN
	RMtVCfP5SO3nBE0MwzqCEnvCRr/tVs0z8H6DawHK8l2UYA/lTYdFHVSoo2qfIkiAxfL+/OmhVg7Aj
	8GlHcAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJe-00000004P9q-13JA;
	Wed, 08 Oct 2025 17:51:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJb-00000004P8p-1gy1;
	Wed, 08 Oct 2025 17:51:04 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E0410EFE;
	Wed,  8 Oct 2025 19:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945765;
	bh=5QPb7bYF1JsxERE0FuwEAunttFsnfMgYjjBTINS4yIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YPkQFe7m4tlSrmAl9ZBjyv+eI/JWf/k7WF+658nQWBrZIzV+uPNz37s0qBigB9HvU
	 0b3YUzqxgqPxJB7+h8Qo5W0EGYR8x5T9nk5cynRX7S09Q60Zndi6x/TV/AEdKol4kX
	 yrBnirUeTD4FdNnixpQ6jbt3LG5QWFlFQynrDDXA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ming Qian <ming.qian@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Benoit Parrot <bparrot@ti.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 00/25] media: v4l2-mem2mem: Reduce cargo-cult
Date: Wed,  8 Oct 2025 20:50:27 +0300
Message-ID: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105103_583334_A1F2DBFA 
X-CRM114-Status: GOOD (  12.94  )
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

Hello,

The v4l2_m2m_get_vq() function never returns NULL, but many mem2mem
drivers still check its return value and consider NULL as an error. This
may have originated a long time ago from valid checks when
v4l2_m2m_get_vq() could return NULL, with drivers then just copying the
checks. This series attempts to stop the cargo-cult behaviour.

Patch 01/25 starts by explicitly stating in kerneldoc that the
v4l2_m2m_get_vq() function never returns NULL. All the other patches
drop NULL checks from drivers.

I have carefully checked all patched locations in all drivers. They fall
in 3 categories:

- Checks in the VIDIOC_G_FMT, VIDIOC_TRY_FMT and VIDIOC_S_FMT handlers:
  Those may have been added to ensure that the format type has a valid
  value, but that is ensured by the V4L2 ioctl core before calling the
  handlers. The checks can be dropped without a need to replace them
  with proper type checks.

- Checks in the VIDIOC_S_SELECTION handler: The only location where this
  is performed has an explicit type check, so the NULL check can also be
  dropped.

- Checks in other locations where the type parameter to the
  v4l2_m2m_get_vq() function is hardcoded: The hardcoded type is valid,
  so the NULL check can't have been meant to check the type. It can also
  be removed.

There's no dependency between any of those patches so they can be merged
in any order.

Laurent Pinchart (25):
  media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns
    NULL
  media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check

 drivers/media/platform/allegro-dvt/allegro-core.c    |  2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c     |  5 -----
 drivers/media/platform/amphion/vdec.c                |  2 --
 drivers/media/platform/amphion/venc.c                |  2 --
 .../media/platform/chips-media/coda/coda-common.c    |  4 ----
 drivers/media/platform/imagination/e5010-jpeg-enc.c  |  4 ----
 drivers/media/platform/m2m-deinterlace.c             |  7 -------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  7 -------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c         |  8 --------
 drivers/media/platform/nxp/dw100/dw100.c             |  7 -------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c       |  4 ----
 drivers/media/platform/nxp/imx-pxp.c                 |  7 -------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   |  2 --
 drivers/media/platform/nxp/mx2_emmaprp.c             |  7 -------
 drivers/media/platform/qcom/iris/iris_vdec.c         |  2 --
 drivers/media/platform/qcom/venus/vdec.c             |  2 --
 drivers/media/platform/qcom/venus/venc.c             |  2 --
 drivers/media/platform/renesas/rcar_fdp1.c           |  3 ---
 drivers/media/platform/renesas/rcar_jpu.c            |  8 --------
 drivers/media/platform/rockchip/rga/rga.c            |  4 ----
 drivers/media/platform/samsung/s5p-g2d/g2d.c         |  4 ----
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c  |  7 -------
 drivers/media/platform/st/stm32/dma2d/dma2d.c        |  5 -----
 drivers/media/platform/ti/vpe/vpe.c                  |  7 -------
 drivers/media/test-drivers/vicodec/vicodec-core.c    |  7 -------
 drivers/media/test-drivers/vim2m.c                   | 12 ------------
 drivers/media/v4l2-core/v4l2-mem2mem.c               | 12 +-----------
 include/media/v4l2-mem2mem.h                         |  3 +++
 31 files changed, 4 insertions(+), 153 deletions(-)


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart


