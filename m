Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85936F532E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=; b=YZMx6+C07R1yFytKKTH6SCDrb5
	FmMMnPwS2avIkiLkexlZ3diVCCzzpMhdEQeSUjttRy3iUR0SEAcyUGyKwLpOGJnACTBfx3E+NdL8g
	YbbKDnbbfEWHI+m+q84XwLJv56kW3zyUJcJk+bd+19HGzxldUJtrzQAgzALA7/eazsDoiZST8tFfo
	NVUCty+RuCNC/0vHdNpxDsFH34+SpcjZul5rZFXBVn2pk7SUOJT3U4MlpF0B4QrwkM1lx3bhpOznX
	N5GTONfhBueUgk2nA5HQiOjF/6Dxe4Jsb8iIgfce4Kz0/gyqTmAWkX08g4/DSiqVttwDHu2TLarwZ
	xhhWXdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wU6-00000000v7o-2JCf;
	Tue, 24 Mar 2026 07:47:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wU2-00000000v6s-1mE3
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 07:47:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so2954480a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774338445; x=1774943245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=CeRkzRG1DhwFbwrEEr8JIPPYrshIuZWsPetowr+VkjOBn+rT/vEA1qmHcVNEq1Drbm
         8AUVqlR4G3IPAMdTgVfDsIHaF9jUsnk/fpeAmRscrwpvBD8o8EngABLqccHW5gAur9vO
         d4zeIE5xrAba6CLnq2BMEl/E836ywzKm2Zr/N3x4c5dBqN7c3V2bGBv1ZOkxF2Lujv9d
         ytLiswkjJwhzYmaM+JjR12z6Npcn+5Ug45tHZP244qImo/CSCPnoadDCn4TMfzB3Duyb
         Fi3peNRQyZej/9SwHoqjVVmVvNiu1MTZPYh7NZAO9dsHbgLD9YKH16qhjU/e46CsdHLd
         Tjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338445; x=1774943245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=LcbW+HInhoJytwcwB2f84m3PGIPKZQ4kORHfdBGJ4Xp0BETWeZpoKgE9q66wuAN2GV
         BL7E1JaQ5fRllFUumYiPayoWrfDI9rdDRBS2yA3nHO1rtFt7dZKRpN4WvwHHjSq7pT5d
         Ld3db/zYc898Y9bGDefJuRHVkSrXNL5kgd5nrMYGJLoyaitpJpNQnUmT6ElqP4O4FNeS
         d0IMR/z8fxmfEIE8PWPbp8mlEtDFUjhzSS4ZFN4vs2KQ/Q5pde0BXpI4vgM+Nd20vyuo
         ndsP9F3H82q3VfkNUnlLiG9CILYpfnsyO8rEJjs8Za9blicjgFokMfAQWcJL7YZP78dt
         0kEg==
X-Forwarded-Encrypted: i=1; AJvYcCWnDMFa8IGgTz+7LH6vfSTtz2pyUtWj5OmCI7e78d7NWNAllPXm4UYrZDO7KUdBBP77gdK5gJQ/npBowpi1+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zKC70ePvACuQSjNkPSnesvBVKQDechOu4HsOKqZlS7lH44Fv
	Zwp3mdpCZeE+Fib7z7EGu5zqAEWUWxVYkKVsX+aQ6xUfl3TvcL+CaKnF
X-Gm-Gg: ATEYQzwtdjgjI0aNrURYLptYSqz5gbt+0BghHx/d52AUI5iQrsL8A1ZMvALaHOcElQ2
	tGVL9tiZuigOiQPAwDLgK6qnx7Q0Qj6tCgmc3IhQ4wcTZyjVyUJ7jIj63uQM9Y95odEZ9KF3WUQ
	MKCuwPAcz6RdCPZdFgAoAg/CICbKc8VrVPktpRrA+7hp/zuFxfw/aq1FyFaSw+O2IRzK0iULu8W
	XbQrsittE5rqcasA092JZ8/t/UPUyS/tlqHn5XIYijgBMSADMm37GuVaLZft0xr7WxyX/8Jm81O
	GLghlpPiqCuf5LEEi0T8g/4sXCaQKNXG2VX8wE5VAya+Iwe5qOORVBFDEem/1oq25g1rE+vgSJd
	1SxlGpCKiGGl2TnUpWOhn0ac+IpMZr0d2LQQyPp4Pm5IBT3j5BUcLW0gXsv7WSFR9Nf7tFtu5HH
	tzCB7KRqhwaCVakCGsxK1ukIveXuvD
X-Received: by 2002:a17:90a:e70f:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35bd2c6efb8mr12454014a91.16.1774338445076;
        Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
Received: from snowman ([2401:4900:613d:9aee:633d:3c5a:a63:3067])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0316327esm1364059a91.12.2026.03.24.00.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:47:24 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH] dt-bindings: sound: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Tue, 24 Mar 2026 13:16:18 +0530
Message-ID: <20260324074618.145567-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_004726_458064_8E0D4A55 
X-CRM114-Status: GOOD (  12.07  )
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

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to YAML schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..05bb18006e08
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650 &rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0


