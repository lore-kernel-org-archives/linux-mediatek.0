Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF17C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 04:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HKoujjtc9hCGDl1d2RjrGi/c9c1GCO8QdPXGn1k1ZhE=; b=K1rOsQhQsxqwA6mue+6Mx2MR9s
	LsWfu4uxzf77g9lAqABO+OGUAdUWqRuSHkKctpLBk4H3UAEWPh3Q7Iy0xeJEzoyA6e3XCqNHYJzap
	Qs5c12R6inlq4Dd0gkGDfqhha7CcUAJbYBr4FPxqzUwcFBxtZt3H+AY4FxCz6lTtWDhjVwHxaTzoQ
	2My0DIKo2LbwZcgPD8pOC0G08xQLBegug28jtHkz2Ay4J2IiZFGCkGRSIehRXD+NwnEn0d76UV0A5
	30Q2W/Bsg/rO0FkapW8fdnet0WfhhsD8dEv/0mz0PqG6MdvWjRnRKUei7FYuGVU86aEi2f1Z6g8WO
	X8wXDUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcITv-00CFHH-1a;
	Wed, 15 Mar 2023 04:11:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcITs-00CFFX-1m
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 04:11:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id q14so5028335pfu.7
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 21:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678853474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKoujjtc9hCGDl1d2RjrGi/c9c1GCO8QdPXGn1k1ZhE=;
        b=PqGSN9BYMdbfE0eWEVmbysbCyChbr6sF9pWxkj85Kz5mkziotP9bSFSXW4C9708ksD
         PdMQdDG3U9RhQxCC+RljHg5ufQoAaOkiDJ7qb1zQhp+AnWEBYLxLDrsn+104v9cVnufh
         r8yR10WUyRReQ9MTec2gjjnuTMDIY3sM0fsUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678853474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKoujjtc9hCGDl1d2RjrGi/c9c1GCO8QdPXGn1k1ZhE=;
        b=Sv71QdGROfBI49iTag3MgQ9NskjEakRfQId2LyOqfA0GS8yLhJBAQY4ohLBydiX9dw
         jBw2gt1BfMimjrUE9zPtwJhtCLdkF2q06hMfbL91wmgus9nGN/GAXyJdapDYtN1122+3
         0fCsBiV3hvmaaJspqzo44G6z88SHOhQF3pkdwPVW7egXQhAbrdTw8LYuwa2yQn/INMaT
         tQb6Q4O4K480bjA2fgFyhVKW2tuPVeRKu+Ofw84noIZfh1Ou0YTh9kAArRvlOOvKoic8
         n2xY4Ny35pvhR30kj7dUxHuH/qzvf1BR209eL69qI1574F7+UgAbkr138Tzn+I+raiEv
         j4Gg==
X-Gm-Message-State: AO0yUKV5qKdZSDuWBSGNuzEW6TU/U/U/FvylbDoecXGT/2lsZoHr19X6
	NDLtDNKd2/+K9c3vYiPThyl2aQ==
X-Google-Smtp-Source: AK7set9NjRWMOlC2eXp/43o2DAvOdU92TkqxbQHze5KccUrQJ7/Ck6guDEaybokQOD5ue/W6vTf3/Q==
X-Received: by 2002:a62:53c3:0:b0:5d7:637a:abcf with SMTP id h186-20020a6253c3000000b005d7637aabcfmr33159484pfb.32.1678853474423;
        Tue, 14 Mar 2023 21:11:14 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:3a77:bf68:24f0:1c75])
        by smtp.gmail.com with ESMTPSA id d13-20020aa7814d000000b0059261bd5bacsm2338685pfn.202.2023.03.14.21.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:11:14 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] Revert "arm64: dts: mediatek: mt8173-elm: Move display to ps8640 auxiliary bus"
Date: Wed, 15 Mar 2023 12:11:07 +0800
Message-Id: <20230315041107.2886940-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_211116_604942_79C3AC77 
X-CRM114-Status: GOOD (  10.40  )
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

This reverts commit c2d94f72140a28d0f516b7c5e8274a9c185a04ff.

The `lg_lp120up1_mode` defined in panel-edp.c is not working for some
panels used on elm/hana devices. Move the panel node out of the aux-bus
subnode so the driver only uses the modes retrieved from the EDID.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++-----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index d452cab28c67..d45a2aeb0eb1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -90,6 +90,18 @@ switch-volume-up {
 		};
 	};
 
+	panel: panel {
+		compatible = "lg,lp120up1";
+		power-supply = <&panel_fixed_3v3>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ps8640_out>;
+			};
+		};
+	};
+
 	panel_fixed_3v3: regulator1 {
 		compatible = "regulator-fixed";
 		regulator-name = "PANEL_3V3";
@@ -282,20 +294,6 @@ ps8640_out: endpoint {
 				};
 			};
 		};
-
-		aux-bus {
-			panel: panel {
-				compatible = "lg,lp120up1";
-				power-supply = <&panel_fixed_3v3>;
-				backlight = <&backlight>;
-
-				port {
-					panel_in: endpoint {
-						remote-endpoint = <&ps8640_out>;
-					};
-				};
-			};
-		};
 	};
 };
 
-- 
2.40.0.rc1.284.g88254d51c5-goog


