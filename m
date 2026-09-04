Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342CAC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 22:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=; b=2FCqE0v/3ouMsEgfPaPUKuVz+h
	bgH2nRmXhcsMz6eYGvHboLzbvMmR+RT4298EhF1cgQ9MGIQBBCMK/Bff1Ymz+aaue4pqOIjCblhTK
	Qjx3ct4uEe+O6M0PC15n3U8ZHql3Ef6RgWNnEqGrFyGutfSZKSSfJ9ErCiCFeLWrWT8Xhwa+VHkse
	u4gMbw8OVVv+QdocwN89WybgoXZTvv3617UYmyHq1AqV/7rOumi54KUw6P+nPkR5IuJ5IIRG3HOmF
	5w5iWMBW3m2NuSFH6MdEJ5wyGWdRaq4s85ALS1b5zMcaBqehsGwE7j9OdgDKCOMA1Z45/2Uv+798p
	CjfoRKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cqN-00000003RVS-2sjQ;
	Fri, 04 Sep 2026 22:57:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cqK-00000003RUb-3GKG
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 22:57:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1364315a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788562626; x=1789167426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=b8iwMMhAgC1jWHZ+QAPT1Mz827JkWiVzD97HUMasoC7j3G2h7mFLTcVcbYJqgWgHAR
         i2ov+WNmpMwokHUBo1v4tnxwO77Ne6+dIAi8nrdvR+MTRuQ3glIPyEGkX0kaTAwH3I3P
         lDBNPGKOMSiJwtOtRckS6uED+nrW8yP1plLdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562626; x=1789167426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=L2t/wTfnO2C2XndKZyulDh9vDYvhH5VvgcxFNbxnEE6OBksPcz2BGdf+VZsjoCFUGr
         och3wsWP7LghzwWsB9X16vVXmAyVUZY+ZxkVkI/JQcTU2+6u25bun0rJR5y3XLd7Dxo5
         JhVFlcyY9yDQElL+h0YIJTXAkQKSw7kNbF86xuCeusuz1w3tWCzBdDWpW+NuSTX0jkvJ
         +Nq+oFNmsAgy5WzIvanExKWqB4QZ/5ckk0PeKSoBD2yCkvHeKANmTTFDV+Uv3vN0xwRJ
         ziFbM7UxKHPnZmsNvqWUmoV+jk9N73MQWrz3qEzNj3Z8yKaAfUktAR6moPQhSrSP2UGZ
         akqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1ugEr59rj8XG7EPkJ6mc/vG9vcjkGUrAQ1NkcK4h8t/ogTg2KUmhW6ycMVqjgRLMos5okDSTkc9IGSGe65w==@lists.infradead.org
X-Gm-Message-State: AFuF++m8uKknCmZFSs5Bb9ohEHfHiy3K2Ghf1sS5WrWxEGArE07ykanW
	7nJgU+o1kO7j8dXmjYcBY1Crk37enc0boba4uRiK/Lh7F7AS/HyiP01iTUt652VHsg==
X-Gm-Gg: AYBFou2A0e2zKJShYkbV29Z+4TXv7sVQ78X9fGcOBQKS+Lvo7Oapaqe6BUjzDVjxPKe
	HvHRSCN5+myaKW9sWzkvt2F/l8LqEINP6J5Oo/KnPJuISVf0pGh0nB7QBqj6iM6UMIdns81vIV8
	BsZ0soviDjPbn6wzBC9XSu6k/sRBgAjvwNn45m9eFcyzwdF4Tb97RDwPugZ7rcRIo/9V1/ru0zw
	8wTk0bAviKb5q4s4KJzSOwi3kqMrboT8AmB3A3voOdaYs27EVFxJbI7DHL4I5MgqdnPE1aUav9X
	5mYVJK4DkIyDonIFAj2xwvcdEGjnVIQmHDexBxKhwQQSaz2haeeroeeUI8xQmGl7CW6d7T32Ojl
	cFJ8ZYRWhBOyNF7RJzFsMHUTNOZs4wkZgzOXFDdFRCi1xs6mtfrU5MttiV2LQNP3+sj6wUsZpHE
	k5IuH6qd0iQiUtJ7/P/dIRIdM7oBL7SiYWO+UUvChLhr2VXl6mvWYZsD7VB73FTffoBcdcnFa6i
	j3vmzC+64xsp4omsWeQLSFyUqzQLBM124TU1oc=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr13463573a91.16.1788562625925;
        Fri, 04 Sep 2026 15:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339aa37dbdsm8157345eec.11.2026.09.04.15.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:57:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 15:56:22 -0700
Message-ID: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_155708_849940_695ED18C 
X-CRM114-Status: GOOD (  15.58  )
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
index 69cab9f9c530..fa359440ed60 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
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


