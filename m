Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32980C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvxtssIvtoFYupLWVv54BPyYcFNiA1KS9aQ8n/ctA2Q=; b=uj7Hm+sbS/k/9ak4uFHC0I9E4a
	iOt6FDXzMlzql4ATkuR5WkMOkki+Gq/3CEpPp3t0UKaDyXKi0kC89wRf+PDU/JIpLNGwwGuqXbWPl
	di0NrGcgwBn6wb54Js0+DFDkduNY8zz2nrif3V9EQepKOpMVMajb/aKTdHm88MuK2m+8lDoIZqyZA
	MMnj2gQGoYR9/PnPQtNowDkd++W1dkF8x6DKDPJ0OqIa3JovOcUpx0kZcFB0Z00ziGo+lnMJqU4as
	tUml9e/AaPWfZEVepOoIPqWIGP+Cq9H84xAPirm5usiF498HCi0osf/9RYa52oB0zjPgzjn3a81t6
	IK5z86Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3a2Z-004aXF-Vt; Tue, 21 Jun 2022 09:19:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3a2X-004aV3-C6
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 09:19:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id go6so7676432pjb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvxtssIvtoFYupLWVv54BPyYcFNiA1KS9aQ8n/ctA2Q=;
        b=n3yhQ6//sI9yfp1kIIQmNjWtnyhxQuTa2xKTjM8m6xRI/oiBqkW31cHcqOC11Lhpqn
         ZR82ouc1zYSWgcx5ZRsGjxx4uU638SPXtbgBbBmzXY2S3rbqyJCOFiTQI7iNreAGmaCv
         jt/wSztc8LZ5TuZBgfzzKuxhRKWjgnJSLwoGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvxtssIvtoFYupLWVv54BPyYcFNiA1KS9aQ8n/ctA2Q=;
        b=g8pPdKNTlg8pGjwLvk3FUJHK1lVKNRxmcj1TTjX672hbFjjlTjZ7IoLJS/qIEffQgZ
         +ZETulYt6+fPwBjTv+OFkap8/vf78oStmb5RSKxuTDO5w0f8YPINe+GSqM9Kn+dcurpG
         KYVy2qWRzBcpDtIAdDCm6mT5mwLWWgrS7MhTHzd3RIh6n6bqEUeUBNsboHt3Rf96TESv
         1yVzjN0SfMS/zwCfISnQKfD8wbEtXmghBsdo9sBAssBSnVdo+tpYnMOjRb4vGazB2Hh2
         YNFe9SSiXHTrOHnftDh00eY8zjNbMD3wUnDgeMVPsLr1i64ZDS7Zihb0dehDtb4oHa04
         RkOQ==
X-Gm-Message-State: AJIora/m029sizGFdo2FdKXgvAWLfnIn6XuTjKQIkrijTaYjnomAuZWP
	7n0afLFJUScB1JvWikQI5HK34w==
X-Google-Smtp-Source: AGRyM1vipYtXDQ0CAyWWxu+6Zvss+Qgr3C2OF6dNknVLJ4sz55B3xVInH5siiLugsmdohehcRfEjfA==
X-Received: by 2002:a17:903:22c2:b0:16a:3039:adb1 with SMTP id y2-20020a17090322c200b0016a3039adb1mr5619291plg.28.1655803145681;
        Tue, 21 Jun 2022 02:19:05 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88f:3824:fbf6:53ef])
        by smtp.gmail.com with ESMTPSA id v1-20020a62c301000000b00522c3f34362sm10609720pfg.215.2022.06.21.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 02:19:05 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Pin-Yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] arm64: dts: mt8173: Fix elm panel DT node
Date: Tue, 21 Jun 2022 17:18:54 +0800
Message-Id: <20220621091854.1904372-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_021917_451644_67EECB59 
X-CRM114-Status: GOOD (  13.85  )
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

Move the panel DT node under `aux-bus` node, so it won't use the buggy
`ps8640_bridge_get_edid` to get the display modes. Also, change the
compatible string from "lg,lp120up1" to "edp-panel", so the panel-edp
driver gets the displays modes from the EDID instead of using the
predefined display mode (`lg_lp129qe_mode`) in the driver, which is
actually not working.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

Changes in v3:
- Include more details in the commit message.

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
2.37.0.rc0.104.g0611611a94-goog


