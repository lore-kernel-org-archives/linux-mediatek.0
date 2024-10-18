Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CDD2F7E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2sw2cnvD53O5L8zKGOZV5sbNVDe/+IEjxX86rJilqAk=; b=ID0ICSYtXVPv1/oMnvqsYsCR/+
	j5DGUmoW2tic1DmTsqL6Yc4EKj9azWPk7073dKbsL7NiUjCfigzMRRlwV2F9yoN10hBP1YmJR9FnJ
	TshyO0dNdrevbINrMDi1VZAkQQU9vT9KMzqsSv6kgSBW0eAlTN64/QrQQonqDC21IiV44h7Fofrpw
	8KG9IILy3xRbwS+CnkqCxEi3E0ZhZT8mLXemFnyjWAbnokQbzr7m65AWHvArxse8E5+2gaHFgVtN7
	lI6n5gCnyZFXu6MRT4m015l+ckzm96VvNGU5Ao4q0DNei+7P+pdDei85iSgiHd8BjzeQyWrP9EkFV
	uBUBL2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iWY-0000000Hapi-11sE;
	Fri, 18 Oct 2024 08:39:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iEf-0000000HUYp-3eLp
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 08:21:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso1586384a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729239685; x=1729844485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sw2cnvD53O5L8zKGOZV5sbNVDe/+IEjxX86rJilqAk=;
        b=jESRMy+8dBW2vizuusWPxBS0kyNvyRNb/Q6Z2nbPKR0wq3bj7gm7w8NZ2JUScZOpXk
         L9zvO6MZFcYGNET5PK4rPHQskWIPFVJ3iDgpFegAlbzaAfkQ8XTGea2Wl4x6eux/nJbD
         1qk2Ly0ZKS7k8E9z68DufEJQ1Fj0VUcaa2770=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239685; x=1729844485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sw2cnvD53O5L8zKGOZV5sbNVDe/+IEjxX86rJilqAk=;
        b=MWfYF0zDmWkyhQCUI1/G6wfcFhhgztD+uPwD0OuLw97c4RIMyaCjwtHvzrcz1i2lcc
         VgdKOec73KRDdefy0Xu5XnkTYWZ5WA6eZ3G+6w6nbbW5l5VTS1yiMht07tleTLKRq/DP
         uma+cpMtT4QZLvOTLx1k+C6U6YwNsat4cjyrdSZiepQvhmwnvAnJs/BN8F7dxuVylrU2
         oGF/u/5ioMw8lyro1ioOMVMYJkmIWaPJep18T00qaVQ5oRKmgRVdf7+LZDlb67ekkq4V
         wf3CmPoZuDI7z7TQKwp4Sx0YjBTPQmQXdmu3NakTg8MYeLfphzZ4DKblRTCwGqNnqiPJ
         JEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGWXlLqO75dQM4cEnUMWYck/rnJPYt4f0Dx20vEbXcNPfpX+XefNkRrIXjji4QUvPfLYLB+y3zam5XX7sdOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4cqzhOX02K0cJXNuE1hyTi6Tw6M6BuYS+PK8YjMZNTuOnGnAO
	nGfV3YR3CmZBDIqBrQuEJzKDe7fpScbEgU/3PF853zY7ttHK3ggd3B3IP+xjPg==
X-Google-Smtp-Source: AGHT+IFOJPmAyaUnxkdtc6GJUuyr1a/qUKidE/urORfJ7bfMi/Vu+97DNhgccSxR9H9P6CXOMHrp/w==
X-Received: by 2002:a17:90b:814:b0:2e2:a96c:f00d with SMTP id 98e67ed59e1d1-2e56185d15bmr1863982a91.21.1729239684929;
        Fri, 18 Oct 2024 01:21:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5e77:354e:2385:7baa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55da79303sm1315149a91.52.2024.10.18.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:21:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge speaker codec nodes
Date: Fri, 18 Oct 2024 16:21:11 +0800
Message-ID: <20241018082113.1297268-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_012125_938854_5CF537F3 
X-CRM114-Status: GOOD (  14.89  )
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

The Voltorb device uses a speaker codec different from the original
Corsola device. When the Voltorb device tree was first added, the new
codec was added as a separate node when it should have just replaced the
existing one.

Merge the two nodes. The only differences are the compatible string and
the GPIO line property name. This keeps the device node path for the
speaker codec the same across the MT8186 Chromebook line. Also rename
the related labels and node names from having rt1019p to speaker codec.

Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is technically not a fix, but having the same device tree structure
in stable kernels would be more consistent for consumers of the device
tree. Hence the request for a stable backport.

Changes since v1:
- Dropped Fixes tag, since this is technically a cleanup, not a fix
- Rename existing rt1019p related node names and labels to the generic
  "speaker codec" name
---
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 21 +++++--------------
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  8 +++----
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index 52ec58128d56..b495a241b443 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -10,12 +10,6 @@
 
 / {
 	chassis-type = "laptop";
-
-	max98360a: max98360a {
-		compatible = "maxim,max98360a";
-		sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
-		#sound-dai-cells = <0>;
-	};
 };
 
 &cpu6 {
@@ -59,19 +53,14 @@ &cluster1_opp_15 {
 	opp-hz = /bits/ 64 <2200000000>;
 };
 
-&rt1019p{
-	status = "disabled";
-};
-
 &sound {
 	compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
-	status = "okay";
+};
 
-	spk-hdmi-playback-dai-link {
-		codec {
-			sound-dai = <&it6505dptx>, <&max98360a>;
-		};
-	};
+&speaker_codec {
+	compatible = "maxim,max98360a";
+	sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+	/delete-property/ sdb-gpios;
 };
 
 &spmi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index c7580ac1e2d4..cf288fe7a238 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -259,15 +259,15 @@ spk-hdmi-playback-dai-link {
 			mediatek,clk-provider = "cpu";
 			/* RT1019P and IT6505 connected to the same I2S line */
 			codec {
-				sound-dai = <&it6505dptx>, <&rt1019p>;
+				sound-dai = <&it6505dptx>, <&speaker_codec>;
 			};
 		};
 	};
 
-	rt1019p: speaker-codec {
+	speaker_codec: speaker-codec {
 		compatible = "realtek,rt1019p";
 		pinctrl-names = "default";
-		pinctrl-0 = <&rt1019p_pins_default>;
+		pinctrl-0 = <&speaker_codec_pins_default>;
 		#sound-dai-cells = <0>;
 		sdb-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
 	};
@@ -1195,7 +1195,7 @@ pins {
 		};
 	};
 
-	rt1019p_pins_default: rt1019p-default-pins {
+	speaker_codec_pins_default: speaker-codec-default-pins {
 		pins-sdb {
 			pinmux = <PINMUX_GPIO150__FUNC_GPIO150>;
 			output-low;
-- 
2.47.0.rc1.288.g06298d1525-goog


