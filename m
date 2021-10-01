Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D949EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3443613A7
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3443613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PLeXNSAQonT2rACpyRfk7zijxRJL8SKaQzJ9XQ6BErc=; b=rGwxpzihoYFkR/
	FF3aBl8EE5FQ/dFVdJ7PZVLieIVFhiCmcLCxl2bMM+SHzTpDmvEj1F7IqGXgHa6PBe3XeqOzC5tBD
	c/S9nrx1f2s3hpM+LBC1DpmnfM7vAndIfjF/8mSPmvcFZ3YQIz3NGzDUAH7oRUFNUrln9CGVShJzk
	q7TydWHKRmYjMn9gdUs13SJ3J7kp8D4yfVxh3tTreRDTkObHeee9gOR71l+ONapnkSPn1NNZ3lJuB
	0AXO39y7STy3jDmfoOCdMGLwyJB+KnIE0JzZ29Hnr0ZhMO05bfP2bZC0ZCg13r9frqfBpiSK+m/wO
	aefTVdLwIR6TFE6djm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF7x-00HJfh-71; Fri, 01 Oct 2021 09:46:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF65-00HIi5-IF
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:44:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so10736190wmq.1
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Oct 2021 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOCEBYgA2BFbjVbZmrsKq39teKLQmhzle1apcWlBCeg=;
 b=j7YKtKFJBDMXB/JSpf6jkk04WJ5xzl7awydIXyLynMimmu9NQ0FNfT6kN4RwB4v9Fu
 GFLy0Q1v/RM45Bc55hjtAOZ4sNA6gasXtuVKs//rGlDZPVj95UXP1jJxgOHW/omXe374
 RUHVuT03MJRdL5/ddvZxGNOq5DIHsfSqRS/5ucFwk2Ry+1+l3eAQPwtZWRe3VEf7rMk8
 lqy/0UIMkLvscqzs5NItVOnxEJaTrWPA5n6F2QsVD4PiTBTA7xpOKc0Vo1sGN5YUdgWX
 53/HrZS9gVLEJVchyqq5QlS4t5cJDbSpE1g3eYQ+gGxrmk1v3M+bChrd2aePTB8E/IpJ
 objQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOCEBYgA2BFbjVbZmrsKq39teKLQmhzle1apcWlBCeg=;
 b=itO3VRmD4GdAYTR7UvJ+quHhWcDyhNUSY0b4j2R46AfQCme+l0BaEYnAKfdLG30AmA
 BcsPGgb0kqchczMdNipGfIwQmCULTkbPFTHoyDrRt3Y4xw1CDKJTfPPb2/UG1oWYiR0l
 /dPdkpMKD277VzvVL2NUrxPnHJ06IZi/QXB8HaLVD9z/lZSc5btnXzyG5PjtbOcBfF1E
 yQlepV93R06HqbU9nnElwNwCh/CBatthI+dJWnm9hN8kO4Zc8cczgSAZ2hYkdUf/uMgq
 6P7yhHupWNKX6/84F3FyQpTHX8VEZHrfYPWXYgh5VYmkIWwWbJ9yIb2gIJBS7Yqy+csG
 WgHA==
X-Gm-Message-State: AOAM533n5liz67tkLbw64ahqCrFuI1ttnJd86E9i2VJ6J9l4+kMa//KV
 QlxxOXK9lflDWmThWr7Z+LJ6Dg==
X-Google-Smtp-Source: ABdhPJzAcGyZKaas6qyfVwP2a6Q5GkAf1ZgvXWJu4LUm9+Wtp4Rl1afD6JnjL6M3T4eGURnPeQ2DRw==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr3449866wme.137.1633081491477; 
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Fri,  1 Oct 2021 11:44:37 +0200
Message-Id: <20211001094443.2770169-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024453_764010_8C96CC2A 
X-CRM114-Status: GOOD (  15.81  )
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

For v3 I fixed/removed obsolete TODOs in the driver code and fixed one feedback
comment regarding a 'DRM_' prefix for the CEA_SAD defines.

The series is still based on v5.15-rc1 but also applies cleanly on linux-next
at the moment. There still is a functional dependency on many different patches
pulled in through the main two dependencies, vdosys0 and vdosys1, but I still
don't have a stable and clean base with these.

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
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/

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
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2825 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  535 ++++
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
 21 files changed, 4147 insertions(+), 74 deletions(-)
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
