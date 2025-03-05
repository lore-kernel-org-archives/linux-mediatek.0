Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3BAC282E5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ifTTgVVfybFoZOevqIOOe2/3W1y7d9X2viVLdQReHQ=; b=ZNX+ZsnFv3cnv2i/yj94mODyS/
	9vqorcs/6Sj1wNVWazRFSfASRXGTUNkLKLCj3ow0VQtHxpKOOZnPgMWIqjtz7Z6D3JR6BIkUbkZlE
	81/RQM6C4hNt4R6URMLWKx8ZYtlppRG6XSG1/u9dJNEvsxC1d+SP+AkRKrXxGfDUw1W9Dhzh9+78M
	qnRq3B/8V6aUSCEDSB6CRq6VMvb9nK/rBhk/CoustC6EwFBWPGVicvkM0c0hvEaY3FVeNx4rHCZt1
	vRpzg/matcFBPKDD6gxwXDmtDHVIS1QJovwx7B9GK0w+Q9IB3Y0KTOEC+R+SHxNgpfOGyeFF/5GWT
	mYIU3Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuy3-000000099yc-1VgP;
	Wed, 05 Mar 2025 20:03:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptxn-00000008zrV-23xG;
	Wed, 05 Mar 2025 18:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201166;
	bh=acUZEVmdOu80f/7L3NgXf/R3B0sCOGH3PeEgX6a2U2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Abo9Xoco5BZ6WU42i2n8OHs+MacWHLzr5cWpH/Vj8lV7FobM5DrotgY3UG/QBPmhL
	 pinANvay6rnmht2LOK3N+1p+D1/XHDbTUIJX8x/UVNWB6xZ2epK7GLkhBDn/4pKE1v
	 yxTOWcCwjsUWKvnGJkRv6q2HiUtIY2gnVEfkkP7zhP4iFBVPKYoLhflODNnghG2CbZ
	 nRqBW5z2eQvI3owf1W/sW9C9rQwM1QA1yrdZipgiC4t9cwUcUPLbSePr15liY7s59+
	 bUnz/L6hIntMre5JBbD2oF5HOE1Dm5iyoq6nZdZ0SsSTCsTQLZD7DSzraHEfpFzg+E
	 D0tXnQe8ECUrw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AE5617E05E7;
	Wed,  5 Mar 2025 19:59:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:16 -0300
Subject: [PATCH v4 01/19] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-1-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105927_709010_4C7F1C49 
X-CRM114-Status: GOOD (  11.96  )
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

Describe the accessory detection (accdet) module as a possible subnode
of the MT6359 PMIC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..51012b8bbfaef3df7bdb619a4f8d828d6f9cc15a 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -24,6 +24,7 @@ description: |
   - LED
   - Keys
   - Power controller
+  - Accessory Detection
 
   It is interfaced to host controller using SPI interface by a proprietary hardware
   called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
@@ -224,6 +225,30 @@ properties:
     description:
       Pin controller
 
+  accdet:
+    type: object
+    additionalProperties: false
+    description:
+      The Accessory Detection module found on the PMIC allows detecting audio
+      jack insertion and removal, as well as identifying the type of events
+      connected to the jack.
+
+    properties:
+      compatible:
+        const: mediatek,mt6359-accdet
+
+      mediatek,hp-eint-high:
+        type: boolean
+        description:
+          By default, MT6359's HP_EINT pin is assumed to be pulled high and
+          connected to a normally open 3.5mm jack. Plug insertion is detected
+          when the pin is brought low in that case. Add this property if the
+          behavior should be inverted, for example if a normally closed 3.5mm
+          jack is used, or if the line is pulled low on open.
+
+    required:
+      - compatible
+
 required:
   - compatible
   - regulators
@@ -598,3 +623,29 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6359";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        accdet {
+            compatible = "mediatek,mt6359-accdet";
+            mediatek,hp-eint-high;
+        };
+
+        regulators {
+            compatible = "mediatek,mt6359-regulator";
+
+            buck_vs1 {
+                    regulator-name = "vs1";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <2200000>;
+                    regulator-enable-ramp-delay = <0>;
+                    regulator-always-on;
+            };
+        };
+    };

-- 
2.48.1


