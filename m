Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7AFC44516
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=; b=HOcFzNKuonH1PGPhtjhZXs7imN
	gkR7RwNdU7EjiFZOlqiTAM4urSYXiKZg35czn9+9YyqqwjWGPpu4gvt3ZZn7B3RXn0NFSgOSluBc1
	GmKf1KdaOnf+kEAaiWPOrbU9IUkMx0/zgwJ6ybbhAgq05nwKBiPYFTS78EEJu8kGhkye1nxJVUTGH
	Az7cu04q0BP9+a2vLlQkmX9PfcIpllmUBvnezgsIzTLauaXlOAsWIu8Ljv9cBe9CpGC0o4KkEQRcj
	vPqmKgIKXGGDHrF47i937BJdj88/DEYtIMrGAL+SefFxEH8jrA85cxTsFIf4k2F1HI9xycqicO4ey
	q8Z8B9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoa-0000000085S-1C3Y;
	Thu, 16 Jul 2026 16:20:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoT-00000000801-1QIM
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3538867b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218792; x=1784823592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=;
        b=UkwABaLMwQY4uNUkXojIUyq0LPrTMpxyWCJPyACssfdj9wFmM32yMWSuqEjOhmm7H4
         C5aOjEuRZxBpb9Xryhm8scmIjXinWysIsSczJKMB/PqNfwsm/Xb5g3l+Urx9XM1SJ51X
         HUTliYAsnv8U3BVtWcyeJkk/cE8zIoXgeWmKszTl1UToSDsrLbiVu5ZmR5cYM8Z7wrAj
         /ly/Pe1F/GeZI28zi1mLfaoL5X27gIz42vS/nLnEtT2/f4hteLzBh1Ew1VOwlLXeH1yG
         dGxTm7ZZ2rwBAr50nZcDrMDfo9lXGSaZSpMDk5XHAvTZz1L6V+NDuqtVvXH2UTKtTjy2
         4mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218792; x=1784823592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=;
        b=c3nhDRz0jLYTkeShRT+FiWWLF/ibUGiPnzLD/YIWJGyZPCbr9s/2u/es1MnDEcXF9n
         ncVx0eMNb5QClbGhmmqU5rUM0e64fj4m10vY+aV6RIocWdtMJ6lLbT072z7iO7YdnsWG
         8iZihZLqBoAF1LIV4yWQLCDxRCVSGu/4PNkyiQlyXhzYjNx0skFu7RPuRmUfgxRtUz0v
         qg2xnP/AUCgH5laALv8eJpoy1lr3UhImPsqK6PLVqLNGrrgipa7zXh6USal/MdWM26Sc
         zWFORen0R2wquhE7r1WgxkcIqHbPWsXcmEyqck/r//wBzvzRbJ19sF2N5umNptEYW7YF
         8Sjw==
X-Forwarded-Encrypted: i=1; AHgh+RoRcpwQ0Q95Yt/kuS+ytQbmsfoOIYP6p06MDETf9pJ/VowOXAFRwrmarIjWNhVTdGrKJvPm/w/BjATSE14iog==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5bogZPwVnspb92Inl+qzt/e/w/skxfzW1ZLFlnmu2LI+qDCCa
	TuvUPwCXQSyYW4U93QFVKC/fxZlyE01lsHG1WUypUZIjDPdKR6IY9EAM
X-Gm-Gg: AfdE7ckpRs8GG4IvVfm3b0YHguPNQVYvwQCTvDo3u3RRfbkb9mjc0HKA/OLek2KFH3Y
	o+EQrTraPD0deuWCUwb2dBm00bf6YOFDgD23d5BSHYbWREvfTDJ9lbkIKVO8xgwbaUcyP5aYmCe
	Ui/8hdZCkUSUDcowoIKdZ8y8QTb4anhZjaz6HsD9wLqpUqKXibjHv2VIpNH+J1cJMhD5dP3uVKO
	WJ4BL3t/7Z98Z4pY4iW0wI9otocbB/XPIx/RhOaCpCxBT0IWcZi+wJRGSHlWa4Yz+NBjv19w1DH
	0HxmU9xbhK0/kpIz6fbKudZCoso1aNjFJ+WcL2vtJUtndUlumPINdQ9FnlCFJIsiVyzo6+wiyx2
	4DMxiSQ9EVVl8D23QAg6koxVc31KN4/CiVELyVDRdLiDtnbqQFrNapE23lrH7+qyYUK5mYe9BcV
	M6n4Qpa/9aXS46iCFMMzU7GoxJMkZ4FEatK4oVWNinz6Pt
X-Received: by 2002:a05:6a00:240b:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-84a6723fbc9mr7209157b3a.10.1784218792451;
        Thu, 16 Jul 2026 09:19:52 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:52 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 3/7] arm/arm64: dts: mediatek: drop mt6589 fallback from watchdog
Date: Fri, 17 Jul 2026 01:19:19 +0900
Message-ID: <20260716161923.266315-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091953_421735_28E68A2C 
X-CRM114-Status: UNSURE (   9.96  )
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

Remove the "mediatek,mt6589-wdt" fallback string from all in-tree
device trees. Use only the SoC-specific compatible.

No functional change.
Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
mt7629, mt8173, mt8365, mt8516.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi   | 3 +--
 arch/arm/boot/dts/mediatek/mt6572.dtsi   | 2 +-
 arch/arm/boot/dts/mediatek/mt6582.dtsi   | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi   | 3 +--
 arch/arm/boot/dts/mediatek/mt7629.dtsi   | 3 +--
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 3 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 3 +--
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 3 +--
 10 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index 128b87229f3d..f23a6d860a53 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -160,8 +160,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt2701-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt2701-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
index ac70f266d698..5a6c9763bd6c 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -53,7 +53,7 @@ soc {
 		ranges;
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt6572-wdt";
 			reg = <0x10007000 0x100>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
 			timeout-sec = <15>;
diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index f941ea44898a..501aeb3a2848 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -63,7 +63,7 @@ soc {
 		ranges;
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt6582-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt6582-wdt";
 			reg = <0x10007000 0x100>;
 		};
 
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index aa42377b47da..48d6c348f667 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -281,8 +281,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt7623-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt7623-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm/boot/dts/mediatek/mt7629.dtsi b/arch/arm/boot/dts/mediatek/mt7629.dtsi
index acab0883a3bb..b034e9ab5af1 100644
--- a/arch/arm/boot/dts/mediatek/mt7629.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7629.dtsi
@@ -141,8 +141,7 @@ topckgen: syscon@10210000 {
 		};
 
 		watchdog: watchdog@10212000 {
-			compatible = "mediatek,mt7629-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt7629-wdt";
 			reg = <0x10212000 0x100>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 8ac98a378fd6..fe81faee0b0c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -218,7 +218,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt6797-wdt", "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt6797-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 158bd9a305d7..0b5ffe9fa806 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -322,8 +322,7 @@ pio: pinctrl@10211000 {
 	};
 
 	watchdog: watchdog@10212000 {
-		compatible = "mediatek,mt7622-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt7622-wdt";
 		reg = <0 0x10212000 0 0x800>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..04b91b751853 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -528,8 +528,7 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8173-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8173-wdt";
 			reg = <0 0x10007000 0 0x100>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..2b5b761b92c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -469,7 +469,7 @@ power-domain@MT8365_POWER_DOMAIN_DSP {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8365-wdt";
 			reg = <0 0x10007000 0 0x100>;
 			#reset-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..515eed0bee21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -203,8 +203,7 @@ apmixedsys: apmixedsys@10018000 {
 		};
 
 		watchdog@10007000 {
-			compatible = "mediatek,mt8516-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8516-wdt";
 			reg = <0 0x10007000 0 0x1000>;
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
 			#reset-cells = <1>;
-- 
2.54.0


