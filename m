Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A715CDB46B
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=; b=HHwdTm0jw88MBIrW9Q7iu6ghYK
	Cg6ZMN+9yXaDGv9XRIu+O+KinYqmbrIFLSMa+JGigxDZILXtimnAfGGRZ3871wvUdN7Vx2mgaPPEm
	1diWNsz5hA6dRmKzkKvXMuhSrLFFMsDLHMdjIqsnEx3xCdDKO20M0kPmIpwO1oMKOuE9Qo6nMDH2X
	V+azjURqaN3I+fLg8T+MuMwtHirDN3Jip4SnLjzRVRaRDqbQ6S4jpEnlbJWaab+jESghp3q1hVLcz
	l5h0N5/6MUho47NDYFZAJB0wF81hPJCPhs8LiybLV9ao5KEHXCPOf4Wa84t7IXeJHPuSLLcf3siZq
	WYuD8hAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sG-00000003WcZ-0mZa;
	Sat, 20 Jun 2026 20:01:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sD-00000003WbJ-2Pq4
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Jun 2026 20:01:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b64c8311so29984505e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Jun 2026 13:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985660; x=1782590460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=;
        b=szGCewCUIqSSGDP0zHC+6FM+AZlSScsdkHQXzanze+P8LRPe6ciOcn/LMBmH4q8n/J
         JB2QyV/Ez+J9WopiT1QO4jwCOFzHO9Uhj3ajjynZYspnjKmDs/g4SFuwwizRi4CWsy74
         bQ6sYaqGHdZe+zVDj0SSVonpJ8/93AQbrmNkrjyjqEnEZsKORwzhMrwr0vo5PBFkw/Fp
         Q4Xh+ALzD92xKCax+k2kjIoKElXnsGUQjpWnrZq5oq9lqPY/+R+UNsbXBvPabxP0GNYo
         K3fCwnbXXM5Cot1IgIL+O+r8dRTClZ6hpIGnXYLLGyf8l/4nLfL+ck9nkDWWLKW1yA2b
         OLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985660; x=1782590460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=;
        b=bPuNInXzupvmT+mx8CDW8jSUdnaxQ4hdFzJf7o0B/nlRqOGb0W/Lc64Re1Ux0YFKHw
         mJKlqNkCSZE1OUcm6t9rmMZ3CX/xd/vcT3+0X50RJv3QiBo71l9NbL3VJa4EUZMYITyy
         tP5WUdpnfwZ4V0iuEu8fAVPsC8gFb/dBCTpjpoqPPyyx4NETpN1twVO05j3wFTYh02O5
         BhbA1oPlFVmt0mYL/g7VSfLymvUOA94BZ1wDr3B4N4xW2r+CD/jHMxwfMZYuZSZRjl4G
         h9QtAeiQ5c2D4oDcc32tRmbUKOOCJyJ3l1yvKsQNfTO7RpP2S7l4vuBi/b1jXwlmdmZ/
         rd3g==
X-Gm-Message-State: AOJu0Yx6IFfYqd6eaJASs9XaEzq75N/V9mtENC0Ttm77z21yqHBVumAW
	ZG15A9a/7T/y9W6Fou6CFvsmlz/KFQw+zj3TypZDZ8zyNsE9iGe2Rg5gIlthJe2X
X-Gm-Gg: AfdE7cnIV0yiR2P4BM5efB1tsQn6lnID4AcXQBhujTRlD5hOudtJ+TvljFWp1sYPS3r
	aiwR0MekNxNnu/UfNKa/6v3dsYrLLnpmTif7Vgo4qzJLmRu/xHgOlC09J01GuG/FI9NOkK9evr9
	ASnebrNUaEzNHsXT6BMivFeIHwxfrWQiIOI1KWb8gapqSgpbPMjzD4oEPsmt4p6VPAQ6ICr149c
	2tFgNhSUeNasdB1cC/rJpwuw5VD+rX/3NVG7BU3PAgi0T2YiXyiyuV8obqjfrI5uJRcTjeAC23K
	8WMy4TM++qy9Lve2TDbXjFUP3DiQ7teAl57UIsBWV3XH/O70LXLbu0DUe8jw6K/gGTa6YkfCyfO
	kDgi8Qv860uWvNPmZSzksKsnAoufgfGT+hHnGks66UquHRRywXr8QPEi3GYAg8E2WGeC4QQNzze
	kD5CY8vg==
X-Received: by 2002:a05:600c:3112:b0:492:450c:57cf with SMTP id 5b1f17b1804b1-492450c5d26mr106314955e9.31.1781985659503;
        Sat, 20 Jun 2026 13:00:59 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:00:58 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:47 +0200
Message-ID: <20260620200032.334192-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130101_645430_A9AF0391 
X-CRM114-Status: UNSURE (   9.82  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..927df823d640 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,68 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


