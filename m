Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7AFC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Kz7FOBiHHhh/zlH3kQlXXhwfkt+v8/mMn6Sm83CJvA=; b=dgUhEf3xHlACC3
	Ji/r5/40YTtQZGVDwVsnG0vco7Z3m52HltiXur6FGscR29NLkhUj+2u70IyfY+MAjCOuNMsjlwIPj
	yJb66l4EtO28e/hO84E/bwNPdP7vPdkfIL1D4lk05ZTen8jd7KxnC7e4BO4XR/9OcI/tGsQ4zugmV
	MTVjO1MUG1/MxwVne7qk481haCBliB5pslvH7MDQLKz67WNDKWCT4ZjhCX4ZDIY+l+xBur7z7zbzK
	HHLV8dxLiqaR4dwp+VpHK9UT52rJEqukiU043xhr12yCta07rY0esNAwWlPrpxgXvh1eu9/8lgjgu
	wXhe6LKgoxfh7s9bMg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpJd-007mC2-T9; Mon, 13 Mar 2023 21:02:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpH9-007knM-4e; Mon, 13 Mar 2023 21:00:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fd5so20149462edb.7;
        Mon, 13 Mar 2023 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Kz7FOBiHHhh/zlH3kQlXXhwfkt+v8/mMn6Sm83CJvA=;
        b=ldeb1HzDf48Nbe42vraHtGT9G8/DKvJya4e2SWRFWACjLyifgQfmHB2PMmw9I+PV3d
         DaHeSiVdQv/l7BsKq9G3EjNX8OEuxjT4TiabKxvKqcFnhI4jAWcAma73AEOUavzuZDut
         RlMmrQg62qT9DSQ6/LMkG2PqGN5fNtrfnQNUBNJh+rT3AZt4sgXudC+SUy6t+JWUTIx2
         1h7v7DEKw8o7yXO563EqIWxe/I3c/yxDTiSG1H2YcQZJfndHFjnBBxUwA63wqXbj9PE6
         uSip349PT+3QwPvFd15hK/I+6+iCJFwS0sGhhkkLBoopKZaqa/s630bFoHrEMvmvDX+A
         YVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Kz7FOBiHHhh/zlH3kQlXXhwfkt+v8/mMn6Sm83CJvA=;
        b=uY7YRWMaWfx1gMMiqiUzksVoE79TDwWs6y3yigt8pOvoaAN9V9ha34qgH4zxGP1vVY
         RFVSkTJUMt8orzGZvOUO3UAVtKx3MhOSXuJEjW6iYU/Dous3H+3zJ0XR5ENDeUCN+rWs
         BQFrEKKnHDkHQlGL5mQuhJzxyTVCSTxb0/BX6vitYoHzjOLFSstE+4cT6ZVnnVc5TuOG
         U6tnTcrVpeNRKSav0Lnhq5eJo61q/bh/s+ZwAZZ5pLYf1bW8RGgHiFss1xeKswwwZ5e/
         pnRZ1iItI4W6m8gz+Vr7YIXREXPS+zFJJvpqOTSDDPbuBN6lvF1l3FtI5XPlKqRptMkU
         PiAg==
X-Gm-Message-State: AO0yUKXx/GHPa3zDfY3JTbe6ciAxldww2OBfHCXfDjFLUCghp+VbQ94J
	QlKwlblVsTAZaKUc6GAP9oE=
X-Google-Smtp-Source: AK7set++yU5hKWGum0vWkHhKhxL0nBNOOZoBb1pfyR6ZKzIpUWGypAFeKlIJ5e9sbw+kp0ci9bn7Gg==
X-Received: by 2002:a17:907:7f88:b0:92b:f019:a9ef with SMTP id qk8-20020a1709077f8800b0092bf019a9efmr571279ejc.31.1678741209715;
        Mon, 13 Mar 2023 14:00:09 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:09 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 07/21] dt-bindings: pinctrl: ralink: drop quotes from referred schemas
Date: Mon, 13 Mar 2023 23:59:07 +0300
Message-Id: <20230313205921.35342-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140011_210680_24D30612 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Drop the quotes from the referred schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index b25e0db77cb3..cde6de77e228 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -636,7 +636,7 @@ patternProperties:
                   enum: [i2c, spi cs1, uart0]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 60f6273930f5..fb8c5459ea93 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -240,7 +240,7 @@ patternProperties:
                   enum: [wdt]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 4f3e0af7d18f..e51667316b2e 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -120,7 +120,7 @@ patternProperties:
                   enum: [pci]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 9e45d851def6..8b1256af09c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -253,7 +253,7 @@ patternProperties:
                   enum: [spi_cs1]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 4bea19d4ad7b..adc4f42a175d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -240,7 +240,7 @@ patternProperties:
                   enum: [uartlite]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
-- 
2.37.2


