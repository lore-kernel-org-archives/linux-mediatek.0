Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8E1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usxsP0K1Xc8cmseqwIYE6ZqiT92s9j11+9Dz8i0YM0g=; b=dP7glMY5XwLXpJWeoOEZIZH4ny
	pL2n7ruxVfD/fPZzDECu/DOSuZk9dIZJRl+VlnNd7QGB8ToIOn8WdBrbJQeh3Lnbyyo9fp7p78veS
	xYG1k0dytMPWJuGYzHj2yRECiqEJ7FICuw+PNUjABvqcIW5tiWW1hAAexo6jr1IT2+8BfyLfI3Lot
	bZnm2dPfJ4rT0f1IwqehACbD7besnXlkB5p2FxBbIX9kAJVKaVHK1CrP4ot4TfGPJau7ISXTta+eS
	MqEClfiUMCT7aItuMPXKtX15V8VXjEXiLfUDnDYIJVAhz1eFQkC2QST91xAtKavIyixMFe94MSCHy
	XPoDvSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtKF-006k5A-Fk; Mon, 25 Jul 2022 08:20:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtJ3-006j9q-Ex
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:19:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id l15so10794033wro.11
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=usxsP0K1Xc8cmseqwIYE6ZqiT92s9j11+9Dz8i0YM0g=;
        b=lv+HXPVhjb50QOdFMwn/gpk7Lionrt4BCfECLdNR9Hspn3noeqcc93vGQPMcdCDUTx
         qhnFcrQhGvnS3RekfHFvbZ5LXn2YhfxVLjbNmDuL/QLLOFsgVH7NM/iUcDAzLrKqrG5c
         2uvAOHu9IZDbNHdLNyoL5SS+k2cT7yZqdrUxLVa5T6kZTc0LgBVj52D7HNHCG5ycTthB
         NNdU+vF33FmkBJcwTvSBgPi0quhj2q4o+aUvXloYBnyYITv0pzHOQCEtx/rXjFKGrmE9
         cqwC2qKlWAF+zm3ZRW+vQcobEzJ+oz2tGh70NQwKumhg2KDi2izOik2P9vIfO7MkSzyI
         3qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=usxsP0K1Xc8cmseqwIYE6ZqiT92s9j11+9Dz8i0YM0g=;
        b=FRg/utom+hWpmNrAYNdoEB3DM/hs85nXeHg+l5u9Me9+n9J0R2gF674Ow6ScBM+OsS
         bBqHULuhdMQ3RQFJxn0Mkwiujo51FNlmJNVk1WQT8S9Nchg4NVHNeP4Jsx3aNVKG1eRT
         maKHkvp178KdnytuktbirINm9dqx+/4OvegyOQrnbfD3MM9nZEjrk5760xKiPbPeIsct
         9+AnsAmeMEf6t5dhhqBcf0Zxlb1yV5qO0p5Hj382wXVbP/wBBJmqDBjkJTfI6+utHMbV
         wM3YSj30JUANFnc2igKXU3m4hcmv+MAilQ4AviqzO0gMg2EX14KpcMD+Cu7AgfQ2Uezn
         dWbA==
X-Gm-Message-State: AJIora+qA4ePR4Xw3rGFcmCnzz+iTvyGKYmtLvPFZpADvZrjqv34M6Rh
	gnyp0F6Zp5FdS0VgERnONdmntA==
X-Google-Smtp-Source: AGRyM1uyqjH/4hgu+UdZWfQezOgf1LqnW80TfiBg5gxjZZ5SFJbrEh87S3uipSb8IG/IhExuSyQQrA==
X-Received: by 2002:adf:fbc3:0:b0:21e:3c88:2aa1 with SMTP id d3-20020adffbc3000000b0021e3c882aa1mr7168379wrs.84.1658737151472;
        Mon, 25 Jul 2022 01:19:11 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:806e:25e7:daa:8208:ceb])
        by smtp.gmail.com with ESMTPSA id x3-20020a05600c420300b003a3200bc788sm16695264wmh.33.2022.07.25.01.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:19:11 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP cap
Date: Mon, 25 Jul 2022 10:18:52 +0200
Message-Id: <20220725081853.1636444-4-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725081853.1636444-1-msp@baylibre.com>
References: <20220725081853.1636444-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011913_505350_62E2C076 
X-CRM114-Status: GOOD (  15.48  )
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
    Changes in v2:
    - Fixup error handling path.

 drivers/soc/mediatek/mtk-pm-domains.c | 29 +++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index d0eae2227813..94ca8981f45e 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -240,6 +240,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	struct scpsys *scpsys = pd->scpsys;
 	bool tmp;
 	int ret;
+	bool strict_busprotect;
 
 	ret = scpsys_regulator_enable(pd->supply);
 	if (ret)
@@ -263,9 +264,18 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
+	strict_busprotect = MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP);
+	if (!strict_busprotect) {
+		ret = clk_bulk_prepare_enable(pd->num_subsys_clks,
+					      pd->subsys_clks);
+		if (ret)
+			goto err_pwr_ack;
+	}
 
 	ret = scpsys_sram_enable(pd);
 	if (ret < 0)
@@ -275,12 +285,23 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_disable_sram;
 
+	if (strict_busprotect) {
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
+	if (!strict_busprotect)
+		clk_bulk_disable_unprepare(pd->num_subsys_clks,
+					   pd->subsys_clks);
 err_pwr_ack:
 	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 err_reg:
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index e788d6bdde9d..a50cfb926d22 100644
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


