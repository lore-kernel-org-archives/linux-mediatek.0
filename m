Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AFC001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHY2zl9AlSScSWcascrM1mTFlsb4P2jY07NseXNj/VE=; b=D9Pz/LjDwUjDo4EwoR7ZKykUo7
	COAWowZmnsdEe+Og3afHZQZ+l6UibuPbmJslTPTDwo5E5T2rEGnonyVCrnr+bKjcvJUyQBMT/LE6p
	Nyj1S7e7snXdco2DU+P1f+Ln7fhm9M6OFiLDKIQj8yYEGNWv0m7YLjKmP+DQ1wYvojI3AB1BXLDuz
	QDV+aA+JobFYhlzF3oKR0vWlFfQYCnBZxXC7vdCxuI6tkMOi5UH46CG5PiGhTeFXRLo5eY+6D3SvV
	wMHYDOC5EdQotQMQbcHW7TmKI7tBSB3RlRdbvw9JF4unTocb+5DWO6cFOW0GM8u7DNa3BdI0VTUOY
	oDJeCNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxsF-003f7q-1G;
	Thu, 13 Jul 2023 15:04:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxru-003euH-2q
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 15:04:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-993d1f899d7so120187266b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689260673; x=1691852673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHY2zl9AlSScSWcascrM1mTFlsb4P2jY07NseXNj/VE=;
        b=mzmHcYpO1Htg+w3gGK9nVRXLug+Zfktq+X2nX57AkyIlOIctmeiIFiEggRCmsPceSI
         hpj9oFlfwpOLgfthbCIgD95Xf+YP7hPgOlRuID6GUtE4pLdCZUYT6/s7Ws4aOAqjxeKA
         ZhDsk+Awp5Q98GnSLXrhFRZ1Lm17gTGghB7sbjNgXqJKKkgcZmL10MxhAO19rwiMJcDr
         KQJYhp5OJloQWmN+3nNCFA+Trjj9SmHKh3ugm8JN+anu1c2pZbT6BS0ypdeWj8FAnv5g
         dk9Bf8Ex7dvgp7GFf88QETIsb2tR56TcSDcrIOiD/aQU8cJ6vbJqljOeQxngVQ6VlfvY
         XQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260673; x=1691852673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHY2zl9AlSScSWcascrM1mTFlsb4P2jY07NseXNj/VE=;
        b=Kv+CEDf7+5P3Z3U/MsFMJInWhGWnY9iaLDBcxIKC+ZeS1VPdLVWV8V6XYrnyCIoxtG
         no4F74hFH5g36P5SsraQ520d0Lg0ASIUUofluvyatangXB/LfMYX6Ntwc7UjDR+BzQ/y
         ztriYQRsnE2dlvyWSNgadtdoj111XFRV+k5XUqYXqywSRqBmMz/rlb6GNYocQ61yxXSZ
         4CYfFsS5GBRp8U50/EfjTAwzwr0Htju6b8ZVOyzzu1J1PY43aAejdhr/pY7vTeZxaOnq
         WvpiLOCBloTk656CF4MjqVVrEI/ELgQJBPozFeljvBbsYJvgVqVFxxaY9KrbbaykG7//
         4nGQ==
X-Gm-Message-State: ABy/qLaTXU5rxM+ZvKTdWEhg3M5lGe5eh5xM5zgEXdYk3CbU/DX5+v56
	OhCeyEEIyu6xBR/yCNqzFFWzSg==
X-Google-Smtp-Source: APBJJlHRJC73a2I1KCWDKoc7uujFZ/ZMOpvCb4pkn5+CV2UBVapFmnlRP4j8D8ExqCxgqspGSQ27Bg==
X-Received: by 2002:a17:907:2a52:b0:992:1964:cd57 with SMTP id fe18-20020a1709072a5200b009921964cd57mr1338543ejc.75.1689260673551;
        Thu, 13 Jul 2023 08:04:33 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a247:82fa:1d6d:d215:e7c4:dd5e])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm4102939ejb.36.2023.07.13.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:04:33 -0700 (PDT)
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
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 7/8] soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
Date: Thu, 13 Jul 2023 17:04:13 +0200
Message-Id: <20230713150414.891893-8-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713150414.891893-1-msp@baylibre.com>
References: <20230713150414.891893-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080434_933085_A9F84C81 
X-CRM114-Status: GOOD (  14.85  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 27 +++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h |  3 ++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index a9ac79e5c295..cf45e29420b2 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -262,9 +262,17 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
@@ -274,12 +282,23 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
index 17c033217704..aaba5e6b0536 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -12,6 +12,7 @@
 #define MTK_SCPD_ALWAYS_ON		BIT(5)
 #define MTK_SCPD_EXT_BUCK_ISO		BIT(6)
 #define MTK_SCPD_HAS_INFRA_NAO		BIT(7)
+#define MTK_SCPD_STRICT_BUS_PROTECTION	BIT(8)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -107,7 +108,7 @@ struct scpsys_domain_data {
 	u32 sram_pdn_ack_bits;
 	int ext_buck_iso_offs;
 	u32 ext_buck_iso_mask;
-	u8 caps;
+	u16 caps;
 	const struct scpsys_bus_prot_data bp_cfg[SPM_MAX_BUS_PROT_DATA];
 	int pwr_sta_offs;
 	int pwr_sta2nd_offs;
-- 
2.40.1


