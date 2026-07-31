Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C70C55167
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=; b=S47Stwe+Qh5x8xV7AxPzPreqHA
	M5MM8QMzGIiO2CuWn+rKP1BHVKUklL6B9jSVYZ8SgA54w5KYpKqh2aNim87WA/I/YzNKpS37vzHIO
	KOw/RyEumezqtLTytXPelCOkQUc50PJIrHEkC3wJmA4n5XHXr61HEOVG8sTL5YVxX7o88CoaFi/vU
	U8NmLknSwm/ua3uhYFGAHMnPCGkfubCpeHROvHrgt93yEljQFyfobCLCxJMR6agZ3Sw9rrRe9VaNd
	JZro/irncaqaaZ18vK80f1B3b5JI9Hu4qEsw38TPWTsNwqVQcajldaDe7IGPrZ+xet/P1MNwLUQob
	AIOSJczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgyI-0000000Bty6-1w5F;
	Fri, 31 Jul 2026 06:43:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy9-0000000BtsK-0mOg
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso333322f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480223; x=1786085023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=hF3Jtqbm1ipJG/qKQ4shAOnIK7E+ImOWv0LNvbPHYkp9vrXnLeLhm59b8D9qHfVNV4
         1vFxobZMZWGEmI93TAqGSPnrtyE8DKaxNuwqDxoHMebFpqLmlNYF1VFd7EWSCZVryd1e
         gY4X0RIzIyS7ovqbWc6W4DKJUBD5sWOBIHGJa++fXoN+xtRzW/hFOkvXR2IryXkuLDw0
         rF9jVS+wkdflui2BF/B38rt1TS0k+E2IMj8lL0DQDMkoWyv1Lu+ZzoMrRAIkYt9s6jRX
         JFxY+qIQuBKClsp78TNZp94m9I+wdi4uEE/lXa5lcNIW/X/F+8w+ty26OYx35Tmb/GHE
         sCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480223; x=1786085023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=hqb/e49K6IAe7S2a8gz1EE5rj4lf6AGY9N0DVNSR+AV6ssFCWqAZXtgNjDWjafiWCH
         qyhb/Y82aaIwUGvXCeTQC/z94uOdkDTGOyMKn41+MmSsD5Lwu/2YpkX0E3FJf0kn3859
         4F33xrKwr3aHO7k9wR2NKs1PIo8dTSqDZolAi5To3gZ2gkFkw+qBu5sBI0yP92+hZKk8
         n1dUu40BHcEPic4NnEyeJWffiaaW2y4BG2+LKMa4Gn3RoG60cnHnUkoyjHsSktqxaNlA
         eqYggsFNhPOPP0avEPLxjxW6Bby00lKrFY6qt+NjA+KWrz1zapzNKUskbqsH+1KVKoZo
         CWXA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo3lfhYE/G5pFywkUNS2DIxbKFveC0lhfOKGQn2zsrDexdwwUIC8XYSP+XNxoCuyoXUxrRC1doYScJXadMwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw53lF5sWlT+CctzYZXaKYtjhHP7Qf/YM2aBebYfdqhQRNJPf0
	vl4jF5IGLtYdoZ6Geow/HlP0/6KxkwmrjkDKGNTDrzeCm9v7uYY2sQx2
X-Gm-Gg: AR+sD116vICiZsKdKlJvomFBQX+quPHF7wqeV0w/K+ol8R1u2qzW+VvqsLMR1xn4uZh
	Se81s6JFyU2kc0H43N2KYLWw7IRqoFxaDAFVfybtg0JCU/YhKmzzi1Ml2+iRZaqLj/fNluq9Y8Z
	UqfWLe5bLz9ah0TqeclDKigcw1KzWIRQY/basKwWjhLk7aVWaLGSIuth+3+7sDc+06RV0lGmkg4
	wawj/FHDh1InS3IqWDW59AxbruAPdC5Tv0/LSKDaf9BkHHvnUWi5Wz1kmAv4ORw1149CqFY/GnR
	15Kk8o+8upocYqWynnjA0JR+6B2eorONQK4Zr+8BB6Vqv9+JqaU8+XLOHl881lZxRtLCN5GgsDV
	xH6OkPolHuR+VoAfC4cd2vTvkeOLWvntuNUcGtr6ffBRRkNF2tyHH5cj4pvWLy+YE2RWvAX/bVQ
	Fox1SNoQ/B7qRQ5b0RsQsN6JHuDjRBpeiWbbJ+F36V3jZ2Ajm9Q10WTj5tUANgZKdLiV19qqi2T
	QCSUbVpEgcPMIE+1B8KJVJ4oJSo28RHgIymoJ5dmSKPvYVG8aihfQ==
X-Received: by 2002:a5d:5f48:0:b0:47f:93d8:f4c6 with SMTP id ffacd0b85a97d-47fd2b716dbmr1962060f8f.59.1785480223099;
        Thu, 30 Jul 2026 23:43:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri, 31 Jul 2026 08:43:22 +0200
Message-ID: <20260731064326.2284228-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234345_249062_4CB11AF2 
X-CRM114-Status: GOOD (  13.84  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960 i2c Codec
and AFE as platform driver.

This gives example on how to define and connect the AFE driver with the
WM8960 for full functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


