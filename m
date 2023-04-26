Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2E1C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShVQ7cNiesOQxt+dSTilOr55/lZ8c9SXW92HkGaO08M=; b=TTdOhVBr9xcrUDE+zlJVDEnESy
	c2LOChGRAN1Ly9mPBS+fNffzilGN0r1unnP92+Zj37lXYFMMSEVzxS0a5h05Y/6+5oIWXCgJlyNF8
	7kuwDMmq9RkZYPaXcmKF0m/3TTnj1E19yVhSJRh8qIvHTt2m0bMw81JmTuoplg6qc2zsLURskM4QR
	rSILFZMtTxJtqsH4YXQXQKrR45mWLE9lW1JelwTFrRDdOYos89prgfwwit++tFviMitFgG77+1PQW
	kQON19s4LB/Ed/HeUkHbmiF2rP1S7b7/9jS46XT1920D6pGBSGiIt8JRBpNWs33A6OwDCM7Ef/ZZ7
	icCYR/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcio-003eel-17;
	Wed, 26 Apr 2023 10:50:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciV-003eT7-2y
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f1958d3a53so54599075e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506180; x=1685098180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShVQ7cNiesOQxt+dSTilOr55/lZ8c9SXW92HkGaO08M=;
        b=LIJ+LAE6cCEv3GCpcMCf7nbM3MWtLk8VyZ+MpeaCfZ7APB5WFUaRuvX5cybmp5cApi
         eIK+AcBqJvw0E33Ir2VJlWcwB2LKusBjmftOqN56OaHSb+KixJZzhCYrFK4MDLeLLtas
         ko8ZM3e/8CrFxkrmJawETlrGr6jNLJ+fgx/jd6a++LMF2ib/2Sgx5KXBe384FC3l3ovX
         /nvQETMF/XjuDhty9omKNmjLw+ykWInv55gXK6FcAHepejB2qUI/bj88TXjazFsrUQYp
         Cfb6zIuVOjmifDda/23UGcl86D7CKHiISmV2V4/CJs4z91R281QcY24/JXjm8jJX+NXb
         y3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506180; x=1685098180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShVQ7cNiesOQxt+dSTilOr55/lZ8c9SXW92HkGaO08M=;
        b=K5q3tk4CdY4vB4nD6ilCIatKmi1zpIC+OzL/P74rnwLChTiGJ4foWWn57/8zL6n2xS
         t+J3cDWoPFNRft5kk+4osX6n9nbZuvaL5bWuRVZnJ3tcEvZirqOakfauUKZrU9+Jx8Kt
         HwrZM1aJJsa/nMQecwkNyAQvQw8Pr+HKvKAiUUiTTUKbRdbByCG6AAS/Jex+nyhJ62Aa
         5ww7iDzhiF/ZS+cfOhG+lMhRdd0aGt5iwkELgvIYAvqLsSbpfQXtdbP6bzfq1iiTrXKD
         CdRTn2rBItPXqMpXgaZl6uTjZjKBuNQZyPsb0oyNg3W57OlrWPeYtCPAVB6jpbM6qvYi
         K/Mw==
X-Gm-Message-State: AAQBX9fUYd3FH2WwkyagEJdeVQ1shjjBVSoZoHnP5UiGRng1sWS44Hxx
	8vF3EHVRaonJ3U0JfK0a6/ruTwmYkjhfmdHiANc=
X-Google-Smtp-Source: AKy350anvHq46IPAf3WZHrRBhZuA/L8gSKK464zrseouQqgnKKJNs9DiIi9Xiqev0eOqTQotEv9LbA==
X-Received: by 2002:a05:600c:2291:b0:3f1:728a:1881 with SMTP id 17-20020a05600c229100b003f1728a1881mr12679478wmf.31.1682506180028;
        Wed, 26 Apr 2023 03:49:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:03 +0200
Subject: [PATCH v6 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-3-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=GDhk/m0fF5qCNCdcaWi8PVQeneypbzl/HHAsu/4aQ6E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/6sFFOlnf1KIfZQ+od5rJyXR7vGiygFFg+eef
 AjVGfhOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURfhND/
 0bwgOVuv6fifdPhYyFMYgQYwAK8YEEWQDVdai8A9vF3+/hng6WEf35wX8gCYmgzM6vAYTnEFqU7WrZ
 bH/AcqF7FId0O1ikOcwAUdYHh0P0dMW7pVceIfKF7HGOpGK1I6a1nmu4cPHGUriqLyWTb+UJckpKdf
 LbSgotnfCYrcNAEXY2HT8s9joGuoEL8WH5KGehF9M7c753KlxoEtD77dJ/GYfMDtFrtcjP9hW8OA8h
 0CqkpCrgz5eR/wTa0UrBJyQWOB7TqxWbOL2WIEyltt+D9Dfr9fxx6CDY+vZ1ACk2uNC8INXV96AA4u
 eXM6PLP88cpLeLNFFta3rpIxbvyibVgq97XWSqzU/q77Ppx8ItE2wAOV05mSZ5oXkTURJlnuolIwjX
 7QfuKSyqWepWjB5jPU95t08UyPwpVfm7+cJzdInOh0Iz5a3/pv2wzVYeyqpmOGKv85R51QznCs5Cyc
 WP0dyqLCSLKgpPc3L33WsTN/opglcHQ0F/NiDQ04WVlbLCyzbldN6VURUl6lNPi3dvArWbo0Xxncxt
 EBYTqBQ1J3TO00tgvmjXJ2qSH5tRnIzDDrnF/OytJ9d+rsxQd6n84q/0XOqey2q30FraE/mJbpcMKs
 5/GCAaj0mfNC8eThYRuIMkAYSEFRGbv6yqEzOZ7EaIbKhAqmHoDyWqT9pt1g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034943_971619_8FB4E1BF 
X-CRM114-Status: UNSURE (   8.79  )
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

Add binding description for mediatek,mt8365-wdt

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 55b34461df1b..66cacea8e47f 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
 

-- 
2.25.1


