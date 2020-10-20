Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1FEC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941FF21D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zz6nDVPZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WbHD959s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941FF21D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iAHVnSQHbpQUPv+RXxA/w3W1DjPsArErwVkALgJflAg=; b=zz6nDVPZ7D2b5a0pMncGp5J5L
	glnWT8vtCBVwZF5rIdFBxdrssZID3qL48i+dab5i9VD4XhkAJNHkcbkqg7zZXb4l+P0kRkHkvodDG
	TcehQLc9fXzKq1zOVliZh8FeKP10BaE7HVgnngEZgKWs6KO4nAkDIVyHXap5GosYd6WOk1lgxu7RJ
	loOPtwgltYkumVa9RSRj69B7J6s3j9iylgCwKU2gd28gNVaDX4Gxgd4h66tFg8RSBDpi7tZWF1ey5
	6sjUT7YnFd3hRYNMUd3v82uNu76ZHY0khWJ67pf8VmbWwVaWQ5CdKQXWeshZ7wPH2cd7Zu9KS873W
	IKHLPhyiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfj-0006fc-2P; Tue, 20 Oct 2020 17:43:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf6-0006S8-NZ
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id c194so2702374wme.2
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBhINe5+YmVPHfb1/p3z/ZugBR00FYyA2WW1AgRCGAM=;
 b=WbHD959s2sqRdOZIhuLjT2Bq0V9cHBGUM6oT9iAegHQsQ+NASd6sENwppAqbr4Aoju
 nx2mJZJa/SiVwmMqJQAUM6ktcpeVWNJ2NtRR+IjvbJF0dvxDCBbvCYBD3j5lRtQGCnts
 EeC4nyMrnqSwmfzfLQuvSWY8Vo2I6I766NCOwnNT52Aq8ka8jUDgLkG8sr1xEPnNSO9x
 2QJwoYC4uhbNJFSLbBNr3FR1JY6T/tNfwoY9g5jp08J6Gjxp3bhlsu2xVxDukEL8SVhI
 c8jPjI0t01rU7NJCIYkxPF6B3R6mvCBkIQCc/ex2IUXOxCO9ihFdQrjBOs7JaNAhmFBH
 i4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBhINe5+YmVPHfb1/p3z/ZugBR00FYyA2WW1AgRCGAM=;
 b=tKZc4kYc4p491XopKpg0REMmyKEsSGrj58CwLBxHBM5ARdOSVdINY0tiaG3SzK9r7k
 qSFzsAlHx1slxwoXP7736tHSzHHEhEJQesNGP6B5VrrauPz38nMsekeAftincQ1NlwLQ
 hkIE3E59jzkc7c6esLjqirRDfMGIDYadQOjxqj/jON05cfC91LGyRbNNx6nEhAPT4Bre
 WnMNriiQUgX+u9tQs5LdM9iBdeDMpXYDONUBPh61Fx56dWifxDKktAdxSyvpzGbfwp/d
 quOjthIdd+FoqLO4WBfG0tGaD9OllpbYhc31/uNLXA46qsz0FXoP87mHleTEamTOYGWk
 qFuA==
X-Gm-Message-State: AOAM533KL7zmsIN1yKoXzxHK6Of5uweLyy7fPu27iocFilNa3NMAXC9P
 LK85l4TPn66g5gPZ6gEEb4dMr5+d3CZiWg==
X-Google-Smtp-Source: ABdhPJzYZnrg/xFUR1Exo3D3a8p65ayChvkyZu0pYYwQ4gWPnT+Pl6BY9opLW0tRMMKBzlTaAg9jxw==
X-Received: by 2002:a05:600c:4107:: with SMTP id
 j7mr3965065wmi.44.1603215783589; 
 Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in HS
 mode
Date: Tue, 20 Oct 2020 19:42:49 +0200
Message-Id: <20201020174253.3757771-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134304_830525_74D6E91E 
X-CRM114-Status: GOOD (  14.91  )
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

On MT8167, DSI seems to work fine only if we start the clk in HS mode.
If we don't start the clk in HS but try to switch later to HS, the
display does not work.

This commit adds a platform data variable to be used to start the
DSI clk in HS mode at power on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..461643c05689 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -175,6 +175,7 @@ struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
+	bool use_hs_on_power_on;
 };
 
 struct mtk_dsi {
@@ -671,7 +672,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 
 	mtk_dsi_clk_ulp_mode_leave(dsi);
 	mtk_dsi_lane0_ulp_mode_leave(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 0);
+	mtk_dsi_clk_hs_mode(dsi, !!dsi->driver_data->use_hs_on_power_on);
 
 	return 0;
 err_disable_engine_clk:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
