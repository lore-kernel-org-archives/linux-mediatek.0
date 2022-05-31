Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EBFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13GXxb6imHMaS9xbzUyA7vhnkgsrQD4FGNWqFEsiwf0=; b=aV1zwORlqD3LWU
	CNTrrGs9f8OmKe7FKO+Sy2bdbQTqeA0dbO8+d/FqUf6DAQy5CjwV3UUS7tQbzYGKpexS4b02BEch6
	Wnhu/q6zUoasN79A/GNNH72FGLT4sCPJCXDTTCbPBLakw80l1MPCAypmTNtX7Rz+C4FzUCvs2ZHe6
	n+hsckgRBqovn6c74ja6PA8zlZTtR6Mfd/WRZdnljcZtMtKsogciaMOBATdCFeC4GvuM5JTleRW/q
	+reGmDbRk19ziearm8AI0Ny2IuUuvJJpCQUxhh/20Uli0edxuQ/ekynpkVqsfCVOiZV3Qcuk3DqJq
	Nc3nVIMF0t9JPy9oFSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3MR-00BOvG-TN; Tue, 31 May 2022 15:00:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gj-00B9yk-3g
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id q7so7831341wrg.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=zwHfoJRh4qEpqnVW4tO8Ww9mFoI0xkeYeX75NLKUzehMYnvddYiXCNrP2wQktLHmL4
         xUHKKb7OGLzcssDx/jyB4RczL28TaZiSTc9JCpmzDJYjcwk/WdM34S2cFCTARqFkGFl1
         LdctYQzJ9woSuCXBJJsxCZRZHlDhQYnY+IAfX3K1OOxNV0l0E0RleUd2ISc2Rgk1qo4K
         fJhqz0GMYoawCe4viZIZ0erbtsOEipTnqJ8vO42ycO5gH009W5gktb3F6y4C7C3zfS+j
         5f6GW9K2Xo/l6wVaOyzBpfe3OMOKhDMwN9sL4RSAhrtp1Bm0pcpeYrF7Ky+FohTwGoxI
         YHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=q6fHDc2+6Q5BNiRHdwihg1q1BC9yVrtLsQHToKHR+KcGXgWYz5C8E/cxTZntaKTxDA
         yjR5vFDvWZQA52ApOM+5U8V+/b92WCsgSQrZBSnfdOT57L1Ctau7JznwpMngBlibetZv
         N4WiVWNMxxRs9gIl20wXBoX9JoKfCTqnUNdmGYakLfZXVluqrbNhvskVxi/f02ZucnRS
         WVqiQKn9RDGTHeJWPr9caxnvQj1FNUhzHNBjGbKEezHQeYR4Tl9q4LEIGqHzkPlROSDg
         90gB/PL6YfbMfFXSgkjYrJkMkcEuqrV/FVNQ4EQeNPiPhaLlQiozRECYuHKtM9zIgNP5
         3xMg==
X-Gm-Message-State: AOAM531cl958nOwgGyLncVwlKMj0kT9LbyM/YaG8cgbl+czaMGkW/Fhm
	nXKHLYN8BqzP90Iph4eEC7TKp5faUD0OYXM3
X-Google-Smtp-Source: ABdhPJyHAelw16D3P0Yimp6zHFw2pjrB1y1+t5Sxv+QQxbBuBodm5ZmZ3Iw3GAh8m1iPVVk6MgPgrA==
X-Received: by 2002:adf:d1ee:0:b0:210:d63:6570 with SMTP id g14-20020adfd1ee000000b002100d636570mr20704871wrd.673.1654005039097;
        Tue, 31 May 2022 06:50:39 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:38 -0700 (PDT)
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
	Fabien Parent <fparent@baylibre.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 01/17] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date: Tue, 31 May 2022 15:50:10 +0200
Message-Id: <20220531135026.238475-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_065045_321538_8B748459 
X-CRM114-Status: UNSURE (   9.32  )
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

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 16a1a3118204..a6fe0d8b0cbe 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -43,6 +43,10 @@ properties:
           - enum:
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
 
   reg:
     items:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
