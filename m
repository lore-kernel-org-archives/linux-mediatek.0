Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA328C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sncxYiJ19EBEMYozwgCXbGEKSdQ2+11yxAIRrAVvyso=; b=bck+gjPfnI2BMdHlNZuqu/sOAf
	ZDvtT/YawS/wQXQb852VkQ7G+c2jYxsOPZPUbb8j1p6nJyejniUKi8WsojPdPbYriswv6pzwwtpWV
	1De8bdEqzaCFkzntrPsEqxJrg3qZcjMbOIA9F/EhYLA3+qNEHseI0q6TXerk/xK8oVy8Wcv4dFXqc
	9ksgLreY36YtDDWTQkguPx+XUehtn9hCMeG2xApDiykZiYZWEY2Kw9uESvIJaJAqsS0aJY8XPSIyL
	RJVyyHcjziXVvmpeF4gqH4YLWcu11xPdAQX1e6tUA73vI/7vn/vrg768A3hI4zK9gqe4tTAFweOlA
	kHJyliNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX61-00Ehav-G9; Thu, 05 Jan 2023 20:44:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDTz6-00CujA-Tk
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 17:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sncxYiJ19EBEMYozwgCXbGEKSdQ2+11yxAIRrAVvyso=; b=UpX6fZopVz992EPPl7EpIhBzzs
	f8Mo58ZbUjPD/N/HZ/nOXVKYl5oAvrMRaXYjT8EHTTCzej0Q3LB2oAjvGFgw9Y/OzTHc91TCrnGJ8
	HD6uhI0O/6ManonEXDaf0L3Bm9ryTK/rvBj/LkP3NeusC3y6xfa3GO8PFxCeSAAgS+gTpL3oI6mf3
	p5JBs0UsDYhcxUFjO8+pCXAFzpHSz4kY3DmxpnQwiqZv2pgkcLJy6Y1D4z1bAL7mB9Iogs3KNCe4Z
	GiCIxSrN7jTcjhpYM75vqp57u5dL1RMUXzFMDRmnRZtxsRB9ZuZWTsOdMTtWFeYTYJbil+sNGP7tZ
	lxIJkI3w==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDTir-00GKHv-3Z
	for linux-mediatek@lists.infradead.org; Thu, 05 Jan 2023 17:08:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2757112wml.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sncxYiJ19EBEMYozwgCXbGEKSdQ2+11yxAIRrAVvyso=;
        b=L8GGi7ni7dl6wFN8IW77qB70367v8PhZ3Sd7+oJtMLY5Ej9cNvDNLQSAsDm09a+xsP
         wK3c5FXsCw2fAI8nS6woEXI0BA5uhEXQAs1+yNidpxEMs39ztajNLQMH9bjXgBm615vp
         3UTrsw/syO8Q2MNa9PtePGoMM7ezHfYurfTCo5Ds8UGYdF/+rmD+F7wd79Y8dZwU7VSn
         B14ErNIeK6oq02bUfQPt0ZEJNesP1wNbvDsX2THshhyp5+nW2Par/RJXvy52WSR2YMq1
         ZFJUeYixlF/HoXntuGwSv4jBB+damvcCP4cq//5M4DNqUB6jD+nSsg5nryz18+5IskYw
         fWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sncxYiJ19EBEMYozwgCXbGEKSdQ2+11yxAIRrAVvyso=;
        b=31mMZghgPQjh8UAiiVz/0bEOWnbGuIsjhQSpaZez6KMZobnUusM8gJ/1/ys24XIBoD
         LRGN0eAfmKxjf3PrE/dI48pLWEawfF3hgLeB7T2TSR66H7rotL+IElNkiUqnMIpnnUr2
         lq5SmXIlNmnjX8Q5AE8cobOQhtfwPGUqdFLWuBe68QvH+vRjdxHhs39gu3h/2Of/qVjV
         iCRyphHbYqnvUi0OlU32dQyWilbu4EE3VNvExqN5rkJmWb2NyHAJj/E9ow6Bibgo2Gzl
         X3XYzqIqD5kAL2IsUKL7J6VQ1ZpKINa/FtZpdhxhy8zkCxWRG/lpNbRdis6wmc2LHYCk
         pR5Q==
X-Gm-Message-State: AFqh2kpM2mMnHTD8jOtplaSMntEE2N8e7Wv2wrsAqGV2A+tcQfW+w+tt
	Kn2SY9D+l6qOskeirUWkm8xEow==
X-Google-Smtp-Source: AMrXdXsa25aMnGI1cayPOWzrjuYzyQhetcgmL1o5YukwOgaRADsQ2/BrQNcacZ4JwiA8kuPZNNtW5g==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id t11-20020a1c770b000000b003cfa18d399cmr39048182wmi.1.1672938474085;
        Thu, 05 Jan 2023 09:07:54 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:53 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 7/8] soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
Date: Thu,  5 Jan 2023 18:07:34 +0100
Message-Id: <20230105170735.1637416-8-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170809_179637_D9D000A6 
X-CRM114-Status: GOOD (  15.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alexandre Bailon <abailon@baylibre.com>

This adds support for MTK_SCPD_STRICT_BUS_PROTECTION capability. It is a
strict bus protection policy that requires the bus protection to be
disabled before accessing the bus.
This is required by the mt8365, for the MM power domain.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v4:
    - Change name in title and commit message
    
    Changes in v3:
    - Rename MTK_SCPD_STRICT_BUSP to MTK_SCPD_STRICT_BUS_PROTECTION
    - Remove extra bool variable reflecting the capability
    
    Changes in v2:
    - Fixup error handling path.

 drivers/soc/mediatek/mtk-pm-domains.c | 27 +++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index d53309f050ee..29a9028dd9b3 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -265,9 +265,17 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
-	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
-	if (ret)
-		goto err_pwr_ack;
+	/*
+	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
+	 * stricter, which leads to bus protect release must be prior to bus
+	 * access.
+	 */
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
+		ret = clk_bulk_prepare_enable(pd->num_subsys_clks,
+					      pd->subsys_clks);
+		if (ret)
+			goto err_pwr_ack;
+	}
 
 	ret = scpsys_sram_enable(pd);
 	if (ret < 0)
@@ -277,12 +285,23 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_disable_sram;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
+		ret = clk_bulk_prepare_enable(pd->num_subsys_clks,
+					      pd->subsys_clks);
+		if (ret)
+			goto err_enable_bus_protect;
+	}
+
 	return 0;
 
+err_enable_bus_protect:
+	scpsys_bus_protect_enable(pd);
 err_disable_sram:
 	scpsys_sram_disable(pd);
 err_disable_subsys_clks:
-	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
+		clk_bulk_disable_unprepare(pd->num_subsys_clks,
+					   pd->subsys_clks);
 err_pwr_ack:
 	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 err_reg:
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 1fa634509db1..e5aa2348a9db 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -11,6 +11,7 @@
 /* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
 #define MTK_SCPD_ALWAYS_ON		BIT(5)
 #define MTK_SCPD_HAS_WAY_EN		BIT(6)
+#define MTK_SCPD_STRICT_BUS_PROTECTION	BIT(7)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.39.0


