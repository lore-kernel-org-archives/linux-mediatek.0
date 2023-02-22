Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF1EC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ER0vFI5ErhPpjBGFO4kcWk4X1/JJbNjdl3KY04hLIxU=; b=LP/NC+6nx0nfkr
	FAc+Xy+Ljb4+guxWmVYrJYWxvzbjebJ1015os1gjCsBhdp/tppjSHEu2Asp72sFxLDYNrv327MdxM
	hQbnx0C9tdIQhpWCPDcVg8sXn8pm0qEzlkM/4vhZvrD3U+pgbGWJ7mgkBvR7TTmBmwT05KjJN4FNI
	pI1eLszDLTEHqaiJlzAPz4bLEbl6Gx3j9pMdq0EXZeDN5ownffpPDgCncMPqgcB9sDoZiJ8FdJZ9q
	6zr8QQcYjSz9L7ENbK97qaUEMIX892hh+RHDG/WBohtTgq88N+oTf8dZff75o4kD7n/JW2FTtBkdS
	Kifs2KKW+zF5sSvow7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu5W-00DVdw-Un; Wed, 22 Feb 2023 18:43:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2R-00DTfQ-FV; Wed, 22 Feb 2023 18:40:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so8860196wrz.7;
        Wed, 22 Feb 2023 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER0vFI5ErhPpjBGFO4kcWk4X1/JJbNjdl3KY04hLIxU=;
        b=fr+C4nCniGBv/+XrMWb+6QS0YLPvFrIVUeIH1AiW92b0gF4mU5BCEKXz/gP5f3vm9q
         X8qwt2biAAHZP+vh3zkfHTY7Zfjx9Bo0OhkXafnAA/klJDLmMeQjvYpw4ILaL8l1cLHu
         vTbqfyjndrLYZQljI+Is0w+Zz4RhqqwnFRYVtzCjFQIfskP7ETx1D7vzvL+F7osCT7/L
         q0P4KckrybXqS/yas96RskQE3ttlpD5sDnx0GwVefIVosFGy+8GsBgW8MK4XiU/i0Fmh
         pyb1fFOq+HyviNflqtVLB7SlneKR17VlqH1Q6/0BbfzevyeoNSaaiKa06f+9Az8p+3BU
         /1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER0vFI5ErhPpjBGFO4kcWk4X1/JJbNjdl3KY04hLIxU=;
        b=sOjGOuI9M0Hc5f6FH91J+/W2At9SQIrnuIeIBTVRa1dITZEM1+DYgtURgtRAu4gB73
         hh05Usvn6QfWYkDC8RGwPWEmt8+gWqpz6cBgsrxFDHAPLqHJZ+x2bIo18Cg99wG1PT99
         MEN0iMGSw+ULm9EYQAZF30XkSmxKfnbD7dSR6MK9d6vM5m3FC06bY7MLtWgxdrBdFyAk
         fSXiPj/khmBdft92A5f7UoUV6uRuT008U4I/urqn6u3w/C/zlg6vqVdhkxOJ7m5pMsD0
         zcxRtEGD8he/S0OrToYjI8nWxOlMBBph7V0tDFzcttAsXDCZKjb6XXrIuQsBlJXg5Lsq
         8Oow==
X-Gm-Message-State: AO0yUKUIPReYScg3/VJC9J/ntz4ZagZ9CGMhlaDw/NW8ogsWJmglrd0I
	awNhu9/oEELGgciKYQDmY68=
X-Google-Smtp-Source: AK7set+hUEzBr/atsckOQnBk4amaaKvrW6cIYsaW6dVu0IN7hMFgpj+XblzOrIPYeGOhOG/wQdNDrA==
X-Received: by 2002:a5d:5087:0:b0:2c5:60a9:9cd2 with SMTP id a7-20020a5d5087000000b002c560a99cd2mr7204948wrt.28.1677091222807;
        Wed, 22 Feb 2023 10:40:22 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:22 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 08/16] dt-bindings: pinctrl: ralink: rename to mediatek
Date: Wed, 22 Feb 2023 21:39:24 +0300
Message-Id: <20230222183932.33267-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104023_577179_6AA3D7D1 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Ralink was acquired by MediaTek in 2011. These SoCs have been rebranded as
MediaTek. Rename the schemas to mediatek.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 ...ink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} | 6 +++---
 ...ink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} | 6 +++---
 ...ink,rt2880-pinctrl.yaml => mediatek,rt2880-pinctrl.yaml} | 6 +++---
 ...ink,rt305x-pinctrl.yaml => mediatek,rt305x-pinctrl.yaml} | 6 +++---
 ...ink,rt3883-pinctrl.yaml => mediatek,rt3883-pinctrl.yaml} | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} (98%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} (97%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,rt2880-pinctrl.yaml => mediatek,rt2880-pinctrl.yaml} (95%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,rt305x-pinctrl.yaml => mediatek,rt305x-pinctrl.yaml} (97%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,rt3883-pinctrl.yaml => mediatek,rt3883-pinctrl.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 531b5f616c3d..3bf58da8a394 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7620-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7620-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7620 Pin Controller
+title: MediaTek MT7620 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
+  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
index 74923ca35c81..4dfe3da5fd40 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7621-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7621-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7621 Pin Controller
+title: MediaTek MT7621 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7621 pin controller for MT7621 SoC.
+  MediaTek MT7621 pin controller for MT7621 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt2880-pinctrl.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,rt2880-pinctrl.yaml
index aceea6248614..7395e4434e64 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt2880-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,rt2880-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink RT2880 Pin Controller
+title: MediaTek RT2880 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink RT2880 pin controller for RT2880 SoC.
+  MediaTek RT2880 pin controller for RT2880 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
index 4c87fe201809..61fcf3ab1091 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,rt305x-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,rt305x-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink RT305X Pin Controller
+title: MediaTek RT305X Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350
+  MediaTek RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350
   SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3883-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,rt3883-pinctrl.yaml
index 71049a2b2779..ab20f67c47f0 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3883-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,rt3883-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,rt3883-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink RT3883 Pin Controller
+title: MediaTek RT3883 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink RT3883 pin controller for RT3883 SoC.
+  MediaTek RT3883 pin controller for RT3883 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
-- 
2.37.2


