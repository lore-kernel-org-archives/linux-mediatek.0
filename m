Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnhrhiJ3cSR7TRf4rHyw+jmPqJUWGZO3FAiJyQ9JLvI=; b=Re/uDXEZDbaJoU
	sLcOPsVVo2JNvt/NN/DXxH60FKmFxeLrnmnOoqhUTyufGy3I/fVH/V8czq0xHVuKTO7HqkbeelaSF
	iEUZQh7yPJWUmJa8j3pg5KcYKGWA9ECzEt3k5kW/Y82BKRkFf6fQKDV7rhK5PF9mITypja5oMob3l
	4Knx5fZjtqKl1zpnQf6+GtuRaQQ4FVCxb05G01Ubn9bp0x+ZmFyviYjN8AsXOxwmw+S4nYC2ZNydm
	mQHOCALLLIHfpl9qD0xabeHUSZcHt4HnX11oq8QAyefFPBJWs62rHEfwYn+YOTAOSe1/oBvwzMcdj
	5PE+5eAfTcq6uDJGSiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEBC-00AjAf-Lb; Wed, 04 May 2022 12:32:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEB8-00Aj7T-9D; Wed, 04 May 2022 12:32:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id i27so2570316ejd.9;
 Wed, 04 May 2022 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tQb6i3JLN4afiayNb9b2ZXTM0vOnQttR7jIOROP3G/Y=;
 b=aHsdTT0i4b+/rqquEcasEwbRp4vMI3Q/epZoFwj34h2xL8rLbYyhjwsHaeXj2w6q6b
 LfiN265tlqSl+XbGmfUaltU98rUUgb1SSvHf5jrzEuFnsz0IDoRdbiurn2lyfMb22uCm
 F+I+MLHKaNmCUmGNqKPlb4hlNpB4IZjX0pldxi9H9kIbs4A/1PIgvdt/YwAkMo3IBS8z
 BMxALBRT/zIndRVeMc7UgmtzeK/8nRuIyMcK74pXOk2BNu2T5E58qsymc12ENMAKmQj9
 DwthCm2/9M/0ZAap2kNe9PU037opvy9r0Gaxv65kmtaZRmrQI3pMmVMovMIQuEjlw7tH
 e3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQb6i3JLN4afiayNb9b2ZXTM0vOnQttR7jIOROP3G/Y=;
 b=Mig04CO2ctEFCA0frRH25l3DSbXqLUpA7tc6LZdCBKSprxVuxefp5UygfL4Ogcsrvu
 Em3Srj40zLseikNxgX4V+wjoAbXLzgY/KUl9vyodSAsJQgj7Mn1CLKfax7i1poVTFujs
 GLNMesP/Adk9YYzUwltA14+neOhOb+AZK1FbapW1UFvoJss4HpNrgH5gQIKkUDPrjow5
 s4nDGV/dTwBCS8kw+l0/+yIx4XMN28wq6iM2DwF5Dd3T1TIOiEsNxPTX7M2ZT4Jr3JvR
 sZTXswI/SCHDP9pDx032hl+mXsSXpK7IS1m3FCEmlHlqDyea8Ju60zcs8O0m7svjZ+R7
 uiHA==
X-Gm-Message-State: AOAM533a2jKTSi/wi8J2Jq57VFyIpnYb+lGX9REAcHCELyae9RPTZS5s
 W4V6y8GQAXe9MxODa9YXVGM=
X-Google-Smtp-Source: ABdhPJzNBv4cEDn9Jph+56mXidHah4kYetwQwPrK8Clz9ddS7VIxbIJcMRjEj4lpElEiNV5dFKT2NQ==
X-Received: by 2002:a17:907:3f16:b0:6f4:c54:2700 with SMTP id
 hq22-20020a1709073f1600b006f40c542700mr20296404ejc.615.1651667543019; 
 Wed, 04 May 2022 05:32:23 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:22 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/13] dt-bindings: arm: mediatek: Add MT6735 clock controller
 compatibles
Date: Wed,  4 May 2022 16:25:52 +0400
Message-Id: <20220504122601.335495-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053226_389176_043F9CA4 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add compatible strings for MT6735 apmixedsys, topckgen, infracfg
and pericfg.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/arm/mediatek/mediatek,infracfg.yaml          | 8 +++++---
 .../bindings/arm/mediatek/mediatek,pericfg.yaml           | 1 +
 .../devicetree/bindings/clock/mediatek,apmixedsys.yaml    | 4 +++-
 .../devicetree/bindings/clock/mediatek,topckgen.yaml      | 4 +++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
index 8681b785ed6d..aa1bb13e0d67 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -11,9 +11,10 @@ maintainers:
 
 description:
   The Mediatek infracfg controller provides various clocks and reset outputs
-  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>,
-  and reset values in <dt-bindings/reset/mt*-reset.h> and
-  <dt-bindings/reset/mt*-resets.h>.
+  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt6735-infracfg.h>, and reset values in
+  <dt-bindings/reset/mt*-reset.h>, <dt-bindings/reset/mt*-resets.h> and
+  <dt-bindings/reset/mediatek,mt6735-infracfg.h>.
 
 properties:
   compatible:
@@ -22,6 +23,7 @@ properties:
           - enum:
               - mediatek,mt2701-infracfg
               - mediatek,mt2712-infracfg
+              - mediatek,mt6735-infracfg
               - mediatek,mt6765-infracfg
               - mediatek,mt6779-infracfg_ao
               - mediatek,mt6797-infracfg
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 611f666f359d..94e5e003e60e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - mediatek,mt2701-pericfg
               - mediatek,mt2712-pericfg
+              - mediatek,mt6735-pericfg
               - mediatek,mt6765-pericfg
               - mediatek,mt7622-pericfg
               - mediatek,mt7629-pericfg
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 770546195fb5..3a186621e7a9 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek apmixedsys controller provides PLLs to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt6735-apmixedsys.h>.
 
 properties:
   compatible:
@@ -32,6 +33,7 @@ properties:
           - enum:
               - mediatek,mt2701-apmixedsys
               - mediatek,mt2712-apmixedsys
+              - mediatek,mt6735-apmixedsys
               - mediatek,mt6765-apmixedsys
               - mediatek,mt6779-apmixedsys
               - mediatek,mt7629-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index 5b8b37a2e594..920bf0828d58 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek topckgen controller provides various clocks to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h> and
+  <dt-bindings/clock/mediatek,mt6735-topckgen.h>.
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
           - enum:
               - mediatek,mt2701-topckgen
               - mediatek,mt2712-topckgen
+              - mediatek,mt6735-topckgen
               - mediatek,mt6765-topckgen
               - mediatek,mt6779-topckgen
               - mediatek,mt7629-topckgen
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
