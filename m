Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE562C3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pk9BYAlXOny5vx7IIMl1r8Ckvn8t89LgHQENG37+b/I=; b=M/IjyyGvbDoRvAm2MAgP6Za5On
	OGDLtOjUaTHxrAxbXu6bkeXNYz5x/4HOKo6ORBYOsAAhP6ubsEzk1Hq0k+HyEVHOovqukWfqG1H+V
	gIeJf3t43CjfFGaM9c/98dNBJFg7Vp3JpZ5i0XmMUIGVLZ7BX75NhVU53FX/R9l3hiVrFpR9fBMSi
	xQMg1euaVvTeZV6nnZ55rFXxYD7j4QEqwXKrc5o6Th6LYE6EUg5SOYZ2P1lWgw+yl0qYU8Pu49X2/
	3vIN2n/aYfsmHuDMJQrz6u/V8q1dwKhAdgxcV617T1cMfIcebdq/oi1WZslYQy/kgt+b6zyeqVV0T
	JkG4f0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRZf-009uTU-1L;
	Mon, 15 Jan 2024 18:20:39 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRZc-009uRd-1h
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jan 2024 18:20:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55818b733f7so7953381a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jan 2024 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342834; x=1705947634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk9BYAlXOny5vx7IIMl1r8Ckvn8t89LgHQENG37+b/I=;
        b=ZBK22a6S8ZIzEa8B9XiPT831gBVjfIfxZht7UaVpFfh0R7cdKryMsQgqN4Qpd/MrlL
         JRvA6hePWXL3hu4O8H8fwgW6k9SCvdTb0TM0D5pX25S6FEMUaKg/BPZ4pfHdxbzc3TTS
         87kpAbVkqP1lMNewwiuLk7lzcWODF7Jj/iBIqy0vJGqgBi4tameuC2Vz782uSM3oyVRJ
         KuPEfw7JFs6qddCBSe29R95dsA4qYsit0fU432XMLpy//uvz8XFOMdeJ7Zbi6f0GUENY
         tQsH1lrnMdTmz5SZscKMNfDi2xT6F5i7lFvsXrM9pW9UBkUABm19XV/TlN73955lxQEV
         sgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342834; x=1705947634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk9BYAlXOny5vx7IIMl1r8Ckvn8t89LgHQENG37+b/I=;
        b=f9YvFJgEyXIJ9ufn3yGjnS+c+4F2Cg0m2EACzWLAwqs50YncgdTl1ijWvGFX9KUBUO
         tmgddCtyCwV+Ayp04sxghoxYvwUHwPri/p92oPQ9iG0qWWHVJ4yhKBVXNITeSdoKVyTh
         KCigqtcoaQ8JlYuUaZfcp2iMqBp7553yCIg2CItBMZ5HRfuKLUf8dpYUS8lGCdMa5v4k
         0eemvCuRqFShvyoWrJYieLaB0VV3zgperGqo8pA4QEf9/hgz1anXbLQHE6G1WhSQhm2E
         mPjXaFRvlXI3OqLLoBd8oyYEnPETFTrieuiFiapneSfeSwmiWsKkEpAj2KBXo2tw4AvH
         MM8A==
X-Gm-Message-State: AOJu0YytjwDFOnKdX2oPNwiZfwFdXJIFZGILKxlxGFerQqPpMEE8+KGs
	tURD/xT70+1MT0EAef79sm1QCK4/ghwIjA==
X-Google-Smtp-Source: AGHT+IE8Rv7TALy6QHOmV7wneFYPZJqN4DYMVXyzwYotmqd3ln8eAYgtdWF5rpaj14WiTEjiCunTIQ==
X-Received: by 2002:a17:907:c24d:b0:a2e:49a4:fabe with SMTP id tj13-20020a170907c24d00b00a2e49a4fabemr138108ejc.16.1705342834090;
        Mon, 15 Jan 2024 10:20:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906118b00b00a2bd02d5f7asm5591970eja.148.2024.01.15.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:20:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: do not override firmware-name $ref
Date: Mon, 15 Jan 2024 19:20:31 +0100
Message-Id: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_102036_565108_7D7B8C0A 
X-CRM114-Status: GOOD (  11.34  )
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

dtschema package defines firmware-name as string-array, so individual
bindings should not make it a string but instead just narrow the number
of expected firmware file names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
 .../devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml      | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml        | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 09102dda4942..507f98f73d23 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -47,7 +47,7 @@ properties:
     maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       If present, name (or relative path) of the file within the
       firmware search path containing the firmware image used when
@@ -115,7 +115,7 @@ patternProperties:
         maxItems: 1
 
       firmware-name:
-        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
         description:
           If present, name (or relative path) of the file within the
           firmware search path containing the firmware image used when
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index eb868a7ff4cd..ad45fd00ae34 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -46,7 +46,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index c054b84fdcd5..66b455d0a8e3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -45,7 +45,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index b6bd33438584..9381c7022ff4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -80,7 +80,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       The name of the firmware which should be loaded for this remote
       processor.
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
index 4744a37b2b5d..45ee9fbe0966 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
@@ -42,7 +42,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 028287235912..758adb06c8dd 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -47,7 +47,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index f7e40fb166da..c1a3cc308bdb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -42,7 +42,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 3e4a03eb4532..7286b2baa19f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -36,7 +36,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
   smd-edge: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 238c6e5e67c5..d67386c50fa4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -46,7 +46,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 53cea8e53a31..4b9fb74fb9e9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -47,7 +47,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 45eb42bd3c2c..8e033b22d28c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -51,7 +51,7 @@ properties:
       - const: stop-ack
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       Relative firmware image path for the WCNSS core. Defaults to
       "wcnss.mdt".
-- 
2.34.1


