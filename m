Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5171CDE00C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=; b=p7Hzk4DvePTXAsrLJsW4sCHSCR
	QClNgMd14vGwRN/KyYMBSx1kuyRXQEC+BQ47MX0QUJ2Dpme9ZJNtTEZF9lW4Uh7YwPEoYlBF8usuN
	KQ4xEAhlSAO+jXFkyGr1a1jocKeV7MbamZNIDJNc5tFvmcv2iEEwozR7IopqP2VdYt3y1YmyJsWx7
	02jz9nVsGWs8KB8JUvxDCTx2QTrwPwG1hFrkRC7R57vBUbGGcxZ8GZ8dsEOLYpx91WjYycFK+FIZe
	51hDKh7LSoLnh0aGzTgx3joi/pNreIfnxfbhpD1laPz1ZoGTUU7QUsHc9QTMQJsFHHbfnq5d3NdSI
	GINprhfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchd2-000000091xO-0o1C;
	Thu, 25 Jun 2026 10:48:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcz-000000091vL-3Ncs
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-462bb734793so1439379f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384492; x=1782989292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=nayFIIvbKrHsD+cZD72vITszIKKUZZ5TcpVmrbdedQC88RmPmlWIDJDrNc81Q6PTBA
         jE4lKsDBpsyBveras+RjiCR8sJ6H4UDhE9lZEKEFi18KrryYDaeiOUmn5Ktr0j9LUzIw
         xRV6aW63fmG6iQKpjvTL/1OC1//EMnmqhfxZxs3WgG8mg5TccwSBSiVl6dpzFNkLDo+/
         KK8KqWp2pgPNuWf08cw555IUL8ePxTwDe4XJruCnH0cQKSLzdkedKtXawa5M1z3Vt1Lr
         nijSPX1RDDdVc9aphsvbAdK+PLD3N/HENBOeZk6xlTL3krMc/PJQX9ClGQ4SJz+GFSQ8
         TK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384492; x=1782989292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=QTHI09Dr/UiBXSex9A5XPcNhOW9FBM/MfGbljH2Zx5/E1YOobqQbQRFGTyHdAv2ZaJ
         5cI4qZsnXEKX6tnsEXyqKWsq1s2Z2S452YhqrbHNjcmY31/3lD6N/t5RnaTyNJ0kZAZ9
         0BQH5gS/rLRb1g53xY/KzF2V+9ads+bK9zOgVHY30AtGNsrlocMVmSiSWXzQ5MppEtWx
         3Lq/FW9sggoKQVlVDCMltve4uKP/FZXN680R2w2+8jonHs8LTzDPyQ1wvmz8PqX9wzHo
         Rv/kCD3dOVyVukAX0L9GOIq/wDuQvLAgRxK8SMm8FoVhLc+0WJ6MCE08CaVaiD/UMCPf
         fUtg==
X-Gm-Message-State: AOJu0YyrTlAJTshy7SrzrAKmNDaYTRKpBGbPtexnAvKv2x/GYcG7XsL0
	/5UwFHoryU8mx3PNZlWnKqHZZl1CT5jPGkhy48xzRpKnSTFAUXoS6RHh766cQPUE
X-Gm-Gg: AfdE7cmzprNqq5Qprj/Mp2fgu96r+GlNzFzUWty6yfxlT+0Swmte7xBfuqWFArWrZiG
	Sp+L6MwlEy/aLy3BbaZCBVzhNoh9aO+pyqC9s3cKeQTqVzqc01QacEijB7nC3xkbJuPYWAcAnPT
	9oZ5g2FjWhnJvjXg3VCoYnXA/UC//t5RtCiehVzJXNpZtw1/SrpHYvMCw0TfJyEofbWU37tgtov
	0qfhbwkA/BdH/hhJsII+piuFSVJDlZwppdxnpxsOWU3uM0unJdajqp+g04cabAyMY0ZGu7D8Eyu
	OAZ/j5P0Q2iycpHK30YGhwHpRc1nJYIz9+jvczwMyy+qw2D3nVRBwcb5nukNH6aeiD+i5/yPsiG
	HzHamUFPKJFDwQ89QA6WYHOkAqttF6RgxZwBdri/zkjNZXpBpAvLmTJnOcnCNYPfdcP2Fd0PtVk
	aYDG6e/Q==
X-Received: by 2002:a5d:64cb:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46dc16b9abbmr3055956f8f.36.1782384491908;
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/3] arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris driver
Date: Thu, 25 Jun 2026 12:46:32 +0200
Message-ID: <20260625104742.113803-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034813_863996_0FB4BFD9 
X-CRM114-Status: GOOD (  11.82  )
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

Update the MediaTek mt8516-mt8167 SoCs descriptions to respect the
constraints of the Paris pinctrl driver.

In those SoCs the pinctrl has base address 0x10005000 for gpio settings
while 0x1000b000 is used for eint configuration.

This change also drops the no longer required syscfg_pctl syscon node
that was used before to access the gpio regmap, fixing the following
dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 15 ++++-----------
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++--------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..65da6c0538b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,17 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		pio: pinctrl@1000b000 {
-			compatible = "mediatek,mt8167-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8167-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
@@ -178,3 +167,7 @@ larb2: larb@16010000 {
 		};
 	};
 };
+
+&pio {
+	compatible = "mediatek,mt8167-pinctrl";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..63f36df4d1b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -231,17 +231,13 @@ keypad: keypad@10002000 {
 			status = "disabled";
 		};
 
-		syscfg_pctl: syscfg-pctl@10005000 {
-			compatible = "syscon";
-			reg = <0 0x10005000 0 0x1000>;
-		};
-
-		pio: pinctrl@1000b000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8516-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
+			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+			reg-names = "base", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 124>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


