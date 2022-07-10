Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jul 2022 21:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7qU0l11XuBaUxJzhKqB0uFCFxpqtrqPIbLk2Bb/IBU=; b=hMGwQBZBtWVTN4FnwOV3R+qOZu
	eEWoY3xcmBKGmp+ed5eVOyNNN5kMho4is6rr1bW0u+xl4WwB2Z+1IV/QZuVC0tXEqAFR/HAtTl2lU
	giQKKf0zBENBGWECUKSad+H9R3iKNuXVSCUQ8cDnnu6bECtBYYyd4xfVCzD9BdCgjbfyxI1Nb/ZY6
	IbrIoiQWBSqPLxNep62UREQWNc1p8MzQcdhK5Z8lTAFZIHpzJY1td6eSsa+mMcCkdU4OGSJg4zGrl
	GyZj1u3ONkUngY+/vfOzgO5qh0d0hgaxbdSyAogOcBenpCHNvKafYF6cdNd2LLCLpxXPf+Oymwa2B
	SIHhg9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAeRZ-00Dosx-Al; Sun, 10 Jul 2022 21:26:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAeQS-00DoGb-AL
	for linux-mediatek@lists.infradead.org; Sun, 10 Jul 2022 21:25:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a5so4744441wrx.12
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Jul 2022 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7qU0l11XuBaUxJzhKqB0uFCFxpqtrqPIbLk2Bb/IBU=;
        b=bViLhf8ekuUWaRy1driK478eBCats9Y5hHqzf3t8OuUIsIUJlRKiYgZCrGxQLMLqpc
         dSooLG6qwZTlKZ7bYeJbBVuG9Ro/m0yGY1VZUyXC1FnI1JvVNcd9yoEP+6LoZj+fSJ1u
         zkSflFutUDefFGp/TOZl+n71eitpTw93MUxamFSgMpgHJlGl14WuymrAYyZibHcMMlJK
         WGM29wuKfb1i7AV+1aD0oceriCGQu/w91N0xsc8uocJNovvMcsMf3qO+VNYGpJxtVm3h
         MfpufvYog+RHS0X0rsDQq1bWh2amnXqZWaEtCFKRLDut4dn8xUzp2esXsp7Q7u1bTGgY
         IrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7qU0l11XuBaUxJzhKqB0uFCFxpqtrqPIbLk2Bb/IBU=;
        b=T3ft53cyS9e8nd9PS6G5qVQMdHzVP6BTiTXEdB0roTSlyCQr9qGpTOzvpRQAtGyOuD
         TUf0xWnyrfmqwFOeCLJKBN0YR03keFN8eDohtNrm36FQd3+xP34fBe6+Jhyh6TDwZGeJ
         BB7hd24TcuPqDjmrcr4za7Of5v0OLCxtMGgN4HgldddNvKbr4VpAbz2FHjTO3PR81f4x
         SX3Foxkts8xp6LnagUInfmXgHHeAEwowM3GG8iwkl8UnHVQyx6WmMcSKdnd5XpEoZPbw
         KQhN9Z0T0U4iMF4mvBpkjzeOBNq0QPBoyFcbo9imv4u2hA5UBTY7JqJScZSUQDHG05TZ
         Dl2A==
X-Gm-Message-State: AJIora/R4jyGVdulJO2lJA0iMGPgCJeXgWxxeXFcS4jLBu0I+ARl+IcV
	P+wJrykTHD1koFCdreDXV7Wayg==
X-Google-Smtp-Source: AGRyM1vffzN5eiy27fcXyMoBJq1BVy3jqLfPjvEt5vtveDcNZJ5OnAIq2aniQxmH184KYKgCE6sxcA==
X-Received: by 2002:a5d:58ef:0:b0:21d:9fc8:302e with SMTP id f15-20020a5d58ef000000b0021d9fc8302emr4587256wrd.22.1657488310058;
        Sun, 10 Jul 2022 14:25:10 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	khilman@baylibre.com,
	abailon@baylibre.com,
	amitk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v1 20/33] thermal/drivers/mtk: Switch to new of API
Date: Sun, 10 Jul 2022 23:24:10 +0200
Message-Id: <20220710212423.681301-21-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_142512_363774_FE3246E5 
X-CRM114-Status: GOOD (  13.68  )
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

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/mtk_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..1dfa6b058d9c 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -679,9 +679,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	return max;
 }
 
-static int mtk_read_temp(void *data, int *temperature)
+static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
 {
-	struct mtk_thermal *mt = data;
+	struct mtk_thermal *mt = tz->devdata;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -700,7 +700,7 @@ static int mtk_read_temp(void *data, int *temperature)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
+static struct thermal_zone_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
@@ -1082,8 +1082,8 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
-						     &mtk_thermal_ops);
+	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
+					      &mtk_thermal_ops);
 	if (IS_ERR(tzdev)) {
 		ret = PTR_ERR(tzdev);
 		goto err_disable_clk_peri_therm;
-- 
2.25.1


