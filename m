Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D18DC001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jul 2023 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=; b=mSfJS5M9jK/yW4UwN9l3ZigC6v
	yjFRL1BfstsuflLJPdXr8Z7wJNOsSBVAIhDLIxBgA0KvH58LjKVj8p4B55UzV35A5Bps8M9imovGG
	IgflnB7V1dbVraFlPn2irxMQIkkkmj9iU1A2EdefaBSNbnyEJcoQEWsQuPBp58HNP++6UY2C2L2mM
	KQTSdoqZ5dxXCxhOTZxyRMSdIXAbS0zjEIq6RtgyYqxWdmJ8+cfEbPP6DEAHIGKVmlCluAxf8fToq
	h1N/RYG0azpC8F5/Z8vNH9yXoQOJwP3oBI6/jKaCiOuT+aMHgl/VqZxX9m9ig25vPP3hOCldGoTVS
	Qac0YKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNTwU-000YMQ-2M;
	Sun, 23 Jul 2023 07:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNTwS-000YLR-2q
	for linux-mediatek@bombadil.infradead.org;
	Sun, 23 Jul 2023 07:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=; b=JYfv7uQXjhanWOVxcpjc1MyYxG
	c1kQBRGqbZC/0VYscUp/7LFncIMz/1XM4cFyy7WgzwH0tokAcWRKVBvTaYg63N9SRnxj6Qyo/J12x
	yymW/pt7qlFckobVVGY/L6CVKYloxHINGF4o0U2fm2GU64n/zcqRxvLLgsBDYnWd9/d69pkZNxpyC
	CTb9ykoJZnGJreijgLAqlJD4cUr6vhOiG4CG27zZuX+m8b2TJOas5yavthtukUkgYD5rTXhwOFLZu
	WszUx7KImWPePv9/lejL4Uzfw8W2KNONb1UA4e+NAQ4CrfyPCk+blnXO1RvKtzzH5jrk6kkqkxm6G
	GCCUxp+A==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNTFH-001lhB-1p
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Jul 2023 07:11:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso4873285a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Jul 2023 00:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690096269; x=1690701069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=;
        b=CbuvaxRC2zvv3P0eIIxrewtQjuqAVLctBR2m/DK3a2/J9tofsuzchHLy2zAbS2aKV7
         5ewjm2fM6XC+ugXghFd5KdRBK+QcERtuU12p3F4cxKYl4q0Sjd/+AB6Nx3p29fSil6uM
         4YzFnlmhyPAyCsDfPlgmsD5bucxqnPBLPueRgRw2XPtUDkOnBCos6qbZWaglamY8Zzrv
         rZflz8T5CgF+bXSWzwhjBjto/+c3QaV3hg/4HP5LnLqwJakWLEYdoBDt+e8v7U95yYwa
         1+UazmkzHpIxjRWxSAzyqtOEPlwsyNiA9Z2at61Sg+KbY//dXxnizdvDE7ViiGpUbbci
         OPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690096269; x=1690701069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=;
        b=A2/lVZzy3nKTJ0k5wr+TJebMoKIQkIEqime6G1JamB3HL4a5sU1tg/G649oJaxRNTD
         7ovg6YyTkHtEZyu5LoLGfdsq0dqKWnVFHmQ9WWCIym5M/jRm5Ide1xn6Z9klFkuikZnj
         kYnARjvt/J/kbLXHRxiP2mALzHk/MBLEuHvGHtdeFr75v9quTq30Fa/KoO7LUXdyCVxO
         Wla9vw2JWwpNiHFOmnP3w0jZCg/pPbtDwHcRgl/U82ComCEl14sJ2EGOgmIJjZWa2tqe
         LByaxZRpB+U29Y7VeT58wD0muaiZahCWI3iuqexXbJyEtg0xVt0/MngJrbyjuwefbPGW
         MpTw==
X-Gm-Message-State: ABy/qLaSDdljVUI3YnRLQzY79YZVsOLz4AoiCOh84giTUFwZkcx3BBdA
	VM5aXc4mTxWqcbjv2XBBTGP/+w==
X-Google-Smtp-Source: APBJJlFdI6DsgDD9WdFYKSmdJf8XSslYUGbeWU0JC3fnxF/QaGLkeRSv/Bwh8LcGsfNdj8uVBWBNXw==
X-Received: by 2002:a17:906:648a:b0:997:eab5:f1c6 with SMTP id e10-20020a170906648a00b00997eab5f1c6mr7319944ejm.30.1690096269496;
        Sun, 23 Jul 2023 00:11:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906299100b00989828a42e8sm4639518eje.154.2023.07.23.00.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 00:11:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Sridharan <badhri@google.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Min Guo <min.guo@mediatek.com>,
	Gene Chen <gene_chen@richtek.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: add missing unevaluatedProperties on USB connector
Date: Sun, 23 Jul 2023 09:11:05 +0200
Message-Id: <20230723071105.40157-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_081111_838793_B4BE5F6F 
X-CRM114-Status: UNSURE (   8.98  )
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

The usb-connector.yaml schema allows any additional properties, thus its
usage should finish with unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml       | 1 +
 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml | 1 +
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml        | 1 +
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml        | 1 +
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml      | 1 +
 Documentation/devicetree/bindings/usb/richtek,rt1719.yaml       | 1 +
 6 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 276bf7554215..45e093978b82 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -25,6 +25,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..42b9d3a35c67 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -29,6 +29,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index a59d91243ac8..7eb880e4a270 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -144,6 +144,7 @@ properties:
 
   connector:
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Connector for dual role switch, especially for "gpio-usb-b-connector"
     type: object
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index a39d38db7714..924f74d45baa 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -66,6 +66,7 @@ properties:
     $ref: /schemas/connector/usb-connector.yaml#
     description: Connector for dual role switch
     type: object
+    unevaluatedProperties: false
 
 dependencies:
   usb-role-switch: [ connector ]
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 8da4d2ad1a91..980235e27a7f 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -36,6 +36,7 @@ properties:
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
index 4ced2f68e2a9..27978580b234 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
@@ -34,6 +34,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
-- 
2.34.1


