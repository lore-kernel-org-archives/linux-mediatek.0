Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9154CC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSMvzF6WPZ8nDQB+J28VbvrCg97cVH3Ebn5HDrB27ak=; b=n+zrmfXrYnQsieK7z6C5W1xYGq
	ub4eidKjkpwpGNfTCAvuTEQTA0Pz6i6Q6q2b6Pl5hKiFvK884PztBYOXYlfWAJStPGzumxHMGYMci
	2FFiIW83oVEROZX6BFHh2owWlQYzWvW5Hz1dgjbZEOMUculcuuD3egLEVW/xV5XSLuCRJn9Awsskg
	8hU7ST1ocpjiPPUgeNha5UejcWby9AgOcw75UU75N/UBUrg5VqNRapSljG3f/iXn++ilTWAjELnc3
	EsWOj7lwgJDTqTcgiyxqt+evFxoFgFt5qv+NiH5VWR68Sxcg9bnHeoVZVPuTN+QVqERAQF/Kr9r0h
	+4sWG0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gu-00Bi8h-Qi; Mon, 22 Aug 2022 14:46:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gM-00Bgmc-Ie
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 14:45:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id b5so9231782wrr.5
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bSMvzF6WPZ8nDQB+J28VbvrCg97cVH3Ebn5HDrB27ak=;
        b=m4y+Z+22JbZ0Ly6iBmFidAPZbkvp3PPRC8y3oYtfAFQ6zt8Qsv0eBQvfUmbwvpR5Fz
         6FfER971HaLEhnRP4cPVeZI966k6CvgqRYCznu2N07D+STkzGsmBCWwAs27GojNTHxAb
         gfgGQK7gfmYhtspMaXzBNGZI8QN+iNbbEWfO1RD64+OxUeqMNHNXqtJWfrO1YBcgZvf/
         ltLGBra18ZmCpSqLGVqMvGQr3CEgFaReGa7JDnqLUfwStl5qtHpUwTTTGLIKZQ+JRo2D
         SDXJAvjea+okphduoXudm34rEiqTE6SIaK/Nn5GnhZyUjgypTOvG5JnUFCysgq1kcBWA
         A+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bSMvzF6WPZ8nDQB+J28VbvrCg97cVH3Ebn5HDrB27ak=;
        b=g/amYE4VFz3qVS8WVKz5zyIRWj62dP15T84O32A113/1DAfWH8mk0vYtq773QCY+sd
         YA1m/XJVnj7f8Yc/fISF2eOlxsP+vcDIBq6AewMHAzGoEnXYVcgutGZvQM/gyzTs9W1q
         k+EDIY2H6eKTqByuAOKiK+DhthuLcqP4Xne8pWPLqLbeKBdgeUcxuhM0WtNevtXh+2oO
         5UCx4mh565Y8pJjz/TfWWIR9t01fXvnBPI6cmPmbjjqyIYTdlwH7RJfulmUPUmOZLlk1
         zAxTuiI/qHo76WdsCgHtS4DQJgt0E0OVo9rpc0rSU9+FTdO73rOWekVLhSmoxdxuaXZe
         H32Q==
X-Gm-Message-State: ACgBeo0kQy8ZMiT02FyQi0cNlLtdfmK/vwmeca29P6mwKYrhNTGqIk21
	f1RjTtCTCjeUU6zJLxQ6IeMyGQ==
X-Google-Smtp-Source: AA6agR5R6cBNc/betWL+bcg9LDkG0egcM3JtWWDX14j+emkuV8ZDXIYqm2augz26Mh+LKIlQ0llVbw==
X-Received: by 2002:adf:dd0f:0:b0:225:1fd6:66d9 with SMTP id a15-20020adfdd0f000000b002251fd666d9mr11085044wrm.42.1661179524224;
        Mon, 22 Aug 2022 07:45:24 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003a5dadcf1a8sm14670935wma.19.2022.08.22.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:45:23 -0700 (PDT)
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
Subject: [PATCH v3 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP cap
Date: Mon, 22 Aug 2022 16:43:02 +0200
Message-Id: <20220822144303.3438467-4-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822144303.3438467-1-msp@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_074538_681251_96F8A400 
X-CRM114-Status: GOOD (  16.01  )
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

This adds support for MTK_SCPD_STRICT_BUSP capability. It is a strict
bus protection policy that requires the bus protection to be disabled
before accessing the bus.
This is required by the mt8365, for the MM power domain.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - Rename MTK_SCPD_STRICT_BUSP to MTK_SCPD_STRICT_BUS_PROTECTION
    - Remove extra bool variable reflecting the capability
    
    Changes in v2:
    - Fixup error handling path.

 drivers/soc/mediatek/mtk-pm-domains.c | 27 +++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index c2cbe0de6aa1..d323275aa11c 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -303,9 +303,17 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
@@ -315,12 +323,23 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
index 974c68a1d89c..493f3fa14612 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -10,6 +10,7 @@
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
 /* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
 #define MTK_SCPD_ALWAYS_ON		BIT(5)
+#define MTK_SCPD_STRICT_BUS_PROTECTION	BIT(6)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.37.2


