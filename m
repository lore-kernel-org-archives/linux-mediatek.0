Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A96606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQdhR7Dz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=If1utSv5nMW5RhBOH/0E3OMG/t4TgZpT3KdrpJ5BcZw=; b=OQdhR7DzY7QTrUf2rWd9ddsKar
	Xh3gOx/WlGg67w8rHjw2dGBga7e0lFuFCbT+ymnuv5D0H/QiU+gXq8cs/+BG7MtfqC0k5YNnNLHsG
	Jm3TWqzmob6k57OUC8ukD36Pvzni+uFJieiQcubMBnvuguDiLrIfHcebJ0RJM/lnfVpEH2gpi0KW0
	dZZR9GonvSGCD/JIp7jyWVcO1vNheb1/kxbxNxMUtereOfNav4LafKY+du9CBnr7nsqtWCq8uQ5QM
	ps+t/ePf/c/Xn3M+ky8YK31ygw53AaXJ80FHlWMcu8+/wXJNtkjXzgdC9pQK4NsaCZ+5pOWxe0Ead
	tT8/7aTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnRO-00000006Bik-2Xk0;
	Tue, 24 Nov 2026 10:07:58 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnRL-00000006BiS-0cqO
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 10:07:57 +0000
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnRH-007eZH-2u;
	Tue, 24 Nov 2026 11:07:51 +0100
From: John Crispin <john@phrozen.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] dt-bindings: pinctrl: airoha: limit the conf pins to the largest pin group
Date: Tue, 24 Nov 2026 11:07:46 +0100
Message-Id: <20261124100746.3887616-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_020755_205337_0B69A720 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A conf node holds the pins of one peripheral. The bindings allow as
many pins as the SoC has, so a node can name pins that do not belong
to its peripheral.

Use the size of the largest pin group of each SoC as the limit: the 17
pins of pnand on the AN7563, AN7583 and EN7581, and the 8 pins of
pcm_spi on the EN7523.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
Follow up to the review of the AN7589 binding [1], as offered in [2].
The numbers are counted from the pin group tables of the drivers.

[1] https://lore.kernel.org/r/20261116-resolved-riot-c6a310bb2d8c@spud
[2] https://lore.kernel.org/r/e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org

 .../devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
index 6d186ebe4a41..77294c1e55f4 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -258,7 +258,7 @@ patternProperties:
                      pcie_reset0, pcie_reset1, i2c_scl, i2c_sda, spi_clk,
                      spi_cs, spi_mosi, spi_miso, uart_txd, uart_rxd]
             minItems: 1
-            maxItems: 38
+            maxItems: 17
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index aad2e9880ec6..9e161e1a1cfb 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -307,7 +307,7 @@ patternProperties:
                      i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart_txd,
                      uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
             minItems: 1
-            maxItems: 53
+            maxItems: 17
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
index 599f80e94432..b5f95b0b7191 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -286,7 +286,7 @@ patternProperties:
                      gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
                      gpio27, pcie_reset0, pcie_reset1]
             minItems: 1
-            maxItems: 38
+            maxItems: 8
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0cf1826c691f..453f41e862ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -308,7 +308,7 @@ patternProperties:
                      gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
                      pcie_reset0, pcie_reset1, pcie_reset2]
             minItems: 1
-            maxItems: 58
+            maxItems: 17
 
           bias-disable: true
 

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.34.1


