Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B21BC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0F32223C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RH2rPcFj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mtc2L/eK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0F32223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDFufSzYaM9uxrSDnVNOJiF7MfBZ8M9car9Y22ex3Sc=; b=RH2rPcFjD+mSre5CUzQ8TbkIJk
	7kIKStvvYuJPckVFbuDEa8qcr3xrOsgtkYdvup44SQofalZQ0SFkuHfYO4B7gkfJYlhHvTMSTUKty
	68NLouiuRpuTS1mRgyluyNY2dRZzQGtBOq0xPeIyTKLMgeFA9BfIH9alm/GR/I40uj112oGNuKVV0
	XWplK5AintpsgxdE2vLHSRrhDMWeJ/KYOtYdlO3ILuNVl9Laj065EgD/1gTxP/LQCUHNeIk/8/wwY
	gRAMiiISrdN0kgJp54qoQj4VaMqK4sFLpYF0TdFLISNBBPW0V286OFkAEsJClZxtCmaPgee+ldzvt
	cz4EtRXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfB-0006US-9j; Tue, 20 Oct 2020 17:43:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf2-0006PM-CQ
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id b127so2929222wmb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KolONEJ0/kBt/8YOlOvYo0QZLfG99esXIK0wMwF8lc4=;
 b=mtc2L/eKqA8TBWtNj1lh1nggWXnyR45rPOaumTksxHaV/nb4d/T4zAlD2P9bjzpHyn
 dfu3yTG/We2OKP1fQIc4+Lj1428T5LiozVeaflzq8AolVXTn21CFIl9ulS4Qau5gLq1J
 IRHbGN2i8IDhOy8UUmMXccWL1xNSJqz4YbnSPOvPH89tfwD+a/yz7rEUFLjBBTPpgesM
 3f1X0/IMnDRSGBqiQK5nS0hhXiexW/y6iLionKupQXckqGP06dQHWHoCjeLx0EIIgq6c
 iwtxhRYwRLZBIK1XSuO9zqjgT7EPREzS1V+iRqvqhw1IW7EkCjA0J2023QN0mRwI4q+u
 yZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KolONEJ0/kBt/8YOlOvYo0QZLfG99esXIK0wMwF8lc4=;
 b=mfK7l6vxZ8YEaQYlAsl7Xvfef2bow7c8rOeW5FqSrM1HBkgS/7aqXmcCQuHrZNmxlQ
 VQtd1Zk8csQEqL65TmwbzKwsdsxex+YMayFXXSmELJki57JEVeVqzO2Zn+Xi04VN+Mlx
 XT8fWT8RCq/fSKcP0gdLkkHmX7ao19VNHLdoX9/Ma9vt8adgVnqsVpuPFwrvFr2ZY3O9
 MqGhxLYhRZf9ZgqhhjNgGGMt0O0vYei4FenF+WI+7Rj62YGoV72AQqvvFsjv6xxBPpm1
 FCDPsgsEncrcsi1xq1wgSixTyotgikxjnKeTipyUPPE7x9sS6AjpzbKm6aEfDDcLaQir
 2Uqw==
X-Gm-Message-State: AOAM533XS9H+WJWmurL1x1rFDC1Y0cvjhYsaOu/OsZlZ1D9QotwsHpns
 //SQnDC7aK0uOJfRMmgCdv4X9+Yw9CckuA==
X-Google-Smtp-Source: ABdhPJxdhFa4U3zvDL3nve6Smzr3olv0OJGGCpFVU2nQZJ2SRN4kwERM99KqsVG5ZE8vhs1527lNKg==
X-Received: by 2002:a05:600c:cb:: with SMTP id
 u11mr3925064wmm.112.1603215777481; 
 Tue, 20 Oct 2020 10:42:57 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:42:56 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] Add DRM/DSI support for MT8167 SoC.
Date: Tue, 20 Oct 2020 19:42:45 +0200
Message-Id: <20201020174253.3757771-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134300_477965_D5377EB4 
X-CRM114-Status: GOOD (  12.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for DSI on the MT8167 SoC. HDMI is not yet supported
as secondary display path.

mmsys is not supported by this series and will be sent in a seperate series
based on [0].

[0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=360447

Fabien Parent (8):
  dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
  dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
  drm/mediatek: add disp-color MT8167 support
  drm/mediatek: dsi: add pdata variable to start clk in HS mode
  drm/mediatek: dsi: add support for mipi26m clk
  drm/mediatek: dsi: add support for MT8167 SoC
  drm/mediatek: add DDP support for MT8167
  drm/mediatek: Add support for main DDP path on MT8167

 .../display/mediatek/mediatek,disp.txt        |  4 +-
 .../display/mediatek/mediatek,dsi.txt         |  7 +--
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  7 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 50 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 38 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 20 +++++++-
 6 files changed, 120 insertions(+), 6 deletions(-)

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
