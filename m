Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4982AC28B25
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Mar 2025 00:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qPD5zeaLyTv7Qy4hdBTQxNRUyG0FnO7mcXkBMLrnQgo=; b=Ki7Oi2fwaSVVEPTe2bOy3KVx2g
	vgBgd9vPQBCdOjDPCunUKoC3P7LkAS2oHd36m+H3fvOFkvTUFGRmZCfd7LZql+C1fSnyRP5T4/LVF
	WLGXXvMlqnxOrO9ELeBlhtVQigmC2tLd5WbBaH3e9beIl8Y7na0bjXkfh9tLVAf/z2IYgHcVq9ds+
	cpBUorLGZ/RKS3ptC/MtJYX/LEmU4SnuMMJ8LjiHEVlnZtjWfD3cyHkZ8X8Rs9bMP5gcENEnloXub
	boDXktTRt8+OKAHqnoN6kiAYxOaNOYY8tmw/UWLQzGblD0EaI2uUXde9ZvyFVaun9bsjQP06Nf8OK
	JFnoNMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4bX-0000000HMlk-3RTo;
	Sun, 09 Mar 2025 00:33:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4bU-0000000HMl1-3f7a;
	Sun, 09 Mar 2025 00:33:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf257158fso422745e9.2;
        Sat, 08 Mar 2025 16:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741480394; x=1742085194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPD5zeaLyTv7Qy4hdBTQxNRUyG0FnO7mcXkBMLrnQgo=;
        b=btm9VqW5pR7VG/ybkhVY6ZNA5VS7US9B3v3MCe4tZbxV52VQzLYwTu4hsz/6T71V3f
         38MkwbME7ePXOHAlycGYOFxHGZ35mpduPSyHGGwn5BxA9alfGwbrxoF+iZfxIHSo/brQ
         kRFXx5E6Lb1melqgWiC/n8wgdkCxj1JZzDe4wqt+wLwfYFl+IPsXb6c3f3CN6iIH/SGP
         0/WkGafdjKmXNzVfjDVnMkapGR4NvCOwzQh0pbAxxJN+akRTrJ1jGda2vl5/h0HcakhZ
         a6d3WNVURofPaTZ/gC9fYWtZahjwDiiIluEI6u7KLgoJYkUA6x8IiHzzc4v7dsdgdRyi
         wlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741480394; x=1742085194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPD5zeaLyTv7Qy4hdBTQxNRUyG0FnO7mcXkBMLrnQgo=;
        b=uzUDVxLY4NUZq2INzyIzKgv87E0hV4/BxJuA2l28iyk1a7mWDNaLEaVzSgvkh4fR0X
         EaC2ciqrVAQ+3/0wedbDhwQdthVs4Of9nuZhd4EtMQaDuQTpb4gEzL9kQwthrvISgrGs
         HW73irBuTnGMQ1B2/9mjzCjGSmzM48QAZ1YS1A9DzEFj+Xq6dRxvTH3MZI6v1ujWj9Ku
         /ezlGkRnkjlkIf0nxT2tCBm7qROtQsevzC3tQlos6+ed96Vp5gLS3hsEcPUYoZQ6laSJ
         YuxsWJAuUY0cVMQQvj5gdmAeSjVfFBlu9kz3ZxPs2lmMr1jeV+SshOXOO34NCie8YBrX
         AY3g==
X-Forwarded-Encrypted: i=1; AJvYcCV/Z11ufo8LsCz5ep+H0DqsAUre8cvhHwDVc43Gf0+zKfIoEyfV7Q5yM1U3CMzkO4j40uCTaEXOS+t3RqNnTh0=@lists.infradead.org, AJvYcCW360lsxM7n1JIw28ndOsOzKxdbghiKmNXlzP8ZyITdwxP1babDl0nPW2WYyjNrNiPUMYeEtTTpy0h1iM6H@lists.infradead.org, AJvYcCWjyltNsh3ApTNw+e5JXToxe3T0tGA2ibUNyYH0LVLy7Itu0zhdvVWCKuRvS/yWVhxoUQF/8jlpEGCJtDgtums=@lists.infradead.org
X-Gm-Message-State: AOJu0YxU9vrbNcpRH2UcRaFhiS7h4c2tIQxOZTKfAhSE9K2k1SrrG2Rh
	2BFrsELgYEw9D8IKVyjVYE0N+SO9fepAGW/Mh/vkPyVtM3G93/m9
X-Gm-Gg: ASbGnctK9bbWi37RhxLF5UVZHlVIonvlfwZcJjwe6Q9aE7DlXqNVF6CRSceo9kUEMoL
	LjfvCA5a0X7PXH9ryHpoqeICsj7RR8evaLx+ITtk5ZHDnIJZpwBdVTKdQAt7ALepj2zxwvBRH6T
	7DXQc7osMoCJvNv+4VUqGCmCRIvyAcdGHR4mSB4UA2L6PvHyIdQq0G649kr2Qk7qfQJVctV12gi
	sLixNcm0Gr3OgscNg3q+CpH7Xr0zAJrosHxstQwpEXU0bK2ohvpefW6H5/BtOki/G58MlJR2rhV
	4d/KWoO6bDIqRVfeEzIzQifvFfgUNh56uXET/qa4shBJ+CQkzfeKkw8yTqn/0tq5HSjmwZNK1w=
	=
X-Google-Smtp-Source: AGHT+IH28MQPA+zgYnEC4J5mfzAYw/utosENTHqe/I9TDxz+92mmLwx5LY/MLbLi26Rzp9G7AsQlAA==
X-Received: by 2002:a5d:584f:0:b0:391:ffc:2413 with SMTP id ffacd0b85a97d-39132da08b4mr5384923f8f.40.1741480393495;
        Sat, 08 Mar 2025 16:33:13 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1031fdsm9976382f8f.89.2025.03.08.16.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 16:33:11 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Linux Team <linux-imx@nxp.com>,
	David Wu <david.wu@rock-chips.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next] dt-bindings: net: Define interrupt constraints for DWMAC vendor bindings
Date: Sun,  9 Mar 2025 00:33:01 +0000
Message-ID: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_163316_945889_0AB27183 
X-CRM114-Status: GOOD (  13.32  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
`interrupts` and `interrupt-names` properties, but vendor bindings
selecting `snps,dwmac.yaml` do not impose these limits.

Define constraints for `interrupts` and `interrupt-names` properties in
various DWMAC vendor bindings to ensure proper validation and consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,

Based on recent patch [0] which increases the interrupts to 11
and adds `additionalItems: true` its good to have constraints
to validate the schema. Ive made the changes based on the DT
binding doc and the users. Ive ran dt binding checks to ensure
the constraints are valid. Please let me know if you'd like me
to split this patch or if any of the constraints are incorrect,
as I don't have documentation for all of these platforms.

https://lore.kernel.org/all/20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers, Prabhakar
---
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  6 ++++++
 .../devicetree/bindings/net/intel,dwmac-plat.yaml      |  6 ++++++
 .../devicetree/bindings/net/mediatek-dwmac.yaml        |  6 ++++++
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml         |  8 ++++++++
 .../devicetree/bindings/net/rockchip-dwmac.yaml        | 10 ++++++++++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 10 ++++++++++
 .../bindings/net/toshiba,visconti-dwmac.yaml           |  6 ++++++
 7 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 798a4c19f18c..0cd78d71768c 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -152,6 +152,12 @@ properties:
           The second range is is for the Amlogic specific configuration
           (for example the PRG_ETHERNET register range on Meson8b and newer)
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 42a0bc94312c..62c1da36a2b5 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -41,6 +41,12 @@ properties:
       - const: ptp_ref
       - const: tx_clk
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index ed9d845f6008..3aab21b8e8de 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -64,6 +64,12 @@ properties:
       - const: rmii_internal
       - const: mac_cg
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index 87bc4416eadf..e5db346beca9 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -56,6 +56,14 @@ properties:
         - tx
         - mem
 
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   intf_mode:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..891396140a7f 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -58,6 +58,16 @@ properties:
               - rockchip,rv1126-gmac
           - const: snps,dwmac-4.20a
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   clocks:
     minItems: 5
     maxItems: 8
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 85cea9966a27..987254900d0d 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -54,6 +54,16 @@ properties:
     items:
       - const: stmmaceth
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   clocks:
     minItems: 3
     items:
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index 052f636158b3..f0f32e18fc85 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -42,6 +42,12 @@ properties:
       - const: stmmaceth
       - const: phy_ref_clk
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - reg
-- 
2.43.0


