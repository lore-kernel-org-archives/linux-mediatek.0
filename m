Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C01EC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qq9SUUh2shlwi+HSCpikmSF5BpTnfRa+mJbDP7CI3P4=; b=CHecH+WNxFwm93Ojd4zJQJaHZQ
	dEpuu+jZKmqeoMT+vpQycpGRjeQn4096h066ayvnlXMh4dBjEl+FaYXkF8VSw1EHUp1PzGvNHoc3L
	ruqxuTaCf1xL3Z+pLh1blu9jfMKF05OkkJmo94bdMbut5wwggDN6uo2gDyg6JSMY5v+f6jIKhybti
	3KS2LEs/+wF3BstDoTbqXYzGfn+5r+i+6amwfhevjklVxuNpfv7wWFFy2+eOyTft3nVikzsm/F7n/
	3EUB/A85GO0vQCARahzXDYnIudxla0J0i4r63tBlEG2X8IV/YJCVBpbQlUJGrvpJ0I1mVaudmMD/7
	Z1ORhBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru89w-00000001IcG-3L4d;
	Tue, 09 Apr 2024 09:52:56 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru89r-00000001IaV-1cwN
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 09:52:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso3773357b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712656365; x=1713261165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq9SUUh2shlwi+HSCpikmSF5BpTnfRa+mJbDP7CI3P4=;
        b=OoNSDLDC5KW37iTnpB86bxjiUwIKbotUmT3DotWKpav0H8Vppxhva5r4xLHJl5t6Bd
         ZkaOIZNRxPr7mVDZv4c7oWlpm4AEi72WnIRnOSuQjYF1O6zHJkHrrVXyOHaqCdeq0J21
         K1G/OcsQ0JARTISfu4A5yXahPGCTfTUMp9fWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656365; x=1713261165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq9SUUh2shlwi+HSCpikmSF5BpTnfRa+mJbDP7CI3P4=;
        b=kFHmk+uRiupnnnobC1EMYTYdhAJgNP5xUXwePoGpR1GuWJf2brwhEXkZSFUfyBDEtR
         sjyORd8ct+SJCYxSDjOdK+4MR1aevsjzmhLBYHqfwoNlLoK8MG1ZqA5OsXcvkUxz8s0P
         gb9NM00CjqJE4IbT3wD2UvQKPQ3JNY1S//s+Z5QpegRaLrPJ16o0YB98CdVrkqr/IK/u
         Mx6uVRngWdm4A6n3uYRSef4U/7Y2U0FAWS3SKuLvCpQDuEvKo8xR6hcqe8PbPoXXaJeM
         JGUTyDvSkZ4Fz+mmy1Anl1SQYjxGC0JkClhxVFwOZgIG43Pb/MJDbDN6Um+37/i7fA+2
         h9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zvFrMtiye60NsDkT9hIQl+I8Xojg9sYTjtk+jXc1x3OYKdjcN30eJlzbknaBH8sTrA+e/5pHW0KWcGzt1MG+vE7YyyrUYF9wu8R9ygt5R88p
X-Gm-Message-State: AOJu0YxeIvM9lP6YmAXEyNjWoWiK54OBDMnRB5ocU654IMUYLRkxZwEt
	UcUysi8lEhurWfn6Gq3dR4CnifC5on7Te/hVrMWAUlRDD2WXevENQZ8AnbmnEQ==
X-Google-Smtp-Source: AGHT+IHTIYMFgIsIpfetDHfBOIWNBd2HP00jBw0bY4nV4zUEdvlm/8j6ySitJ5LHkNkBYsJJiw13jw==
X-Received: by 2002:a05:6a00:1782:b0:6ed:6b11:4076 with SMTP id s2-20020a056a00178200b006ed6b114076mr3371667pfg.12.1712656365506;
        Tue, 09 Apr 2024 02:52:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:cf76:4647:8bd3:d341])
        by smtp.gmail.com with ESMTPSA id h18-20020aa786d2000000b006ead792b6f2sm7931509pfo.1.2024.04.09.02.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:52:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dianders@chromium.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC] arm64: dts: mediatek: mt8183-kodama: Split into base and overlays
Date: Tue,  9 Apr 2024 17:52:38 +0800
Message-ID: <20240409095239.627000-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_025252_623251_1A3945D8 
X-CRM114-Status: GOOD (  18.17  )
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

All the SKUs of Kodama share much of their .dts, as evident of the
inclusion of a common .dtsi file. However this scheme builds each
.dtb file as a complete device tree.

To deduplicate this, make the common .dtsi file a .dts file, and the
SKU specific .dts files into .dtso overlay source files. Have the build
system assemble the SKU specific .dtb files from these components.

The final composite .dtb files increase in size by around 54 kB, or 22.5%,
due to the inclusion of symbols and fixup tables, and extra phandle
properties. This could be slightly reduced by dropping the symbol and
fixup tables after the overlays are fully applied if desired.

However if the bootloader can assemble the end .dtb using the base .dtb
and overlays, and only those are counted, then the combined size
decreases by around 165 kB, or 68.7%.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Hi,

This is part of the work I'm looking into and will present at EOSS 2024
in Seattle [1].

The idea is to reorganize device trees so that devices within a common
family, instead of having a common .dtsi file, will share a base DTB
and apply one or more overlays on top. This allows an upstream [2] or
downstream [3] bundling script to be able to deduplicate the base DTB
and get some space savings, however minor they are compared to the
kernel binary executable.

This patch gives a simple conversion, but we could even look into
converting the entire MT8183 Kukui family, which are all based on the
"Kukui" hardware reference design.

There are some issues, hence the RFC:

1. The base .dtb doesn't have a valid board compatible string sequence
   yet. Suppose we used the sequence

     "google,kodama", "mediatek,mt8183"

   for the base .dtb in this conversion, would that be acceptable? The
   base .dtb would act like a fallback.

2. The composite .dtb files grow in size substantially, due to the base
   .dtb file being built with overlay support. The symbols and fixup
   tables could be trimmed out with `fdtput`, but there will still be
   extra phandles, and also nodes with /omit-if-no-ref/ that would
   have been removed.
   For this I could maybe come up with a program to minify the DTB. That
   would also work for existing composite .dtb files in-tree.

3. Such a scheme would require more awareness on the maintainer's part,
   and of the .dtbo authors. The maintainer needs to be aware of how
   the composite .dtb files are assembled. The authors need to know that
   certain constructs, such as /delete-property/ or /delete-node/, won't
   work.

[1] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-on-device-tree-platforms-chen-yu-tsai-google-llc
[2] https://lore.kernel.org/linux-arm-kernel/20240329032836.141899-1-sjg@chromium.org/
[3] https://crrev.com/c/5412876

 arch/arm64/boot/dts/mediatek/Makefile                       | 6 ++++++
 ...ukui-kodama-sku16.dts => mt8183-kukui-kodama-sku16.dtso} | 4 ++--
 ...ui-kodama-sku272.dts => mt8183-kukui-kodama-sku272.dtso} | 4 ++--
 ...ui-kodama-sku288.dts => mt8183-kukui-kodama-sku288.dtso} | 4 ++--
 ...ukui-kodama-sku32.dts => mt8183-kukui-kodama-sku32.dtso} | 4 ++--
 .../{mt8183-kukui-kodama.dtsi => mt8183-kukui-kodama.dts}   | 0
 6 files changed, 14 insertions(+), 8 deletions(-)
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-kodama-sku16.dts => mt8183-kukui-kodama-sku16.dtso} (90%)
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-kodama-sku272.dts => mt8183-kukui-kodama-sku272.dtso} (90%)
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-kodama-sku288.dts => mt8183-kukui-kodama-sku288.dtso} (90%)
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-kodama-sku32.dts => mt8183-kukui-kodama-sku32.dtso} (90%)
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-kodama.dtsi => mt8183-kukui-kodama.dts} (100%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 9234dadfe1ad..6986d7a2efaa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -46,6 +46,12 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku38.dtb
+
+mt8183-kukui-kodama-sku16-dtbs := mt8183-kukui-kodama.dtb mt8183-kukui-kodama-sku16.dtbo
+mt8183-kukui-kodama-sku272-dtbs := mt8183-kukui-kodama.dtb mt8183-kukui-kodama-sku272.dtbo
+mt8183-kukui-kodama-sku288-dtbs := mt8183-kukui-kodama.dtb mt8183-kukui-kodama-sku288.dtbo
+mt8183-kukui-kodama-sku32-dtbs := mt8183-kukui-kodama.dtb mt8183-kukui-kodama-sku32.dtbo
+
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtso
similarity index 90%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtso
index 7213cdcca612..20675de68823 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtso
@@ -8,9 +8,9 @@
  */
 
 /dts-v1/;
-#include "mt8183-kukui-kodama.dtsi"
+/plugin/;
 
-/ {
+&{/} {
 	model = "MediaTek kodama sku16 board";
 	chassis-type = "tablet";
 	compatible = "google,kodama-sku16", "google,kodama", "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtso
similarity index 90%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtso
index bbf0cd1aa66d..46ab97a18003 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtso
@@ -8,9 +8,9 @@
  */
 
 /dts-v1/;
-#include "mt8183-kukui-kodama.dtsi"
+/plugin/;
 
-/ {
+&{/} {
 	model = "MediaTek kodama sku272 board";
 	chassis-type = "tablet";
 	compatible = "google,kodama-sku272", "google,kodama", "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtso
similarity index 90%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtso
index a429ffeac3bd..e27b56f1826d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtso
@@ -8,9 +8,9 @@
  */
 
 /dts-v1/;
-#include "mt8183-kukui-kodama.dtsi"
+/plugin/;
 
-/ {
+&{/} {
 	model = "MediaTek kodama sku288 board";
 	chassis-type = "tablet";
 	compatible = "google,kodama-sku288", "google,kodama", "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtso
similarity index 90%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtso
index 5a416143b4a0..d9a13ff7abf2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtso
@@ -8,9 +8,9 @@
  */
 
 /dts-v1/;
-#include "mt8183-kukui-kodama.dtsi"
+/plugin/;
 
-/ {
+&{/} {
 	model = "MediaTek kodama sku32 board";
 	chassis-type = "tablet";
 	compatible = "google,kodama-sku32", "google,kodama", "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dts
similarity index 100%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dts
-- 
2.44.0.478.gd926399ef9-goog


