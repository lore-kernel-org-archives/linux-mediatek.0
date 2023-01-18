Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C02EC678D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtwVyM3K+4xfqOEqd0qS9jQUn3un4dIlOZ3IaOVmOyo=; b=3z5T7xCYvPnglUqCkNw4h0rrO9
	k9VxBXHwU8FfJBaXKH79M1BDWLbDZSX3V4lWOH2IS624HaCuI4Ua6AT+GBRx1GnW6wUrCLbs+BcCl
	tCf1UpFmIHXihkPQKajUyqLg8vZQbefQaFhLrEcjSA2Vda9vkmWF1CcfTUS9EEEYRDeZxQbMhzI+p
	MRsPovJ1SmVJq0mvm5zXyhkew9ES14atD5Obkyx66bbckQYd10n/GWERovD2cknvYOn0RCHJ73Oyp
	W1bWMAH0NaoD28Ddcy8EgcHOIH0jE0URt8exUgF3S8dSjpreiVjPYW6XF9ZnF6s2wsIcC+PE6AT0b
	En2ZoQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICPr-00251g-Ej; Wed, 18 Jan 2023 17:40:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICPg-0024wZ-P3
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 17:40:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id b7so8726624wrt.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtwVyM3K+4xfqOEqd0qS9jQUn3un4dIlOZ3IaOVmOyo=;
        b=uG1LoW51EyTrR5K0su1WK7HgiV36VrKRpjf9MMIxBKxArggNiL2gx3cbAclzZEnGrX
         173HD3BB4/BQRq2R/W1sT/l09f8WqPXdK9ZPSgaKxMRXJt+aOo4q9JY/ZqcxAv0tb9XJ
         3TFUWt70aAnHCUa6YQWTveEKwbt/QJjGE5UYjs2tS0LyI0aNugkdYz3HNb7zquj5Ndkz
         mtkMvQ18inXyuY2JCFt8qMVlOhEEzXZtKX0RscXIU/CXARgdk1SfAd2RxyqZZf0Bcm3l
         qSz5PmQX71Tk4es9dGaQQe+EN2Th4RsmYJ0Ch2xaYIKqc+U24Fu5lJ1HvVj+ZL8rf0YJ
         NTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtwVyM3K+4xfqOEqd0qS9jQUn3un4dIlOZ3IaOVmOyo=;
        b=iXOxEa37vHegfOuqGOP+PP5UBCA8CNfBwV0Ivte1F2oK8UuMtUet+C5JgCh+kc2Vp9
         xXhkNgm+MGtuETPks1PAA9m2o4S+Zc2LqvxNBeZ8tKgQem74DccjuoHs+9uhaU2bP2r+
         sRsiHY+12iZrfDz6HMXNPRV7ptUHST7fDNJnbAfq5Xc/VHcL+SkV1S6AdmrPOmDOhwLf
         uZ+7xz7JY+fdxxszqE5y3wp3PR1pFIq5Dxn8wazwpY9bnBJQ/jECP7ZE51ZAxxer99eg
         WAFDNrZDVQD3klKfw+f+8l8LQz/Q8rtI44HvD6CoA61QlZHZyhB7C4RpL8R0KVndv32N
         fZdw==
X-Gm-Message-State: AFqh2koi5ab6IfONg4wcFVGdBiXjYBAVPYQlsq1HMb27S4h9zpazwOPW
	CM2w9Nlbh1ISTYViHk2ddMiQFQ==
X-Google-Smtp-Source: AMrXdXssGP6UUIlZOO/mf0W4Agmrlx2dZmmc5gPJRGSrJysLLW8tVlfCePh1WGEBQI7iccNrD8TtpQ==
X-Received: by 2002:a05:6000:110e:b0:2bd:db2a:ec8 with SMTP id z14-20020a056000110e00b002bddb2a0ec8mr2666620wrw.28.1674063591544;
        Wed, 18 Jan 2023 09:39:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u24-20020adfa198000000b002bc84c55758sm28730074wru.63.2023.01.18.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 09:39:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Han Xu <han.xu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	Gabor Juhos <juhosg@openwrt.org>,
	Bert Vermeulen <bert@biot.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Birger Koblitz <mail@birger-koblitz.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Anson Huang <Anson.Huang@nxp.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Erwan Leray <erwan.leray@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation, lowercase hex
Date: Wed, 18 Jan 2023 18:39:32 +0100
Message-Id: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_093953_009805_039356C2 
X-CRM114-Status: GOOD (  13.62  )
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

Cleanup examples:
 - use 4-space indentation (for cases when it is neither 4 not 2 space),
 - drop redundant blank lines,
 - use lowercase hex.

No functional impact except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
 .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
 .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
 .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
 .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
 .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
 .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
 .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
 .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
 10 files changed, 150 insertions(+), 152 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index e5eca3a6f132..4e28e6e9d8e0 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -100,17 +100,17 @@ unevaluatedProperties: false
 examples:
   - |
     spi@c1108d80 {
-          compatible = "amlogic,meson-gx-spicc";
-          reg = <0xc1108d80 0x80>;
-          interrupts = <112>;
-          clocks = <&clk81>;
-          clock-names = "core";
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          display@0 {
-              compatible = "lg,lg4573";
-              spi-max-frequency = <1000000>;
-              reg = <0>;
-          };
+        compatible = "amlogic,meson-gx-spicc";
+        reg = <0xc1108d80 0x80>;
+        interrupts = <112>;
+        clocks = <&clk81>;
+        clock-names = "core";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "lg,lg4573";
+            spi-max-frequency = <1000000>;
+            reg = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
index 806043fed4d1..8e769ccda97f 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
@@ -40,15 +40,15 @@ unevaluatedProperties: false
 examples:
   - |
     spi@c1108c80 {
-          compatible = "amlogic,meson6-spifc";
-          reg = <0xc1108c80 0x80>;
-          clocks = <&clk81>;
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          flash: flash@0 {
-              compatible = "spansion,m25p80", "jedec,spi-nor";
-              reg = <0>;
-              spi-max-frequency = <40000000>;
-          };
+        compatible = "amlogic,meson6-spifc";
+        reg = <0xc1108c80 0x80>;
+        clocks = <&clk81>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash: flash@0 {
+            compatible = "spansion,m25p80", "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <40000000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index aae6fb139b5b..57d932af4506 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -60,23 +60,23 @@ examples:
         interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 
         flash@0 {
-                reg = < 0 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 0 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
 
         flash@1 {
-                reg = < 1 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 1 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
 
         flash@2 {
-                reg = < 2 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 2 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
index ec5873919170..28222aae3077 100644
--- a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
@@ -99,98 +99,98 @@ required:
 examples:
   - | # BRCMSTB SoC: SPI Master (MSPI+BSPI) for SPI-NOR access
     spi@f03e3400 {
-            compatible = "brcm,spi-brcmstb-qspi", "brcm,spi-bcm-qspi";
-            reg = <0xf03e3400 0x188>, <0xf03e3200 0x50>, <0xf03e0920 0x4>;
-            reg-names = "mspi", "bspi", "cs_reg";
-            interrupts = <0x5>, <0x6>, <0x1>, <0x2>, <0x3>, <0x4>, <0x0>;
-            interrupt-parent = <&gic>;
-            interrupt-names = "mspi_done",
-                              "mspi_halted",
-                              "spi_lr_fullness_reached",
-                              "spi_lr_session_aborted",
-                              "spi_lr_impatient",
-                              "spi_lr_session_done",
-                              "spi_lr_overread";
-            clocks = <&hif_spi>;
-            #address-cells = <0x1>;
-            #size-cells = <0x0>;
-
-            flash@0 {
-                    #size-cells = <0x2>;
-                    #address-cells = <0x2>;
-                    compatible = "m25p80";
-                    reg = <0x0>;
-                    spi-max-frequency = <0x2625a00>;
-                    spi-cpol;
-                    spi-cpha;
-            };
+        compatible = "brcm,spi-brcmstb-qspi", "brcm,spi-bcm-qspi";
+        reg = <0xf03e3400 0x188>, <0xf03e3200 0x50>, <0xf03e0920 0x4>;
+        reg-names = "mspi", "bspi", "cs_reg";
+        interrupts = <0x5>, <0x6>, <0x1>, <0x2>, <0x3>, <0x4>, <0x0>;
+        interrupt-parent = <&gic>;
+        interrupt-names = "mspi_done",
+                          "mspi_halted",
+                          "spi_lr_fullness_reached",
+                          "spi_lr_session_aborted",
+                          "spi_lr_impatient",
+                          "spi_lr_session_done",
+                          "spi_lr_overread";
+        clocks = <&hif_spi>;
+        #address-cells = <0x1>;
+        #size-cells = <0x0>;
+
+        flash@0 {
+            #size-cells = <0x2>;
+            #address-cells = <0x2>;
+            compatible = "m25p80";
+            reg = <0x0>;
+            spi-max-frequency = <0x2625a00>;
+            spi-cpol;
+            spi-cpha;
+        };
     };
   - | # BRCMSTB SoC: MSPI master for any SPI device
     spi@f0416000 {
-            clocks = <&upg_fixed>;
-            compatible = "brcm,spi-brcmstb-mspi", "brcm,spi-bcm-qspi";
-            reg = <0xf0416000 0x180>;
-            reg-names = "mspi";
-            interrupts = <0x14>;
-            interrupt-parent = <&irq0_aon_intc>;
-            interrupt-names = "mspi_done";
-            #address-cells = <1>;
-            #size-cells = <0>;
+        clocks = <&upg_fixed>;
+        compatible = "brcm,spi-brcmstb-mspi", "brcm,spi-bcm-qspi";
+        reg = <0xf0416000 0x180>;
+        reg-names = "mspi";
+        interrupts = <0x14>;
+        interrupt-parent = <&irq0_aon_intc>;
+        interrupt-names = "mspi_done";
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
   - | # iProc SoC
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     spi@18027200 {
-            compatible = "brcm,spi-nsp-qspi", "brcm,spi-bcm-qspi";
-            reg = <0x18027200 0x184>,
-                  <0x18027000 0x124>,
-                  <0x1811c408 0x004>,
-                  <0x180273a0 0x01c>;
-            reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
-            interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "mspi_done",
-                              "mspi_halted",
-                              "spi_lr_fullness_reached",
-                              "spi_lr_session_aborted",
-                              "spi_lr_impatient",
-                              "spi_lr_session_done";
-            clocks = <&iprocmed>;
-            num-cs = <2>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "brcm,spi-nsp-qspi", "brcm,spi-bcm-qspi";
+        reg = <0x18027200 0x184>,
+              <0x18027000 0x124>,
+              <0x1811c408 0x004>,
+              <0x180273a0 0x01c>;
+        reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
+        interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mspi_done",
+                          "mspi_halted",
+                          "spi_lr_fullness_reached",
+                          "spi_lr_session_aborted",
+                          "spi_lr_impatient",
+                          "spi_lr_session_done";
+        clocks = <&iprocmed>;
+        num-cs = <2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
   - | # NS2 SoC
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     spi@66470200 {
-            compatible = "brcm,spi-ns2-qspi", "brcm,spi-bcm-qspi";
-            reg = <0x66470200 0x184>,
-                  <0x66470000 0x124>,
-                  <0x67017408 0x004>,
-                  <0x664703a0 0x01c>;
-            reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
-            interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "spi_l1_intr";
-            clocks = <&iprocmed>;
-            num-cs = <2>;
+        compatible = "brcm,spi-ns2-qspi", "brcm,spi-bcm-qspi";
+        reg = <0x66470200 0x184>,
+              <0x66470000 0x124>,
+              <0x67017408 0x004>,
+              <0x664703a0 0x01c>;
+        reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
+        interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "spi_l1_intr";
+        clocks = <&iprocmed>;
+        num-cs = <2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
             #address-cells = <1>;
-            #size-cells = <0>;
-
-            flash@0 {
-                    #address-cells = <1>;
-                    #size-cells = <1>;
-                    compatible = "m25p80";
-                    reg = <0x0>;
-                    spi-max-frequency = <12500000>;
-                    spi-cpol;
-                    spi-cpha;
-            };
+            #size-cells = <1>;
+            compatible = "m25p80";
+            reg = <0x0>;
+            spi-max-frequency = <12500000>;
+            spi-cpol;
+            spi-cpha;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 9be4e2c5d1ee..7606b5a252b6 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -117,7 +117,7 @@ examples:
       reset-names = "qspi", "qspi-ocp";
 
       flash@0 {
-              compatible = "jedec,spi-nor";
-              reg = <0x0>;
+        compatible = "jedec,spi-nor";
+        reg = <0x0>;
       };
     };
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 9f78b2c06494..9ae1611175f2 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -74,25 +74,25 @@ examples:
     #include <dt-bindings/reset/tegra210-car.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     spi@70410000 {
-            compatible = "nvidia,tegra210-qspi";
-            reg = <0x70410000 0x1000>;
-            interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-            clocks = <&tegra_car TEGRA210_CLK_QSPI>,
-                     <&tegra_car TEGRA210_CLK_QSPI_PM>;
-            clock-names = "qspi", "qspi_out";
-            resets = <&tegra_car 211>;
-            dmas = <&apbdma 5>, <&apbdma 5>;
-            dma-names = "rx", "tx";
-
-            flash@0 {
-                    compatible = "jedec,spi-nor";
-                    reg = <0>;
-                    spi-max-frequency = <104000000>;
-                    spi-tx-bus-width = <2>;
-                    spi-rx-bus-width = <2>;
-                    nvidia,tx-clk-tap-delay = <0>;
-                    nvidia,rx-clk-tap-delay = <0>;
-            };
+        compatible = "nvidia,tegra210-qspi";
+        reg = <0x70410000 0x1000>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&tegra_car TEGRA210_CLK_QSPI>,
+                 <&tegra_car TEGRA210_CLK_QSPI_PM>;
+        clock-names = "qspi", "qspi_out";
+        resets = <&tegra_car 211>;
+        dmas = <&apbdma 5>, <&apbdma 5>;
+        dma-names = "rx", "tx";
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <104000000>;
+            spi-tx-bus-width = <2>;
+            spi-rx-bus-width = <2>;
+            nvidia,tx-clk-tap-delay = <0>;
+            nvidia,rx-clk-tap-delay = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 85e7770703bd..e94d915e28c8 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -87,7 +87,6 @@ examples:
                 spi-tx-bus-width = <2>;
                 spi-rx-bus-width = <2>;
             };
-
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
index f45d3b75d6de..4d8ec69214c9 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
@@ -141,15 +141,15 @@ examples:
     #include <dt-bindings/power/r8a7791-sysc.h>
 
     qspi: spi@e6b10000 {
-            compatible = "renesas,qspi-r8a7791", "renesas,qspi";
-            reg = <0xe6b10000 0x2c>;
-            interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 917>;
-            dmas = <&dmac0 0x17>, <&dmac0 0x18>, <&dmac1 0x17>, <&dmac1 0x18>;
-            dma-names = "tx", "rx", "tx", "rx";
-            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-            resets = <&cpg 917>;
-            num-cs = <1>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "renesas,qspi-r8a7791", "renesas,qspi";
+        reg = <0xe6b10000 0x2c>;
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 917>;
+        dmas = <&dmac0 0x17>, <&dmac0 0x18>, <&dmac1 0x17>, <&dmac1 0x18>;
+        dma-names = "tx", "rx", "tx", "rx";
+        power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+        resets = <&cpg 917>;
+        num-cs = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml b/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
index 69a463305274..edb5ba71af3a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
@@ -59,9 +59,9 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-    spi@9C002D80 {
+    spi@9c002d80 {
         compatible = "sunplus,sp7021-spi";
-        reg = <0x9C002D80 0x80>, <0x9C002E00 0x80>;
+        reg = <0x9c002d80 0x80>, <0x9c002e00 0x80>;
         reg-names = "master", "slave";
         interrupt-parent = <&intc>;
         interrupt-names = "dma_w",
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index d35c6f7e2dd5..18afdaab946d 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -95,7 +95,6 @@ examples:
              <&dmamux1 1 40 0x400 0x05>;
       dma-names = "rx", "tx";
       cs-gpios = <&gpioa 11 0>;
-
     };
 
 ...
-- 
2.34.1


