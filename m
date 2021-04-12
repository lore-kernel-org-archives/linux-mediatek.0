Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168E4C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:43:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816816120B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816816120B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4g+PSjX+mxOD9b832yZZokOs2T7Cm7ihcvWAuFNz+o=; b=e6gsK8r1t958RlNBxGPzuLkxx
	XvwCNKfiggTp72t6iYWFmT6mJwWbClZblMCdZQ3Ml/P9CQCCq/xImPt0LIsiioM1voC8JQNbKS+6k
	cvb7QIV5bgisutp0Fv3XZdy3S9RItVbeSmqhQAOWNQezwgGCB7EGhmnZCZTdvJLAuHPzOjFScC6aN
	mUvTDdamzsosYHWk00AgxXCScdZooAcqLpU6Xh+tBAzxvrHKM/RZVO9aK3xLVIS1qEF2ZTq2dkH7P
	Mt4BRoVfJbu5qTQK4jy2QTKmvOJx7t5Xn81attzuLHr/2ZoWlA7GeYN6sJfqGJxY8wNQEpd1/ORS0
	op4Crjx1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt68-006KOL-UT; Mon, 12 Apr 2021 09:43:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2l-006JXa-Kr
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 09:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=; b=bxuJqkTZoy4mlsOeyQtFyEclYB
 kQRE2hcoLKTtQO4V7S+VIQ2Mn5ItHrHSjyZlp6XwJ/BDs/EskxftBhOYFfu3iAFKvkSkSVMsP8gLt
 ESetX5bzi3roHEN0vImoTl1Ze9vjJrauefdgBKVeXGUv2M/OFMYyHGtIBaGMMAFs1RFl3uZGEeRX/
 D4ECRdAf5pDMTXiBMVjBxarkyJjrBgVfVqOUUTpgHrvjLkWdgvXLoHTkvrPo8Ey+5j2A6Cd/fzpvz
 xvMQMbrukYm/7s0KvyiB9nwBkYa9U0XSRqx0yWAcwzIQUUyukRcOsIlqNj4MTQYLJJx1QJI7PJ+5b
 JB56X0kQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2i-0064x6-Rs
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 09:39:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j5so11220470wrn.4
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=Jpnjn9rXPzkPxXX9WoOJFeWyeK+Ple7SplSjETf1bgkKa00qCyCMZZHr89iasN12TP
 oxxcivC+ycem/57+p8Se9OmpW61Ci+2Lwf4CVHcNFuzmyMoJkQq3ZH4ovghZTO8pLOMq
 MUhnxCtrb85Fxyx4KOXAy1kmoALlk4B4/RN4i2PnbcW/j0xKu1fRmHvKYLT+RffbQoxc
 sdckkuOeCDhdDf/cMJRNDRqq93W1zI+VrTKEglTuYDA2TVQXBuil6HRCOuEsEsg798Np
 9IxE5NDgPI4riPu9xNC9v07n/ayBwsSg/UVLpmw72zWalk75Q8xqPjbjqbRrnD0En2ig
 dxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=jSHPbrUEkEqT1DJc6MFTva0GNoM3DmsMqVLfGfZxLyt4JqQaYPXx+CkdM4LBmb3U3y
 Aq/AjwNLfvIZ25k1PkzhyXPqfIZ2srL06leG1CgEBuxKhnOSzNWm6gg6UKQRsXlxlQOf
 0z+4IFECf2qRaPeSOtdXLZVwkn9R46COdpnRenhMdrh5zHVvmzEpVEcgaTblPCxvR+d9
 7z3Mn2WhFY5lKviIr94/zi53Hmb9UdeVhX4p7N8WLCdcCY2I0OesJ6JZ5uyRu3xPNu9K
 OK6hrOm0KuFGrR+GDmHFoOIkPKScSUy7pjgveJHS6ljLofdjiZEm1mGDZMU1f/8g8OaT
 zQsA==
X-Gm-Message-State: AOAM5333wjeMKo8fnaRsdTTUJsit3xjV6aYM/0no6EhVrTWdwbNpkXpS
 SsvYKvOld0Zhyc7+wduhYy2Osw==
X-Google-Smtp-Source: ABdhPJxSRfTPtAOzbr7EGyj16vGGsghASbI4b9GyWVvNHffdVr713D7XedbHjc9AgjB8nY3Mw1qMtA==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr6745211wrn.262.1618220379586; 
 Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v2 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
Date: Mon, 12 Apr 2021 11:39:28 +0200
Message-Id: <20210412093928.3321194-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023940_923529_59DECACF 
X-CRM114-Status: GOOD (  11.66  )
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

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes,
so add a configuration entry linked to the MT8167 compatible.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index bc50d97f2553..c1651a83700d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1787,10 +1787,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
