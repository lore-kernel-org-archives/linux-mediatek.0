Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF975C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3KhhmJUOpB6BvIaPsJxzAazeleZ5u/gnv17tGzlP0Y=; b=oaqmuLzvs5h5XN
	hqMOI8C/2zYqDVJCtoy0ZV/55esswOe+SSQYvgRZ2SGgTxvzeBDtHbThsBFjl1PqPDopQwkaUrFty
	6NwNP1mo1CyBf6E/r7qEdgiMX9IR5UkY8Jn8l2K2SxWHIjumpyn89tqzYYONCEUjggk5DOCzTNBf7
	cDnUj6kcdnqsG64bG4PQGpUGB14L/v+eF3pMxQY1j0W3iNqwEGEPDdz5V8p4MoLHETN8uQtZVMkFS
	+G1zex7oVVw78PyBdE7HFt646QDPm3btAjqhqV6rFUk6TpbLkY9RP2XuAZfZa8LGF2BShL5xxRqdy
	8awJSlYEER/pRpwqtzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt48N-002kYB-2K; Mon, 23 May 2022 09:13:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3L1-002Otb-UR
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:22:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id n18so12436830plg.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+44BSSlN1XE65CChHOFpA2+bmaSayBXAi8yg7sU14k=;
 b=Q2TUZwWb3O8USHfgIO9tS+qDCKQ4aHCFf5zVdpZ4kZL/ae6pcScOhVImdn+XIsDcvj
 kF8PDjhYBd9Ql4uU/PgJb0rtPsN5CZTjI/FBvXaDrgt1BSctQlerLchZPIZ0UIVfPvWW
 gEK/YC/JXT+hRjEiaupO7Dk9pghVmeLndrcGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+44BSSlN1XE65CChHOFpA2+bmaSayBXAi8yg7sU14k=;
 b=HeYhg52Nbb85xqG0Z7Jbp4ak3E8vME+Cy9PI2Vooc+Wi4geyZF/7pGpYsaeLqZVcPQ
 iXv+kDR2yOM3Opme7BW7HHngScUYzrywsqziIBW8C9h4jVCbodaOP41dfrfom7Vupg84
 RDgaFXdVyVV7xJj9D4I8UlFEb9keM9fVm1/d2C+s0lAk1LlkzoF1fnVJnBOVtzsZ6Kq3
 ZgugxXT2nWMPpsU1H76eL0IvptQKK9etMd8PB89/Xoj2wMTGfriBfGdreEO3skvy+RMi
 bXugEyOGZwRjnN7kG/AcSz+uKjMIuPOUhlNKIYnk40t+4wTKnjUIa0c1wcWoq1ksBiF8
 E+bw==
X-Gm-Message-State: AOAM5322xb9G8RKQcZt0FsDbq2h29moAd4E6hdVUnHf6nRX8tMtQOSLM
 dJHfIBfqjxLsEbOkKVEpeAy2ZA==
X-Google-Smtp-Source: ABdhPJzHXp4n75/dUnjS1z28pKIVVr4s/o0CZ70SogSxK0Bf83YapNMXVetV8ByWrj7BP/CYF/FRBQ==
X-Received: by 2002:a17:90b:1808:b0:1e0:4dbc:8781 with SMTP id
 lw8-20020a17090b180800b001e04dbc8781mr4230775pjb.58.1653294169493; 
 Mon, 23 May 2022 01:22:49 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:1547:329:6bd:3965])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a63b24d000000b003fa321e9463sm2277982pgo.58.2022.05.23.01.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:22:48 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pin-Yen Lin <treapking@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mt8173: Fix elm panel DT node
Date: Mon, 23 May 2022 16:22:39 +0800
Message-Id: <20220523162235.v2.1.I8f6449d46305a0e89845cf191e10c042736a1688@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_012252_045169_C1AB8219 
X-CRM114-Status: GOOD (  11.59  )
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

Move the panel DT node under `aux-bus` node so it won't use the buggy
`ps8640_bridge_get_edid` to get display modes. Also change the
compatible string to "edp-panel" because the predefined
`lg_lp129qe_mode` is not working.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

Changes in v2:
- Remove the Fixes tag because this change is not compatible with the
  old kernel versions.

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 9c75fbb31f98..1e0802a6f6d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -90,18 +90,6 @@ volume_up {
 		};
 	};
 
-	panel: panel {
-		compatible = "lg,lp120up1";
-		power-supply = <&panel_fixed_3v3>;
-		backlight = <&backlight>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&ps8640_out>;
-			};
-		};
-	};
-
 	panel_fixed_3v3: regulator1 {
 		compatible = "regulator-fixed";
 		regulator-name = "PANEL_3V3";
@@ -282,6 +270,20 @@ ps8640_out: endpoint {
 				};
 			};
 		};
+
+		aux-bus {
+			panel {
+				compatible = "edp-panel";
+				power-supply = <&panel_fixed_3v3>;
+				backlight = <&backlight>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&ps8640_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
