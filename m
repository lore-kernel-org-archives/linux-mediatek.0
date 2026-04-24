Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A35FF8844
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=; b=V6LyQZNKH9pk8UWY6qTNISvKOo
	5czrMkeQTtaXrMeDnHSY8o0iP6AkK9/s5nnrwl4IyD3THqIfik3A8DD2bFPKPiq3GByrWADPalV5x
	FHkhm19nRldwgCXa5smuZ3TU1OQgRBJnfZQCygR5/bB+nWkWDLLF+02AN5zEGF3jkM5SHCldbhBVD
	lhBl5tXR2LeMwWxoGjuX6Q1KJUIlEQq8hgnxXst4Cs3OoomA07V6IJ76psP2jyz5qd5NhsVtb+Zt9
	5TA+qz3nT9nECemF9jlwFo6l8w/w+uCAnoeVI9RoS8Mr03XzGeregPq30LCenIQ60zCYkOw9xAs1w
	UqhE29Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNgg-0000000Dkro-01SG;
	Fri, 24 Apr 2026 21:03:46 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNgc-0000000Dkr3-2xmw
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 21:03:43 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso3696247a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777064621; x=1777669421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=ET3N5o8nBK40cyDmB+D5yB0kuOudwv/TQ4vfUl4GTLwYJ5+g+wGKS8pS+vl9plaa9W
         Cc1RWFPwrFk1VL1mFTrsbKnL6xfHTBMCX8i1NsvziTU6xUmzMu70uwiAuY9054Qc3KE4
         ahLqL2/MavaXhGaJ9Hg9sXnZJVD5+FSX0wAPOR4nVDvwuKY9/qiFR+pFhrXjCuz2UcVo
         khu7/e7aj/gGOEdqRL6H0SYEoIs/8Ve8DdvhwLT/99Wqkyamc44MY0IQ5BVEfHFC6aKj
         WXovJ/46oUL9QTDyQAbnZHHA3opGrzjkY3QKHetlGTp6S2xthKINL9hKT/f12WcRHGyF
         uE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064621; x=1777669421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=Dtfw3ldzlIyk0cFFf4vLTGv0T+goiu1LvtwWT+Hw69HtZtwGnMbJihFSm2ar4A2qUe
         Qd3YPGIBW/Qid8H9RrD1MaoN6/a7VPzq+rr2dsbIpEFGw0i5Yr4Sw3gSUf7c2QceqBqB
         vhQxZsUOF+mWDNdojhh47czxAx7b3FuplPOchjwFZ+Zn6Gxuiti3z+6hCwLIkGnrctUB
         G/cao+5Ss3ZnUaOgnWKPUlttjlfsa5lo6ZnAy2sjRt5PXgmXUwkQ6MWUa7ofyKczE+b4
         hsFEHICsl9BUaONfHnhUimmRxRFJpdwEw3mkop6ooSVdWjyPGNRjpfKu6amLToJtktAh
         3B9A==
X-Forwarded-Encrypted: i=1; AFNElJ8YjB8QBibDNOleq3nYOr3IXtFbVauf9GYb6MI7xnW2IBqmIpID/dJEteKs//4LWi6ysHDKc4F4Oy+6GJXN9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkRSoC1qJxvWosasNiRqX8A8gC8AI7jFFhC67cRUEXJt4n2Eg1
	eh6nBaqZGKnk/0CmT54wKCHA1YT+nxTgEyyrulaBrfBxd/desVTGikCG
X-Gm-Gg: AeBDiesNJCiyTN+WsiEs0sLjBB/WrBcfFE8pibc6GaVp2HVJjipqcf+akOjwh1CglFz
	KxbEsUkbwGnNwaipMV2IS45QthtQWEygR4zMiry+GHX1JCJKNcLBMSFCR8Dmjdo3WCh2KI825AT
	ZZukkFsKeNQ7oQm3wQBti/GqS9Y/nR8fWKsOyCF5dUbgs8QZjgm8qnG5ejLDmh+S5KQ3JbXFP5q
	ElOs85rSOiCOcq2w3RFkxaFuV4Ave2dI2cdoB+jBlFeNz2kL70EMAYif0GhURtO5R5FBuYK0fEL
	pxGHtymxdwOi35yMiL0mfn8tfShqyF0h5TvA8Rr5fDhzDKbv1vfJZh5khttiIskJQ0G0OByfr7f
	9LVrOuF52X2iy/OmjQeHuHvfbrdv4+5h1znZGnUJ1teIluxMPEFjFs1OKUuIs3b/+nL8x8/i16o
	qTpfvvyLMJSIyW9Q0fcXJZb/G7lvtqDRNBKf8TFtgrJsXKZuxv8t/HdUqMT24tIBQYYV8WJyB8K
	gGOZg==
X-Received: by 2002:a17:902:aa06:b0:2b4:6664:97d4 with SMTP id d9443c01a7336-2b5f9f83295mr238594565ad.24.1777064621178;
        Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm250554025ad.53.2026.04.24.14.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 14:03:40 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Fri, 24 Apr 2026 21:03:02 +0000
Message-ID: <20260424210302.39972-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_140342_749156_67DE5AE8 
X-CRM114-Status: GOOD (  11.07  )
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

Convert MediaTek MT6351 Audio CODEC bindings from text format to
YAML schema to enable dtbs_check validation.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../bindings/sound/mediatek,mt6351-sound.yaml | 32 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 ----------
 2 files changed, 32 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..f9fab8962325
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6351-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6351 Audio CODEC
+
+maintainers:
+  - KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+
+description:
+  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
+  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6351-sound
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6351.txt b/Documentation/devicetree/bindings/sound/mt6351.txt
deleted file mode 100644
index 7fb2cb99245e..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6351.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Mediatek MT6351 Audio Codec
-
-The communication between MT6351 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible : "mediatek,mt6351-sound".
-
-Example:
-
-mt6351_snd {
-	compatible = "mediatek,mt6351-sound";
-};
-- 
2.43.0


