Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C3C04A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=; b=NsLRLUl/m6lgxQ9dLTlhaliqu2
	X6eGONRVcLkDPgXnMDbnuJrhYIOJvn8c+HgiTD3LOUacb4wFC64oFcN/1jeFal1Cn+MStZsoz28bv
	crkx4BcvRXbQVxnSgPNnLkHaS3aea+VvGVXgkCbjE9vsQSyF/lQg1m4wpNDJ5vO1OS0wkPPqE15p3
	PPnMQNGNl/fCZlruwAhcAI6KWyhXcrZlakw4e9ZZWXevfCLGMQJVGwfrAa6Av5me7iJFZMI3oyZ9n
	mIoPkspPNqrsddjaMayb7+ThLerokug4JAESxnk8mqj+aijxTke0db71BSo3CepqRU5eEU2ZKDx9M
	Qc4c7FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBb-00DJMF-1l;
	Fri, 21 Jul 2023 08:08:27 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBT-00DJEP-34
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:08:21 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4814505ddbbso732159e0c.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689926890; x=1690531690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=;
        b=mOqIIVg9BcpADuYEnhsJwNphrOGgsZ/jx0kH+3BSYoXkYKZWwTzoWjv28ReLmi9Hp5
         fu1Wwau6EMEiARv3e8CYbk+7qFAmYEI57cpZWbaGQn+h1+V3JoGukF52RG5fy7ltxenJ
         O1SF2oZuyLhxYpQ0yxCuGKxdEvMBZ1CGPiaN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926890; x=1690531690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIWYt/VUR+LWe3Ym6ggQYemB73LQMpv4Ia87+08eNu8=;
        b=TSWut4D2zDrNK5EpdeObgQTSW0TYZ64lZxq0vOFXYiMln8GLKXMMmlAvs6WYiWdajE
         AueFsmrlZq1pn5BvNhCrOs0qmfdBjAWRZiKKPD/VxIBXHu3Oz/XR5EyKwDEQ5itiUJhu
         VPNjg4H1+XASgJmwCSCQixc3Q5zkQDdWp0/RRaRGc0IgqjWHUtZGVyWfIfnh/tLsYD/U
         NTVdVaB8zdyWRjHAWEFiJwEVRaXBUF0xSnqb0fxvPEv7gAlnncojCJZylB0K2EG0j0HC
         j8eHuK/pziKROBjbjUyTifwjaDA80JWIgKNuj0p+kuCU4lI4voAONUyB+ymBPRz92sJU
         +ZWQ==
X-Gm-Message-State: ABy/qLZYG6JNvB5MQvWI6+fVo5RiGowUChXwXCnCnb+pVRux6UMvF062
	geI4sLEXN9wEGLOKpv9qslyMFQ==
X-Google-Smtp-Source: APBJJlEC5hPJcYbZ0l3QzrR9QVptQ1VIfzlcV+K0dtYmvtmyBtq4fo5SPB+MiPVbfac4ByQiUkzN+Q==
X-Received: by 2002:a1f:3fc9:0:b0:471:cea:3d62 with SMTP id m192-20020a1f3fc9000000b004710cea3d62mr698570vka.2.1689926890023;
        Fri, 21 Jul 2023 01:08:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902bcca00b001b850c9af71sm2740294pls.285.2023.07.21.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:08:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v2 2/7] regulator: mt6358: Sync VCN33_* enable status after checking ID
Date: Fri, 21 Jul 2023 16:07:43 +0800
Message-ID: <20230721080751.2012318-3-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721080751.2012318-1-wenst@chromium.org>
References: <20230721080751.2012318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_010820_011689_FE359802 
X-CRM114-Status: GOOD (  13.84  )
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


