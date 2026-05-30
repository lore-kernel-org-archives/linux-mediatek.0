Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38848CD6E49
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2026 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=; b=n3kTVczoEocQskNGfETiI1OVww
	OUZYRrhaBIihFgJhabqRDu4HhmPeOtE8fkUDau3ldCPcpqQW3ZtAO1UhzPsiiLKYJEyXfJt3pICeb
	Q8qCH4yhsehXu4BpE/CdPqv/MvE8/NCkfY6R53PaUk/PNSsNVNHnw7I/Pte2VZ0V+l59zAw5FYdNZ
	hiPADkKv0p+YsF0h+GlsaLTnkQo94sT5bI6HvC+yWfe3RqgJYtaeLkeFJvS/SkODhKqfPbKtqQF+H
	4NV1ZAJFRQWcz3Sf9QPyz9I8iGzfQjXED3/xq5a3spEKt6e22aKjkG/fgxr06cqvgyn3VbIGgvppA
	WTzuK9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8v-00000008r9h-1ZSV;
	Sat, 30 May 2026 14:58:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8k-00000008qz7-1qOJ
	for linux-mediatek@lists.infradead.org;
	Sat, 30 May 2026 14:58:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45efb698ef2so169363f8f.3
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153097; x=1780757897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=RiEqzjHimz+wvx60mXadJ/kKHFOlJm+s6ykyHwvhDwMvPAFEI+FvEHYWrEqWf38Tez
         Sxe6+ttjIwonOmVOJtOr6ksPncIwBrr0xlAURzC0A2doJFe1N9olsaf2MPckbBgGgwN+
         qCu0fGiGumxVsZsZiik0+J4fxQQfiONtPeJsxkKw6nFD2czupX3S00nJeYs99J/SffJm
         qMYXUIfVSuIa2VpNGN+2rOaXa7TZ4CvqzPDkVv8OssLrfH95F0jaXZeeG+wXLjjUJret
         IG2I7/9bjwFtc7FUO2EhGZFtm3zgEi3KUJ2OJj0LKvaWT1g3P9rREOKFsALcYDvOp0ry
         zF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153097; x=1780757897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=Qxy0dKCNIR5WTr1SQuryFRJltfvBoGXy26IDTjRhHuUSbhlKS5S4lUmfM8QCwkkMoh
         1MkAOmka3GAygrp7ijuy+jEj6vVHCeceJGg0IoocXgQBcOMGqCoNkC69EQ8cOfxBRPZQ
         opFeCbY0UMJPIA/JqyevI9xRpyQDpD1cc5siAMCKPxlVZBOuRrsXPcedTdUe1HE3SQZp
         qhcjo3JGqlMTBX8KoAzoKZVYSjB4J1A9zElKNVj7MU5siHxT8+xNxcBCZlLGNsruzdJq
         Kgrx5gnCW3LgABM+f1dl6i2qS8dEZVs4yPaI0q5DrrT5Y9vQDd4LElWHQJ+vfyYqbnrg
         IM1w==
X-Forwarded-Encrypted: i=1; AFNElJ+1uszDkBTZpxaOFYMtTxFqrRk/elrgIrtmeR+8eGfrOW1N5uquEVLzZeuulzP+PAjcR2RRXey8/0YGnXjhYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHMnKsnbOWuqbm0LUFVnWrNoYQXJKsLNrW6CLtKU50F1FxUb3z
	nkd90YC6e01L/JODuLB7Kov2bz2lbodNVlY2gqJcQon9AlQ/MpIWUANL
X-Gm-Gg: Acq92OH+2TFTlFcSmIaKqkzJLs1JEuZtJxS0Zv76Ka6jrtXQgrxTqeQ38qc+V57HKID
	Daamij4PtqtATF2e6hKNtHD/88Z65fCbOM01QiKtw0r9YPD8kTaSsO3wM3KOFoTIqftjYqkqBPv
	393y+ebVHEcEOaaf+/wU5OUvnesUl9YxGp0UUpz45p3bUn87cghLxyqJUgItsPy/lS6ceMJH5g+
	M5cEjX1//pl5w+CalTxG6Ko+WFt0D7VgWoP9WzeY1s1gtEZmrAFLD8k9yhNFB4UTAgtaONSN4J9
	EBjRNC7CNrL5NcKTDeyO3chDTfIYjBi5pkLffJiXM+uD5zKPdmSP30iDRElqpIUEOATmbxAfPzM
	DesGLqQNTjneymwt034hlMuv3F3aQn/eKyAJIMr1gtcV1A962zmacGtWzOdEHbU/5J60m7JvT3g
	QFl2oteOFtT6KL9eZpXB/Hz1xjaUgGO2I=
X-Received: by 2002:a05:600c:c492:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-490a2901b25mr67467075e9.5.1780153096610;
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Sat, 30 May 2026 16:57:56 +0200
Message-ID: <20260530145800.1029920-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075818_502490_1145371A 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 2124804c8863..1f65f0fd41bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.54.0


