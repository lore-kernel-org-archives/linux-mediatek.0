Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32240C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=; b=T3KPFXErv0nhBI0Uxx3KxLwn+i
	FgidETA3Woi6BUHBrhLKQvhAF5M0lP3vP1FOJhwUpQmL4YH+eAg8/k5+FzCjqHh1M/v1dgHeWZrkM
	kTMU4FKFGRiTvtFExQ3v3mw5LZ5YE4q9+mPeXiR1P+Upq1JbDnkNF8S7lGU+S5oKMK+eOEESWqWtc
	JFQLAoYOIbL90ta6w8OS8iPPXbJEvUy/rJdRExaD4ljFMbnWO/zueWgG4r6I7Lq5GE4pIfi3DxsnI
	U53JRmNNAzj2QUCJdWe7vcYSS/wZvycrjpQi4hSeYSjzUitmwuIPDbt8whZHZ2mT9nce8p5rKUMBe
	qlVWZQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW9-00DNOI-0q;
	Fri, 21 Jul 2023 08:29:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW2-00DNJq-0v
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6686ef86110so1121836b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928173; x=1690532973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=;
        b=U8tbOuYsv2qAdDwgZoO+iz47dgCAAuQtft3iB/+2w3aUBrW2BKSDOKRq6XwNvVmZjn
         kcG5jy0Jg7hOzt1t0O6ye8LfAHv/h3rahLv+WIyqan+z6XMhf+TImBBS8QRmFUTw/EnU
         5nfhMcw2R3snwZ7cBuwUgdC/XeRpSbJcm3Oag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928173; x=1690532973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=;
        b=i000WtrbjIgggD7pWf4pZXtvKK0eujWER/gK2vfLeqAJwaOVnxUTFRf/5SZBSaQTPJ
         i/guN4viSjo0BOz4iFfs5VPMHrCmyRDjz2h99oD2U0RhV67Ez7tsqEZ2xnqoWhB0PqB9
         kPNPh/r2nFkIh5G38qXyv1sN4bVVb3A60nk/yxopMSLYfzzP8oO7ZFrpPcYJIasYq2SR
         JnvgJFDWM8QZH78KUfaUtp/DlDZVrsdVWm9n0SqPYEOsItWNAGcMnmeOQrZIwwkbNaq3
         eL4nc0u7zraIgHalqSlC9GDU9XLIr0cI0H/SBkoFMuFtBi3+HV4MJCkHIcGIUbAy0LGG
         yzgQ==
X-Gm-Message-State: ABy/qLbR45BQb2m9S9Av0o554raRDiKyTULgGgy+RZA54/VPESseZ3sd
	KS07ja8j3bs6vNBHAd1aqK4qog==
X-Google-Smtp-Source: APBJJlGKWSQK0mN8NpAN1D+3ZDdQIBCHZZ4gZk88M8iDl/Ci3FHMFyzggXhCphtN+TVPXkH52RraFw==
X-Received: by 2002:a05:6a00:2e18:b0:67a:f6f6:ccc6 with SMTP id fc24-20020a056a002e1800b0067af6f6ccc6mr1225758pfb.5.1689928172684;
        Fri, 21 Jul 2023 01:29:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 2/7] regulator: mt6358: Sync VCN33_* enable status after checking ID
Date: Fri, 21 Jul 2023 16:28:54 +0800
Message-ID: <20230721082903.2038975-3-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012934_323373_98824FC4 
X-CRM114-Status: GOOD (  13.83  )
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

Syncing VCN33_* enable status should be done after checking the PMIC's
ID, to avoid setting random bits on other PMICs.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 65bae54e08c1 ("regulator: mt6358: Merge VCN33_* regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6358-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 31a16fb28ecd..da6b40f947c4 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -676,10 +676,6 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 	const struct mt6358_regulator_info *mt6358_info;
 	int i, max_regulator, ret;
 
-	ret = mt6358_sync_vcn33_setting(&pdev->dev);
-	if (ret)
-		return ret;
-
 	if (mt6397->chip_id == MT6366_CHIP_ID) {
 		max_regulator = MT6366_MAX_REGULATOR;
 		mt6358_info = mt6366_regulators;
@@ -688,6 +684,10 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 		mt6358_info = mt6358_regulators;
 	}
 
+	ret = mt6358_sync_vcn33_setting(&pdev->dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < max_regulator; i++) {
 		config.dev = &pdev->dev;
 		config.regmap = mt6397->regmap;
-- 
2.41.0.487.g6d72f3e995-goog


