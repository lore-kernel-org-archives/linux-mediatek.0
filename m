Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B933CCD190
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbCNpAYIPae32+g0NWVFssTvnWcu5XCM+s6LdBCCw7c=; b=38rPYTVvZa4IDKgJIBS/J/m6WD
	h7HJgHfnZyGNuZqcjDc+sGyCFdn4+WTDqVa88qk3wHsuI8+BO5jpH8YJ/LXyDvMEhBw+R4sD5EZFq
	TAoz64Sla7v7RXt4PCHwUb469t4MAzDc6FLZusyR9JjPVI4ZId69sT2sI8L+h1fpDPYfGS50ePw4s
	kd6zpH6z0oRiBDhVcxFRXc+2Jxs9ah/YoVgqzgcu80N7YDAY++W2iPXTK+n34qjaZ7ODXELJIYgju
	+mFI4gF1uGZOIFQtgaDXaWz5GajEOnxeuDebu18BzgMLkuAet2pc7AJzY6lDg2qBVIXCTTuzLOIul
	3a4DksVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKn-00000000oZz-2sNx;
	Wed, 15 Oct 2025 07:54:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKk-00000000oZ2-1omE;
	Wed, 15 Oct 2025 07:54:07 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7C3E8E92;
	Wed, 15 Oct 2025 09:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514742;
	bh=HMpyQc1vCbg200Ovi9oVcwwxqMAbktCljqyWnp6/pa4=;
	h=From:To:Cc:Subject:Date:From;
	b=bHz2suxZQcf0OwK6sXgHCFZZ6iQ17jH8d09o9a4jKXrYvttYbKQiN193Zi3ckmrEb
	 VOc063B/05xd/wZPm3lhzUiRSoCLduQif6EbnCkdyDb4f7fNTKbIFtfsUB7NowV2j5
	 Xm/CYKIPh8yqEnxujxmRWLzg3Hf6LshKSceZbfRg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ming Qian <ming.qian@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Yunseong Kim <ysk@kzalloc.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH v2 00/25] media: v4l2-mem2mem: Reduce cargo-cult
Date: Wed, 15 Oct 2025 10:53:23 +0300
Message-ID: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005406_612967_2A1DAC65 
X-CRM114-Status: GOOD (  13.66  )
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

Compared to v1, this version drops two more NULL checks, in the Mediatek
vcodec encoder get format handler (09/25) and the Qualcomm iris venc set
format handler (15/25).

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

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  5 -----
 drivers/media/platform/amphion/vdec.c              |  2 --
 drivers/media/platform/amphion/venc.c              |  2 --
 .../media/platform/chips-media/coda/coda-common.c  |  4 ----
 .../media/platform/imagination/e5010-jpeg-enc.c    |  4 ----
 drivers/media/platform/m2m-deinterlace.c           |  7 -------
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 -------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 14 --------------
 drivers/media/platform/nxp/dw100/dw100.c           |  7 -------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  4 ----
 drivers/media/platform/nxp/imx-pxp.c               |  7 -------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 --
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 -------
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 --
 drivers/media/platform/qcom/iris/iris_venc.c       |  2 --
 drivers/media/platform/qcom/venus/vdec.c           |  2 --
 drivers/media/platform/qcom/venus/venc.c           |  2 --
 drivers/media/platform/renesas/rcar_fdp1.c         |  3 ---
 drivers/media/platform/renesas/rcar_jpu.c          |  8 --------
 drivers/media/platform/rockchip/rga/rga.c          |  4 ----
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  4 ----
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  7 -------
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  5 -----
 drivers/media/platform/ti/vpe/vpe.c                |  7 -------
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  7 -------
 drivers/media/test-drivers/vim2m.c                 | 12 ------------
 drivers/media/v4l2-core/v4l2-mem2mem.c             | 12 +-----------
 include/media/v4l2-mem2mem.h                       |  3 +++
 32 files changed, 4 insertions(+), 161 deletions(-)


base-commit: 082b86919b7a94de01d849021b4da820a6cb89dc
-- 
Regards,

Laurent Pinchart


