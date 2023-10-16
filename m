Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CFBCDB482
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u8MwZO/uTMniT8O9fzxMnkQinvsfIqPjmwsPljhL/U=; b=lE8sKtD1gpI7OAIygrqcz2Fza4
	7SbLuXQbP7WMUYPWYqf8wY+46kUjBnxU2OrO7TfZaWxhMjh2s8QUPs/R91zq4OcwKNGO1YM4O/ZH/
	rHlpOPTTfXjMZrZs5CTGam2tJV+bJBw7/Pi7Gs6VHkIoagDlVVdMGI2azkN/T0FIP0s8c8Df9++Ms
	sB+65MEmhM3LPFJgRwUHhVa6DNLFRDQxxim57lJ9cPjCDcELZYS5vPftm6Nkx9PZ9phQsg1KA5Wq7
	ZDZypXBTzmoCKsQWjHv/Iy5JfoLOcii2NUYc3e+oRYVYXGiZuxzg22CMczQxA2rxQfejPp1xILQUy
	0lb4Tvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOW-00Abb0-2X;
	Mon, 16 Oct 2023 21:45:00 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOK-00AbRg-0m;
	Mon, 16 Oct 2023 21:44:49 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6c7c2c428c1so3028525a34.0;
        Mon, 16 Oct 2023 14:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492687; x=1698097487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u8MwZO/uTMniT8O9fzxMnkQinvsfIqPjmwsPljhL/U=;
        b=acQM4YpkeqyJ9Cwcrb/fpgwaxCrdCOOEQJUCD50sihJ/Z8ES4rx1DGrrM4YwXH2/LP
         HHJ7kd5pyFEWsLVCfhylmBUorybefAvfExKwrdrkdzV0G7Of9NtUzvOi3koedDmcNUqw
         KJsi6loy0nvGaISYXCYPjJ1AgiyQyMsEyQbSSCMaCDezbPpghe/D4F/yAd7Rk8hK5srL
         5tLzg9z4HzW6p5qyOTgNak+h5gR387i1DU5zvnnH5IIDuyfbe01K2g2T7fDbx8o+lnrV
         DYzCRIktzW2X1n8b8QuirHNRVWB8TlBGzafOVcDZRPS7k8a+zY+pu7OnBB0ura5alD8b
         2xGQ==
X-Gm-Message-State: AOJu0Yz8GFgyT6p32FTan0YTsS/gkXMgu+QFyI8lRkYVgVpqVvyzegO+
	hGIblwnl7Tv8JfjL2ZeWbeKWJmebKw==
X-Google-Smtp-Source: AGHT+IE4SwXq4h7uY4ziiMKnfiIle2I3ym0yy+YjuXM+z1MdMac0LpulZcsCfiCM5Uqisbpc/DAs1g==
X-Received: by 2002:a05:6808:238f:b0:3af:6b0c:fedf with SMTP id bp15-20020a056808238f00b003af6b0cfedfmr23647oib.24.1697492686807;
        Mon, 16 Oct 2023 14:44:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h13-20020a4adccd000000b0057df0bcab46sm13975oou.45.2023.10.16.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:46 -0700 (PDT)
Received: (nullmailer pid 3823222 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:26 -0500
Subject: [PATCH net-next 7/8] dt-bindings: net: mscc,vsc7514-switch:
 Simplify DSA and switch references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-7-a525a090b444@kernel.org>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	John Crispin <john@phrozen.org>, Gerhard Engleder <gerhard@engleder-embedded.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_144448_281080_D34A1640 
X-CRM114-Status: GOOD (  10.47  )
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

The mscc,vsc7514-switch schema doesn't add any custom port properties,
so it can just reference ethernet-switch.yaml#/$defs/base and
dsa.yaml#/$defs/ethernet-ports instead of the base file and can skip
defining port nodes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/net/mscc,vsc7514-switch.yaml       | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 07de52a3a295..86a9c3fc76c8 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -24,7 +24,7 @@ allOf:
         compatible:
           const: mscc,vsc7514-switch
     then:
-      $ref: ethernet-switch.yaml#
+      $ref: ethernet-switch.yaml#/$defs/ethernet-ports
       required:
         - interrupts
         - interrupt-names
@@ -33,28 +33,18 @@ allOf:
           minItems: 21
         reg-names:
           minItems: 21
-        ethernet-ports:
-          patternProperties:
-            "^port@[0-9a-f]+$":
-              $ref: ethernet-switch-port.yaml#
-              unevaluatedProperties: false
 
   - if:
       properties:
         compatible:
           const: mscc,vsc7512-switch
     then:
-      $ref: /schemas/net/dsa/dsa.yaml#
+      $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports
       properties:
         reg:
           maxItems: 20
         reg-names:
           maxItems: 20
-        ethernet-ports:
-          patternProperties:
-            "^port@[0-9a-f]+$":
-              $ref: /schemas/net/dsa/dsa-port.yaml#
-              unevaluatedProperties: false
 
 properties:
   compatible:

-- 
2.42.0


