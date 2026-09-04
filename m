Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D0C79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CoP3yRaiFCSXh1sZA3gfI7CK30OHycO7b/XTPFpuSM4=; b=EgBlcbGOSjHSDUyu/IH/Q9fCxZ
	srtZu5wyjXhbq6SqjkgRduC57rF1K039hViTpZbCUf6lEvlB4FvU7JTJ0RcWa/w+X510E4yWtHq5h
	mTVe5weRPkkyqcTb2zYhJveGtqouh5NHi25fHw7w5FrocA8bqUc/hoXhln6iIw+ZJ7bG0Z8m3nb4g
	IMSWy+TN8xGcPiT5GF/7T3BGckl5t+llDtfChzuz6C5mI1qfwHyXSWgwpQSFAI5mxXtdqdpjHSmCv
	e1GViV3txXOD2SK+H9ZpG1m6qnGI/gCrBZ55o6BONjidmv+IHGVxETYZprRJsoTPHe4RchQeav5GN
	NgthXDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dOh-00000003TdO-2pH8;
	Fri, 04 Sep 2026 23:32:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dOe-00000003Tbz-2ERS
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 23:32:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1525052a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788564756; x=1789169556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoP3yRaiFCSXh1sZA3gfI7CK30OHycO7b/XTPFpuSM4=;
        b=OGOuHaMtse0VmuWqO7VKSpDM4b/dYz8dsHuGfUflD5yrKltN68rjh8DFl+XoCOEXJa
         hrnYi3gJkroH4QGxksELstvxwISRsUzedoft+Q1FwKebi3qVlYTMWKXwKxcDn6M6u1a6
         bOZ+z9/hdpaOsxKWWHMB0M83FZG/OIhXUAYpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564756; x=1789169556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoP3yRaiFCSXh1sZA3gfI7CK30OHycO7b/XTPFpuSM4=;
        b=SFMvN3LBdemRkZ+aUlOfQ5aYj6b/0ZdvCy8Dj3hhQ2JqBoTCqfnP0W5v9aLvrIKa/f
         sSXg4fyuyio6fm6mBpK+ONs+so677pRhnCSYpXBRarsPJGb57XfsbYPwqsNm8wog/igs
         oQc6/9m2rk/MgMxJgVnsmpY8QnKmfABr2de5D7BmxPJd/UYZT1govwcbSCOO1nG7uALL
         HID6cjKcIcv9U1WtfnCayqPZf04m45WoXKRdMLpfGfh1e+BBkaUSsq/hVvuEGujp/k5O
         k2pOa9NYbnppNxobRIVfIlEGGS9UW91W0pDcPd6wBKXkmgoLHIL4siYdw6EQliMh1r5T
         gTdw==
X-Forwarded-Encrypted: i=1; AKwUvBwNdJQxUwphSn0+NYe7UBy0OUr/xGggSo3f1EdR/AcrNpcsZtTexSGsAAQvU48TuYZ5fPqfGPa35zQ8ZPKGcw==@lists.infradead.org
X-Gm-Message-State: AFuF++lusupkm7D7FJGY/xCgNVdJXQpsiKBPzlM91NTc9wylkh2GZU6E
	9Or8DFLdXmjxW8o+D5+XrMnbwguzRZ0XW6KcU9Xvc9j5YOLCRWytqJMY/zhKt23m4g==
X-Gm-Gg: AYBFou0d6MQCtUXzsqmz+3qQGJrLt/YnjVgsQEJmly9BsDEaqNBE92vP3wuKFdZrqti
	+4NXApTqeMCf4zrrfN7wSX3Z18cgM9/hwCHFvrNWku4eE5STbnFH+LZsVJPiWYkpiXsRf/P1skT
	xW/zMkCe0rsaXnKAlXxO2xEHcU959NzfZOlMzAYAat49TKzdih4i1QIS57SMCc5gKiD+osSj520
	naHewCVuwI8wkTE+AHx6n2XUjhQHqL1iEfPie39h54WeTDFre9ZRCGfCCa/n9aqKhYe9/0+omDL
	c0vWZyED0cbgTV0hz+lLg8VWRQev6XgKh4YuXdFHsjdBaCPqFYqZaAUpYrtMSBredigQhtKcLeX
	kkaVULz5GOCSg3+kapPHyWHHHXVvHZSCK/8Lsrjj6wbXi4POHq3k8rwA/t33TA0GHIrinYWBUMH
	9HazcOhP7PZRrg0EgpTYCQDvNibOGuTiVezffsZpCpCZRjwocstmAYY+bRDYb6y2blchLsVVAJy
	Fv00I3U/J6mh+5IMEcCcsfryIITgvhgDvtk
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr14333919a91.1.1788564755684;
        Fri, 04 Sep 2026 16:32:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:1121:7bb4:46a7:263])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339885ca07sm10975102eec.1.2026.09.04.16.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 16:32:34 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v3] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 16:31:44 -0700
Message-ID: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_163236_616770_7C56D798 
X-CRM114-Status: GOOD (  15.88  )
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

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1 series:
https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/

There is a little more background in the v1 cover letter. I didn't feel
like a new cover letter was needed for a single patch-resend.

Changes in v3:
 * fix the syntax (build error) in mt8183-kukui.dtsi. Oops. (Sorry, I
   was testing other platforms for v1, and not ARCH_MEDIATEK.)

Changes in v2:
 * resent separately from the series, since the rest were applied by
   their maintainers
 * trim other-arch maintainers from CC list
 * Add Reviewed-by
 * Add missing linux-mediatek@lists.infradead.org Cc. It claims to be
   moderated, and its "join" seems broken, so I'll probably get bounced.
   (https://lists.openwrt.org/mailman/subscribe/linux-mediatek is
   disabled, and linux-mediatek-join@lists.openwrt.org gives me error 550)
 * otherwise, no change from v1

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 69cab9f9c530..acd5f59b0d4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..c65805f2a7e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 40d34b16dc80..e8ebbb74987f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..f06ca2bc165d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.55.0.979.g7e5102b832-goog


