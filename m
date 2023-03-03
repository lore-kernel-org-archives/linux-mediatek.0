Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD259C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIyRY7TAQ7V6fBVxNRjh5iohVjcgkpwqxbFfnDhQVbI=; b=ZRPzq47TOD7wzU
	6VGBdzxnogktD26klndTfItcW6JMUe85b1dQ8hYle4hzG7jDrY9iHQfgYnvTgaSpkAcN/CiqFAa1g
	UruUMdEsAr3FIWOvpcvO7/MQu+d7a0k0tIlyXd+dbD2ffvrGqNnOuzjlw/NCc6dIF888GHzqwFZnA
	u28wtI274TDwgr/2yM25fWPKeJIW/B7WjTLe0+nbdvzPleRL7rMHQddhmXl2qoCMNpADxHa48SB4Y
	ZKBZBzWRhVB/5ns674/omj2fLS0c2TPp0ca1WUt0VGO1Eciu0HEPfY7XBXIneG+b1lwBnIyq7tvRZ
	FC/c+n1mBl37Lb4K9WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtPS-003uLY-Mq; Fri, 03 Mar 2023 00:36:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJb-003qeP-Uj; Fri, 03 Mar 2023 00:30:30 +0000
Received: by mail-lj1-x229.google.com with SMTP id f16so735284ljq.10;
        Thu, 02 Mar 2023 16:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyRY7TAQ7V6fBVxNRjh5iohVjcgkpwqxbFfnDhQVbI=;
        b=ljzr7TOW63wyzf8b1d3XSpxXJ1uU1SbN3J43WA+QTSiLQJIUV4c530Mlr18PZsABPT
         wZBRCM5JHbPobo6eQ4LTrxH3I+FzGLMWiupxxx43cZCYy9qxVzrhOVETw3l9oau13tgn
         4tbSRCflh1iT1Vk8KD4g/SPoF5KI05zSftssxmZV4PQbUqloqkYKGSAtGCOa1GdkMUlx
         wEKFjEcYJsEMtWajYJ/CbWL7O6CorjRZnzoqxYCx+2dW3xAzODRYvESfS0Loi70cQ6MZ
         x7Ag1UDeZ+3CS0aGA5FDMZpZ2Amv4NJmocL9clDciX9Q/S7/n9Fat9lNv1NZnDKrpOzC
         vHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIyRY7TAQ7V6fBVxNRjh5iohVjcgkpwqxbFfnDhQVbI=;
        b=nzN7s7wrokSj7R0BS1WfRRAl4tMLtKvKBkXYcVQxSSh8fuNImZzkgOgpO3GAXjneaP
         tyGCHrQtaDlsEFJuN3t7GcLSMaDyr1Y/yfaYFIQc8SyTSt/6CPHSsNdfePgEgMkI8zBL
         vpg1iPr7Ve+ZdIxvMPIF3iUR5Eme/NxNZrmQQJ44AjO+ZNF32fo0CfUf1Q+Us+LYKqVa
         sfZwNJZ6pDPabFDLNXUgbzgNxK87oovnT+8gYifOxagmr99ScT5EPOD6JfgZQ8l340FZ
         PaldLOPmGa/zicYzogyOocobUQ/Llj6KPjhF1jTO3OE58zDyVRbPg0uTAeOBBlvUuLOY
         JbqA==
X-Gm-Message-State: AO0yUKVpv5HJoOlJ3Haqb27iKBdaCOdI52MQGGoigIZzzSU+kXGV9qm9
	eRQFq73x8vtflzLRsPH7Z6k=
X-Google-Smtp-Source: AK7set/BEHPxNho/TaooYSWMdsGBRP1obHleYMqILnotARCJIvuhtnGjC7EM9IU9zpYvWtlw25Kpyg==
X-Received: by 2002:a2e:bc06:0:b0:295:c386:35f6 with SMTP id b6-20020a2ebc06000000b00295c38635f6mr5180052ljf.44.1677803427295;
        Thu, 02 Mar 2023 16:30:27 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:26 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 14/20] dt-bindings: pinctrl: mediatek: fix naming inconsistency
Date: Fri,  3 Mar 2023 03:28:43 +0300
Message-Id: <20230303002850.51858-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163028_076759_B4155993 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Some schemas include "MediaTek", some "Mediatek". Rename all to "MediaTek"
to address the naming inconsistency.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index a55c8e4ff26e..77b1b52f5799 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT65xx Pin Controller
+title: MediaTek MT65xx Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@kernel.org>
 
 description: |+
-  The Mediatek's Pin controller is used to control SoC pins.
+  The MediaTek's MT65xx Pin controller is used to control SoC pins.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index a2141eb0854e..c2fea29fa02f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT6779 Pin Controller
+title: MediaTek MT6779 Pin Controller
 
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index c5131f053b61..a78df32e6c39 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT6795 Pin Controller
+title: MediaTek MT6795 Pin Controller
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
 
 description: |
-  The Mediatek's Pin controller is used to control SoC pins.
+  The MediaTek's MT6795 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index ac93eb8f01a6..3531b63ca4bf 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT7622 Pin Controller
+title: MediaTek MT7622 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@kernel.org>
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
index 74c66fbcb2ae..c3373290a8a1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7981-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT7981 Pin Controller
+title: MediaTek MT7981 Pin Controller
 
 maintainers:
   - Daniel Golle <daniel@makrotopia.org>
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 216b356cd519..71033831d03d 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT7986 Pin Controller
+title: MediaTek MT7986 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@kernel.org>
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index c30cd0d010dd..3e34b03e11fc 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8183 Pin Controller
+title: MediaTek MT8183 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@kernel.org>
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
index 32d64416eb16..a0519acc92fe 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8186 Pin Controller
+title: MediaTek MT8186 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@mediatek.com>
 
 description: |
-  The Mediatek's Pin controller is used to control SoC pins.
+  The MediaTek's MT8186 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
index e764cb0f8c1a..3c3dd142a989 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8192-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8192 Pin Controller
+title: MediaTek MT8192 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@mediatek.com>
 
 description: |
-  The Mediatek's Pin controller is used to control SoC pins.
+  The MediaTek's MT8192 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 7b3dfc14eedc..d4d5357cdd1d 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8195 Pin Controller
+title: MediaTek MT8195 Pin Controller
 
 maintainers:
   - Sean Wang <sean.wang@mediatek.com>
 
 description: |
-  The Mediatek's Pin controller is used to control SoC pins.
+  The MediaTek's MT8195 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 4b96884a1afc..42964dfa9fdb 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8365 Pin Controller
+title: MediaTek MT8365 Pin Controller
 
 maintainers:
   - Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.37.2


