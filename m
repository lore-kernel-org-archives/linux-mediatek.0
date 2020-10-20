Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA41C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA46521D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfbcmZSq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WnvZJski"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA46521D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvKamrVmTrkpHo8A+xvTDIsEYflMznyEMrPrVNi2hU0=; b=kfbcmZSq5GdgXeqWNU1HzpqCZ
	oprNc1bee0sE9UPxvYyJCiRTl+Zi1eiBnpxonXD3+wHxNTSMA8/sVdIU9/6447diwyIKFjM50X6cv
	Wgz4GZ9aJsurLEB0H+bOFgXTS4vYxR9t/MRuG0xPnwd6FFLfTMPMQxUQ2j2l1NdTUwTzNgb7Bt496
	afgWCdHc7hknN5ZlDdlX+A8zBr98jTNPW7OqeUkRzoq5PXUJvGtW3orvCImnLLSvTzhnNSu7ORvwZ
	GSLRCA5WRTNPRQi5ja3tXGKb/EeC8qZUjqneXm5LqDpcuVUNjBT08GOhoUZGTU18dZzRyqgN2Kut2
	JgfXFFSXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvg4-0006xC-Am; Tue, 20 Oct 2020 17:44:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvfA-0006Tg-Et
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id s9so3213595wro.8
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUKyzhSGhUR/Bwwd5x38HZWQ53tYZ5QssSwc3z6VJCg=;
 b=WnvZJskixl0tYxIjUvfdGfd3sQFS/qQ7mBwPCXEslhPAIP8Mf53G5brThLZkuzn0PQ
 +N5GMsL02ari+rbsuqrlf032XTeg8kuwW3GwGPH1d4tNoXxfMqJ2Zez9pn/tIx2U1z/9
 jaenEiZWJsAmrEMpVm6IxMNe0N3rFNPM0qxiMdEG+GuZHrKd03khMy+vPcRYWJL3gsE2
 Ltm4+juqIRNNziZDNWoMPqgkpInngwFBFbdB+u6m3CDOXjQr9UWQciRtoA844ZGOAemA
 TswLIGcpSC7erqVAnCrGGIjwmnkplMMEYZOCkGEhCFQ2ukKKR72z5EmSwl4aLfH1dsS0
 /I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUKyzhSGhUR/Bwwd5x38HZWQ53tYZ5QssSwc3z6VJCg=;
 b=aBX7bRYvrxG9x+4Hs+c0X+s4V9/vpNH4GJX5XwyHSucT9LxRLZzEINUlsZ8IfHPXfg
 s31snktmpGi7eva++fe17FYhdregKjE9uxpl5lFRg+sO3npDnQwiqmxoA5Q8R37KW/lM
 ulrDv8nT8CHMDYJaTBZB7xgPQcelP/mHVBlP8FQl/WAP/8Tcq0sD6QRHSzuX72kgUMpL
 umNCzQGSeTnyo4qDG8EuWYXp59EoknVl22BDliujYOvDwC3Z7sHdUybTFcOpEl0TkiPq
 gSBcv3evkc8b0EGA+mSJjfn3ajI+r6enTqyL5YhGzp+i2/Cst6Yzp6HPJ6LmKIUyOKPh
 /yxg==
X-Gm-Message-State: AOAM532FxsbCDK7+umpzUbV7eEBU7OKA6cKrQeWJLS0kEgJvB9s541jW
 5ojGtgi/edabgXUSHKbnUO/XpYpwZZgBfA==
X-Google-Smtp-Source: ABdhPJylIT9S52zEh0LE5r5mbFdXBQ69vOLAAksKF1Kpq3OlZP0kKeEVshgGZzd/uO0H63x7NnFyfg==
X-Received: by 2002:a5d:5604:: with SMTP id l4mr4614953wrv.140.1603215787049; 
 Tue, 20 Oct 2020 10:43:07 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:06 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/mediatek: dsi: add support for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:51 +0200
Message-Id: <20201020174253.3757771-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134308_543521_EDBA2060 
X-CRM114-Status: GOOD (  12.78  )
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

Add platform data to support the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 08786734df8e..d90dd0f83292 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1182,6 +1182,11 @@ static int mtk_dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_dsi_driver_data mt8167_dsi_driver_data = {
+	.reg_cmdq_off = 0x180,
+	.use_hs_on_power_on = true,
+};
+
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
 };
@@ -1199,6 +1204,8 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi",
+	  .data = &mt8167_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi",
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
