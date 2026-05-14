Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48036CD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=; b=1ySEcNxuoI5+i2ywhpOhFmtcsN
	rtQIRN0yRlzOlozPAdQZRuTWwlVTj5XvYtU7WgE0hwz/Ey0Rx1b/1ylYKX2725wmrXY5v6xjwpd6v
	vMZcRAgVMIWEorwZWnvXowIuFDn1u4tkt/ZYUHfIAI8moaVr/u/1vbMg1Si0CO1QVqegmNuY5Zcqp
	BKEigMnNBtTdeDW4kjabu70pvG+HbziwiMb4f9fAXW4CHU+nq7DEgNVlNvRi/OUyDAfDM8VHm9oE4
	Qz+d5K0Qj3vHGXs1bAJyYAmGQBMQzeVZiDTe1uPKTu0eutphnkdHft+Bl8fkalO7uc+VyWR03qfie
	DxMefGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAa-000000051o7-0uWV;
	Thu, 14 May 2026 09:15:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAT-000000051iD-1Ur7
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 09:15:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3680540a6efso3311578a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750144; x=1779354944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=OD6vzB/UvDjEl6okVaWxOLIW8FG9dE33F9JK2hSLFlY9fCJfOsWo3SX+eGAm/ZH7vu
         FDHHrbaJ242b3l+04k5l4dWLrhyZVXSjGS5c4ru2OSUUxS3qNiUPHb94e9xczvE8O+Ha
         eZX4paMprKN4Ds0PwPjz+4KyObdT5flcJjSXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750144; x=1779354944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=BSmI/BMVfTfDh1riBwfTxLLrL9bogutnCd8pelUa9touCxPstpogNjzKiGwExJU3a6
         2yS8V69Oek+r+IKUsB76ZivvERq3NQbz2WIprEDwnXfa37YdLGL0R75xOj4x777Noxpt
         KEdqwWE8rPVJGNsRJvmzRpZVLzgfJvcQqci72f9jOQd9mgMs+XC0nO5morKJxKQmn8HD
         Tvj6Xn0LhJY74c4YNnQ9gm+KBYOJUeSgWugy6gZeqKy4kgKR+dFR7/DbmCosjr3YxfNY
         xRF0C5W6kWwagrLMq2jGWuHRwQgkKA/4BuO3w3RFbElTCoNR1jm6B2e5LpPIvK02zTFT
         GNYA==
X-Forwarded-Encrypted: i=1; AFNElJ9iMQI6XOAZDCHcKk2r6dEgHOxfREBrGbT5wxfpC07mVywiNy+KTrzAe2SMfZv46/M8fa/Ce/lGMqyfFXUoOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCGG2vrbklLXXPdLFudBUZU3R7B9luGFhmlT8DgKQN4On/wDB
	utQG2GQgO4CYgRYXVIvVvgHnPlGy7cX205aGn1ny5SnqnFvi3Kvyba4ZWq4mwCQ1WQ==
X-Gm-Gg: Acq92OGRLqWapAfSGQJA18pMYWDrVVOe+ZiDpsZEHkWvk3Qn44d7dOq1QLTdmp1OQsC
	sUIOkuRtsF7k37chFde2QFfPbs+Zp5qpNe46xMCEYN+qFcsOmBymYI8o6Co+i6rz+0pTW0esQcI
	xfsszvuOh8YQXlIWHtcFuIKtPvmykmggWezEQRYmpOt/odloKLoOKCPjrdn7qJtOCzkTNN3sgJt
	honZZkPaSDMi906zXNWHHjjkP0N+5GxtMnS0wWerncoRB8a2H3h2uJUT+pq+VFBjuu810yr1VD5
	vueHWL9Qkcmn2wnwLxEXfvvmqHuz+h/MxGeWERI7QIGHJE2gVk2xSynvOw7MzhSLxuVplLlNCMQ
	JwD0fHpnIUx40bQCZEvLo6Qeyj68fjg0G6MIiKqUFvYqem0gP+eH5F7q38eITxuuDF0vUs2Sing
	rB0msBMO92iMVjcUZJOKy8npn36vHnBYZo8WKWbHE7jBCbkriseAaE7vnd5HsNIXjNqueSqBjTj
	3ptOIaeuOJvZy+orlM=
X-Received: by 2002:a05:6a20:6a26:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-3afaea365e8mr7445174637.8.1778750144405;
        Thu, 14 May 2026 02:15:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Thu, 14 May 2026 17:15:16 +0800
Message-ID: <20260514091520.2718987-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021545_396483_7D5A5E46 
X-CRM114-Status: GOOD (  11.65  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v3:
- Added ending match to regex for deprecated vcn33_[12]_(bt|wifi) (Sashiko)
- Updated example to use proper vcn33_[12] nodes (Sashiko)
---
 .../bindings/regulator/mt6359-regulator.yaml  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..e3c20412c8a7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
@@ -203,13 +212,8 @@ examples:
           regulator-min-microvolt = <900000>;
           regulator-max-microvolt = <1300000>;
         };
-        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-          regulator-name = "vcn33_1_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-          regulator-name = "vcn33_1_wifi";
+        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1 {
+          regulator-name = "vcn33_1";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
@@ -270,13 +274,8 @@ examples:
           regulator-min-microvolt = <2500000>;
           regulator-max-microvolt = <3300000>;
         };
-        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-          regulator-name = "vcn33_2_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-          regulator-name = "vcn33_2_wifi";
+        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2 {
+          regulator-name = "vcn33_2";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
-- 
2.54.0.563.g4f69b47b94-goog


