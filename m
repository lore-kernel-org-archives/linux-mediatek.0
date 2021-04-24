Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8E2C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:59:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 140FE613B1
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 140FE613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QQKocQLtnzcZAVD8Rtk92vW4PrGtBYmIT15ra5kQ4mY=; b=e/SP7y92TNr7K5mavU4ZS3U2q0
	es/uylV5+KTBkQ81Yo5dQPPAntOKDGZVpKQOdpgSY4N3hAFl+RpNy+wysJN/Ond5tCHqd4SM1QEwj
	GLvn5Kv7jLteb/VQECzauZRThfaHnTpcxf9KReemc+jLMoY75Jzn6wxKmpqRgzZ1evfsRH/oiH/Wg
	Sz/1E0GDZIw5vNAgDBGxbLBCIt6py1lWm1NYIha0fsWWvWhk1CAqcTdRman/Tgfh1o5GdfmMmgcjq
	CJR0BnmypZUOHd/6Fr7t7Suvcxy1ZIujQ3dPvd5iqWSimVEunyBs9lCzNdH4Lw/c04cx2hY0CGKvy
	YsXlhIng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laCGT-003CTd-0E; Sat, 24 Apr 2021 06:59:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC48-003B16-7m; Sat, 24 Apr 2021 06:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=24cpkOzTyGa9SNtXSyRDOyv5BdBdeIFEmpBK8SOwrUk=; b=kyOxLR1+lhgetn0XSXy/7Vd2nX
 hZDqeVEbve/XYAfnEp3qoq7kz6vk4thyUE/cm9LjMn7MfCyJNWY7rlcuLC6tuUw/lrunK9yCjxPxs
 /cuyETBIwmPMSRmSSEmCeYk4SW5JchiVt26YOfh7y7xY5YMt1zbU436yBBOWs7MFZZGlGMo6N6oQH
 jKeLVQzM4myuVl71eMEwdqDSTg1Yg/sD8gwm+jmjV6t8faKt7bCiOnAGopUQRAVmH4IUHUgU65Ekk
 jYVJun511Nd0j/AUlK0ZtVKWp404NA5oKPVoya53M5W5spmqE8lXKCPurvki0nWWLJGnfx1cPg57H
 MWEfV23A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC2s-00EsNR-2w; Sat, 24 Apr 2021 06:45:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 071B7614A5;
 Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619246734;
 bh=Lnim1TUt677YJWiPrC+8LojehUt72YCS6RwqaKvsxik=;
 h=From:To:Cc:Subject:Date:From;
 b=hIffhgY80p5UIxouhMq4zYEYJPZqhghVGH5RoleW5zL7OXHyN/MkccktMHJOI+UiA
 kkJwJUMKa19h1Bpdz00JMKun/cLmyzErqcxzltDRnnKWnLn/hxVEeoNP8mXQgoOvdg
 f1JqyaKVSpOKxwZ9BJZnQ4AXJUhN4zguZ6kUaUuzn9GwgkaxYbl0/B75Bo7fxUFVYL
 CnKxnIWz0C4qKUOdkjzy4usIVUBeQ8AQ2LMW5XqxMK65Vm0kExnClFLr29tEeBZI2a
 daRG4L2AuCCy4cydWBTFq/Zve1e68Jd2ekj9thR9z6ky4wYhQ4C8VLYdUhweX1/a6t
 KWpP3mz5w1Sjw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1laC2k-004Jdj-RZ; Sat, 24 Apr 2021 08:45:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Andy Gross <agross@kernel.org>, Benoit Parrot <bparrot@ti.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Dan Scally <djrscally@gmail.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Helen Koike <helen.koike@collabora.com>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Leon Luo <leonl@leopardimaging.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ricardo Ribalda <ribalda@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shawn Tu <shawnx.tu@intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Todor Tomov <todor.too@gmail.com>,
 Wenyou Yang <wenyou.yang@microchip.com>, Yong Zhi <yong.zhi@intel.com>,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: [PATCH 00/78] media: use pm_runtime_resume_and_get() instead of
 pm_runtime_get_sync()
Date: Sat, 24 Apr 2021 08:44:10 +0200
Message-Id: <cover.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_234538_311850_98893EB2 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During the review of the patches from unm.edu, one of the patterns
I noticed is the amount of patches trying to fix pm_runtime_get_sync()
calls.

On contrary of the common sense that a foo_get() function will
only increment the usage on success,  pm_runtime_get_sync()
increments it unconditionally.

Due to that, there are bugs on lots of places, that ended being
gradually fixed, but, still there are a few places on media where
this is still broken.

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added a new method to does a pm_runtime get, which increments
the usage count only on success.

This series replace all places where the old  pm_runtime_get_sync()
is called, using  pm_runtime_resume_and_get() instead.

This should help to avoid future mistakes like that, as people
tend to use the existing drivers as examples for newer ones.

compile-tested only.

Mauro Carvalho Chehab (78):
  media: atmel: properly get pm_runtime
  media: marvel-ccic: fix some issues when getting pm_runtime
  media: mdk-mdp: fix pm_runtime_get_sync() usage count
  media: rcar_fdp1: fix  usage count
  media: mdk-mdp: fix pm_runtime_get_sync() usage count
  media: renesas-ceu: fix pm_runtime_get_sync() usage count
  media: s5p: fix pm_runtime_get_sync() usage count
  media: am437x:: fix pm_runtime_get_sync() usage count
  media: sh_vou: fix pm_runtime_get_sync() usage count
  media: sti/hva: use pm_runtime_resume_and_get()
  staging: media: rkvdec: fix pm_runtime_get_sync() usage count
  staging: media: atomisp_fops: use pm_runtime_resume_and_get()
  staging: media: hantro_drv: use pm_runtime_resume_and_get()
  staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
  staging: media: ipu3: use pm_runtime_resume_and_get()
  staging: media: cedrus_video: use pm_runtime_resume_and_get()
  staging: media: vde: use pm_runtime_resume_and_get()
  staging: media: csi: use pm_runtime_resume_and_get()
  staging: media: vi: use pm_runtime_resume_and_get()
  media: mtk-vcodec: fix pm_runtime_get_sync() usage count
  media: s5p-jpeg: fix pm_runtime_get_sync() usage count
  media: delta-v4l2: fix pm_runtime_get_sync() usage count
  media: sun8i_rotate: fix pm_runtime_get_sync() usage count
  media: i2c: ak7375: use pm_runtime_resume_and_get()
  media: i2c: ccs-core: use pm_runtime_resume_and_get()
  media: i2c: dw9714: use pm_runtime_resume_and_get()
  media: i2c: dw9768: use pm_runtime_resume_and_get()
  media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
  media: i2c: hi556: use pm_runtime_resume_and_get()
  media: i2c: imx214: use pm_runtime_resume_and_get()
  media: i2c: imx219: use pm_runtime_resume_and_get()
  media: i2c: imx258: use pm_runtime_resume_and_get()
  media: i2c: imx274: use pm_runtime_resume_and_get()
  media: i2c: imx290: use pm_runtime_resume_and_get()
  media: i2c: imx319: use pm_runtime_resume_and_get()
  media: i2c: imx334: use pm_runtime_resume_and_get()
  media: i2c: imx355: use pm_runtime_resume_and_get()
  media: i2c: mt9m001: use pm_runtime_resume_and_get()
  media: i2c: ov02a10: use pm_runtime_resume_and_get()
  media: i2c: ov13858: use pm_runtime_resume_and_get()
  media: i2c: ov2659: use pm_runtime_resume_and_get()
  media: i2c: ov2685: use pm_runtime_resume_and_get()
  media: i2c: ov2740: use pm_runtime_resume_and_get()
  media: i2c: ov5647: use pm_runtime_resume_and_get()
  media: i2c: ov5648: use pm_runtime_resume_and_get()
  media: i2c: ov5670: use pm_runtime_resume_and_get()
  media: i2c: ov5675: use pm_runtime_resume_and_get()
  media: i2c: ov5695: use pm_runtime_resume_and_get()
  media: i2c: ov7740: use pm_runtime_resume_and_get()
  media: i2c: ov8856: use pm_runtime_resume_and_get()
  media: i2c: ov8865: use pm_runtime_resume_and_get()
  media: i2c: ov9734: use pm_runtime_resume_and_get()
  media: i2c: tvp5150: use pm_runtime_resume_and_get()
  media: i2c: video-i2c: use pm_runtime_resume_and_get()
  media: ipu3: use pm_runtime_resume_and_get()
  media: coda: use pm_runtime_resume_and_get()
  media: exynos4-is: use pm_runtime_resume_and_get()
  media: exynos-gsc: use pm_runtime_resume_and_get()
  media: mtk-jpeg: use pm_runtime_resume_and_get()
  media: camss-csid: use pm_runtime_resume_and_get()
  media: camss-csiphy: use pm_runtime_resume_and_get()
  media: camss-ispif: use pm_runtime_resume_and_get()
  media: camss-vfe: use pm_runtime_resume_and_get()
  media: core: use pm_runtime_resume_and_get()
  media: pm_helpers: use pm_runtime_resume_and_get()
  media: vdec: use pm_runtime_resume_and_get()
  media: venc: use pm_runtime_resume_and_get()
  media: rcar-fcp: use pm_runtime_resume_and_get()
  media: rcar-vin: use pm_runtime_resume_and_get()
  media: rga-buf: use pm_runtime_resume_and_get()
  media: rkisp1-capture: use pm_runtime_resume_and_get()
  media: s3c-camif: use pm_runtime_resume_and_get()
  media: s5p-mfc: use pm_runtime_resume_and_get()
  media: bdisp-v4l2: use pm_runtime_resume_and_get()
  media: stm32: use pm_runtime_resume_and_get()
  media: sun4i_v4l2: use pm_runtime_resume_and_get()
  media: ti-vpe: use pm_runtime_resume_and_get()
  media: vsp1: use pm_runtime_resume_and_get()

 drivers/media/cec/platform/s5p/s5p_cec.c      |  5 +++-
 drivers/media/i2c/ak7375.c                    | 10 +------
 drivers/media/i2c/ccs/ccs-core.c              | 11 ++++----
 drivers/media/i2c/dw9714.c                    | 10 +------
 drivers/media/i2c/dw9768.c                    | 10 +------
 drivers/media/i2c/dw9807-vcm.c                | 10 +------
 drivers/media/i2c/hi556.c                     |  3 +--
 drivers/media/i2c/imx214.c                    |  6 ++---
 drivers/media/i2c/imx219.c                    |  6 ++---
 drivers/media/i2c/imx258.c                    |  6 ++---
 drivers/media/i2c/imx274.c                    |  3 +--
 drivers/media/i2c/imx290.c                    |  6 ++---
 drivers/media/i2c/imx319.c                    |  6 ++---
 drivers/media/i2c/imx334.c                    |  5 ++--
 drivers/media/i2c/imx355.c                    |  6 ++---
 drivers/media/i2c/mt9m001.c                   |  7 ++---
 drivers/media/i2c/ov02a10.c                   |  6 ++---
 drivers/media/i2c/ov13858.c                   |  6 ++---
 drivers/media/i2c/ov2659.c                    |  6 ++---
 drivers/media/i2c/ov2685.c                    |  7 +++--
 drivers/media/i2c/ov2740.c                    |  6 ++---
 drivers/media/i2c/ov5647.c                    |  9 ++++---
 drivers/media/i2c/ov5648.c                    |  6 ++---
 drivers/media/i2c/ov5670.c                    |  6 ++---
 drivers/media/i2c/ov5675.c                    |  3 +--
 drivers/media/i2c/ov5695.c                    |  6 ++---
 drivers/media/i2c/ov7740.c                    |  8 +++---
 drivers/media/i2c/ov8856.c                    |  3 +--
 drivers/media/i2c/ov8865.c                    |  6 ++---
 drivers/media/i2c/ov9734.c                    |  3 +--
 drivers/media/i2c/tvp5150.c                   | 16 +++---------
 drivers/media/i2c/video-i2c.c                 | 14 ++++------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  3 +--
 drivers/media/platform/am437x/am437x-vpfe.c   | 10 ++++---
 drivers/media/platform/atmel/atmel-isc-base.c | 26 ++++++++++++++-----
 drivers/media/platform/atmel/atmel-isi.c      | 19 +++++++++++---
 drivers/media/platform/coda/coda-common.c     |  2 +-
 drivers/media/platform/exynos-gsc/gsc-core.c  |  3 +--
 drivers/media/platform/exynos-gsc/gsc-m2m.c   |  2 +-
 .../media/platform/exynos4-is/fimc-capture.c  |  6 ++---
 drivers/media/platform/exynos4-is/fimc-is.c   |  3 ++-
 .../platform/exynos4-is/fimc-isp-video.c      |  3 +--
 drivers/media/platform/exynos4-is/fimc-isp.c  |  7 +++--
 drivers/media/platform/exynos4-is/fimc-lite.c |  5 ++--
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c |  8 +++---
 drivers/media/platform/exynos4-is/mipi-csis.c |  5 ++--
 .../media/platform/marvell-ccic/mcam-core.c   |  9 +++++--
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  6 ++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  4 +--
 .../media/platform/qcom/camss/camss-csid.c    |  6 ++---
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 ++---
 .../media/platform/qcom/camss/camss-ispif.c   |  6 ++---
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 ++--
 drivers/media/platform/qcom/venus/core.c      | 19 +++++++-------
 .../media/platform/qcom/venus/pm_helpers.c    | 10 +++----
 drivers/media/platform/qcom/venus/vdec.c      |  4 +--
 drivers/media/platform/qcom/venus/venc.c      |  5 ++--
 drivers/media/platform/rcar-fcp.c             |  6 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
 drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++---
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 ++---
 drivers/media/platform/rcar_fdp1.c            | 12 +++++++--
 drivers/media/platform/renesas-ceu.c          |  5 +++-
 drivers/media/platform/rockchip/rga/rga-buf.c |  3 +--
 drivers/media/platform/rockchip/rga/rga.c     |  4 ++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  3 +--
 .../media/platform/s3c-camif/camif-capture.c  |  5 ++--
 drivers/media/platform/s3c-camif/camif-core.c |  5 ++--
 drivers/media/platform/s5p-jpeg/jpeg-core.c   |  2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c   |  6 ++---
 drivers/media/platform/sh_vou.c               |  6 ++++-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c |  7 ++---
 drivers/media/platform/sti/delta/delta-v4l2.c |  4 +--
 drivers/media/platform/sti/hva/hva-hw.c       | 17 ++++++------
 drivers/media/platform/stm32/stm32-dcmi.c     |  5 ++--
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  7 +++--
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  2 +-
 drivers/media/platform/ti-vpe/cal-video.c     |  4 ++-
 drivers/media/platform/ti-vpe/cal.c           |  8 +++---
 drivers/media/platform/ti-vpe/vpe.c           |  4 +--
 drivers/media/platform/vsp1/vsp1_drv.c        |  6 ++---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++---
 drivers/staging/media/hantro/hantro_drv.c     |  2 +-
 drivers/staging/media/imx/imx7-mipi-csis.c    |  7 +++--
 drivers/staging/media/ipu3/ipu3.c             |  3 +--
 drivers/staging/media/rkvdec/rkvdec.c         |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  6 ++---
 drivers/staging/media/tegra-vde/vde.c         | 16 +++++++-----
 drivers/staging/media/tegra-video/csi.c       |  3 +--
 drivers/staging/media/tegra-video/vi.c        |  3 +--
 92 files changed, 270 insertions(+), 322 deletions(-)

-- 
2.30.2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
