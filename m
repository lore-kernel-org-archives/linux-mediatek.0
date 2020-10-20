Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD22C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C8A21D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yEM7KD/H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y0K8WJVB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C8A21D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zsak3jDwKjDb087IalyYJHBk87QpECEUefObKB/wZ78=; b=yEM7KD/HR7+Kdp9kXhqiQ3czR
	l4iYeQyRNxaUHz3ePTD9dIPdI5P4iDBhDYXdKayZkUzZPN1S89G63MVsL0goRLwpGtbqzAV9d34Ig
	bXZTNkvFXkUhOhMhGjqqzSSGaZcAfiW2lUnqLIWJfvHbcuio6KB/O3S9rQrGovEojajb2egpvxr7T
	QkyVLQpgvvDUXQR6ywL1ijAytOaHvg3tIhh+ra62TsLk5dUblbV1KEPo0BO6J4QvhFLi4bYDzxdnS
	cCz1Mq5lV9/guWrtiu4W0AnwjQxVbxrdEx04Y/5gz/xp02OHoTkLgq7S3GPgzXfJGXc8Ew714l97L
	VEZ6TUl/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfz-0006sY-3p; Tue, 20 Oct 2020 17:43:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf8-0006Sy-6n
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id c77so2706456wmd.4
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twq11JCTg4YQPPBb170KYVskL+0y3cSGC0QSvk3HH7Y=;
 b=Y0K8WJVBkIOPg/vWN/gU1vxXt++vSz7StmVppBiSGnmhyGQBKOMQ8hAIb04Afhwj6a
 62+XiBskbzrvJhI4iA0oRmM8jG4MwFzf8EzwA9mCx+eRDjY5tuMZVIjPVJ8rJQ2l4mjy
 apDGCrIAKYw2L5zy+NC2R9nsPefpTGiANnp5FUzPb6gSHYA1D1/yvF9vZW62tnEW5JcL
 xwFxp2jAZEsl/dwdQzPJ5USMd9KZCSRimXYGtlaWRbKTSqVErYT5qC9uimgEP7SMH445
 ob07PhCQGEjZ7ZEZ1pg47Ci1z5OU9XyECBPwHRgN1OQ1psyp6Mqkj4qX5B7Dx+Smj61Z
 eOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twq11JCTg4YQPPBb170KYVskL+0y3cSGC0QSvk3HH7Y=;
 b=G0WsUigybFJXR4QKYqv/gGr/f1k88WuIO6lY/G0adArmmFRqQXAcn+laLBBoKZBn/t
 vH5A5K8IGIKg746mVcjy/gexuFFpu641JRrlAhBfa1f8LtlqzckMCNJVxR9qiQ921ieb
 PgxpTf+SvYuTxuYwEqElAyAq9BNIhCXUuolmU33AN/yZfKPTFQjB9tbaQsR4QUdoo13R
 SrOqMml/m5COCGD5Qpwe4mPH+XW4KYPv7w4AdEoXKKI3Q7I7fYDY+NTPzcWOCzgkEX6n
 osujEt7asWmlMl7HQBMJVQHxREBFkM3Jt/aw8s8N6pVs95Ue8NTvS+1U9d8GnS9HFssU
 nR/w==
X-Gm-Message-State: AOAM5323ytE/U+cvdeCV6dlhSd3E0j7UVYVMRh837WW9wKYzGRhV27sy
 HTtkq4CCdB0Yyobv6lHIhVRG2V3KUTw+GA==
X-Google-Smtp-Source: ABdhPJyenmhTxFRDWjoJTAfZ9z3NaV+DCbnu64Fauv9XbNcdJIz9d1gaggKnqTTQxm1DBo/NklsnPQ==
X-Received: by 2002:a1c:de8a:: with SMTP id v132mr2244614wmg.173.1603215785045; 
 Tue, 20 Oct 2020 10:43:05 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:04 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/mediatek: dsi: add support for mipi26m clk
Date: Tue, 20 Oct 2020 19:42:50 +0200
Message-Id: <20201020174253.3757771-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134306_314678_D2E30E6E 
X-CRM114-Status: GOOD (  14.68  )
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

MT8167 SoC needs an additional clock to be enabled. Add support for
the mipi26m clk.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 461643c05689..08786734df8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -193,6 +193,7 @@ struct mtk_dsi {
 	struct clk *engine_clk;
 	struct clk *digital_clk;
 	struct clk *hs_clk;
+	struct clk *mipi26m;
 
 	u32 data_rate;
 
@@ -653,6 +654,12 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		goto err_disable_engine_clk;
 	}
 
+	ret = clk_prepare_enable(dsi->mipi26m);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable mipi26m clock: %d\n", ret);
+		goto err_phy_power_off;
+	}
+
 	mtk_dsi_enable(dsi);
 
 	if (dsi->driver_data->has_shadow_ctl)
@@ -710,6 +717,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
 	clk_disable_unprepare(dsi->engine_clk);
 	clk_disable_unprepare(dsi->digital_clk);
+	clk_disable_unprepare(dsi->mipi26m);
 
 	phy_power_off(dsi->phy);
 }
@@ -1086,6 +1094,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
+	dsi->mipi26m = devm_clk_get_optional(dev, "mipi26m");
+
 	dsi->hs_clk = devm_clk_get(dev, "hs");
 	if (IS_ERR(dsi->hs_clk)) {
 		ret = PTR_ERR(dsi->hs_clk);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
