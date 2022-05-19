Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FGHfpZj5m17T9FxvWuCbBflimLGebgYC4lOhQ+sAnls=; b=WWcs585iQ2Rg+T
	joPGffIaBkgfLjxq7fINqIeSmD6sipxeGAqILcL79TdkDpnZVWrWXXHcxiomtkoU5+1e7EkHNMn1R
	q/+ZKWFl6thc6ZJBaes/7iu4fdiS5Uz/JxXJDgQLDknVBCQjx0VgjyY8BmTZNGQoHTQ/P5/5MJN8D
	QCFxUlfb4qWlBLSCC41bXDeig54gwd31vx3Mb9zQBH3XEAS9RSVxw9MdfJ2axN5Vn/XHFIczaBWtI
	Nc6tjzhYGmuf/8fo13lceavRFJxSfrnr6FCQYLwM5GI6P7gByBUwCqnW0IJtcnYHw2gIiJKh0VlAM
	gOBI73Ts6UQtWPGZfpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraZ1-005XgV-0G; Thu, 19 May 2022 07:27:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraYq-005XeK-Ox
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:27:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i8so4016444plr.13
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAwl0nMeiuQyulzpnQY+0Q3CMgejgrLMRz8aWvv0M80=;
 b=TCm4dq7k42XhcVURpAi98W3DD52g+rV9t2retTLhSARqOR3vx0HOSAEBHAd+IT0vqW
 NCYdc4hzFxG5KHr44IxqM2KzakWaqafx5DwQW/baXPYYt9/0/QCh0zLdjV4YDWMgaoMM
 G+7u+3OlAY3yeCssSlYR9pIe3ZnfyvvitTnK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAwl0nMeiuQyulzpnQY+0Q3CMgejgrLMRz8aWvv0M80=;
 b=pAc5fTl4H8hAYEZMEoH7f+OwALHqKElAp8f2xZ3VEoDjvZach3Bb1TcyuQCpFXIYTd
 V2OPh7n3pCdToDi1/2S3y4XmudfZMiZuUpCkDDt+XCPyu2L8SX8Gel/IEA7rf+KPk6EA
 cgJSldu7G4VALuN2cIUxV3Ik+9aVFnh7fskCtinZA9oBHIeU+Zmj/mEA/qHPS7NY3TyZ
 VMkIJxuZu1Bk3a/oKBtof1XlT9LEGD6ah/YzE1Uw9mm1Pyo/cQ1DcptF93BqWZ+LwLq0
 yZe1ULh8U8L0pm1yxJV4H/icoFSytGu570DSusCzUcYMYngdy4gIcXBBBS58U7SGGxik
 Wz6g==
X-Gm-Message-State: AOAM5322IioJoQrX1fSV6ZXyOOwly5kgGDKei2cBOsPQ+dbaxCGsFwxw
 PVQKhAgJBBLnBOGWrRGimUsqxQ==
X-Google-Smtp-Source: ABdhPJwxYC9vOe2OgP9SywcJgr2vVxIIiMIGMDJNVZ/f/acPVTzBxtTzRayEoSDDSXE/IjWNvND/Hg==
X-Received: by 2002:a17:902:cf4a:b0:161:64f4:52d8 with SMTP id
 e10-20020a170902cf4a00b0016164f452d8mr3433156plg.83.1652945221701; 
 Thu, 19 May 2022 00:27:01 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7f93:9f84:d846:5099])
 by smtp.gmail.com with ESMTPSA id
 y23-20020aa78057000000b0050dc76281d8sm3296106pfm.178.2022.05.19.00.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:27:01 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pin-Yen Lin <treapking@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8173: Fix elm panel DT node
Date: Thu, 19 May 2022 15:26:49 +0800
Message-Id: <20220519072649.1493706-1-treapking@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_002704_846928_AE60EA43 
X-CRM114-Status: GOOD (  10.27  )
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
Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
---

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
