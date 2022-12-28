Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDBDC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KTmLp3WPbuZV+b+hTAD9egOWKyUGIagroxlWC31ebpo=; b=JS7KYjPBZzNW1nExzielH4CuHc
	w78P2MQ7RTS5RtnkDXvhwW+FI5C2s4vDudpiG3hC2E8cDsmLI/oqFcc7gPDDWA/uCCOBhkR73lZBa
	CjDikn9lkTgOeQj4iFD8vcRURIeTDB6NuL4vcb0LaoE6cTi9DjetpzNXFBdaDlME+rfoADorZsVXo
	fEbZQX7nPw2feETK50MwXfBNVkoFSrx5oF5bKlyqLi3UBplQTcQ518WYErSlyhofjG2tGyKF/Ho5K
	QamZ5MgLAUyd46m6WjTgJx/db5rBnh2dDVlqlQM5j6vLCW2KHd/mg7/Lr7A5OhwWN5xJAoxl6swX9
	1Yyo+vtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUfS-004STy-CP; Wed, 28 Dec 2022 11:32:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUfO-004SSY-EQ
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 11:32:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id 6so7803476pfz.4
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTmLp3WPbuZV+b+hTAD9egOWKyUGIagroxlWC31ebpo=;
        b=nvJ56kdO6TYBqlvfyBBy44mrPbj6j0sswfmD+BfW6JUnz947+VBa0I4+vIvGnGxL2C
         xsOILcAE8JSmL+VcfWGh+DcPuST3RRIwqbyi/SEUy/pYwNbKJkCU429Z+w9m3YyJfkj+
         osoiuk3YMs4zhIh181anhkeSpwMm/FhgqeYWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTmLp3WPbuZV+b+hTAD9egOWKyUGIagroxlWC31ebpo=;
        b=1IOdrsDYplDiJfoKv7iOy3WFabVF3PWxj06DNw8gPyuRuQF8P06NWd7xv1KnI7V9+H
         O+sswMMCyJxovV/BHzKTay3lBjzp8fo9d1R+kt0gv48pPc0KiktQWfCzl+9uW88n2b/u
         MwR++TV3FAbZWd0FGPBDV896x51v5DR0G9ObK1+kZWZryzzo0I+sB7wINAZqBVyOe/Uo
         b/PiAjNCyuoOZ4tlrCzIc+8F+jkjfzinaAremFGuyPAbhflKWRl6FUzTfPfDw93Xfdsd
         PXQTC+2M2J+a5+g7MpN2hWQUBk+YsOlqZ22u/OeOTjNMqTPkk+C1l/oLTeAX9tO001u+
         d5yw==
X-Gm-Message-State: AFqh2kpsGmbggPxXuHqMScIQMWyVVa59fqx4Wf343J0cpBBKZgTwTHBO
	pxK2M04rWOCbcxiojs5hL6N0Yw==
X-Google-Smtp-Source: AMrXdXsMYQjyC6xgL+G4AOqkuUQJXWG3LyE0123LXzv3W/PwJe5cSz4GYQWNfvPJ8/GMg0yggFHymw==
X-Received: by 2002:a05:6a00:26d8:b0:56b:9b71:ca2f with SMTP id p24-20020a056a0026d800b0056b9b71ca2fmr23155416pfw.11.1672227132377;
        Wed, 28 Dec 2022 03:32:12 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:882f:1d5e:9d7e:ebbd])
        by smtp.gmail.com with ESMTPSA id w18-20020aa79a12000000b00581816425f3sm1987756pfj.112.2022.12.28.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 03:32:12 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mt8183: jacuzzi: Move panel under aux-bus
Date: Wed, 28 Dec 2022 19:32:04 +0800
Message-Id: <20221228113204.1551180-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_033214_618821_FB862783 
X-CRM114-Status: UNSURE (   8.67  )
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

Read edp panel edid through aux bus, which is a more preferred way. Also
use a more generic compatible since each jacuzzi models use different
panels.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 3ac83be53627..543286ce9cea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -6,18 +6,6 @@
 #include "mt8183-kukui.dtsi"
 
 / {
-	panel: panel {
-		compatible = "auo,b116xw03";
-		power-supply = <&pp3300_panel>;
-		backlight = <&backlight_lcd0>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&anx7625_out>;
-			};
-		};
-	};
-
 	pp1200_mipibrdg: pp1200-mipibrdg {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1200_mipibrdg";
@@ -181,6 +169,20 @@ anx7625_out: endpoint {
 				remote-endpoint = <&panel_in>;
 			};
 		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "edp-panel";
+				power-supply = <&pp3300_panel>;
+				backlight = <&backlight_lcd0>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&anx7625_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.39.0.314.g84b9a713c41-goog


