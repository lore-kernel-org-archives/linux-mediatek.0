Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB50C55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D8BB208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zLvObIMf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MlR6wK4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D8BB208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K1HkqUjU8am88mJFY1jKA8ysJAHv6/4nqcepJmpSw2o=; b=zLvObIMfJ7MbPI4U94mp6SVHsN
	yLL0+j7fotvRM7aPwZ3SClfrpbVmJB/HFP8QSiuI7G5MlL8wNST+MeujJhIb93s74AUkS8B2GUYym
	gZzDRP270xqCd2kBDYB9Xwj6eepyx9iz8CFY0+0fjuQPQOSOjaWL4zHyLAcrCfGdUZB6Nw2/rKs6S
	rRjbL5VD9YhczRnyZl9gZFawgdm9ZrHtyIy23V0L0LL9Kwa5jbJhIi3cidHGYXeN8wyRioZxxLb0y
	JzqgRO5PrDAdd50GT0QKeQmaCoRHPWwmr6UeCgfAFrxbRDJVkhUvpCDYGblManncUmZY+ta4PnLRj
	k7km0LVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVxAS-0003eI-TK; Fri, 23 Oct 2020 13:31:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVxAO-0003b5-Cz
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 13:31:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id a72so1476642wme.5
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0g5y25aamnJmaPgpvLpUPjcowdDVx0DC7LsyytrI5g=;
 b=MlR6wK4kuxU+Ax9dRf4/DR9QDEr/ma6S6Y2sM20AWbwA7RfrDwTOOLYdZaax7G0v1y
 zsFqOdkKJfXeOi3Yyhs6Zhol6iJX6NsnuMRaRnAoCfQxi4JEXtn5GNKWELkTTWb8WdHn
 ajtN6cIlBo/KjFgAgqvJLHPTaCSxPtg6NuFnBiti0+aY7y+Wnahua1t8VjnSDG5TyTLx
 L1xGw/h7u5Qp+D2SR2Y9/0TmbwOwUPdOkLI6ydPX2T/GrZA/QQDjLoEen9L6CFXZVUxy
 /N8Bwq19JrKxMCxvNX6YwY8+cSYhFxAnjWHLzaBIJHX31b0Ppkepn0BNjIrPH6qfGGsh
 CqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0g5y25aamnJmaPgpvLpUPjcowdDVx0DC7LsyytrI5g=;
 b=oIvyAr+H4MV5GEM+zokSlY7wT7Qd8as6yucEGP6HHQxch8Z63KptpmLxoEKnLKgBGi
 G3KySDMDIpPC7BAwmbxRQmpGqPs5lrAA/023EB5JzpoCa60/UbSTe7rba+Ra4HAYMaVZ
 meT6hgGWPo+yeJ427JMgapOQiZRCYaN95GYpFrvY13srO1/Ndw7bVspFbpMdAPvy5p4m
 VpbpYhUA3p9vOdeWVv6IIjUy/tH+HSRhTil5PkTfjJfUIexS2kYNMu7aNwPGKIdjOXgr
 +jmME3Ie2wyI/uXFjpZnkbgJx9lzSBYiTYM6fzhG6nIHLhdIIRFx9BYphy+69DBQkI7q
 kQfQ==
X-Gm-Message-State: AOAM531WhwLXNmEiIPYjsqi8M5gvW3W5nRDUJRqjaHh77Om4SN3shdVZ
 wwS+S2tQ1uvXnDKIoE9bDqA0NyCa9Un2Vw==
X-Google-Smtp-Source: ABdhPJx3KXkKjPhuP5F8RgAsbrby6ayVAwe3PQJpsJ7APdCh/zspU8uMjMlSQ4RwHHypPHprj6j/XA==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr2267365wmf.141.1603459894574; 
 Fri, 23 Oct 2020 06:31:34 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:33 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] Add DRM/DSI support for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:25 +0200
Message-Id: <20201023133130.194140-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_093136_586232_1A51923B 
X-CRM114-Status: GOOD (  11.98  )
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

Changelog:
	V2: removed 3 patches

Fabien Parent (5):
  dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
  dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
  drm/mediatek: add disp-color MT8167 support
  drm/mediatek: add DDP support for MT8167
  drm/mediatek: Add support for main DDP path on MT8167

 .../display/mediatek/mediatek,disp.txt        |  4 +-
 .../display/mediatek/mediatek,dsi.txt         |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  7 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 47 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 38 +++++++++++++++
 5 files changed, 96 insertions(+), 4 deletions(-)

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
