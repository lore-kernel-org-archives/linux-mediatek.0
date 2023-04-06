Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EEC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCcdE7dUEXb8lwbE7KvuyXGuIt74Tuf6bSVVO3NCHnI=; b=ATGJt6/mJlfFVb+K/sbjBl/ZLz
	B6PI15PEZSmRjOu88+el4pZOgBF+BJOWCojGpINttXp9jSmC8FkYCcCIVdF81aMG4ark0txhMxeG/
	5/pMaY3VA5TC1Jdz92NM4mH5AszPOU3Q+fEjmVfWvrW7PavG2NOVOZC2Z+VkwAERkjH2lW1nYpvMs
	La5yNOYXxgMSXFAlhI0l5FeEQHOjbrPZ1KGi1mZcBGLG7x4EdrcOFR7WXAcwGj+ElhuBwfbzv81TR
	VTVO8Z6pM8xS6rzuI6rH4gGbGQJjV18KmE4DVjMYNqe7AIOCAwGoP+Ug5yql8aiaz9c76EXBTYk6C
	b6ZsHdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZb-006gdi-1x;
	Thu, 06 Apr 2023 08:02:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZW-006gaM-33;
	Thu, 06 Apr 2023 08:02:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so19759778wmq.3;
        Thu, 06 Apr 2023 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCcdE7dUEXb8lwbE7KvuyXGuIt74Tuf6bSVVO3NCHnI=;
        b=UrCyNSmLCpUhTtLbClX53/JZ14Vonr35xOfoaooPfPxC6OfEPYPGvjEHfkOA+OJ4Ro
         QjpW/sVm/Q8YC4uCHfg8yljsqJw+73p4zoG0ywI4JgYqanIYdzRc9IQc//NZ59pZ2GVd
         L5xPLrXXu9KO3Yxu5sPlMAYtX9NzPZKZXaNGEw+lq756gkwFjKk94xE4xVBRLMeVrM19
         KzguntSeG6P7x2VggjkcNbi2gLbDD2czRaKrPICtTNgf5XwWWA3roZPgse6qNvN66l3r
         uI9bOAnap95CvaNnKSfiYcVVUyndPoC+kGXBiARbHBU9VzqAPP6v2V9maP5tTSeg0v/5
         74jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCcdE7dUEXb8lwbE7KvuyXGuIt74Tuf6bSVVO3NCHnI=;
        b=ocvJAr4UGrV+EYhmkV8p7BkMwF2pXdo2wTrSQjf2WLYL0+zYvizE3Y2xX6zhx0/w5h
         Uo04ykFnpkDOOa0p/sG7tUKy5p3w949QwRCkT98MnCW7bGaR+J964kw/hhl10ONhIiI8
         OsODnZBpmZkeakH5FxuJjldSg5dIlu4gzw9ngReEyB1T/ld2SUjJtlNqUA6hJ+0f7xga
         87aen0nKzWM4Qh034Pmw8Q6Fjoc77AhLhyg6EgFNa9R214igOovea5f16QFlC/ckmScO
         wJ1LjA3M0UHeBoMuIFxFCAWvV9SrnCPn/3bhZqkjYJvY0Wfv7UJHFcBSog98yrNc17D0
         cxKg==
X-Gm-Message-State: AAQBX9d6CEn7mwbJGblNA+Hig3D90MdRl8BAzAOzyMh+ILLbn6CUPo9f
	/ZmI8SFiAldDaSqE8K+Lt44=
X-Google-Smtp-Source: AKy350asArPyeyaBI5v416dwhtFXcF3RCqZCSobCIiySV4LcN5vzjJwxz0eGo4Fa58lOsn2mzDPf1A==
X-Received: by 2002:a7b:c416:0:b0:3ee:6d55:8b73 with SMTP id k22-20020a7bc416000000b003ee6d558b73mr6893176wmi.29.1680768136558;
        Thu, 06 Apr 2023 01:02:16 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:15 -0700 (PDT)
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
Subject: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port bindings for MT7988
Date: Thu,  6 Apr 2023 11:01:37 +0300
Message-Id: <20230406080141.22924-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010218_983937_9652E0A2 
X-CRM114-Status: GOOD (  13.23  )
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
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 7045a98d9593..605888ce2bc6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -160,22 +160,6 @@ patternProperties:
       "^(ethernet-)?port@[0-9]+$":
         type: object
 
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
@@ -186,9 +170,21 @@ $defs:
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
@@ -212,9 +208,21 @@ $defs:
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
@@ -235,6 +243,27 @@ $defs:
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
@@ -285,7 +314,7 @@ allOf:
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


