Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjbaJMNtigvo37K2rWTiU3XYSzFFi/ZJQDYEY7kAj8I=; b=gZEo0xSxJot6s6
	yi3axa/KQIfZPsGOXVV0zTbdVWr4v2YnljAgzfcLTyjqI2OBqRc/8f/kfpqxobb1RnmdILwgHBIZU
	R7V9OtzEnDQipQIkUoNsGMHzUW+OKXyToWkWM8PzXJS3+Z8vNn5acHY/VxbhV2QPZqMyQCCR9lkKL
	kkG0sk987M3ucCa/Tj+AvYRp9yIzYodpXahCbQeXVpBk4ocDJb2W8LOkQH/KGWOTXey/NTxHha0ci
	RHRA1VTrBnjkNPWFKH2KHahu+CnACT6rMA64sXPkU2nPz8OU4juEL3jP0VUL2Ymg4ZD7kmGXX7DJp
	wj/53SEmOkFxtzoRaGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhpv-007nWA-2Y; Thu, 19 May 2022 15:13:11 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrh4w-007OMI-9u; Thu, 19 May 2022 14:24:39 +0000
Received: by mail-qt1-x82a.google.com with SMTP id s22so4940350qta.0;
 Thu, 19 May 2022 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v13RFBMs++l4Uo/HJueyt8iKmNbI7+Etkp5S+ELIDJg=;
 b=DtvsPXCb2jRPYUq1EwPsx+PLx1MKG+CkFmWqDHiaFSbWu5xu3Rg9xdPZG6WWctZr9c
 m0k3eTABFHjj3fjmEUAxk21Ahh2ssebdFYfqPuy2VNN3PRHMa9mLAq7Vhw96uh4aceX8
 uqa68JDMUPfiW1+JX12AblHLcmHmaumHxWuGbsk13TNrb0fpv7IZtsdZj4dpoE9x2hBL
 r3zOGZ96JYesog4W7C+AwU1J+EgpTeA4PA5H04rNmYLJY9GsNWByUq6kpNLH2eMB/K7p
 UJx0aAQo4sJtwD+3uweQdNlnZ7OvtHJ7R+MKWwelQzEOamf0GUEJ/bix6gsmNFneWM1o
 IJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v13RFBMs++l4Uo/HJueyt8iKmNbI7+Etkp5S+ELIDJg=;
 b=TEXAXTtPbpLwZoPtTD8jjpsUgIQwsThA+Vx5RW/+ojqB6poGllwxPvQXUtDLrc+/Lq
 mZjPWC8LEND3Mh4yse3ylNmSCVQaL/rIOuyjYc1X/19GL9rIDeWRHbbYIwRMLth+TPj+
 grgUSooS/SHqtQe5qTjgaVyB5nZ29U9YO2appQGUoIRMCTn6AdPhiBcfQOk2k3O/sb45
 osLvUYejuhwof9raETzO/n4OmQKDFfVQWHe32GA6amFtSYhqnpI/UBNimjairCWBlp5w
 j/7m7UtXh5SJDqtBJdP2yro94PAyQZZ0e5eFo8kqQ3A7OoZSzmtMG4cHj+rQnRYTKPRc
 oGgA==
X-Gm-Message-State: AOAM530+tn7Pb4PwZ0b/Cv95+yTXK6ictQil7mUDMjTIBR7vSy1qEOJO
 d0u3U4WVIpV+RvSJhFRFX7I=
X-Google-Smtp-Source: ABdhPJzRX0EPJPrfCEYKugxC43dOQ60RDegHvoA4xxRpq0pX8amtUO0QHqU7wXtZgU15AoeRq8CHhA==
X-Received: by 2002:a05:622a:1906:b0:2f3:bbbc:f7b9 with SMTP id
 w6-20020a05622a190600b002f3bbbcf7b9mr4004178qtc.632.1652970274100; 
 Thu, 19 May 2022 07:24:34 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac85a8f000000b002f39b99f697sm1539342qtc.49.2022.05.19.07.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:24:33 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/4] dt-bindings: arm: mediatek: Add MT6735 clock
 controller compatibles
Date: Thu, 19 May 2022 18:22:10 +0400
Message-Id: <20220519142211.458336-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519142211.458336-1-y.oudjana@protonmail.com>
References: <20220519142211.458336-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_072438_411748_180CA309 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
