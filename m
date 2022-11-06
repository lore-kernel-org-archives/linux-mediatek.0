Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3064C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjAdxtpTxlN0A+X+YASvDZA5e+yMzGung7G3AXysxXY=; b=SrqNbI9hS/phRA
	6OAyHiL+4LOKT77FUi8xy+ZUJXf8+yi0WZQtbFsvxkce07uF0jBgDTAf17Ti8v65AA1j6QFFhHRIJ
	3YuQhfwtiHldlR1ZQ6JOPZQFbsFuR27M2o3tcWiy0znqQ4IbQmhDCLMM31qDEJlVFkB5Gr3MF1beb
	MwTggwi/3a8NFXqW6IG3/KN8PNTgCNHdYDcf8NHddK9OwS7Pu72GSk6JBJ2SRECxGQJPzQiKgZSwf
	nLW1zdolFmvgPgICCs2ICdJHLFgF8wQ/1qFH9NXHWZb+ddDjUen0Khnm+Nlc95T7+Zg3m3TRe0wUq
	2ARpFfKbisv87MNovbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orabK-007e3q-1U; Sun, 06 Nov 2022 08:01:54 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraax-007dv9-Ha; Sun, 06 Nov 2022 08:01:32 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 015F75FC27;
	Sun,  6 Nov 2022 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjAdxtpTxlN0A+X+YASvDZA5e+yMzGung7G3AXysxXY=;
	b=f64ZSD342f1H++EkxJtwBZ5JLOXuUyQ8HHV19RnUZkFW7a0OhFAmUS1PBy4aaMjiuvr3wq
	FZayF6YeqDzxrGoAkhermRevgaOvpW++yGOsKUuCEwg6RH1uqOOh3Ed1s9YPu2uWnKfyIC
	DmbowoMTxSE7SmCNbY2GMq31BoedIwg=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 3C025360707;
	Sun,  6 Nov 2022 08:01:28 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/6] dt-bindings: pinctrl: update pcie/pwm/spi bindings for MT7986 SoC
Date: Sun,  6 Nov 2022 09:01:08 +0100
Message-Id: <20221106080114.7426-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
References: <20221106080114.7426-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 930663f8-d39f-4ea1-b476-287d1e74bae5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010131_745903_2D2BECA1 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Allow multiple items for pcie, pwm and spi function.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 89b8f3dd67a1..75766956cfad 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -197,7 +197,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pcie_clk, pcie_wake, pcie_pereset]
+                  items:
+                    enum: [pcie_clk, pcie_wake, pcie_pereset]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -205,7 +207,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pwm0, pwm1_0, pwm1_1]
+                  items:
+                    enum: [pwm0, pwm1_0, pwm1_1]
+                  maxItems: 2
           - if:
               properties:
                 function:
@@ -213,7 +217,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [spi0, spi0_wp_hold, spi1_0, spi1_1, spi1_2, spi1_3]
+                  items:
+                    enum: [spi0, spi0_wp_hold, spi1_0, spi1_1, spi1_2, spi1_3]
+                  maxItems: 2
           - if:
               properties:
                 function:
-- 
2.34.1


