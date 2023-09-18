Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC7DCD13D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+o3x+uJ9YzwXJ706ogofqn/rKhanyRMaKp/8ksBhmQ=; b=ICIySN73XHjG5j+ZlujJIWnaTw
	ynvPu2BNJlNBEQL9RUzNwmqUCBTuBCeJs7Odq7HVn7XEJzbAyj10JyfV9FZjDEKm1tRVz2BBEG/+G
	E97hB1WY3o01SkUMURkp1BCBN0ssNZ2Zo9ZIkQx4CFVv6ksUIcfR563fFLlPVd86opxpi4QUozcpf
	VU4kFwSlBeGg2fClEUR45oMq5xyOa/T7diVBcaTd4Boi1vUinUCWo20IUzRP5q/hnzAxLXltZVxnZ
	4MC2qSdTC/JPZVGAqGrdPTXsrptJJr/W3LJ7pBu+lfXqQslSOe5C0pvhGPSRc//HhkQNxuUlnxrZo
	7yRt6rQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAiV-00Ey9d-1F;
	Mon, 18 Sep 2023 09:38:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi3-00ExsU-2K
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bdcade7fbso542162266b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029906; x=1695634706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+o3x+uJ9YzwXJ706ogofqn/rKhanyRMaKp/8ksBhmQ=;
        b=0bFIqwpaZoFVLQ9TTHA3HzKRMcn852bNeo+9V+Ylusbgnq2HuwUYiNUur3+Gq868+o
         APc38oB/sh1h00yXg1DDMc82Hii0s5MqdrmNUdrBysU5Td6oi7ESMZFq05emAvk9jPlV
         WAnjt0GPXVFe0fEgHwsqEKlF06COxOqj+hM1DNCTQHtgEKhl+xdRS2m8aDxhGZNYNEzX
         cNOgTS42pCifvhtSHg9jTQu+FC6mFQegXQyv52hiYnnXr8925sCcGUITDzKXniEozFSX
         aFxn/Fgpu87tLpVWx06GC707GEDia4+xoE4qb3kxvsXYWWxP3ja4oqmh11jdd8viMHn9
         a2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029906; x=1695634706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+o3x+uJ9YzwXJ706ogofqn/rKhanyRMaKp/8ksBhmQ=;
        b=COCFu7VLYqMshEgkwN8Dtng4F948brMR9JQA/QKhJtfGJVhvJugCViH5OLuM32J6RL
         fVxy+pPb/FSNZxMypAKjXpQ+iY/n7JWa7CiaItG+yyNLBkRWrLY9H7EWYrVBCAC8eZpV
         8VGCuychUhnm4LZjcQHFwG57BYjWIuz5XbnyzsjoEYMafwxueM0SljyQ8vIL7Gzx0POw
         K7ECuJZWfuqFIdID2Z3fKB2OxcYbkFqn03KKbw/nQH8FJMIDT1GqjHQmp8ZVFLhNw2Af
         4+F4u6Rsxa3Da9hnmjPvX2EoYhfa8ofE0rXyMSMW+F8z7FEPxOWtlMEIpZBlmeSdTy3t
         vukw==
X-Gm-Message-State: AOJu0Yyvt9MOnp+2vMPdVR7Ajr2sTp2q7T69ySqfgaT/lkGkHiuXv8CQ
	VbFz+O210prm+DjNvqlUxdu80A==
X-Google-Smtp-Source: AGHT+IEX0ezJmq5q1fuYBZLREjIGK0zvStap6dCn74VZClYqNabRbMBNjqZl++yQ4n7omZ2/YQ90ww==
X-Received: by 2002:a17:906:292a:b0:9ae:f0:17e1 with SMTP id v10-20020a170906292a00b009ae00f017e1mr2538052ejd.74.1695029906014;
        Mon, 18 Sep 2023 02:38:26 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:25 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v8 7/8] soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
Date: Mon, 18 Sep 2023 11:37:51 +0200
Message-Id: <20230918093751.1188668-8-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
References: <20230918093751.1188668-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023827_790735_96ACC8C4 
X-CRM114-Status: GOOD (  15.57  )
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
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 27 ++++++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  3 ++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 4bf3a375b749..69cdf6ff00b8 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
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
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 17c033217704..aaba5e6b0536 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
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


