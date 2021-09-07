Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B7CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1586C60F45
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1586C60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wwm1L3+1wgJX3ULAtppQvsua6xg6c8JYehYkP4eysOs=; b=0i62goTaCXOXtU
	3tzo0qWetO5S+1hH47xIVJTA/znJT8hiXf2fVhsNNj+qMKiZamhg1M4Ici+E33ZuZfl3VX4zCT36d
	ys6MyL7hemUKuH+brEZ1qINRAH/qwoPvP8UQxk68cnmoFZtqyAmCot40YqMQIR8UazWkxfqvwttbY
	NpcjC6jpNPpM0RhFe1w6t2mD7qDaJ512vF8pO76UxhWQXpvQ70L4qlP2Kn4S/Lh/JmpeYosa4XujB
	9vvX9oMXmxbmDuh+QK/sAPyBIFHjNb9VZyaQjkbHtjMqGsSk6ACYpA8AYHOFMK++46BbrhsqrqG0M
	7cdk7Sbqkn0vDCKDQCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNWdm-002tRS-C5; Tue, 07 Sep 2021 08:39:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNWdV-002tMT-U5
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 08:39:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id u16so13230718wrn.5
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F98RMuT2qFWn1szuv2XyNIrHwLbg9F30PRmPPAi7A0M=;
 b=MDFH+AX1/fhl1Q9N+IereO8Pv8T3Mm3NxuqG0nXQ0iJM91QqmIndAAnmE5IN5EETDV
 emEiMPVTOYFSILl9MQAzJF4Zv5FHPLdOEjm0hg8AIR2PnQC9sepBJ6EzIxxd2S/r7SIP
 q5tJFNrIEn5ojPe/SmJQYKTTZoUc8dnjnu1ukSMlz78DtSeHOhjnfwHdaDxnEwCe22mG
 vDZHysPOUYvrwgDrYg6cFSTpLxUzsZhf1r3NFwTahZRauK4C86uoYipp2ZaKib5yQPAJ
 vLFpP2yYlff4IDGqrAQzxQ5dxgYcNAg8H/CiMCQCJZ/ZPs0sBG2HXOOIW5TVQT3PsTFi
 DYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F98RMuT2qFWn1szuv2XyNIrHwLbg9F30PRmPPAi7A0M=;
 b=IfTr2LePIKKWR8/xzmxDEnTFTVtSa8rUl4lcpk39xMWar2txXd8i1EcQs1WB+YhsOS
 98OhTl+PVGJlSJJ66KzdIlyud/kQCpFUXflmWfDt8EC0ygrkvrju5JPCdcPhPZHGOMqO
 K8L85UM6nHuoqWWfsMNCYukpAjhvsJrW3k4So3wEQRjjHtB99RSCCTOn6JyrrbrSmpuL
 PcgbeSFXbxTU/r59r0HMORWADAJPjx0FflA+kZtaFgtDwHOBy+90Pwb9kmVEZpLwGOAV
 E6mpLCs6iN+xKL5JabqsD036khTJnf/BrUnghOjQ5edm0Aulr+4pMKRjWNRIIXF7vPOW
 wqtw==
X-Gm-Message-State: AOAM533/J+gZmKdlxZNHV1juKqMNt1U6oLvkD4OXSgJbr/wQFNG+bhaF
 FF/JFZpMuFO17Vprg6mwtvlQ+w==
X-Google-Smtp-Source: ABdhPJwRMagq1ACw4+bT2LsmQvYIfLHSi87xUNxOtgU30yHDEHYEuHkRzaIGYpva6Z4k8qxO99HQvg==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr17652012wrp.94.1631003959316; 
 Tue, 07 Sep 2021 01:39:19 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 0/4] MT8195 HDMI Tx support
Date: Tue,  7 Sep 2021 10:37:17 +0200
Message-Id: <20210907083723.7725-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_013922_081016_4D6476B1 
X-CRM114-Status: GOOD (  13.41  )
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

This small series aims at implementing basic HDMI TX support for the
MT8195 SoC family.

This series has been tested on a chromium 5.10 kernel but not yet on an
upstream 5.14.
It builds, boots and probe on 5.14 but due to some missing dependencies
in the drm chain, it couldn't be tested as of today.
I'm still working to get this series fully tested on 5.14.

This series is based on:

- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Guillaume Ranquet (4):
  phy: mediatek: add support for phy-mtk-hdmi-mt8195
  drm/mediatek: add mt8195 hdmi TX support
  dt-bindings: phy: Add binding for Mediatek MT8195 HDMI PHY
  dt-bindings: display: mediatek: add MT8195 hdmi bindings

 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    |   46 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |   99 +
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        |   71 +
 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    4 +-
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2413 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  147 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  541 ++++
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  276 ++
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c    |  777 ++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h    |  179 ++
 13 files changed, 4583 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
