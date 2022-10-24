Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0FCC3A59D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PVFntkudDPcDUkrTjdaUD/wKnuxi9MDu9IdQDwEuaUA=; b=vk2gudBdGZBNT0
	ZqwDGswE2cInJroEF9Z6/vZ+//2aeXf/fNz3Jtq9jI70vKlxD7i/5GpQNAx+A6okADaFNpU3BAs8G
	AEJGZurJQM1/HoBgXFart3imgLfM0rqKPWUNsZlRBIJJ7OV23e6YNblebCpdi9qtYDo9keyzs+zCg
	KE/47JnngdF6Cq9H1H9UdP4h7sXHJcgjbrfI+9oSMz5Z5EOhLA7s5U5TbunM4BRmLn+bObm3nSdh/
	cCQZuaWHG2bIoDYhXbD4i4k5wOWeWCAsdS1kJorLQ0HoKGY5iR/jp9oQAKCCOUNteC8x3tbkjywdM
	ZLKKvfObrNYl78oaPN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oms7x-00HX0I-Va; Mon, 24 Oct 2022 07:44:05 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oms7n-00HWwS-N2; Mon, 24 Oct 2022 07:43:57 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 16F603FEAE;
	Mon, 24 Oct 2022 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666597432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PVFntkudDPcDUkrTjdaUD/wKnuxi9MDu9IdQDwEuaUA=;
	b=lxo5WKqWxAHeKNpqTV3sVds4I5G5Eaq6eYEDf5hOUUpGQFjmNEkIXaHoGgqb/EU4wz5en5
	9B180I2AsWJUqSc0ONgRXUJg+5O1oEpvhShCle0A8cE1YGDfHz8/iwHKkZlTGmxGvWEat5
	b6CrTuy/9DDVZ5HtT8w1EKOpFBcWQ0U=
Received: from frank-G5.. (fttx-pool-80.245.75.40.bambit.de [80.245.75.40])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 4FF9A40112;
	Mon, 24 Oct 2022 07:43:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: update pcie/pwm/spi bindings for MT7986 SoC
Date: Mon, 24 Oct 2022 09:43:49 +0200
Message-Id: <20221024074349.7777-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4cf9fda7-e364-4d0a-b8d2-819af5223c20
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_004355_917705_BC288CA7 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Allow multiple items for pcie, pwm and spi function.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index d5ab5e08badc..0a7d130ef112 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -201,7 +201,9 @@ patternProperties:
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
@@ -209,7 +211,9 @@ patternProperties:
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
@@ -217,7 +221,9 @@ patternProperties:
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


