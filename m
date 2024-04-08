Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9B6CD1296
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urPnK9SKsV5nVEA1yeOAoEutTVGuSxP802X+pnIxpxI=; b=QFx6ySyYH6v8+b4S248x6O3/U7
	elQwi4VnsuR8wm3OlvKaIh9FgBpeHJzCTBq8RzetnTYCI6+Uvx0TxJv6Zw9zUtqPLYVUNirlM2Dxh
	znb8b88D6h9LYfrbJ1Bpfc1iHFIDjFwR3p5oImkVN9ntARTPU7oRIitrbp+ndJM9haS9WzdVZWING
	orURqwpQJXdB79Ww/GVHPW31xRHFLlF1Hn0K0vcOaO3dzcB2CicvlzjqMmEfnXt/HxvHm9g4Ikg1o
	atLPUwd5QfaZz0CTPcYffmZyU9Hv7IKqSFNq3dhgeP1SAiTtAOXvCOqrYFaDmkoyhuKBq1dU34qFN
	ghoJrcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwM-0000000F0qg-411M;
	Mon, 08 Apr 2024 09:05:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwK-0000000F0ox-0Yfu;
	Mon, 08 Apr 2024 09:05:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a51addddbd4so262336866b.0;
        Mon, 08 Apr 2024 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567117; x=1713171917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urPnK9SKsV5nVEA1yeOAoEutTVGuSxP802X+pnIxpxI=;
        b=dWO2Y30d91v48a866w5wM1GIXmFH17tAMn6STCKYmXY5UjcX0LdKj0v/lWd4zTt7jv
         a0OlM+Hwt/Wyxer907n0IqyaSyGmeuoQHwGV7R180eVpYr6yePAXpbNJ+kaDT+FILhBY
         OxOKU0nEcyozVfZpfhmR1Y0huo3CtF2BUZ29PYD+S54qijO7EoWoI1HcU7dyp8QqJn1/
         ZyaF8u+Cp1j82OiriC1NioWeIjrCeKo+l1G4KEgMV/4ZGVL4Va5nOs4EYfpRtXHP7PRv
         B52K3qna3ryG7BY9Aw8MBNNwevNCHekSL3gaeabTArYU0vCA/3hIxa4jbRdDYp0q4Shw
         eigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567117; x=1713171917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urPnK9SKsV5nVEA1yeOAoEutTVGuSxP802X+pnIxpxI=;
        b=wgzhg9HtR/eK7ZUeHcavgeUgjOqhmnShRE5CySBq7sgIZyNunt17RQBJ9HFW3V/+Sy
         3EA1Gy7KBCIRLx8pk2owO/r/1/QuxgV71BEiSJOzBYx4tDoOoZ9Bft9dVGgKqU0BqE2N
         e28iPsU76QwkvZM4aee8UqB8FVdtkVgLCRNlVJE7HVTl0DVtnzGcOaA8PiPsrnuhDJUR
         1ZVHTVhaBY37Zmn5fgLkEKx/HKavJFtymrgy2d0/VVS8OlXB/WB1p4nMtyA8ASTkSVLH
         RiaHFiiED8V7xKhOJj3igmrJ8FKyolKlqyY2g0C1ex2ay7icraTWPPtrA8n67VZ7keJ4
         EtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6e54c+uL1m+x4RVtYwsYX+PWgWkKKW7WnZ4aWxS4TnSYgPlF6LomZ/HYFxxwPSh+UBlpW8odGqj0aEtDNEzjzvkRhYJ8LhbxIndgh0b2aSrB+6IolnjWKaRLh9YCRa6miW5t39KF/+k9+rXrw9pvb/1fDhYJblLA=
X-Gm-Message-State: AOJu0YzKVadaxQ43w+dYKgThyfxocqYPb0QG6hCyqTQKiFFDBE+jVR+g
	WAbA/dmuCVN8HtmhL/DUuLZyrRBgNZsSWUX/EWvcKIYHknEzY9EvUL1gcg6y
X-Google-Smtp-Source: AGHT+IFrzZOCYf3cevStt0TK0MTR+9GFEq2JSptieBkxHNbtINxf0w9YFW6N4oKbZw0HPh2N8wyEWQ==
X-Received: by 2002:a17:906:3bc5:b0:a4e:3715:7f4a with SMTP id v5-20020a1709063bc500b00a4e37157f4amr4263965ejf.71.1712567117295;
        Mon, 08 Apr 2024 02:05:17 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 2/3] dt-bindings: pinctrl: mediatek: mt7622: add "antsel" function
Date: Mon,  8 Apr 2024 11:05:05 +0200
Message-Id: <20240408090506.21596-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240408090506.21596-1-zajec5@gmail.com>
References: <20240408090506.21596-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_020520_208871_81A568A2 
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
pins/groups"). Include them in binding.

Cc: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../pinctrl/mediatek,mt7622-pinctrl.yaml       | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 60f30a59f385..a9ab623b2697 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -75,8 +75,8 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm, sd,
-                   spi, tdm, uart, watchdog, wifi]
+            enum: [antsel, emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm,
+                   sd, spi, tdm, uart, watchdog, wifi]
 
           groups:
             description:
@@ -90,6 +90,20 @@ patternProperties:
           - function
 
         allOf:
+          - if:
+              properties:
+                function:
+                  const: antsel
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [antsel0, antsel1, antsel2, antsel3, antsel4, antsel5,
+                           antsel6, antsel7, antsel8, antsel9, antsel10,
+                           antsel11, antsel12, antsel13, antsel14, antsel15,
+                           antsel16, antsel17, antsel18, antsel19, antsel20,
+                           antsel21, antsel22, antsel23, antsel24, antsel25,
+                           antsel26, antsel27, antsel28, antsel29]
           - if:
               properties:
                 function:
-- 
2.35.3


