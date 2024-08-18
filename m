Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60E2C52D7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsSwfgyCCKZm1ElLU08MN03l085AljcXAGLvPNx9VVs=; b=psADYGKzSx43WDH+WpAQ2I53GG
	8xYKSXBzIOItfIf3KZiG5qUbiF6rLlMBdSvrytChwTHjAb0rPhNdTa6MeIh5N0+6vaEJMUQnkWLDw
	gOXTX+AfA8JdtxDejRc0jRyW+NNM0elRKYVfCL0A9lKWTmUR2IgwAwBtKZpzy8oqYpwELB28Vqtze
	lCY6a04X9KTtmRmn8qusVkSsZHsjnlI5ZYgbEEEpSccJ4jIPjznWFwiXTT7fde+Va5PeMzXyQBJUb
	o2y3BL0KF3ycjppqrBm+acdoNq9sM0YAPsa7SnMSMzgHwxaMDl4XxS3pEQJdRMrzJDS3LWvakU6yT
	+vRuZG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjnn-0000000GuWU-1Qep;
	Sun, 18 Aug 2024 17:34:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjiO-0000000Gsj9-05iW
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 17:29:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3717de33d58so2237650f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002154; x=1724606954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsSwfgyCCKZm1ElLU08MN03l085AljcXAGLvPNx9VVs=;
        b=QBk1TYezoTBV1RNWp3slRAeMQoiZeEdu0B6Qgnjh847m0leUtnDCUhs19q2eJw8P5f
         51XjmVM+cYXXqCubpFvx2oVQry9uADGhVlIBoRG2FmUOlQISiZDQmQIAv8d7l9eN6b9K
         yliCb/qiNDPSrz/Wl5kQYjtSbtxYvCTiLcb81StAOcpC8v0csuSy+5/X5llh+uFmbIZ/
         qwdtCXq1BCluCADz4Tmln0v8snHoBrgwV4M1JQdxX5AzjT4NU5eoPvvGeiJpTPAVMCdg
         AbDoBfeLuRrtglLsmwFu5zQTRTP6SqcnilewE2lRenwspf+wE6ZN/wkJNy7uDljUwopJ
         16Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002154; x=1724606954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsSwfgyCCKZm1ElLU08MN03l085AljcXAGLvPNx9VVs=;
        b=q9HAektSQ2pQn8Zlg0LfbtHLK6L7FmBphkovq4lDqOulQrhneZ0cC/ZsUMmRyRJOzb
         rcehswCXG9R7KmxkBIIs+uypFlGf6qJxxXB3zpfGWP8ATnxqbWK8sptX5WSCyiR0MYgA
         +x2YG7Pb8mI0IkKP1b/r1KN3WureTf8VBq1ZIEGKrPhGg+TFIjXnvA3Swv+HQ9dxL7sv
         uSLWeHXtOR7ngvBhCd61UEDIU5mp4fiuyqGDexkwIicknHwn1+GLrKAfiTIJDLX1oeSQ
         8wdIruCs1apdIdMTMtqwIRdMgTITAuYzDMzX8c0lZZ7YuVgVGrvj0jjaZY+bxx3aTQGb
         OMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflomMdcuOC7opo7HmNGZH5I4X7hZh3VY+ULEviaiNTQ5lS6tYk2Xb/Regcew2hh8AFDsVkO/zh4NMQ7R/gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHbo1CDRdbz10sD3ffAkPVv+lvelhZ40JKTBtLkEKGSbqvMCeJ
	ne9Lamms3zLbrlkaQJTSyTnJCoWYhaERH3O+zAIzYexEN80L/PyvOwHXFbEq5tc=
X-Google-Smtp-Source: AGHT+IF5oqIaO/kGomtpTBUzPJ4hI/zfkkWQsLbeENpJUcPLayIcaNoTVT/LmiOBEGxfF3K0OFkCRg==
X-Received: by 2002:adf:9bd9:0:b0:368:4b61:7197 with SMTP id ffacd0b85a97d-37194453122mr4749751f8f.24.1724002154312;
        Sun, 18 Aug 2024 10:29:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 3/4] dt-bindings: net: renesas,etheravb: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:04 +0200
Message-ID: <20240818172905.121829-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_102916_075434_0F9E0813 
X-CRM114-Status: UNSURE (   8.87  )
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for reg, clocks, clock-names, interrupts and interrupt-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/renesas,etheravb.yaml        | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 21a92f179093..1e00ef5b3acd 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -62,15 +62,27 @@ properties:
               - renesas,r9a08g045-gbeth # RZ/G3S
           - const: renesas,rzg2l-gbeth  # RZ/{G2L,G2UL,V2L} family
 
-  reg: true
+  reg:
+    minItems: 1
+    items:
+      - description: MAC register block
+      - description: Stream buffer
 
-  interrupts: true
+  interrupts:
+    minItems: 1
+    maxItems: 29
 
-  interrupt-names: true
+  interrupt-names:
+    minItems: 1
+    maxItems: 29
 
-  clocks: true
+  clocks:
+    minItems: 1
+    maxItems: 3
 
-  clock-names: true
+  clock-names:
+    minItems: 1
+    maxItems: 3
 
   iommus:
     maxItems: 1
@@ -150,14 +162,11 @@ allOf:
     then:
       properties:
         reg:
-          items:
-            - description: MAC register block
-            - description: Stream buffer
+          minItems: 2
     else:
       properties:
         reg:
-          items:
-            - description: MAC register block
+          maxItems: 1
 
   - if:
       properties:
-- 
2.43.0


