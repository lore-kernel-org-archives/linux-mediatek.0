Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A07FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99/q/F2+NAur1C0sHYHBdfMYdOgBzbg3mFCUC7p5RMs=; b=RSGo9XiuJkks3p
	p4RNSS6mNwqRR1CTFupPo5snIMHqbcv7lAZcWohtibSNtEBimPkBVl77R+xXA+ywZyyIu/yJaUdkL
	lC8UWPm7RjjTi2MGuwaSy8gqgvAp295CIFfUfpXlsBTKx67IZXsXUYFetHe2h5kSWg034AmcbSTsD
	KS7vYIcykz0SUymNWjQ2jgUF0AchRyX2snftoAMi4X+EgyOd3YDSGhygznho4uah+/e+dursM+4Fz
	dK0feevKkRJF2kx9yqTwTLxAB8W0bowNLMqcCVmTAR50A9AnLwd+ZJrMSArocX5RYfH2w3+MLXUkX
	JKte2tT//Dw9EMbHyTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbZI-006UsW-8e; Sun, 27 Mar 2022 22:41:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZD-006Uo5-6i
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u3so17926740wrg.3
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttvVODLTTBaqB4olSje/RjnCtKXgr801DvSo2q2eG0E=;
 b=eB8kNh0eru6ENTfiF7I8ZxfQgc65hjixuwm+WdOYEGiiS0ZIji4HliGcQvmy7m4n8l
 JSAC/LEPtDftUix2szlYowNNLRzxAEmYcKmE213cQwfTsW1PyKem+SvaoiJB5SzevEHj
 p490rhnT34xKU67nlAfaoCjFSXDvaPqM5rBft90+Eu+ruMv9Q784a55+HiMwMwbFxNbB
 lT4loCIWa8dqjvVMXBtUDE5c0sQTygs6cL3VKja9gTSUg6wv1IB8ps16ju7dt/c9lD+T
 55tgtAsvXxmb/p7j7e87S8PlYmb5jf480aEWzV+FgM+LN5m5x8HFF4xalRltUHETkgRk
 +ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttvVODLTTBaqB4olSje/RjnCtKXgr801DvSo2q2eG0E=;
 b=5RoeZipfwYrWw1KXPJxrcUVZvxCkkmADJfsQH960ZRPpz0Q9O1TMp/KC6QmXcnV/xd
 obA9rCCizhIhgKkhkFC2jUDRHQ44eenv6YjnUhZkFaWtPbYOjXzYGpEfnkbLVm2agScy
 hLIS12jqh5rc41lbZnJVIVdkdzYDaGKCIjZZII9sx8XGqF/BY4dPBuSF93w7JVxRhnFf
 whZFnUTnjusiUsbcAbBs0BFjg8XAHdyvt5P28Hu1NrmX591aF89y2YG2FTKg2cjkcCBt
 8n/NdZHGOGbf8phL5L7AQ3sO+c8lbhrlgxQOTSlAVEBxljkIwxRTdmt3fZbsaY1eX9r8
 dk+Q==
X-Gm-Message-State: AOAM531NjRLaWyJN99b/36bXIhcT5GhcEzPwAet9ntUrMUufKP8Yeuog
 G86UZyII0xyj3dS0MogaWF0oAQ==
X-Google-Smtp-Source: ABdhPJwJHwvmnudnZ78O/kb8n+VyIyx/4wcIM7aEIY4BUkHtQ+mFdwbAuOdLXigX6S01LsAJxrtNaw==
X-Received: by 2002:adf:f94d:0:b0:1e5:5ca1:2b80 with SMTP id
 q13-20020adff94d000000b001e55ca12b80mr19448508wrr.323.1648420856992; 
 Sun, 27 Mar 2022 15:40:56 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:40:56 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: [PATCH 00/22] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 28 Mar 2022 00:39:05 +0200
Message-Id: <20220327223927.20848-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154059_344080_7F745457 
X-CRM114-Status: GOOD (  22.15  )
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

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

This v9 is not quite ready yet, as project constraints forces me to
publish v9 this week, I'm sorry if it's not standard practice.

Moreover, it is still un-tested on a recent kernel.
The integration kernel we are using is still based on 5.10... but we
are actively working on bringing up a mt8195 integration branch on 5.17.
The patches have been rebased on top of next-20220301 and have been
tested to build sucessfully (no functional testing).

Changes from v8:
- The DP-Phy now has its own dt-bindings and now shares a regmap using the
  syscon facility with the DP driver.
- hot plug detection has been removed from the Embedded Display Port.
  patch and moved to the patch adding External Display Port support.
- started working on better error handling for the mtk_dp driver.
- rebased on linux-next.
- removal of tvd pll clocks re-introduced by mistake.
- various coding style fixes.

Things that are in my todolist for v10:
- fixing the train_handler in the mtk_dp driver, as I haven't been able
  to reproduce locally (hopefully migrating to running the tests on a
  more recent kernel will help)
- explaining the various sleep/delays introduced in the drivers
- explaining some of the differences between mt8195 and "legacy"
- retrieve CK/DE support from panel driver instead of hardcoding it into
  the dpi driver.
- better error handling/reporting in mtk_dp
- look into re-implementing mtk_dp_aux_transfer() using drm_dp_dpcd_read and
  drm_dp_dpcd_write as suggested by Rex.

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
v6  - https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
v7  - https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
v8  - https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/

Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/all/20211026155911.17651-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/all/20211029075203.17093-1-nancy.lin@mediatek.com/

Guillaume Ranquet (15):
  dt-bindings: mediatek,dp_phy: Add Display Port PHY binding
  drm/edid: Convert cea_sad helper struct to kernelDoc
  drm/edid: Add cea_sad helpers for freq/length
  drm/mediatek: dpi: move dpi limits to SoC config
  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
  drm/mediatek: dpi: implement a swap_input toggle in SoC config
  drm/mediatek: dpi: move dimension mask to SoC config
  drm/mediatek: dpi: move hvsize_mask to SoC config
  drm/mediatek: dpi: move swap_shift to SoC config
  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
  drm/mediatek: dpi: move the csc_enable bit to SoC config
  drm/mediatek: dpi: Add dpintf support
  drm/meditek: dpi: Add matrix_sel helper
  drm/mediatek: Add mt8195 External DisplayPort support
  drm/mediatek: DP audio support for mt8195

Jitao Shi (2):
  drm/mediatek: add hpd debounce
  drm/mediatek: change the aux retries times when receiving AUX_DEFER

Markus Schneider-Pargmann (5):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible
  dt-bindings: mediatek,dp: Add Display Port binding
  video/hdmi: Add audio_infoframe packing for DP
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 Embedded DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   97 +
 .../display/mediatek/mediatek,dpi.yaml        |   11 +-
 .../bindings/phy/mediatek,dp-phy.yaml         |   43 +
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    8 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3204 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  568 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  222 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  202 ++
 drivers/video/hdmi.c                          |   82 +-
 include/drm/dp/drm_dp_helper.h                |    2 +
 include/drm/drm_edid.h                        |   25 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    3 +-
 23 files changed, 4541 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
