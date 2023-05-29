Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E33C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=; b=06ISG7XQCDIl3vd7xs5ZE2MrtH
	Re3JUloDbI+udSyTz2PkuOjnqvpREwk1oy9D2OBxrfBi7nXru5mTDUt/QDbqPuYJS14D5Fxs0P00e
	HLTwVtw6CsSpYdPk++M7C3SSqem5tKC7Z4CnAP6lnFXfweu26XATbh8f8vR8sB9k4yG3r9rjx3mHx
	LJvqgo0ADyA/Gpc4Y34423DPxjYhWndl1fOaVQ16VethPKuqzyGmybjE4njoP33D80U71drb0010Y
	bl/lW2ZIEiqrR4jiE+k8Vky3CrjDIzQ2W9Bqa6VBMO4WVnF1oBK0y+eDAIvYc8tYs6tYJpyRppZRR
	uZZdgRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3hAK-00BLrP-01;
	Mon, 29 May 2023 18:00:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3g0e-00BAQG-1N
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 16:46:17 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96fffe11714so650217266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685378773; x=1687970773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=;
        b=deTEIU+pyD3V5mnx/rrEaGu+++V8NuthSZVyNy3qg7qAW7v1bdiAuHp1Ykv4wUMdak
         sEITqWIa0GT/2rqYOvugqqALSSRd0RVUjiefeGQVIw0wLoa8e+hwbyx+2w1oNF//W7Un
         BXuQN9qcPNRjHieND/XpY8yaVCXqjH/bMXGpEm8E/v6SQuK2JCOB0KFrRcLdU/v7pTEj
         EI/mw2e4EWrFO1ixiI2qRQFfaNcig/KQNRdwTN6CbqtiM5EDCUzq8/hCPOICPWOAq9tw
         8Q6Ityc22xe4ekw1DhjSIKE7tu0Jvyv+2v80prncLc1QuPfo6T8PloejnKRJqziKOLJj
         KE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378773; x=1687970773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=;
        b=BJlDLV8mHHRZF2XebMACDnHqD74MZ6siGtOft1g4VJYYltlz5qQifCWbO1G3HEemnn
         Ef4gkc2QxAJpdLcTC4Llc8W/qO3QQarIai92I9hGVdXAxP72+ddqluwl+MFJ8h/BPGyo
         /cejReUo7EON3UMxT7QdY8XflIlptuwmZXg84xcec03kpGhtQykczIQ+e+hKk6cq9AP3
         75HlJoENi+i+EBxurN0SKil/u2mNr3ANS8U9BYIYgsBIuyRR+KoZjGeLTmkaG/cfIlYJ
         VPSQKaDHjNvUbzqIi8bw/o6M8D2X0P0152evsjbKAkIEDF2VhVSVrkUh7jHeUsfuCvcm
         93QA==
X-Gm-Message-State: AC+VfDxhOeIJQssDQR++0W+pPJVsuu4WlRSXzzoPXFZSFyF1s2gJ+0Ro
	oxx5rfYfjhP8nAYclCrjFRZU6EIhxm8m+hn32YCVTg==
X-Google-Smtp-Source: ACHHUZ57TCu1nzyJyjSvhGgSy6JPiAeD/WueOUQpFY775HM6nWCxEeV9TIa9C/uSHQQiugl0GYTgpw==
X-Received: by 2002:a17:907:6093:b0:965:6075:d100 with SMTP id ht19-20020a170907609300b009656075d100mr14795453ejc.39.1685378772810;
        Mon, 29 May 2023 09:46:12 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f4-20020aa7d844000000b0050d89daaa70sm3248578eds.2.2023.05.29.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:46:12 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v3 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
Date: Mon, 29 May 2023 18:46:02 +0200
Message-ID: <20230529164605.3552619-3-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230529164605.3552619-1-bero@baylibre.com>
References: <20230529164605.3552619-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_094616_468526_DEAF75FC 
X-CRM114-Status: GOOD (  14.54  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add suspend and resume support to LVTS driver.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index d0a3f95b7884b..5ea8a9d569ea6 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1169,6 +1169,38 @@ static int lvts_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int lvts_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct lvts_domain *lvts_td;
+	int i;
+
+	lvts_td = platform_get_drvdata(pdev);
+
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
+
+	clk_disable_unprepare(lvts_td->clk);
+
+	return 0;
+}
+
+static int lvts_resume(struct platform_device *pdev)
+{
+	struct lvts_domain *lvts_td;
+	int i, ret;
+
+	lvts_td = platform_get_drvdata(pdev);
+
+	ret = clk_prepare_enable(lvts_td->clk);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
+
+	return 0;
+}
+
 static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
 	{
 		.cal_offset = { 0x04, 0x07 },
@@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
 static struct platform_driver lvts_driver = {
 	.probe = lvts_probe,
 	.remove = lvts_remove,
+	.suspend = lvts_suspend,
+	.resume = lvts_resume,
 	.driver = {
 		.name = "mtk-lvts-thermal",
 		.of_match_table = lvts_of_match,
-- 
2.41.0.rc2


