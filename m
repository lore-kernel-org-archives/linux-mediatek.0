Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC913C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84FgM/FVnZP1rWfRH7Rix7KO0TYKL81ghGqMfAMNH9w=; b=rxydj3IInJcDHUF/tSqnOFFLDM
	1Ryr+fF62px9Tp95B8pLbu42Io1FGr1xgsoJNqp9AzczE9SgmnKMmnPjLZ9kqLBIj4EM2dY0v5TW4
	rZbHBiPNMmD3aPcgmsrvVlOHsaP95QCuSjszMaJ1m3IjSxtTQZsQHcWPWURn0xJMBmNBgfj47khVv
	g3epMPdNBDRp/2IgAJlSyPcYKB+e7T1JDvyFk8a/7vG94C8zC32UeiFvCKAdVF2IpK2thn3E0nLvv
	pvhrxZUAR2LMbIn6GG5UGEdNxs4f0R+NvyJOcU5DzWd0asQsN6JNQouJdLgcjOZAA7L4+CIcP5y09
	GzEHUyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU5d-00H641-Dc; Tue, 07 Mar 2023 09:58:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU3b-00H4yp-V7; Tue, 07 Mar 2023 09:56:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l25so11525038wrb.3;
        Tue, 07 Mar 2023 01:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678182988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84FgM/FVnZP1rWfRH7Rix7KO0TYKL81ghGqMfAMNH9w=;
        b=eFq2KyyTn/QGbH4BM+M5/FmPPuIzwcnCVqRLo0zYV0sSvg0+tGAXHazl9KWmkCiEk7
         WLxBQGPM1bsojnZFEfY05aoyYIowBdtL7gvKFGicwSButTOpEAtuuHkrMFeD+eD8Klan
         NdqhQg/D2dRkKMgFlznZJKJGQ5CoqGW4LT6C1ba5BWTb4BJIzK9UgtkM9SnCWanWSvFj
         rMaJv4lgSFarm8UCE75p7YU+VSaqMYX2LuauciLfGmDju/NpFRuYbs8kp+P7A0T8vRMV
         WfS7+i5w/B2y/xdSTIk5fueA0qAtWpB/CXyMNhx9agQR91DnsS0d2j7fqbU0wNX0zqn7
         Oo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84FgM/FVnZP1rWfRH7Rix7KO0TYKL81ghGqMfAMNH9w=;
        b=gWUdt5NLxDCnPSfohyspXLwgleyG3eAi3NxhSjcp/sD8dF3b4pf9TssUNGv4bT1m6P
         BUEGq0qWGQ7+HHs460o9PhknLUEB6bWwfbGBiCQcWaCeoWNikwNVkb+SKrX3a7EVY7yF
         uKY9SpnI6Fpw8swMWQgOeLZLRR5jagOpSygTDEiFtFZu/yridtwZe/BLpxZv69NfYt/B
         zBWxsu8H7AHobwwQHr6Qp+IzZcv9KgBY/ZEbIH2z6hi043mo6wejmvydxubeY+gI0/rR
         KV2lzVLSmW9wSUxdKhNEFwMEIrf+KyupVQ2ZtQ/mmSiTS0sjjl/40Zvc0CXRuj4ieqwu
         2F4w==
X-Gm-Message-State: AO0yUKUMsVuoMCvgfqUJhIYoff0ohHnBES1EGSzYkEuJ/2X3i7w0b1Zs
	DAkM/ch6VVQAzH5SDuzC6LI=
X-Google-Smtp-Source: AK7set+2oqnqS/Vy/l7T728/Cs+NBndVQPWOONRki7dYNYfEOCQKVhTw2lodMf9LsijyuBXftEBKqw==
X-Received: by 2002:adf:f58b:0:b0:2cc:4dac:fe3e with SMTP id f11-20020adff58b000000b002cc4dacfe3emr9457600wro.62.1678182987854;
        Tue, 07 Mar 2023 01:56:27 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm12257203wrm.23.2023.03.07.01.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 01:56:27 -0800 (PST)
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
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Rob Herring <robh@kernel.org>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: change some descriptions to literal
Date: Tue,  7 Mar 2023 12:56:19 +0300
Message-Id: <20230307095619.13403-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015632_057333_3175E634 
X-CRM114-Status: GOOD (  15.31  )
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

The line endings must be preserved on gpio-controller, io-supply, and
reset-gpios properties to look proper when the YAML file is parsed.

Currently it's interpreted as a single line when parsed. Change the style
of the description of these properties to literal style to preserve the
line endings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v2: git send-email doesn't like --from "Name <mail@mail>" but --from
mail@mail, got it. I also got to fix wrong submitter name for my gmail
address on patchwork, sorry for the noise.

Sending again now that net-next is open.

Arınç

---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 449ee0735012..5ae9cd8f99a2 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -93,7 +93,7 @@ properties:
 
   gpio-controller:
     type: boolean
-    description:
+    description: |
       If defined, LED controller of the MT7530 switch will run on GPIO mode.
 
       There are 15 controllable pins.
@@ -112,7 +112,7 @@ properties:
     maxItems: 1
 
   io-supply:
-    description:
+    description: |
       Phandle to the regulator node necessary for the I/O power.
       See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
       details for the regulator setup on these boards.
@@ -124,7 +124,7 @@ properties:
       switch is a part of the multi-chip module.
 
   reset-gpios:
-    description:
+    description: |
       GPIO to reset the switch. Use this if mediatek,mcm is not used.
       This property is optional because some boards share the reset line with
       other components which makes it impossible to probe the switch if the
-- 
2.37.2


