Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C5C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijOoimJYROvL2xKKNrDkLF9qZTzoSBmk/l6jvqUrH2Y=; b=SNo0Qr1gBdrvvwzw50cHgenjjz
	3hyG3eu4ckXnTfPIPwRDq1kicUN0as8n4cp8XKGAbHybNMw4Ue+cwT0sjq4uIIkWDezSDK/ZsWCgk
	F8AGkZo+vqZjYUg6V8Aon2Y1AlklTILS11CtWD6hLFfv++lQcZhJ5Gxp+VK9F7C8Y1z8XuHnubtVA
	TQaDh7nnSLfF9zmBKCtiM0gkRy9iWPUfGFR7+k1cHmyFmwOlMV787MyMCH/uNGwObMRlT8hrDW7Ec
	rNYpl7+e63lUFcnmEuA439TxCd1L78TPQ4btLzmhyWWgvlCocImJOvcS+4Sp5gJI7yxAMF0k0Q4mz
	Muviu3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklY6-00ACe2-0d;
	Fri, 07 Apr 2023 12:50:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXw-00ACVq-2K;
	Fri, 07 Apr 2023 12:50:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso4346268wmr.0;
        Fri, 07 Apr 2023 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijOoimJYROvL2xKKNrDkLF9qZTzoSBmk/l6jvqUrH2Y=;
        b=mLxuJVp1lpNT8/fb6Y0avFEOu/NNjP1458DTL5fFs+veWRX5KSMi5bhZs3Y79jXDtO
         fBu8U37MIlltZGTFWK4EmLjGHUeZMVNmDzMINeUwJZqH/QOoiCmuk53a3O3PUntrI6Sf
         QJ2FlJv7FKM5O3bRE1GWsevV6SoTMOslaXTZF+M5wrbbamUZOUunAKQ73L90uU+Q6kvq
         650/qXUO0Vtexr0NeB45xwHjD1qMXVywj35h+ShGAIUxG8ha+2NE1P1mig4GxsK6RkA8
         pSqxXs98cwBnF47+RVQD0fCSgU8N9VxgEoHRHY5HieFkrj3PUyIJr8pSBvx7gp/fww1X
         O+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijOoimJYROvL2xKKNrDkLF9qZTzoSBmk/l6jvqUrH2Y=;
        b=i3HskZUixqJcsXywXrVD9vfnD/MAEF0aDseAvYikUnrgJubQoZ1IcDP4aeWqkBIms9
         l1Ux7tXhRdrobZsUAuGd3/ZDD0tNyp7R3zG8RR33uiWDV9ilfS2NF/6HoEPCTRpnEV49
         oBBE6ULsZum/FbQtUBZWgjktjMQzedQQvleklhtHeSYyLYoRjhNHnMfviud6Q7Pf/9Iz
         eyigYMz+93jS+YSgP/zuLn4uiQaXlETmob72TuUtWZd//Rv4H5i6EbVY+5UHapZpnUTd
         90RP+uqyIWzyFgzWwdG0512J9ohYIOBGPZixtaQHZYYdQ/lAC79CvA7D4W93c9s3KBX8
         IZWw==
X-Gm-Message-State: AAQBX9fVSGDJSHt7YoZu9RBasLSnAkTq8NbbQ+mTdTgeUr3Exfp4fw0z
	zpAHQ3GWqombhf42Qo17j3o=
X-Google-Smtp-Source: AKy350Zk26UApNEGoDELJLQMWH/Qq3yPg/VheTn1EjnWyokM6oY6sX0P15HTgqQQ4ASurUEw52f7pw==
X-Received: by 2002:a05:600c:22cf:b0:3eb:3f2d:f237 with SMTP id 15-20020a05600c22cf00b003eb3f2df237mr1736688wmg.6.1680871823257;
        Fri, 07 Apr 2023 05:50:23 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:23 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port bindings for MT7988
Date: Fri,  7 Apr 2023 15:50:05 +0300
Message-Id: <20230407125008.42474-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055028_792174_4CAC8F6A 
X-CRM114-Status: GOOD (  13.45  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
to be used is internal. Add this.

Some bindings are incorrect for this switch now, so move them to more
specific places.

Address the incorrect information of which ports can be used as a user
port. Any port can be used as a user port.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 71 ++++++++++++-------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 7045a98d9593..922865a2aabf 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -152,30 +152,6 @@ properties:
       ethsys.
     maxItems: 1
 
-patternProperties:
-  "^(ethernet-)?ports$":
-    type: object
-
-    patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
-        type: object
-
-        properties:
-          reg:
-            description:
-              Port address described must be 5 or 6 for CPU port and from 0 to 5
-              for user ports.
-
-        allOf:
-          - if:
-              required: [ ethernet ]
-            then:
-              properties:
-                reg:
-                  enum:
-                    - 5
-                    - 6
-
 required:
   - compatible
   - reg
@@ -186,9 +162,21 @@ $defs:
       "^(ethernet-)?ports$":
         patternProperties:
           "^(ethernet-)?port@[0-9]+$":
+            properties:
+              reg:
+                description:
+                  Port address described must be 5 or 6 for the CPU port. User
+                  ports can be 0 to 6.
+
             if:
               required: [ ethernet ]
             then:
+              properties:
+                reg:
+                  enum:
+                    - 5
+                    - 6
+
               if:
                 properties:
                   reg:
@@ -212,9 +200,21 @@ $defs:
       "^(ethernet-)?ports$":
         patternProperties:
           "^(ethernet-)?port@[0-9]+$":
+            properties:
+              reg:
+                description:
+                  Port address described must be 5 or 6 for the CPU port. User
+                  ports can be 0 to 6.
+
             if:
               required: [ ethernet ]
             then:
+              properties:
+                reg:
+                  enum:
+                    - 5
+                    - 6
+
               if:
                 properties:
                   reg:
@@ -235,6 +235,27 @@ $defs:
                       - 2500base-x
                       - sgmii
 
+  mt7988-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9]+$":
+            properties:
+              reg:
+                description:
+                  Port address described must be 6 for the CPU port. User ports
+                  can be 0 to 3, and 6.
+
+            if:
+              required: [ ethernet ]
+            then:
+              properties:
+                reg:
+                  const: 6
+
+                phy-mode:
+                  const: internal
+
 allOf:
   - $ref: dsa.yaml#/$defs/ethernet-ports
   - if:
@@ -285,7 +306,7 @@ allOf:
         compatible:
           const: mediatek,mt7988-switch
     then:
-      $ref: "#/$defs/mt7530-dsa-port"
+      $ref: "#/$defs/mt7988-dsa-port"
       properties:
         gpio-controller: false
         mediatek,mcm: false
-- 
2.37.2


