Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DDAC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ts+p85/BqXRyImfUTVqMY6V4o9A9GbTrAg9y9bk+otQ=; b=ZBX++Kc+GIeZpP
	K8AvHFJfLIPxk8v3M2jGemvynDiKcuWKp28tmEhzradYnI+gNvU9y7dyCoSEuDUq0Zu+jFfEROm1k
	hOy/OLfhYMgNjMVpvoJcepZHvqn2+fapPfUGWqsNkw9fCPRjNJIHN1ukgrHmaLHlJHZaMPGc/xxrs
	bjmG93OXoZ4RIvwKvqI32BGgl0prVFf/9AQT/polDCdrQaCle6Y5a7SlnfjII0f4NkJzg77+dmy6I
	Vp88mFcZZaffRoWhKmIvOSwn0i321ZmTxq2yO4/5V4IqbE5zQOTvhQR8FfGqpP6Znyatc1YKKMDmt
	Dlavrgdvuj+xyLJOCCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oms13-00HVUo-Hj; Mon, 24 Oct 2022 07:36:57 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oms0s-00HVSL-1j; Mon, 24 Oct 2022 07:36:47 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 96266100617;
	Mon, 24 Oct 2022 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666597000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ts+p85/BqXRyImfUTVqMY6V4o9A9GbTrAg9y9bk+otQ=;
	b=Bnzo/dMhZ3ru0VkT0cM0etoLr3plkBArLkdwePcVuOL7x6I4KeSfAl3yc/OiJghhc9NQlI
	wIugidlFkNMwYl9F5xj4W69mBS8FhI2kJn9MwzbUg6oGKau+XTi4PUIuamUf9fDEGki6/L
	zDrqGUMyAwGMLOesf6ueaMQku1QYuZo=
Received: from frank-G5.. (fttx-pool-80.245.75.40.bambit.de [80.245.75.40])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id A2D534069D;
	Mon, 24 Oct 2022 07:36:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
Date: Mon, 24 Oct 2022 09:36:34 +0200
Message-Id: <20221024073634.6834-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8d57070a-1742-43ea-bca5-77937089cb9f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_003646_261299_DF573611 
X-CRM114-Status: UNSURE (   7.61  )
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

Add new splitted uart pins and emmc_51.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 89b8f3dd67a1..d5ab5e08badc 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -87,6 +87,8 @@ patternProperties:
           "wifi_led"        "led"       1, 2
           "i2c"             "i2c"       3, 4
           "uart1_0"         "uart"      7, 8, 9, 10
+          "uart1_rx_tx"     "uart"      42, 43
+          "uart1_cts_rts"   "uart"      44, 45
           "pcie_clk"        "pcie"      9
           "pcie_wake"       "pcie"      10
           "spi1_0"          "spi"       11, 12, 13, 14
@@ -98,9 +100,11 @@ patternProperties:
           "emmc_45"         "emmc"      22, 23, 24, 25, 26, 27, 28, 29, 30,
                                         31, 32
           "spi1_1"          "spi"       23, 24, 25, 26
-          "uart1_2"         "uart"      29, 30, 31, 32
+          "uart1_2_rx_tx"   "uart"      29, 30
+          "uart1_2_cts_rts" "uart"      31, 32
           "uart1_1"         "uart"      23, 24, 25, 26
-          "uart2_0"         "uart"      29, 30, 31, 32
+          "uart2_0_rx_tx"   "uart"      29, 30
+          "uart2_0_cts_rts" "uart"      31, 32
           "spi0"            "spi"       33, 34, 35, 36
           "spi0_wp_hold"    "spi"       37, 38
           "uart1_3_rx_tx"   "uart"      35, 36
@@ -157,7 +161,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [emmc, emmc_rst]
+                  enum: [emmc, emmc_rst, emmc_51]
           - if:
               properties:
                 function:
@@ -221,8 +225,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
-                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
+                  enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1, uart1_2_rx_tx, uart1_2_cts_rts,
+                         uart1_3_rx_tx, uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts, uart2_1, uart0,
+                         uart1, uart2]
           - if:
               properties:
                 function:
-- 
2.34.1


