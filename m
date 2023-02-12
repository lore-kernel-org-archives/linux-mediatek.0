Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E127CC636D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XA8l1UNyv+RC0xjr49Zj35slp6HWpLIolNcfko1OuWM=; b=B3/XYQ+p+3oQwkO2UU4Yia3/Wz
	ixKk93g60ijLze+zOXV9XxlZfR0assEWvnOVcdE/zrmZEfD/zopfDZrllu0zeEx68D/A+nw9TE5Mq
	6XhVtTXfhnGuqZ/wq7+iciSoavxJAAd+G8bsXOhaKJaX9MbW4EM2VvTWfu1qDe6JBnptQM65Dc6m3
	Tt+ZcW52oghf1C2uRYmoyWK7v+y5WkR1k9+Dg/yLGomOMUam1ey0G7XtaNbzTt8SauQt3+FI5NHBY
	FJg/peq3GZfFIur4uEIzyd3isNAo9LliUQ4t8O+hpzkZoOxqjDzRbNwjgJQ2SZBbZ8B5XV2APE53d
	YrYijXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRCAr-00BVVI-Uk; Sun, 12 Feb 2023 13:13:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRCAe-00BVTH-RL; Sun, 12 Feb 2023 13:13:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id hx15so25904548ejc.11;
        Sun, 12 Feb 2023 05:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XA8l1UNyv+RC0xjr49Zj35slp6HWpLIolNcfko1OuWM=;
        b=paikrkY2n7o92kwyNvsr8KemY9Cr7a4ASfa41yKpvLy6Il/K3Eq7MiuLjoM0LVnsfU
         EwR2vCpQT6esW9Au5BrEt8+lYNQ5mQ/TJ5Zraz1dnfQsgyMeYkPg/MaHkLZN2SAEBawY
         6K9pNot+nLI27j1BshO1zYcoEINAoqEtlMNtoLKMGdzNecqpSHAUOz529i1zDDDjqiZn
         Pinj9ujSlMaT0zmd2IZs8IWHZlh7I5E70nIwygKU2V+ucFnqP++2KLMjxdnTOgA5qmxo
         6l+O2Uza0miWwBTFpAGoBx+F30kU+atcIES0NbX19SBSER1oRVvXfXuJ4xitTfcrxfTH
         Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XA8l1UNyv+RC0xjr49Zj35slp6HWpLIolNcfko1OuWM=;
        b=mN2sc7kKPX0MWeMxKxyLYyPubg3vkHR/9DfN92VqQOiWUjAHZ5+14JbNOHvYWYmMJO
         6a7ylnMlz+MdodQjYHJNQOIqM6tue+Dylcyd9OLpjVBVe4jJxnbl8fz4mq2i209F/8i2
         hgwzhUC0c07DhMlnxwOPmUFs7p87pA0lK2sHThhoJ4PQoacsNcUZwDIc3pfYE5vYFYgy
         jGbnguxs1Ihu8D33hx+wpRZFqfnTWuArQD2VaWjtAd9WTVD0MDnXpkByEFE5pHHrA5bt
         IsZI2SAwF3PL/n6VnW2ENWDQkuFZtg/ukSXcmucuaSCXjrXp+SOZyilW+LtC0gLjIoNK
         JsZA==
X-Gm-Message-State: AO0yUKVGx6YH7IqBx55dNBQECztGzM+3NrEgA5AMuIf1RaQUwpJIa1Lk
	imie3bOrScjsS8VbZZhfNPM0HdaRBep2aRDACNQ=
X-Google-Smtp-Source: AK7set9A8ddWDXir4M7hpFzx+8WBWCaIhqs/npzdiCbwJqwSlCWj1tejYJyI1eiuNBMtPBW859lv6w==
X-Received: by 2002:a17:907:720b:b0:8b0:26b6:3f2b with SMTP id dr11-20020a170907720b00b008b026b63f2bmr6375987ejc.53.1676207605166;
        Sun, 12 Feb 2023 05:13:25 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906580a00b0086f4b8f9e42sm5257880ejq.65.2023.02.12.05.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 05:13:24 -0800 (PST)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: improve binding description
Date: Sun, 12 Feb 2023 16:12:58 +0300
Message-Id: <20230212131258.47551-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_051332_953983_FD9E8BEE 
X-CRM114-Status: GOOD (  17.50  )
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

Fix inaccurate information about PHY muxing, and merge standalone and
multi-chip module MT7530 configuration methods.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 52 ++++++++-----------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 08667bff74a5..449ee0735012 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -24,56 +24,46 @@ description: |
 
   There is only the standalone version of MT7531.
 
-  Port 5 on MT7530 has got various ways of configuration.
-
-  For standalone MT7530:
+  Port 5 on MT7530 has got various ways of configuration:
 
     - Port 5 can be used as a CPU port.
 
-    - PHY 0 or 4 of the switch can be muxed to connect to the gmac of the SoC
-      which port 5 is wired to. Usually used for connecting the wan port
-      directly to the CPU to achieve 2 Gbps routing in total.
+    - PHY 0 or 4 of the switch can be muxed to gmac5 of the switch. Therefore,
+      the gmac of the SoC which is wired to port 5 can connect to the PHY.
+      This is usually used for connecting the wan port directly to the CPU to
+      achieve 2 Gbps routing in total.
 
-      The driver looks up the reg on the ethernet-phy node which the phy-handle
-      property refers to on the gmac node to mux the specified phy.
+      The driver looks up the reg on the ethernet-phy node, which the phy-handle
+      property on the gmac node refers to, to mux the specified phy.
 
       The driver requires the gmac of the SoC to have "mediatek,eth-mac" as the
-      compatible string and the reg must be 1. So, for now, only gmac1 of an
+      compatible string and the reg must be 1. So, for now, only gmac1 of a
       MediaTek SoC can benefit this. Banana Pi BPI-R2 suits this.
-      Check out example 5 for a similar configuration.
-
-    - Port 5 can be wired to an external phy. Port 5 becomes a DSA slave.
-      Check out example 7 for a similar configuration.
-
-  For multi-chip module MT7530:
-
-    - Port 5 can be used as a CPU port.
-
-    - PHY 0 or 4 of the switch can be muxed to connect to gmac1 of the SoC.
-      Usually used for connecting the wan port directly to the CPU to achieve 2
-      Gbps routing in total.
-
-      The driver looks up the reg on the ethernet-phy node which the phy-handle
-      property refers to on the gmac node to mux the specified phy.
 
       For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
+
       Check out example 5.
 
-    - In case of an external phy wired to gmac1 of the SoC, port 5 must not be
-      enabled.
+    - For the multi-chip module MT7530, in case of an external phy wired to
+      gmac1 of the SoC, port 5 must not be enabled.
 
       In case of muxing PHY 0 or 4, the external phy must not be enabled.
 
       For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
+
       Check out example 6.
 
-    - Port 5 can be muxed to an external phy. Port 5 becomes a DSA slave.
-      The external phy must be wired TX to TX to gmac1 of the SoC for this to
-      work. Ubiquiti EdgeRouter X SFP is wired this way.
+    - Port 5 can be wired to an external phy. Port 5 becomes a DSA slave.
+
+      For the multi-chip module MT7530, the external phy must be wired TX to TX
+      to gmac1 of the SoC for this to work. Ubiquiti EdgeRouter X SFP is wired
+      this way.
 
-      Muxing PHY 0 or 4 won't work when the external phy is connected TX to TX.
+      For the multi-chip module MT7530, muxing PHY 0 or 4 won't work when the
+      external phy is connected TX to TX.
 
       For the MT7621 SoCs, rgmii2 group must be claimed with gpio function.
+
       Check out example 7.
 
 properties:
@@ -601,7 +591,7 @@ examples:
                         label = "lan4";
                     };
 
-                    /* Commented out, phy4 is muxed to gmac1.
+                    /* Commented out, phy4 is connected to gmac1.
                     port@4 {
                         reg = <4>;
                         label = "wan";
-- 
2.37.2


