Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C93C04A6A
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2WVsYTQao4k2m790yPgkBUcRYo/CRh/+UQCuqc56fg=; b=GJQ5l5UmPgDxYHYXg6pZTFcqSa
	0XhIYKiArzqDxNcda0Lbh6mT0sdOBDY4Ng3niJXthIbaHKnXAOWF4dQe6xoXIisonPfS3LxuXsvX+
	qa7a3XIUzefxihHgRBka9Q9TEO3NlC+NpxF8uHb9ErtYqcos1o7aTQ6XuFdLI61nIiqJLGbUtc/t5
	vjREOmRlHogQBPYxBNpfoqEy3lqN1N2FgXwWmDoYZZ2eMPmTtbimBEZWEeuT4jec15zyrAqYPsJ59
	cgPCDLBVkLGI+CS+wU+wdqwIZZy19hcnkSbMbGJ2bKTmuMCjlOzOrAchjlipcoXgCtAbNtXDhRJ0o
	0reajErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhqk-007Ikq-0T;
	Sat, 29 Jul 2023 11:11:06 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhqf-007IkG-0T;
	Sat, 29 Jul 2023 11:11:02 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso44486291fa.0;
        Sat, 29 Jul 2023 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690629057; x=1691233857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2WVsYTQao4k2m790yPgkBUcRYo/CRh/+UQCuqc56fg=;
        b=LEfdG5XH2AcG3bXPLaz5HA6B97CYkDq073HkUfNWKsBlgbvPwMArsTrm5elIgdh1P5
         0DoGFQvIPrhF1xmk4EXgKEg4koY1oZ7HeQo/e7mcM5VSG5EFwQ7RerhzVrR6Nh7I+8Jb
         MmcY8i7SHesvrAaOZd+TaAFqCUH2/QAXO2mf53HT8aB3e5pdJtvi7yq09dU520Kr5yun
         xL5lOGj5yUyT8sCRNOvRo3xPBs9ZOL+OcT3Qq8ECp4+GXAfIRe/XmsrjGvBEMflc48BK
         MeY1kp388s2uWKYsl+jDLSoz5NkInS+s4H/c/67HouclnRn+ZfDVdYN5LumdACbAiVxq
         EncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690629057; x=1691233857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2WVsYTQao4k2m790yPgkBUcRYo/CRh/+UQCuqc56fg=;
        b=HJp3NwhHcF6D0+P8QjERTpXMInSl67ecHNJHTUij0h1mPVjfcwidbsj/ryiD4S7uGX
         2uXZjKWBxfzLexBam0rR9trwjv9F73gmZdQNvf0YrJCIoasmz+p6YuKzQaB74a7SvpHR
         MSqd33ldjKatDmO2kSqB5y44ff449t3/bfipknGI5+bY/x5WNr0jr+TN10hKv5P/8D7q
         ydDKiGX7RHXKaY2twVakDIeMBUendZkuhxRlq8hShyk2Gkrco2I/Kw4ZN6PHz3aLRpb5
         PmatoCxKDhRl5U4+4CkckwfVDOKU5n2g2HRbwXSk8pQ2OJplIM/3j8HSGZcdPELLN3Id
         mlcA==
X-Gm-Message-State: ABy/qLak7Vkqfw6C9yBtjPIvXCXqOWUC/r1pGwJ8euoQqJCTvots2nxR
	RF0y9QCICuNM85+GHLXvlW0=
X-Google-Smtp-Source: APBJJlGSvHFxXqv2qEmmPgRag7EgXKr0lr6BjPH50xKtDWH+GJeG5BkdOA1kuXoQrmkg6KwgOzyz/w==
X-Received: by 2002:a2e:3603:0:b0:2b7:764:3caf with SMTP id d3-20020a2e3603000000b002b707643cafmr3363513lja.10.1690629056721;
        Sat, 29 Jul 2023 04:10:56 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id i26-20020a2e809a000000b002b9cc2f5c39sm1064989ljg.37.2023.07.29.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 04:10:56 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: net: mediatek,net: fixup MAC binding
Date: Sat, 29 Jul 2023 13:10:45 +0200
Message-Id: <20230729111045.1779-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_041101_209720_72A48045 
X-CRM114-Status: GOOD (  10.02  )
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

From: Rafał Miłecki <rafal@milecki.pl>

1. Use unevaluatedProperties
It's needed to allow ethernet-controller.yaml properties work correctly.

2. Drop unneeded phy-handle/phy-mode

3. Don't require phy-handle
Some SoCs may use fixed link.

For in-kernel MT7621 DTS files this fixes following errors:
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@0: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@0: 'phy-handle' is a required property
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@1: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@1: 'phy-handle' is a required property
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 8d3554818c37..e74502a0afe8 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -388,7 +388,7 @@ allOf:
 patternProperties:
   "^mac@[0-1]$":
     type: object
-    additionalProperties: false
+    unevaluatedProperties: false
     allOf:
       - $ref: ethernet-controller.yaml#
     description:
@@ -400,14 +400,9 @@ patternProperties:
       reg:
         maxItems: 1
 
-      phy-handle: true
-
-      phy-mode: true
-
     required:
       - reg
       - compatible
-      - phy-handle
 
 required:
   - compatible
-- 
2.35.3


