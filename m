Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FD0C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A709E611C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A709E611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MxOs7g1QlMZSBtHv4ON6hhIdiD4BtpYMs0raOuGTgXE=; b=34ElCHETSlXpZ0
	V82fRM9+/oDgxotMfydYWHwSOgIjCO9XWzjNqDuefnM9PEq7uEZqYiylpdp0SJkx7WUWfY+8PiP7h
	CQbAL3sZQXrCF7dg5GbvP4l78lUCvVCli8RqeKNUrOhHYbrTB1p9hYU3c6OHY+XP1ZTuA6xYe1jh1
	XUIaxYathycK2j8FFgMEz1YOh3AE2+6sXKKTbaM5rj14kiyBjNiYF49/vTURwD3iOXxWsY7II5Slj
	Os7hYKa71t4DsRK7wOO1azgnFg1gPLaOLqW2AtkWql6GmInjVTQcY43pG4MBDDAb1XEphVF0YimAD
	czKLBxF/Zfd7+tuo9/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRDRW-00EDBU-60; Fri, 17 Sep 2021 12:58:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRDRE-00ED2g-Vo
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 12:57:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t8so15044555wrq.4
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Sep 2021 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
 b=Vojsq/qATfqaLlBx4GBlzY1M3WQZBkET3/mYiL3HkeYBMyHzWtJbjHthyfck3N2imY
 cOchlbwuXK/iJL6FTVNRR4N6LsDzg5ueKC6Q/busloEZbIggqb55XCgGJc5u+W6/q1Sc
 C3F2brFPLgR81rImVQ/fzY1R8cBgz8gBVfsLVqJeh3G9HxBG0VqAwdbdGikzpDS42CE9
 ofZWBpM1Dyv1TFNfej7D0ZCxUYMFOKLR0gPEgxl3cicBjY9FSggM8IL0jVct8KiT/Ctm
 6Dr2o3sqhUQ9wRKHM2Se+EoGr+ehAxcbcAFY6nNObaZgFuVZTxRftv90jKjlNW6Xwtc/
 fmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
 b=lBdr6rIRNIkhC8dMozU7kaKjmWCCz2lw3KWJQy2x3TzPfcvxo4zDgX2z5zS2nzro2l
 ip5fpCrceIIaI7TC+ExsN3zrZFbX4YBASEFv0u/Wy8m6zYpFlQ923tGSP0xLS7YH9faq
 ebSLQnJpz9/eKe0XgH5Ddv5b8n89hEIjBNJUwZYTpLL+qlNNVk3QR4FTnSnKTfU9COuy
 rtuh9NlKbDs/eunq/SEBda23hPAU+TlRnS7dghnAcmBvEakiCDZzMD7jaWh6sXRN77Nt
 CpSFn/RifpSrwnw0FlwwJzObyUcCVcbQjPiCas3qRCCFnQcYZqu6REi8gK9bTzuu4jDA
 XqSQ==
X-Gm-Message-State: AOAM532VadIpGZriU4qRKgOp9Zy0TViMG9IlDQV0yy3x6O4zjjnSFghr
 OTEXYIQ6xXefBLSVDMV5FwgVAQ==
X-Google-Smtp-Source: ABdhPJwUld7Y82YW6Rc8Pz69DPxiv4IUt7DfWDhYwTVj5a1Rbt107Ifh+5ZTcTCPWcgP4Ahl8EgU4Q==
X-Received: by 2002:adf:b781:: with SMTP id s1mr11968492wre.165.1631883474593; 
 Fri, 17 Sep 2021 05:57:54 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:53 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 0/4] Add a DRM driver to support AI Processing Unit (APU)
Date: Fri, 17 Sep 2021 14:59:41 +0200
Message-Id: <20210917125945.620097-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_055757_091630_30C44698 
X-CRM114-Status: GOOD (  12.43  )
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

This adds a DRM driver that implements communication between the CPU and an
APU.
This uses VirtIO buffer to exchange messages.
For the data, we allocate a GEM object and map it using IOMMU to make it
available to the APU.
The driver is relatively generic, and should work with any SoC implementing
hardware accelerator for AI if they use support remoteproc and VirtIO.

For the people interested by the firmware or userspace library,
the sources are available here:
https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu

This RFC is a rewrite of a previous RFC that was not using DRM:
https://patchwork.kernel.org/project/linux-remoteproc/cover/20200930115350.5272-1-abailon@baylibre.com/

Alexandre Bailon (4):
  dt-bindings: Add bidings for mtk,apu-drm
  DRM: Add support of AI Processor Unit (APU)
  rpmsg: Add support of AI Processor Unit (APU)
  ARM64: mt8183-pumpkin: Add the APU DRM device

 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   6 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/apu/Kconfig                   |  10 +
 drivers/gpu/drm/apu/Makefile                  |   7 +
 drivers/gpu/drm/apu/apu_drm_drv.c             | 238 +++++++
 drivers/gpu/drm/apu/apu_gem.c                 | 232 +++++++
 drivers/gpu/drm/apu/apu_internal.h            |  89 +++
 drivers/gpu/drm/apu/apu_sched.c               | 634 ++++++++++++++++++
 drivers/rpmsg/Kconfig                         |  10 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/apu_rpmsg.c                     | 184 +++++
 include/drm/apu_drm.h                         |  59 ++
 include/uapi/drm/apu_drm.h                    | 106 +++
 15 files changed, 1617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drm_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 include/drm/apu_drm.h
 create mode 100644 include/uapi/drm/apu_drm.h

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
