Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9751FD3B7E9
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=; b=04mU6QfTQ1/vNmUWAM78MhTrSV
	JqjL7YIp6FfxbWk1qTAs3mfNGTOuBQYKdMvLFkJE1OEYCFvf1qv4frrckNm4w68Kd8xKLwFETBOVq
	n6dzi6INfJG3Yh+FNtD2SHrLDdciNDe7v33k/bJuIpIpSfwQKaJxA7EYi7+VsP73HnitXqWP/MrWf
	yuaSyZHqmBw230i8fxqh27r2USG6yBxEtPzrVGXwTCZBGHdl+zu8IlxQJl5SBUwVIWr9A64wFRbqE
	vs00QxU8eEN9BDf80JD7Iyp2TxCY85KPrjrj76lVVbg+yPdnhup+4qgLjpZsHN/hhwiVNxfS/n3Bi
	6DpIp4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkR-0000000ClXC-3FDB;
	Mon, 08 Dec 2025 07:33:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkP-0000000ClUH-0T1i
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:30 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b80fed1505so4427720b3a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Dec 2025 23:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179208; x=1765784008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=;
        b=GsQHnBa0xM1dRwTgMiqCUsw361YT6PxFHgVV9cEjCOw8rMTevJkQVrHoApc2QJyKvz
         hqwK8Oe4dKreGrbQts/ujd8KEhBd87SAQ5aROyMDKIUH8uEaN6XqBEVMjnyJIHIkCuvK
         qeRT3WAzqCq+2CDMdsfPnMjDGjAyQx1xXRqf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179208; x=1765784008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=;
        b=nzRY6YpiUHV7GrwuLhg5XIderdgepnMx4eGzcgHWMLP6NbrzcH2/F+I8xg8h27HtHH
         ygshfqKWXPUWBwwYa8GhVbJCK5bTumCDFzwFbmsKeyX7SImA+b6/o7mh68W0S/ZG7iUA
         GHHbU1QBvBDzKaLhJC5Du0A/bvBKxetTd1Qrnr/s45Nc4tS38NftwnUTEQFdR/6mG0Sy
         yio4zT6g6enzKKGI9P6kK1kq2NrVMlMXGkS7Ftevs4vS3OAu7dcVtQSIaWLc80YqCVeU
         Y7e85VCy2k/7zgMKLe9eEHhxmlC0F+kV3jTP2NU5sDLDBbx387GLhXhf/dZ5RaZ/g56N
         VkYg==
X-Forwarded-Encrypted: i=1; AJvYcCXlmFGqRv5Q5fvf2CSxKesUusm8qDGVfdz9cN/2WPuPhCSKqpEW9M1ujr9ELTfodIGhwMrhMVdhyiAUki5GNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn+GA4FVEKguq61J/1YcBqyN3tNOgP/LsXD07c1s7A/3LVC9fq
	X1ZnNFwlD1DMWPwWINyN3/D9iIc/BDf6mysWR+YoAjbd6D3YWlb0bQKb9QXFQKoQbA==
X-Gm-Gg: ASbGncv/cgDSX+wp5VV+2FDkRscg38SgT1+2HFxfGbBtPq3Zrhs9xHuWgsNcaFXEZAo
	qWblLbZuX05M0v13vnx3k7PV6hDEXVQwMi6MxE7V+wEdz40TR//wjrD6dg+M+ukzmjzEiym0gc7
	oAdYJezDqPXhYt3EAEe9FyrtOGsAfnx+RDnD9gnT8wvR7/BXHVbYgkdP5ILEfQ2A9ys2elOS43B
	TKOI7IYbnzhtJNohY1v6R+GkViIZo9JA6iRAG/uIzuzWJGhkBlaaDHBDA8cfXaUF9Jl5yk4RZI3
	z3TDTMYg0X1evCCnD98rAZl2gGi1IGXBGAIIARjqqNlM0UfR12ybATFjj3dQhVNs4MGxF4YHCkQ
	NhSR+EfhPQwvqQkaYNTfCuLmBemgFtAcA/YoaCR102JDfTGjvnjpHumWul6tweO+FsyvymGTgze
	z0Qydx1bcXYtu5+J7TlX4nVqB9caP5E3M003T3PJf0fc6OngAY3bcGmDY9Ch2tdCEzfREl
X-Google-Smtp-Source: AGHT+IH03+VWpfw72JOyBUA2/6zHYSF0GZ6M4iF47ZhbShTJYVZdsObM/Okmg4+ncXpzCQ/1sI3Tkw==
X-Received: by 2002:a05:6a00:a8e:b0:7b7:8aad:99cc with SMTP id d2e1a72fcca58-7e8c0ad15ecmr6144301b3a.3.1765179208186;
        Sun, 07 Dec 2025 23:33:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:27 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] [EXAMPLE] arm64: dts: mediatek: ciri: Drop SKU-specific overlays
Date: Mon,  8 Dec 2025 15:33:04 +0800
Message-ID: <20251208073306.75279-4-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208073306.75279-1-wenst@chromium.org>
References: <20251208073306.75279-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233329_182398_C6543815 
X-CRM114-Status: GOOD (  18.43  )
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

The final SKU-specific overlays only set the top level board compatible
and model, but add nothing else. The specifics are not super important
to the kernel, and could be removed so we don't have to have so many
source files.

However, the ChromeOS bootloader (coreboot / depthcharge) selects the
device tree blob to load basd on the compatible string, so the mapping
from a SKU-specific compatible to a DTB (or a series of DTB/DTBOs) needs
to be maintained somewhere to build the FIT image.

Move the SKU-specific top level compatible strings to a separate file
stored with the device tree sources, and drop the SKU specific files.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
This is meant to serve as an example for dropping SKU-specific files
that just have specific identifiers that the kernel doesn't care about,
i.e. doesn't need to be present in the DTB itself, but need to be
preserved for other purposes.
---
 arch/arm64/boot/dts/mediatek/Makefile         | 24 +++------
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dtso | 11 ----
 arch/arm64/boot/dts/mediatek/mt8188.yaml      | 51 +++++++++++++++++++
 10 files changed, 59 insertions(+), 104 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.yaml

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 39a844386366..5123d15c62c1 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -89,36 +89,28 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 
 mt8188-geralt-ciri-sku0-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku0.dtbo
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo
 mt8188-geralt-ciri-sku1-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
-				mt8188-geralt-ciri-sku1.dtbo
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo
 mt8188-geralt-ciri-sku2-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
-				mt8188-geralt-ciri-sku2.dtbo
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo
 mt8188-geralt-ciri-sku3-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku3.dtbo
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo
 mt8188-geralt-ciri-sku4-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku4.dtbo
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo
 mt8188-geralt-ciri-sku5-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
-				mt8188-geralt-ciri-sku5.dtbo
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo
 mt8188-geralt-ciri-sku6-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
-				mt8188-geralt-ciri-sku6.dtbo
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo
 mt8188-geralt-ciri-sku7-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku7.dtbo
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo
 
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
deleted file mode 100644
index 884a7b2d943c..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2023 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku0 board";
-	compatible = "google,ciri-sku0", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
deleted file mode 100644
index d3ed6ea535d7..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2023 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku1 board";
-	compatible = "google,ciri-sku1", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
deleted file mode 100644
index 3f9d38bc2ad2..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku2 board";
-	compatible = "google,ciri-sku2", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
deleted file mode 100644
index e6a6f8f06141..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku3 board";
-	compatible = "google,ciri-sku3", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
deleted file mode 100644
index ee5b28c4ef00..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku4 board (rev4)";
-	compatible = "google,ciri-sku4", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
deleted file mode 100644
index ccf8d2f0eb70..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku5 board (rev4)";
-	compatible = "google,ciri-sku5", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
deleted file mode 100644
index 773c702b59d8..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku6 board (rev4)";
-	compatible = "google,ciri-sku6", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
deleted file mode 100644
index c22860eab9f8..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku7 board (rev4)";
-	compatible = "google,ciri-sku7", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.yaml b/arch/arm64/boot/dts/mediatek/mt8188.yaml
new file mode 100644
index 000000000000..7808ae20060f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+- dtb: mt8188-geralt-ciri-sku0.dtb
+  description: Google Ciri board SKU0
+  compatibles:
+    - google,ciri-sku0
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku1.dtb
+  description: Google Ciri board SKU1
+  compatibles:
+    - google,ciri-sku1
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku2.dtb
+  description: Google Ciri board SKU2
+  compatibles:
+    - google,ciri-sku2
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku3.dtb
+  description: Google Ciri board SKU3
+  compatibles:
+    - google,ciri-sku3
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku4.dtb
+  description: Google Ciri board SKU4
+  compatibles:
+    - google,ciri-sku4
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku5.dtb
+  description: Google Ciri board SKU5
+  compatibles:
+    - google,ciri-sku5
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku6.dtb
+  description: Google Ciri board SKU6
+  compatibles:
+    - google,ciri-sku6
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku7.dtb
+  description: Google Ciri board SKU7
+  compatibles:
+    - google,ciri-sku7
+    - google,ciri
+    - mediatek,mt8188
-- 
2.52.0.223.gf5cc29aaa4-goog


