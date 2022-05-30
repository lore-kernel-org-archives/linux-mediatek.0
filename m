Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8oWdU+PGvoj6e3MCoaioJ/R2nufeuQ+LPNet1mxZ1E=; b=m9mESRcrlN7hN9
	O2I9llQbggPr1w9lCU+dTE18exGi8xk/fW35WZsSS3d7NIKjSIpSqLPBlkZz8JwqS2Ye1+NqWmcIu
	sVMLc+5zRLWPprVIcNbSsEB83EwjRmp8SYRATMbjp30qrhs36bqPGchZU3GxUIZjIhf5NoSdSE4ER
	jwhvq5jfTBN0HnI6fsonbhHAUg3OtMXLCSTIkYlaWKjKe4dwy9zGLIUGtKhhwnjUqYge1rVl+DWoM
	OkD+mgqw5XusYS8uzt/F1mDQ8aMsQrb19H7uG2cvrnvXXhEoiFeQz0zorOk3mQMvYiN+nXT9zUMXk
	b2pVZf/umtusfn6H12UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmDr-008F1m-2p; Mon, 30 May 2022 20:42:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmDg-008Ews-EX
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:42:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso156672wmn.4
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OfRzRz9zY+mWQeLzIoLCLlJA3rGJuwiAX+1Eau/u4p4=;
        b=OjKjf6rUbb5SpHdfuQH/imC6NIGGZ3P6M75JaF7jECTByieFVd1TOqOnYXpvC0Xfnl
         kfuspj+G1QyOLBh5ycOvIDKPEaJpzXwRasjKFwdTVZX+NCHgfJxPMWEQnOa4b7AQ71EH
         EHzNtZZQhJgqZQxFQ/zf9FKMzmL1isRwROY615/pxsGSyD2GBYUJv9t8Za7onN8ZMiKb
         5ziqKRVwUiCvD4Kl0L1TFAlFgHqF9+MiZjI3RA1MsLUFL5UUJFNmYpOCEqe70vM6Ox/e
         7hWYxIS0wN5QzYQ3+Wgepr65/WYoGz9FitNkxZIpVpVxrjl6s77g2vP1cmz/I5bO9hVJ
         TmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OfRzRz9zY+mWQeLzIoLCLlJA3rGJuwiAX+1Eau/u4p4=;
        b=QvmYzUQOKZu9ClAVqB0dw+avWYBwhkC7pF1nn5/rQDrM4SXvnph7wM0YakbDceYrBC
         SGugQodCUaPzgTUjegosxtcFgrch3UB4BL6Z9/7dg812tAZ3nO7eKdaxowxCYpAwYcvr
         m/EnonLRGBU/4r88U5WalFrPbrXIMZZOQDwrTzo80pVunGFE4tY1iqx0mC8pp+NEziZy
         S4gTOLaJxOwvR+XZG++V73WOjzVmxASK3YkUiE2xo8OCgWCu7g7+TqxassuVue51bNxU
         c88HFOKYQvv7ett3mAWCX4QNuABm0YpiBgN1v1SUmOZKAQGeGJ9N1Se+lO4nXuGvx4A8
         n3FQ==
X-Gm-Message-State: AOAM530YLzGRsorYgG9CKSWe3sBMgtxUtf0xVaRy9ULFial+lRs1qKB8
	O5Pr+X8i6kurVqYRQox6dRUepA==
X-Google-Smtp-Source: ABdhPJxK0D0IN4lwSq73zpNlpbs45dPOpaoXgVGrmOvGp9YvwJOGUYq8ZhEMazBS/AVR3tG2t4BOCw==
X-Received: by 2002:a05:600c:3849:b0:397:89ce:289 with SMTP id s9-20020a05600c384900b0039789ce0289mr16587313wmr.104.1653943351285;
        Mon, 30 May 2022 13:42:31 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a7bc74d000000b0039b17714eb2sm262253wmk.34.2022.05.30.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:42:30 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP cap
Date: Mon, 30 May 2022 22:42:13 +0200
Message-Id: <20220530204214.913251-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530204214.913251-1-fparent@baylibre.com>
References: <20220530204214.913251-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_134232_549005_3FFC6395 
X-CRM114-Status: GOOD (  14.74  )
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

From: Alexandre Bailon <abailon@baylibre.com>

This adds support of MTK_SCPD_STRICT_BUSP cap.
This is required by the mt8365, for the MM power domain.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 37 ++++++++++++++++++++-------
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 90b91b3b19a8..beaa5785fda2 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -263,17 +263,36 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
-	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
-	if (ret)
-		goto err_pwr_ack;
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP)) {
+		/*
+		 * In few Mediatek platforms(e.g. MT6779), the bus protect
+		 * policy is stricter, which leads to bus protect release must
+		 * be prior to bus access.
+		 */
+		ret = scpsys_sram_enable(pd);
+		if (ret < 0)
+			goto err_pwr_ack;
 
-	ret = scpsys_sram_enable(pd);
-	if (ret < 0)
-		goto err_disable_subsys_clks;
+		ret = scpsys_bus_protect_disable(pd);
+		if (ret < 0)
+			goto err_pwr_ack;
 
-	ret = scpsys_bus_protect_disable(pd);
-	if (ret < 0)
-		goto err_disable_sram;
+		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
+		if (ret < 0)
+			goto err_pwr_ack;
+	} else {
+		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
+		if (ret)
+			goto err_pwr_ack;
+
+		ret = scpsys_sram_enable(pd);
+		if (ret < 0)
+			goto err_disable_subsys_clks;
+
+		ret = scpsys_bus_protect_disable(pd);
+		if (ret < 0)
+			goto err_disable_sram;
+	}
 
 	return 0;
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index a3955d960233..5347471bc3c4 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -8,6 +8,7 @@
 #define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
+#define MTK_SCPD_STRICT_BUSP		BIT(5)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
