Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26936C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=; b=YMjq8XLPM23pyHDd/UIiSERPjr
	YeaRYTSavebAldkAa9RMHzXYYuZvGtvRG+WizmNi1bjQCmKVTz7h/ayocN7Cs7pTPiKtN727WBGZj
	Xcf7WzdyboNpIwH0IPfJtRWc8iV57nd7m06SHxCB+c2Jv6DkyomVWg2z7kutXhztlCtqDlly/TPS5
	2qV4jMnNx8BH8rcFVJSnaOgS2H6dyIvPZY9nRKNxumuvlgC2HdAmy+EOPNtwNCRmGSL2/qcU4nmKv
	/J/DMvWUgv4M0KHpVD2EpaWbBcZmknf7FNqaDSDX82KVsNLdVoZDA6zM7VMVmA2crBKbOH2kMu4BR
	JiKg1JPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqS8-005KPO-F4; Tue, 29 Nov 2022 02:34:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRk-005KBF-QT
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 02:34:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id z18so17943514edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 18:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
        b=KtIorSIdh3d3uWlsZA1SrhGsQlbfGeLfo+VHQYFWQtkxRniNSTYERELjM3I5xCQPES
         iW1aMNWCA9wC7C4/aaVQa1DNgKcQlD0kCogEmpTnekZQiNNzVXywkUMmwJMXV0124wTT
         VgIr5sURQfKCiUWg8xMSU0fSEODUS2kcAv9kRtnb9l1e7VpAUXIMggTPsR0gGavSYVYf
         HqrY+qMUOQrxu0XjRe7Wfr0gZbyPsUhV1JpPtywD4DPBiIRVzADw4dzQ0nrS+5Ig4HrG
         hZ5ltam91ISEz7Ri66w20yPQLBDRWqJmKpiEJuMtkP2obRkKfBAZCudmfLLTnn4gm0SG
         HfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
        b=3S60hkSt3uDbdv6hyNQc95iBTOn9kcdwuCcfueT9um4PTrmrg4aul5pPFNcDsDP29g
         AmkYVB/XK1pDQu1PGS71Qf81bUCn2mKFEu0/Ngzb+kEvkbA+j19xLzSeJ3u9xygdJGeQ
         yQRaQVevsYvNtbv7cLdNTyODuiugQ9POHaQfdqwUJDkguPrQcvWeGlGNYImoctiG1Whs
         B5ylRu5u4xxkKZ0sPkUotnm8E17R8b1CHlvBhl1aHvvR+JynWb97gDY7I9F4/qdSN6iR
         bNhzVBmQi+9v1LuC/XjQpoFltBQ/HgZr6rkmXvIF5Pbhs9Z0HmgBiE2p4SR8IFmrKusD
         +4OQ==
X-Gm-Message-State: ANoB5pmjDhfF/s5YqXb628gIIDSgbAT74ya35zfAv53XT9HKbH6UfGKo
	+WQgRA4NuA6cYl7jm0rcpkc+KQ==
X-Google-Smtp-Source: AA0mqf50ZSA74qR3XCOCM6LUBeSegCpn3qM55F0v3CAeeDj/+bX11XGwWL8FKbwRauaJFIssCHLC4g==
X-Received: by 2002:a05:6402:5483:b0:468:d5a9:cb4b with SMTP id fg3-20020a056402548300b00468d5a9cb4bmr35890314edb.409.1669689245330;
        Mon, 28 Nov 2022 18:34:05 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: [PATCH v3 2/7] pinctrl: stm32: Remove check for pins-are-numbered
Date: Tue, 29 Nov 2022 03:33:56 +0100
Message-Id: <20221129023401.278780-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_183408_863741_FB7053A2 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Remove the check for the unnecessary pins-are-numbered
DeviceTree property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc9472b284047..1cddca506ad7e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1499,11 +1499,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!match_data)
 		return -EINVAL;
 
-	if (!device_property_present(dev, "pins-are-numbered")) {
-		dev_err(dev, "only support pins-are-numbered format\n");
-		return -EINVAL;
-	}
-
 	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
-- 
2.38.1


