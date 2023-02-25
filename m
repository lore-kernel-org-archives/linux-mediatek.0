Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DFC64EC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyT0nXBKIBFtnMODtiBRknbDY/YQ7mPKIuKNpiMYykM=; b=ZWMb4Ybg8R1leu5Ihy6BTbLLUw
	JGdiKFK97ZgXgoQl4/bvDHTeDQtWXkh5uaQcoEDbTxpLt1/c88yAedPEla02FyWcRviigUhPFt3mw
	C6qcb1x1FNpZMG1kPshjsZjcC4nFn+vPFtB3LN5MnbODe/pvfzJaiWs1jvrY556hBypEp6gp/eCdg
	gaUCDA924X7pAZNsV4e7xx012v2Gl/tknFAPXRCRJEnCVgAgg3JjmvnwI1nluiNSVCT5WubpHtmcv
	9SUH3OPyP2cc4kDbFHMGvAgl9Jdso/QpuCatXZ6NuXKvk81xb/bd7MO2ZmqLGoMMR5HAZSoBNszxN
	PjBzFnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr7J-005NpN-Pj; Sat, 25 Feb 2023 09:45:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr74-005Nh9-Qi; Sat, 25 Feb 2023 09:45:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id o12so6668955edb.9;
        Sat, 25 Feb 2023 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyT0nXBKIBFtnMODtiBRknbDY/YQ7mPKIuKNpiMYykM=;
        b=haBe2r+6cqqz7cdxGut21qhQ4ej8l7X6PedtFvQ6ihepcDoYL6cqUGEZE/scXhlmYf
         YdSHIbbDksPISFrqnZzMx0dBXA0ySgo3XZJUW4fix1p1n6/I66WCTBZhbd4Pnhhpr2Jy
         eXNwVdlQ3uFItI0+0B6/Q/RJVkHdy0deZHpGVw7LfMJbMp543E1NRNEAIdCLwzvpb7mv
         2a4Pb57en9Uxt/nKdxNXjWdbVphX78EkQGHCKEj8S2FtVCfOran8Kmn9PKUoVqntPFk7
         g3u5tY5+Y7dc2LsilMVXw+XGDaSBbJTyW62eOGQ4321J8nt3/wI+D4MsBnatPhMkgino
         IykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyT0nXBKIBFtnMODtiBRknbDY/YQ7mPKIuKNpiMYykM=;
        b=nwid6mP9G2h9dGdYsG5p3fCI8JP95Xa07E+zsnwEHTGo6Rn06gOdFwTTo0Mezlu9XF
         aaFOIflw5sgdp6gcd+XPrjDQHBck6yK0WQceyMmlRgVlokllvW1+0o6Lmn4BQqwWmWAE
         a91OQU4YKCPeoJR7UeSe8X8LXBymcI9d3YacTjJ2nuNLzbJKKpctSIyqi8f3EnfuXxyl
         vmFosknhAq/XBczOyCLOHPGhw6sXmTNkb1rsuugJFjTq+j+9NVKS0JUWautYqDw/i2TF
         EXE2D7RhF9cYmsVTsYis8JKhRUiKPdw3qdbCpzU2StRkKSKdqey/oY/QZ3M87x1DCfFA
         HDdA==
X-Gm-Message-State: AO0yUKWLuUZc0ADUBvaLWZ7KrzkOaLxkfzsq11GBSpGvYUHGm9+Qm9W+
	+lQDXk4tolseIVWHt8fs5iw=
X-Google-Smtp-Source: AK7set+yaEaPmbZ7PxDA3LgD/6UTZtURnBlrzxTTsl98vXPWKuLRNSj2D1mb+tf/KJffjHrQRkxnzQ==
X-Received: by 2002:a17:906:e10e:b0:8b1:7569:b51a with SMTP id gj14-20020a170906e10e00b008b17569b51amr31147105ejb.53.1677318304642;
        Sat, 25 Feb 2023 01:45:04 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id va13-20020a17090711cd00b008b23b22b062sm653649ejb.114.2023.02.25.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 01:45:04 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: arm: mediatek: Add MT6735 clock controller compatibles
Date: Sat, 25 Feb 2023 12:42:45 +0300
Message-Id: <20230225094246.261697-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225094246.261697-1-y.oudjana@protonmail.com>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_014506_952895_97B999AE 
X-CRM114-Status: GOOD (  12.53  )
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
index e997635e4fe4..715e24a4ddda 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -11,9 +11,10 @@ maintainers:
 
 description:
   The Mediatek infracfg controller provides various clocks and reset outputs
-  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>,
-  and reset values in <dt-bindings/reset/mt*-reset.h> and
-  <dt-bindings/reset/mt*-resets.h>.
+  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt*-infracfg.h>, and reset values in
+  <dt-bindings/reset/mt*-reset.h>, <dt-bindings/reset/mt*-resets.h> and
+  <dt-bindings/reset/mediatek,mt*-infracfg.h>.
 
 properties:
   compatible:
@@ -22,6 +23,7 @@ properties:
           - enum:
               - mediatek,mt2701-infracfg
               - mediatek,mt2712-infracfg
+              - mediatek,mt6735-infracfg
               - mediatek,mt6765-infracfg
               - mediatek,mt6795-infracfg
               - mediatek,mt6779-infracfg_ao
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index ef62cbb13590..fd2f97973264 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - mediatek,mt2701-pericfg
               - mediatek,mt2712-pericfg
+              - mediatek,mt6735-pericfg
               - mediatek,mt6765-pericfg
               - mediatek,mt6795-pericfg
               - mediatek,mt7622-pericfg
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index dae25dba4ba6..73512038b27c 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek apmixedsys controller provides PLLs to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt*-apmixedsys.h>.
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
           - enum:
               - mediatek,mt2701-apmixedsys
               - mediatek,mt2712-apmixedsys
+              - mediatek,mt6735-apmixedsys
               - mediatek,mt6765-apmixedsys
               - mediatek,mt6779-apmixedsys
               - mediatek,mt6795-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index 0fdf56414833..a580ad03a5bf 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek topckgen controller provides various clocks to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h> and
+  <dt-bindings/clock/mediatek,mt*-topckgen.h>.
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
           - enum:
               - mediatek,mt2701-topckgen
               - mediatek,mt2712-topckgen
+              - mediatek,mt6735-topckgen
               - mediatek,mt6765-topckgen
               - mediatek,mt6779-topckgen
               - mediatek,mt6795-topckgen
-- 
2.39.2


