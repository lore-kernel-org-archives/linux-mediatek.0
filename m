Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942BC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWbAxCbex5z2bVfqGQhXVB3nkKDf2dyOixZg0iRnhQo=; b=YhLRoDczEBcVyg
	8hvm5e4rnvXfKg1hbou1/Pgs4ARBcsx9WNrXbOT72eMdseEsvxycZPRt8QB08O03hXieG4iiLbWV8
	Q885K/09dPV/NOgO5gphXGugrfra9uqKIqI1h2qpzKwKTPH2ZWlI0gXN/iRQJEihjgzIclVUnqY2r
	jpzHVxZjS4YQ6na6I8Ck3qjE2kJ/8hUJEld2jwlGyVItW1lSzWPgw1U4xsTPp4Ib3Qo6TqYgkhaxM
	NwMkFejh5VqHMLq/9Z3MfYy+hWcobMpy5tVUZeiDWUxjpj0nrl8AUC0SpyTvjHB2z9Cr+6JSLncNg
	lNxXnG86iiYD9WK85FUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpLo-007nMr-5q; Mon, 13 Mar 2023 21:05:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHL-007kps-0H; Mon, 13 Mar 2023 21:00:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id ek18so22896641edb.6;
        Mon, 13 Mar 2023 14:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWbAxCbex5z2bVfqGQhXVB3nkKDf2dyOixZg0iRnhQo=;
        b=D2gUZEwIzCy0DMDjShGn6TBeIJZfxrpO1rrrh4oX+fuusTnUBTtpghh0wMl7wHEQbP
         cXBxJnaFXN9k8Q/XcQd+R8QQDetoGQ1Apja3u5ZIoGhLCY6FBvPoNWq7xHq0N6ZunbDO
         IfguKH/TdoO+Frud3ZZ6S6PJJ0pE3BhaRUkSm41EvTg499O2HsZgNEoQwCXNVo7V7GSf
         515FKLVcm8wxHWt1k4DSc0dlm6t++l74y3DcRLao0riG4a+ogcXIZpjOaPsHyXo7U+RV
         hpv6QroGzPPrhWJ9YYnack/8BHLayvKyrAvbnkxbhhtiJW0rti798hxll7XJe0CgCal2
         f44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWbAxCbex5z2bVfqGQhXVB3nkKDf2dyOixZg0iRnhQo=;
        b=GNQtqQeMjXo2/Sn7ChZA3mnQDN0LG9k2vVcjwjamNya1pEuUCjH+uRrQqE2hQLU6dP
         zshvOdG7me2ujDgvRW2gADqZAZgoe8raoiUjIkGBrWtwLEW9Z26COE7kqx0Y5MJfnkYA
         vBc1u3TpzsVyMXKj45o2OYjEvSvE2l74W1zWo6XY1CgeClJnnmavEwLVnEoqkL9xcYfu
         QmDP+BCd88WENRDSjg4CNPZ3EIU1XINXKBz5wH+QEgaiK/KjhGhsDBsBY+XWHPLdqtsd
         XLE1YTDysJBue59jPKdGvmj69jUtKPNdSLPtQ4LetMy9O6x6wTmTmKgR9Gozf15ToGB1
         rF7Q==
X-Gm-Message-State: AO0yUKVFlfahJLNo86c8tnuWt0hj6i45udVxJfIrm2vqzFXlb47cMhT6
	hML17YgmyJ9rwLhlg9K34aI=
X-Google-Smtp-Source: AK7set+8xZ5sltZJ6fup+N1VDhON+CdUCYZS7saVqQTVK1a3z/QxT1hxiTWgdwGBVogpP5woWK+4GQ==
X-Received: by 2002:a17:906:1713:b0:8b1:806b:7dbb with SMTP id c19-20020a170906171300b008b1806b7dbbmr34642943eje.51.1678741214482;
        Mon, 13 Mar 2023 14:00:14 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:14 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 09/21] dt-bindings: pinctrl: ralink: {mt7620,mt7621}: rename to mediatek
Date: Mon, 13 Mar 2023 23:59:09 +0300
Message-Id: <20230313205921.35342-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140023_345418_49AFDB34 
X-CRM114-Status: GOOD (  10.85  )
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

Rename schemas of pin controllers for MediaTek MT7620 and MT7621 SoCs to be
on par with other pin controllers for MediaTek SoCs.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

I'm not changing the compatible string. I asked if it's accepted to do this
whilst keeping the compatible string but haven't received a response.

https://lore.kernel.org/linux-devicetree/deca532a-bdf5-c49e-1422-ce6124b61882@arinc9.com/

Arınç

---
 ...ink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} | 6 +++---
 ...ink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} (98%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 09ebb8ac22ac..0dcdc3788e66 100644
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
index fb8c5459ea93..32506c538459 100644
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
 
-- 
2.37.2


