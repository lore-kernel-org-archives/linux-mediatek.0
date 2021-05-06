Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C39C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 15:28:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6E161990
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 15:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6E161990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYbDKR+ZjX1q+oIYKho718IAhJM2LBGfFU8EOfG0RyI=; b=PNRqlByFGkHifytXkv6H8wpc1a
	5xKXifHGvM9LC8rlFyY94Nc2m9CAswacMELeHVIqTzGnm/8smm5OR8tj9dpmMyN4LC54BY9laecKT
	9SVfuPW0gflh01BDHaXAwySrqeAkRv50AnQ7R/nsHTLNb+LOHZYjnYjLqmGf1BmeMMKiNDVcWecAX
	//Xd1bm3FRTKz1nGt1IFR6oru05IbhSS2nCNqLhXwfk+59voj+uj2E4bSGirQlzs3UbuTwCStfvwu
	V7fB7/3641doi81QUS1NWEi4rw4gshjYdtcfb5/DloUl4sh2l3dY46F3hUp6r+qN4DQzes1aSHmj3
	ZkETQfUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lefv2-004YJm-Di; Thu, 06 May 2021 15:28:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lefth-004Xrj-MR; Thu, 06 May 2021 15:26:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2403A61584;
 Thu,  6 May 2021 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620314800;
 bh=PvMAY6Y2fz/EvEn1dyCRJ72V76RqJb8t+KOlunBx8UY=;
 h=From:To:Cc:Subject:Date:From;
 b=WnFjjXi6QufHdKAf0NrxvIr88fq46S7vbtcI30ddxj18mrch8A+v1YNh2H9MQqftF
 xbggOG7JOxwSWbQTzeyT2oG4vE9DQQlDsqvm2Shs6WHwvcQtkEff1vL1xmCenTDUxz
 DDU2AwYzImtlNSUjehesEzHx7hlo+/ZKRBsRPbb9i9aumHNHqJTJUYvJFv8/Qa6aLG
 H5cs5YZDguj3bStGcWFq7Fsc7w2JID15ILH4nlzjsa4uOXBi6Sc5apsyWSH8ooG3GB
 bkXTuVqCSd6zl0UkdjlpxZOrap35ifdCt681cypv2r3raeYR+W9YzcVfw734dX4O9c
 P34nCnsFHocGA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1left7-000SB2-KN; Thu, 06 May 2021 17:26:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Andy Gross <agross@kernel.org>,
 Benoit Parrot <bparrot@ti.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Dan Scally <djrscally@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Helen Koike <helen.koike@collabora.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Todor Tomov <todor.too@gmail.com>,
 Yong Zhi <yong.zhi@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 00/25] media: use pm_runtime_resume_and_get() on non-i2c
 drivers
Date: Thu,  6 May 2021 17:25:38 +0200
Message-Id: <cover.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_162642_245352_CC7E737F 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dealing with PM runtime (RPM) is different than dealing with other kAPIs used
on media, as most pm_runtime_get_*() functions won't return to the the state
before the call if an error rises. They, instead, increment an usage_count.

Due to that, there were several bugs on media. Just on this review, we found
24 such errors.

So, let's use pm_runtime_resume_and_get() whenever possible, as it
has two advantages over :

1. On errors, it decrements the usage count;
2. It always return zero on success or an error code. This prevents a
   common error pattern of checking if ret is not zero to identify
   for errors.

There are however a few places where calls to pm_runtime_get_sync()
are kept. On several of those, a comment was added, in order to
help preventing trivial patches that could try to change them.

PS.: This series was submitted already together with the fix patches
at:

   	https://lore.kernel.org/linux-media/cover.1619621413.git.mchehab+huawei@kernel.org/

I opted to break it on 3 parts, in order to make easier to review.

This is the third (and final) part.

Mauro Carvalho Chehab (25):
  staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
  staging: media: atomisp: use pm_runtime_resume_and_get()
  staging: media: ipu3: use pm_runtime_resume_and_get()
  staging: media: cedrus_video: use pm_runtime_resume_and_get()
  staging: media: tegra-vde: use pm_runtime_resume_and_get()
  staging: media: tegra-video: use pm_runtime_resume_and_get()
  media: rockchip/rga: use pm_runtime_resume_and_get()
  media: sti/hva: use pm_runtime_resume_and_get()
  media: ipu3: use pm_runtime_resume_and_get()
  media: coda: use pm_runtime_resume_and_get()
  media: mtk-jpeg: use pm_runtime_resume_and_get()
  media: camss: use pm_runtime_resume_and_get()
  media: venus: core: use pm_runtime_resume_and_get()
  media: venus: vdec: use pm_runtime_resume_and_get()
  media: venus: venc: use pm_runtime_resume_and_get()
  media: rcar-fcp: use pm_runtime_resume_and_get()
  media: rkisp1: use pm_runtime_resume_and_get()
  media: s3c-camif: use pm_runtime_resume_and_get()
  media: s5p-mfc: use pm_runtime_resume_and_get()
  media: stm32: use pm_runtime_resume_and_get()
  media: sunxi: use pm_runtime_resume_and_get()
  media: ti-vpe: use pm_runtime_resume_and_get()
  media: vsp1: use pm_runtime_resume_and_get()
  media: rcar-vin: use pm_runtime_resume_and_get()
  media: hantro: use pm_runtime_resume_and_get()

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  3 +--
 drivers/media/platform/coda/coda-common.c     |  7 ++++---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 ++--
 .../media/platform/qcom/camss/camss-csid.c    |  6 ++----
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 ++----
 .../media/platform/qcom/camss/camss-ispif.c   |  6 ++----
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 +++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +--
 drivers/media/platform/qcom/venus/vdec.c      |  6 +++---
 drivers/media/platform/qcom/venus/venc.c      |  5 +++--
 drivers/media/platform/rcar-fcp.c             |  8 +------
 drivers/media/platform/rcar-vin/rcar-csi2.c   | 15 ++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 ++----
 drivers/media/platform/rockchip/rga/rga-buf.c |  3 +--
 drivers/media/platform/rockchip/rga/rga.c     |  4 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  3 +--
 .../media/platform/s3c-camif/camif-capture.c  |  2 +-
 drivers/media/platform/s3c-camif/camif-core.c |  5 +++--
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c   |  6 ++----
 drivers/media/platform/sti/hva/hva-hw.c       | 17 ++++++++-------
 drivers/media/platform/stm32/stm32-dcmi.c     |  5 +++--
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  6 ++++--
 drivers/media/platform/ti-vpe/cal-video.c     |  4 +++-
 drivers/media/platform/ti-vpe/cal.c           |  8 ++++---
 drivers/media/platform/ti-vpe/vpe.c           |  8 +++----
 drivers/media/platform/vsp1/vsp1_drv.c        | 10 +--------
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 +++---
 drivers/staging/media/hantro/hantro_drv.c     |  5 ++---
 drivers/staging/media/imx/imx7-mipi-csis.c    |  7 +++----
 drivers/staging/media/ipu3/ipu3.c             |  3 +--
 .../staging/media/sunxi/cedrus/cedrus_video.c |  6 ++----
 drivers/staging/media/tegra-vde/vde.c         | 21 ++++++++++++++++---
 drivers/staging/media/tegra-video/csi.c       |  3 +--
 drivers/staging/media/tegra-video/vi.c        |  3 +--
 35 files changed, 110 insertions(+), 111 deletions(-)

-- 
2.30.2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
