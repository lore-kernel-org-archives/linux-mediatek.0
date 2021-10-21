Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 10:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2293D60FD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 10:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2293D60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rbr5KqOqO2hZ9/MZyF8Y3MouxnNjVVT8e6Bq8yXIRGY=; b=MJAUtuaC4QhpwF
	vL7YFsVjRERVb9XLfJnUUcwe5CELFz6kDmmdihf22yVDrddqNGwDi7X43XAouR3+lKXnJeyGoxUCr
	X4ukZU81/KFBYWnPk4i2RoKr9vRkvj7qTAkwzfwBGTuNd+gV38c8LBS5mEmG6rGcc+e3EXGA48UWK
	oo+bQv79Ic2xy9lQ2N6NYO7cate/GK8bgE1aY5Uz1a9VR9weSPgIsHOWEsR59R9qNg5cd5dQP4FMW
	cS4ZJeIuLwm9pc/fzPf8j/zdLwbjDJqaH3HzBzHhzP/1dDCzLwZF4GBeXi1qz9vmiR00zbNVFmmzr
	hYLJtP/7eKpa0TmCEEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVLK-007EWC-BF; Thu, 21 Oct 2021 10:30:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUMC-0070qQ-26
 for linux-mediatek@lists.infradead.org; Thu, 21 Oct 2021 09:27:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v17so2859795wrv.9
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Oct 2021 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZYjp3Dh8hYAEBhaoFo5fj7lc6MgCHR723xl76CUYQw=;
 b=53f8z8rb58oZUqdOszfjJfIxosmnNwBcT1tAWZBniM9HagD5l5e0NJ8M5Oi4LwEmaE
 0pmfn0sSI9zhlBuDjCHI6LvDeNF8e4YQrNVKDeRJ03VQ+xkOANXibCao2miiaaAtVERk
 WHM3i67jMrN0iEMwhYdibUilq9GW9ZGmpLseHf/SX9T+xLW1iLih8aBd/HiETzTFrDCn
 O2bZTFE1SVtseOO1JGcYp3AqMs2T5lc2ft6QIVD+IvTuNCd0LvWem6Xv+Aw7eIXVZjS+
 QYLM3b93FYUKaMpAk1YI1I0dmzD0xOnzREXZnU1uL1p8LLzuyScie0IEUZR47dGFS1U9
 ToMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZYjp3Dh8hYAEBhaoFo5fj7lc6MgCHR723xl76CUYQw=;
 b=fj0Ni6ZOVCFA9YDQUk+jTLNMuZn6ytAy4Zq2UAH85O62YvJnDi95D1sybwvT4RZJGg
 /hcVNrG2Sfwh1kwxyKaDH7tjcZTKpc0BKkK/NMASdfA+COiieLOc80Uv3ECH/62LRcE6
 nykD44qAnfQ+y6aSVVQt3SJr7qGl+oNF4SPvg24UtgLdyvVzuyKUixHuWvGcboeOd+L8
 Yx/IIc8rQEBku4gP6sbVsMwJFlX9cEDr6HYo7Sg51b64PnAdOwut3JPPIozznL98QVcD
 S6rywYLfjnxwp5JtiPJrvWfmq/kRptQ7ezF8wwnFeHkUFtEyvM8Rhi2mG+CRJJqO5CIP
 RPdA==
X-Gm-Message-State: AOAM5304uutM8ozA4Ezal4jEHOul5kcv1vizfGWmR9Xlqd8Wjxgajt80
 9DIfvHWUE1Gw/A3VFSIxq9HbWw==
X-Google-Smtp-Source: ABdhPJxKwvQe1h4U5lHSzGW5G0U7Y6O6CUrkRgxaTKQUauPRqxI+Wryg0o4Rsh3TqDUBSnokeRxL1Q==
X-Received: by 2002:adf:f305:: with SMTP id i5mr5850502wro.155.1634808445339; 
 Thu, 21 Oct 2021 02:27:25 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id d3sm4538468wrb.36.2021.10.21.02.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:27:25 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v5 0/7] drm/mediatek: Add mt8195 DisplayPort driver
Date: Thu, 21 Oct 2021 11:27:00 +0200
Message-Id: <20211021092707.3562523-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_022728_185348_190EC234 
X-CRM114-Status: GOOD (  14.47  )
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

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

In v5 I reworked the mtk-dpi so that dpintf is only using the same three clocks
as dpi does. This lead to the removal of the separate dpintf binding document.
Also there are minor updates to the mtk-dp binding and driver.

The series is based on v5.15-rc1 but also applies cleanly on linux-next.
Note: This patch series is currently tested on v5.10 and I am still
working on testing it on v5.15.

Thanks in advance for any feedback and comments.

Best,
Markus


Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210921155218.10387-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20211004062140.29803-1-nancy.lin@mediatek.com/

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/


Markus Schneider-Pargmann (7):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   87 +
 .../display/mediatek/mediatek,dpi.yaml        |   11 +-
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2813 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  535 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  199 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  219 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 22 files changed, 4019 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
