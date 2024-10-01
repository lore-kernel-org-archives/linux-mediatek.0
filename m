Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C7CE7D10
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHVpAqtBhTjk/tW32shjLNYqZYBHOi3xkZZdLwrHsZc=; b=N+EDQ4T5evpFfj
	LW5Z/GnuKP0kPEufVfE9NAMGkAyRG2vdIw4cQnCWYjmpvSVzEIiCo47P+acdLgHuNZAT/Kb39IYvg
	FGDLCDmnjjEeRLSWLm5FvKBwVK3XrraAHF73zHy81vQgYxYpxbYJ7LDKBBAAcn1tO3sskx63fuEOx
	dMDVr2U+zmXsEXOedTbhAymQbeIoEQlshclHrAv8FKykXozQzwLb1tjCJkUEkEwJcsoiBSYrOjfyr
	M4UBGsG4Jz/oEF37KdHGxZEtIq3rN/stdvZTTJ50u9kGP4DWA1fDvSzO2hch1bhdQHtY8ueuo+p23
	BOfQ6xZnp8K/rpXI8DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbN0-00000002a1r-2fh0;
	Tue, 01 Oct 2024 11:48:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6T-00000002WTF-2rYI
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71b0d9535c0so3780077b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782301; x=1728387101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHVpAqtBhTjk/tW32shjLNYqZYBHOi3xkZZdLwrHsZc=;
        b=R+uoPQIB3MtHmRDtbjH90BDJcggwW8qbNnV+6u9gUheCKpOaQ1QSYS4h7Hj4FNbE1I
         sSXKetJXB7Zvfq7NtJ4Zr5n13s7Lku0zoGLWQKA1hAeQF1sxxmeOx0Y9og9fQqxMyUb5
         oyFP3Tc8/fVHPMj133vDhf0CeA40nRdVyyy8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782301; x=1728387101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHVpAqtBhTjk/tW32shjLNYqZYBHOi3xkZZdLwrHsZc=;
        b=RtOmVqQYT1xqkmPX4yPJFIfDJJdH41tEhGex2hCNb1lRt/iu+eZErB1Mbp5MLkiinI
         LiKSdPITwSF2Cb9HXJc3q6qZtBiCi9BCke2LuGvLu+fQDMmg9skjLfRYXzcENZ4ilcSS
         xftmPux/VBmBwnj2eG1SRV7cmTzVtn+4in4noKCBMoz9Ud8q8QONef1x/bQiL4anBIwG
         PStsWnjNmlE85coKk7CFS36E6imUq8GbyqgRFPHBYkEHuxm+HhmYmoC/pIZ1iscR7AoV
         zews1EaH1vbCUl8J04iuAr3g6z4Y2LCODbVaj0xKxNeftdxGmCngw2zmmIXVGdUrfs/y
         lVIg==
X-Forwarded-Encrypted: i=1; AJvYcCXNB3D1q8aN8xRkmW184jPD71lO6G4Je4xNDmOKFDwZ9mRN//JFvcL95wSUzJjVG68i7EXcVUCb9PL5ZgDEOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxST6XNymofjRvGNf9cpD+bIZUaxRVTkh6tij7GzipvYcGoBOzG
	o6Zw+b/M6ExH9WBe10EszMyqsaGwCNC+2mtW98amSuT2v00C/MGxGE2qm43nBw==
X-Google-Smtp-Source: AGHT+IFZ3oUWJS1Sa53CgoaQveyvKTUyDvv6ZPmGhi3kZ/l698r7fpVxnLWRxa7awXLoABaq4SwyfA==
X-Received: by 2002:a05:6a20:1d98:b0:1cf:22d4:3832 with SMTP id adf61e73a8af0-1d4fa64c5admr19196260637.5.1727782300706;
        Tue, 01 Oct 2024 04:31:40 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 8/8] arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
Date: Tue,  1 Oct 2024 19:27:26 +0800
Message-ID: <20241001113052.3124869-9-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043141_753151_3689EBBB 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move the #address-cells and #size-cells properties from the board dts
to SoC dtsi to be reused by other boards and avoid duplicated lines.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
New patch.

 arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 2 --
 arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
index 68a82b49f7a3..f89835ac36f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
@@ -140,8 +140,6 @@ &mt6359_vrf12_ldo_reg {
 &nor_flash {
 	pinctrl-names = "default";
 	pinctrl-0 = <&nor_pins_default>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index ca50ed20fca0..e2c6ed816507 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1618,6 +1618,8 @@ nor_flash: spi@1132c000 {
 			clock-names = "spi", "sf", "axi";
 			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
 			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.46.1.824.gd892dcdcdd-goog


