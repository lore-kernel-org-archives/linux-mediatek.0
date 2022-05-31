Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D796C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RDZsNDoVHE6j9LuD4ZbRFpqkpiGWSnN257xcKjx/B4=; b=WRFhbw1/juy7A9
	cd1vYEfrGMjsxl3Aq+B3QBJtHM1SCn6XuzA9yZz90dCQY8AkW1YEZygeQNxhwUmhbr3mpywqGUZjq
	H7heimQt8mwWORuhYvuMEH5511Ibo0y0wzjXfBoNPNy7mJhTbMYnO07hkBi8Z8P1/J0pCOFvxJnQh
	trlcZ9KU9RfUaDf8cEHWzUfFAfcNMLwZGWqbG2NSeAUO/LW4deXWpqVHxEnzEo/Dyi/A1MXcpvweM
	tDQCP0UN+qfwEhzuooMxCC64i0kyyANzgw0zJ1+z18Ibq/Vi764Kxe//eTZw9QaEaF0k2sIkTy7zw
	l9spQkEdcEl2YgvEqWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Nd-00BPX0-1g; Tue, 31 May 2022 15:01:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gr-00B9xy-NX
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u3so18782377wrg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poEfxrglOPRvGSjuKsP/EkFpCQGyu08L1eg/xjf1B1Y=;
        b=aHmuwAfSfJw6Mefu9ShhCni9jlWFc+9ZC9ROtMspcijeIrK4NW2NnFHPjuJNB6UnqY
         fbWvMizollAHpP4g1wiQxsHcPAEufWVY3Q4ZOaALL1x46y+ayC0kMwl3y50W0tLYinnr
         DA80hwBPdL17pWfSPFvwTEsv/ZjHjV6UvnjTBCyzpSYbQEyCVJ54PJpuaqP69QdDR2vb
         gzBoG9139g4a6k4E3Vmb+/SWrzsVqFxrjQzjEKsnmPqEtL/2jd0IVfoxtnmFeFHVNsMv
         DSidPQzDa8RiBW6TyVqha6BIvBOaxjN0Sj1OpD3TogJqehwGY2CTnXvMD3Gez73Jc5Z7
         AemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poEfxrglOPRvGSjuKsP/EkFpCQGyu08L1eg/xjf1B1Y=;
        b=iRJqCdVLGVU3hdIZdhGUu0LWnQiX9VVrv4GIIHP6bL91l1WWHzesr54QRK9EQygx/s
         e0ZufWFBUvddE6GEwuxM1uUK/OYZOBH8mKU/jOK0rum+bQwsFgIb2Nq1H5CYdItdpGpV
         Nl84Ufq4yusLEK6nF+TSfceXXiNceQxuvKmXccTZSnIey1ftmN+jDvynTXAiz7pVmvjH
         TMb07pu3M8toIkEe6huw34cyRB86cj+RsIa57aXpleuKAOVHdaM0ufsb3D+g8vO2+TFl
         tuLdGd6YBzgmEyJ13MbjobgODMiwPErdzA0QaRsUABbdKDCz+++T/g0N8LyQIRJTFisB
         rv9Q==
X-Gm-Message-State: AOAM530Ain0sKMFmkr62zRQi5J1+IBW3W5gqznj9yw8VPpeFGPJkaOoQ
	J3veJRl976t+dYtllkUlnbblng==
X-Google-Smtp-Source: ABdhPJykTBwGPKug6M1MqnHyEK7Ev61BplKNaormccadnbmARRHHBqjjm4OJ28cN7w83/dZOCJCd0w==
X-Received: by 2002:adf:cc87:0:b0:210:307b:2ec5 with SMTP id p7-20020adfcc87000000b00210307b2ec5mr9747075wrj.98.1654005053251;
        Tue, 31 May 2022 06:50:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:52 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 08/17] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC bindings
Date: Tue, 31 May 2022 15:50:17 +0200
Message-Id: <20220531135026.238475-9-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_065053_810856_252534DC 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index a97418c74f6b..0e63c4ba3785 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -19,6 +19,7 @@ Required properties:
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
 	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
+	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
