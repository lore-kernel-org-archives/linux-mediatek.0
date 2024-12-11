Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D57E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdiLjWqZCqkJzTb8taSGz82kJU+JDYdNANRgcY+U26Y=; b=edp7KJUiF6yRZi2PgKP3gvkD0z
	N5eWJxiXuPcAF5bJy6CEARf5Ldiq8qtcC1cfWDCgGyTnT77Qc9o4sonjal8tQofzIHlaTaLGa+BfR
	RwS+0OXF4Xnr/UY1uymWS0RNog0iFOZkcLvRUik6xMrMdVkb3zdTkIMSCYmlKz+CJVLNWpwKQP3/W
	dQr+mYGwaOxaSCmXlskO08t5kQ9GBgGPvsiVER7+Hme+F/YBVEgoDXOVduMiTzYt+5zXJmJgnp6Gb
	vmm0DVyeiT/WpJkD7TD+xy+PMbtoSFv/DfoXZO8xE6Q1VXypUxY4OxYIdL7+aidFLeTDbNFdOxNG6
	EhFMtitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFJL-0000000DqDw-31X3;
	Wed, 11 Dec 2024 05:30:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDO-0000000Dp8V-3H2m
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:51 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725e71a11f7so245524b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894690; x=1734499490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdiLjWqZCqkJzTb8taSGz82kJU+JDYdNANRgcY+U26Y=;
        b=lfuACHCu5WqPZDSphkHJ8CHsMOUtinT6Mw0f9NXIJFrgjFR7LezbXqG3yfbKbCV4Cv
         s+oRA1yu/6LMwbV0xf/w8hHTxN3RKX2+vRFdIf+ZAa77N5zaaCmyTcJUuIC1BhWIdXjV
         dQ0MrzxwG7RPSVPqcSJmqXHLMwIFYzTsfo+RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894690; x=1734499490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdiLjWqZCqkJzTb8taSGz82kJU+JDYdNANRgcY+U26Y=;
        b=nOAkOyGvw7NzHnsETtovQp7fGBy2orAc8plksndWUWDHTBtyX7kox6DmW3Ysz4RZ/2
         QW2U3cfQjOclWtN2VIkHsM443nMIOZmyuvf0aabcespEsYRBlyCQnrmjuFMsOlAORoKa
         bYRKvTqUvuD1Xe6/4tQ7IZD0ucBHnK3TdDUgHSwoq3/UxdYuaDdUwbn7xAHhqBAc+S1x
         EYkbP9M/ys16++go/bnbIGcEkjzUwuz2PvKqaFlCDUdJS82/W72SsRAK+fNCChkFGnAd
         fZdgS9b4cqd8+eEzojxTGK5jGkphmMl4Xy0cahGjvZ4WSgGhsgdRiZIMBRnpcTHYHmkt
         Ee6w==
X-Forwarded-Encrypted: i=1; AJvYcCUEkYUL/91IgoPvHRUGedtatCBFDaKXiOUdnqV4cLU9rSsns1MzYrqTud1s/msWTdh2wPje25hbly8A/gGrTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYZ3wFritT5leiwoLcXaB/w9GhR6YLoVM+Ngh9azahz9uvjDSs
	oxAj2O0cZJv1gogcJfdc9InWIofJe1fOUWqTmHGR+n21WjUQaM2iIH6m5SP6jw==
X-Gm-Gg: ASbGncvZ0Qe28kiqxoyEZnl/d1DBlu7r4h4MERr30TOA1koOiogGvmJbI6qE3G1VTEF
	ZyazpU9mzkemn5YLHgpz2v9BzOMk+w+tW8b+Y3Tbc5uDRuO13C51MNW06+9cJwrElxu7YPNNTOE
	2880BaExtVzHPGR/WqhKXY1NsLq3kuTMuIM5UwhWqoSqpxrse7uwofi7WK//ieg5A31AIBGdgip
	vfrn/1uV8TBp7bnNQkQ/gVQyGmSg3nBIu7rd8OEC7fKYMasQMeCmWegCWwErs0bDYBUYrth
X-Google-Smtp-Source: AGHT+IE3tH05FCDWD+zKQbH/6GkwhwOe3oH+eHt/gxo//2UmKzQG0AGbv9mpB/EeA/+0SV0LYD5TJw==
X-Received: by 2002:a05:6a20:d8b:b0:1e1:a48f:1212 with SMTP id adf61e73a8af0-1e1c26a8ecbmr2332202637.4.1733894690317;
        Tue, 10 Dec 2024 21:24:50 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:49 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:24 +0800
Message-ID: <20241211052427.4178367-7-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212450_817054_B9359649 
X-CRM114-Status: GOOD (  10.13  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It is also not listed in the MT6360
regulator and charger bindings.

Drop the "regulator-compatible" property from the board dts. The MT6360
bindings actually require the lowercase name, so with the property
present the regulators were likely not actually working.

Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 31d424b8fc7c..bfb75296795c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -137,7 +137,6 @@ charger {
 			richtek,vinovp-microvolt = <14500000>;
 
 			otg_vbus_regulator: usb-otg-vbus-regulator {
-				regulator-compatible = "usb-otg-vbus";
 				regulator-name = "usb-otg-vbus";
 				regulator-min-microvolt = <4425000>;
 				regulator-max-microvolt = <5825000>;
@@ -149,7 +148,6 @@ regulator {
 			LDO_VIN3-supply = <&mt6360_buck2>;
 
 			mt6360_buck1: buck1 {
-				regulator-compatible = "BUCK1";
 				regulator-name = "mt6360,buck1";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -160,7 +158,6 @@ MT6360_OPMODE_LP
 			};
 
 			mt6360_buck2: buck2 {
-				regulator-compatible = "BUCK2";
 				regulator-name = "mt6360,buck2";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -171,7 +168,6 @@ MT6360_OPMODE_LP
 			};
 
 			mt6360_ldo1: ldo1 {
-				regulator-compatible = "LDO1";
 				regulator-name = "mt6360,ldo1";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -180,7 +176,6 @@ mt6360_ldo1: ldo1 {
 			};
 
 			mt6360_ldo2: ldo2 {
-				regulator-compatible = "LDO2";
 				regulator-name = "mt6360,ldo2";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -189,7 +184,6 @@ mt6360_ldo2: ldo2 {
 			};
 
 			mt6360_ldo3: ldo3 {
-				regulator-compatible = "LDO3";
 				regulator-name = "mt6360,ldo3";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -198,7 +192,6 @@ mt6360_ldo3: ldo3 {
 			};
 
 			mt6360_ldo5: ldo5 {
-				regulator-compatible = "LDO5";
 				regulator-name = "mt6360,ldo5";
 				regulator-min-microvolt = <2700000>;
 				regulator-max-microvolt = <3600000>;
@@ -207,7 +200,6 @@ mt6360_ldo5: ldo5 {
 			};
 
 			mt6360_ldo6: ldo6 {
-				regulator-compatible = "LDO6";
 				regulator-name = "mt6360,ldo6";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
@@ -216,7 +208,6 @@ mt6360_ldo6: ldo6 {
 			};
 
 			mt6360_ldo7: ldo7 {
-				regulator-compatible = "LDO7";
 				regulator-name = "mt6360,ldo7";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
-- 
2.47.0.338.g60cca15819-goog


