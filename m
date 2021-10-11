Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD3FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 09:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E96D60D07
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 09:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E96D60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bngOOb2guW72JAdH14DKUzU4J2/3wViU6AvSyQlMaNQ=; b=3SnucwXKSyucBP
	lXeCz1BCagHF08QzF/51P4IAEj+oRyNDHe+RCJJDLDYUK1/1pGSFK3CN4vSC2L8rJAVj56TXLk9tK
	sXJZ63oO0cSsU1zsyD+P87IncRDgy4lh1CU9avYWCT+ovt/+cI0oKxBGRHi4HfmK6MaHh2jP5fawq
	csuXiLlms5XGzeXngSTcCdxPQ0Ps4qkm8ed2evMVFlEkiy4iHHUOcARlbBiUbSMy+FZXH/l1MwwLw
	E4rjWomiI9a3eyeae5Id5bceeEprzL4+BDQpkRyfnYWzmS1TvBeVaD+d7oVoLd3sBTS6FSQkgLow2
	AfHj5Ii6E4R/7rBN2SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZrxx-008ejQ-Q0; Mon, 11 Oct 2021 09:51:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZrtA-008cMZ-Ov
 for linux-mediatek@lists.infradead.org; Mon, 11 Oct 2021 09:46:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id e3so20590272wrc.11
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Oct 2021 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSc57xuE9GFmk4sxP/W9phMrvO3YpoWm1qxIDAy9GJs=;
 b=aLMYJJl2jay10utJpCqgLmwjoJoHF2aWNffZ8CcQdQbjpmToq1xKpzaix08JuBwetA
 n15W8fKyqZhVG3QRv36cWd8qXOPo//x+dDwbY+YzcxYCdcJsOsuFtJgy1hPxgDVfs5Lg
 V0hqggcuQ08di7ZkzkVpudUVokVEYmNKzx0gk0mfEV7PxTFUP4AzPeEUlHyarb1QJnpu
 vV7FeRP0kJ49E8L0rXCaAuc4O2MGCjQqvqB/R1iraABe8wTaMiQW5Rkcqc5Ip1O3Rp2+
 GZeyaaTeyhQFIoZhM/jTR5qfghgQjGLsZoglkhL6NIxAWBfVkGcSfHgWrnXUhriYYgqL
 klbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSc57xuE9GFmk4sxP/W9phMrvO3YpoWm1qxIDAy9GJs=;
 b=lbyvQleBLCC/kFjd2YB7t+/WKfbTwW8AbCPvR9+PSlnn748e8mZtgspK7PZJ8eqFSw
 8U3DR4B9NfSG7ARsS5Pn8DVAqpWHHB3un/PaJ1YPp8IzIyFjN3azsm7zCi0zA3o4tnuX
 SOSu9z8PvLX6m9WPM/5qfzlq5Zf5Fw7e0H4xyJ5ZpZRW9y5utJiTm/PxxPLERGIG7hc8
 FG9esYSc8uqJM8ZsfuJH1oA4zOGyC/uDO74kr2okDFN+vTKTgfUXM+YlIEonsnZnub0y
 NM7y08yZ7xbl19DZHZtcLY82Mze8hmaCdHeaP/L9RFNlN4Q9H+X305hQfH1lj782gCVr
 l6+w==
X-Gm-Message-State: AOAM533JGnJn7rTDyeAasbEfkxj89ruc2wtQN6BbRwC5uo5lgX12D7j7
 jVOogUj9161wb7Ok8TAGuEHjyg==
X-Google-Smtp-Source: ABdhPJwkrZ9coXI9B2VtoJT63Rqn0d6J1tuxlDndRciOkM9VYSuyidpeDF3QUBhFQb6wD8MsN7tNdQ==
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr18750694wmh.85.1633945590291; 
 Mon, 11 Oct 2021 02:46:30 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id o8sm21349291wme.38.2021.10.11.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:46:29 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/7] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 11 Oct 2021 11:46:17 +0200
Message-Id: <20211011094624.3416029-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_024632_929927_63D016E9 
X-CRM114-Status: GOOD (  13.85  )
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

In v4 I split the phy driver and dp driver into two patches as
requested. Also I added an entry for phy-mtk-dp in MAINTAINERS and made
tiny fixups to the binding files.

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


Markus Schneider-Pargmann (7):
  dt-bindings: mediatek,dpintf: Add DP_INTF binding
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 DisplayPort driver


 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpintf.yaml     |   86 +
 MAINTAINERS                                   |    1 +
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
 22 files changed, 4156 insertions(+), 74 deletions(-)
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
