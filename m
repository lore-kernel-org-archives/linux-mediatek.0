Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B36C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZuj2vYwtu1q+1KUWNq9Rx/83sQjYgOtd/pHC+rLp7M=; b=YoELXmPpEiHLg1HBmhxO8Fjfk/
	vIkDrfkP6TqAel/0PGBzDllePGymPsxBJU3GbyVXUGDK+VQi9ELJMtSaHk7p620D3nDX+17o3b82y
	7j4pGCaWnyW+7n2sik0a7a91rIXpAOUXKNqEnBPgIOt79LmZ67T4qLYvQ0HfO3dGCtwJP7srBmAb9
	BUKZ6Gu9wTvj6bFbvDi1p2rqXZ6WxAqNhV7WjhLQ0CCxc2q5VrlP/5ZXhK0+U8J4Tys8xti+HfGxT
	YJ1Z3q3xuf8AC5haEiM/CSToj1PiXM9QQL8deGxQK9cUz+awu7HN6YyHz+AEGKyvT1LnII277q37S
	s/lQY9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxsA-003f4r-0e;
	Thu, 13 Jul 2023 15:04:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrs-003esY-0Y
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 15:04:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-986d8332f50so123854966b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689260670; x=1691852670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZuj2vYwtu1q+1KUWNq9Rx/83sQjYgOtd/pHC+rLp7M=;
        b=RkOwDzpMuH2Q9wEvS+/gVNzvc/el3qTstPACqXVvJhgiFkyO7cPmPhjkqX8bY/QLbu
         u9SKdly9DwBumaoDqWYPBQ1978dW7/fouv1P0eozmwURIR0aJdPnUEa58U448y9oBKxB
         5RBWiTAwtqECxcetJeECbX6/8qH6UTWahp0ZvOJ/6EJL6gEnol6jN4/Xw/0nbB8N4X+H
         Q48XYb8vfaAo7S2vdE0XM29Sx8zQeMXxUeM+gaUt5dlVONtiIoMr82nXBCef7KUcMgF+
         XXBldbQz5isMQVIjGEw041lqXVa/Z3YxOYloRIFOMXVLhS4wnj0CpRzqFO+RMKQeNl5/
         8mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260670; x=1691852670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZuj2vYwtu1q+1KUWNq9Rx/83sQjYgOtd/pHC+rLp7M=;
        b=SmMcORxIvaGBSYpKxZp/OD+0IjPyMlU962tKZrPyx7Ua05n7WQEFEPB379RcNwGj6V
         Qsrjba6tT9mWc0bz5AIB6t5YdZ0jIWT42wLQsFQeUOl/LL2LN4E/eww3kpgZPG/mlHiR
         ZTxk0Oe43m9f4J46DTZFe7wRLVRM4Q8YE3aTNI/nEVRfWxC4kZTmQIgDLDtgRXJCuVot
         c9vuP0/rxGWRvT91Ys7G8vdAtu36i+J7GlLI561OtyBUWlToAYdGBs1vcUUhPPMw+pVu
         yOe4mHyMhIcGbgemWcxQ8e+aJ6f3ArYHF2e5LdSJLWvwJrQq/RMwM4lAkNF37+rXukX6
         SpwA==
X-Gm-Message-State: ABy/qLYpRXNNxe7tNx8uhxvp0Ojn0WgcvtYGXZDAGLQRKYx20wnc9sM7
	J81Al6dLyHdYwe80KL2Zw675tA==
X-Google-Smtp-Source: APBJJlGQBOniWxQQ0p4125shOSawu+R4zWBBkYj1MASWCD7uyRwcaZd75TijtpdYHX2tDjuhURKpQw==
X-Received: by 2002:a17:906:10d9:b0:98e:2b01:ab97 with SMTP id v25-20020a17090610d900b0098e2b01ab97mr1739243ejv.68.1689260670406;
        Thu, 13 Jul 2023 08:04:30 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a247:82fa:1d6d:d215:e7c4:dd5e])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm4102939ejb.36.2023.07.13.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:04:30 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 4/8] soc: mediatek: pm-domains: Create bus protection operation functions
Date: Thu, 13 Jul 2023 17:04:10 +0200
Message-Id: <20230713150414.891893-5-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713150414.891893-1-msp@baylibre.com>
References: <20230713150414.891893-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080432_230503_A978D31A 
X-CRM114-Status: GOOD (  12.43  )
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

Separate the register access used for bus protection enable/disable into
their own functions. These will be used later for WAY_EN support.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 68 +++++++++++++++------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index a2c8f5313124..a7a46fb132ee 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -118,26 +118,50 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 					MTK_POLL_TIMEOUT);
 }
 
+static int scpsys_bus_protect_clear(const struct scpsys_bus_prot_data *bpd,
+				    struct regmap *regmap)
+{
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+	u32 val;
+
+	if (bpd->flags & BUS_PROT_REG_UPDATE)
+		regmap_clear_bits(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+
+	if (bpd->flags & BUS_PROT_IGNORE_CLR_ACK)
+		return 0;
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, !(val & sta_mask),
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int scpsys_bus_protect_set(const struct scpsys_bus_prot_data *bpd,
+				  struct regmap *regmap)
+{
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+	u32 val;
+
+	if (bpd->flags & BUS_PROT_REG_UPDATE)
+		regmap_set_bits(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, (val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
 {
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-		u32 val;
-
-		if (!set_clr_mask)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			break;
 
-		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
-
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, (val & sta_mask) == sta_mask,
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_set(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
@@ -162,24 +186,10 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-		u32 val;
-
-		if (!set_clr_mask)
-			continue;
-
-		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-
-		if (bpd[i].flags & BUS_PROT_IGNORE_CLR_ACK)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			continue;
 
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & sta_mask),
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_clear(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
-- 
2.40.1


