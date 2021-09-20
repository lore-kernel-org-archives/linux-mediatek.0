Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D297360F12
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D297360F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IuFxk8Y9RBjN9QK73V78L63rzTpNocjOHP8Uf6RjrFI=; b=ryRaJAfNI/t7+s
	aaZTYeKjwAQFNyz59Ebfx0BuG1f7jDZHThekTMDoP1OYgqhCkqSadT5kigkBMDHHtjUAJUsyBnfLo
	6Z/3JpmLZD17KTJ/A+fmgbWUIc5J3vB0F7zyl11/pcvfm7EF97W8SOMFLDsTj195juF0SSUWlzVOk
	yVMzROaX5gzzmQ6drCt5itXOkiLb1L2ILWTfDAko5uRY+VV5dbWCaCdB/ql0caJSvmkZEbSRS0KyE
	1Dyb8kTYADNw5MzvixKLUH0gFXLnYvU9YQcD7lwNzPZG0P5hI/9Mi94INDIa3ae+sojpvfKncRSpF
	6S/Sz6HlYy/mmjvtGX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEum-000wmk-Rf; Mon, 20 Sep 2021 08:44:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEuh-000wiK-1S
 for linux-mediatek@lists.infradead.org; Mon, 20 Sep 2021 08:44:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id t8so20446557wri.1
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5QWfzsaU49KYqjn5I4kDilzjyCt1o6LBhMWE6h2zk=;
 b=tvBzZUBhhKM/V5Mc+zPF0GHJsAG5N/a4OsO26F2ZWBq2hUWcFwZG2Ja9LCRN4W5cN/
 2JCxGyBp1kopW+zQXAkJYZvHUumN5ZrwuNmbjSXtwh0DCymLFu9Ud0zDcmHN87UbGHfg
 6PUBTjToIUeQk3YECQIfjaW/RhgmDu78BntPkfMvSG4qAYQxDk/5cSRZ0cPNuAcjdLUW
 9TVpEykGJAeQF2TiNwQya1rkoglgQUKzfeUB29rzoasji8k5JAF1NUUAyfL8e5MTz5Ob
 csVDJGFTAnaKg4TPgXAdrVU4I3a3Pm/NOiWUb1oJ36PN8EivcmX9gpXXvD+wBHXWzLIz
 Rumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5QWfzsaU49KYqjn5I4kDilzjyCt1o6LBhMWE6h2zk=;
 b=lrDMvMsk1cBZSpI2iQ+xaVG78JZt0yK62qw6oWvcFeo6Xz9ChmuAiOBAy0uOWxkHSb
 FSWS4jPPRscv7gJA+S2KmAK7hbgC/t7xHy8RVXEq+wBEHYjHNY4D1zE6Cq0PZ5oY7IhX
 A2S6xsZHj2TUU2Nss0Q0NdVqyqzFPIGXtYybHkkEkhgNKkkc/9TbKS40NY30xKep7TG6
 M/qJ4x+81chMnFaS9jTCjH/7zanO5BblMZdbj8zjHB5Q+s71GFOXRbBGFAmAu7/CM2VV
 +h09+lXaclqFMXQ7jZ6c3/ptqAHkE0Rm2OPoqN0qsbtOo+ww9VR3YKDyYlq7HSF+PPgo
 1Mmg==
X-Gm-Message-State: AOAM530hmnMAVCMRHRZqmwGeHV3d1KP37DNYG8D+zLMQ0SItP1RzvJnf
 Ien3MPLHYqDwL8pbAynRYfnj5g==
X-Google-Smtp-Source: ABdhPJxiKMhEJInOM2ibVykhU8PPCOv7Ymx0xv/l9nNsd52khYEKtv2XNA5e8Cmba26ySupkVMI3mw==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr27021202wrr.98.1632127472956; 
 Mon, 20 Sep 2021 01:44:32 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:32 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 20 Sep 2021 10:44:18 +0200
Message-Id: <20210920084424.231825-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_014435_134127_E4FE943F 
X-CRM114-Status: GOOD (  15.78  )
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

Hi everyone,

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort driver to work.

For v2 I rebased the series on top of v5.15-rc1. There still is a functional
dependency on many different patches pulled in through the main two
dependencies, vdosys0 and vdosys1, but I wasn't able to get a clean base with
these patches yet so to continue improving this series in the meantime, I
decided to go with v5.15-rc1 as a base. The main potential merge-conflict
points of this series with other series are mtk_drm_drv.c and
mtk_drm_ddp_comp.* etc. which should be easy to resolve later on.

Note: This patch series is currently tested on v5.10 and I am still working on
testing it on v5.15.

Dependencies:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/

Thanks in advance for any feedback and comments.

Best,
Markus


Markus Schneider-Pargmann (6):
  dt-bindings: mediatek,dpintf: Add DP_INTF binding
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpintf.yaml     |   78 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2855 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  498 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  248 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  218 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 21 files changed, 4140 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
