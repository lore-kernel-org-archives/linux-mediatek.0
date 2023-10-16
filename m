Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D8CDB482
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSTNCx96ijN7xDd+L1blp4PP7h+p+AqB5mCYZJB4VZ8=; b=1vSDcH1Ep185zXRZAPaviOOYCG
	wJVIFh8lNIrsVK3OQyfAauUnCae4I/KtIi9z3K9PG4SK1LCNFYjHUI5VijXUHN1ijlyTL/DGFxkRk
	ewuSEkqeTLygUMhCZHmLMpGKJIP9VAjHkvO8jfpNCEI/Qb69qpAChtrjK9B96I81F8ySrgh5pbQEv
	VRMnMegBF4vxVUAscfnDP+2fg5rzrMrMLl3F8P5zQ3j792UR0rbzLO7OK+CSqHM6T/Kuq4K2ff0/8
	tZ0p7hHlOjhGyzQEJ6m9oVJPHkFgzb7cIsDZbnYTuQpDTTlEVSPAGnfKdyYgOYn/N0vIMtwOLQn0w
	g21tDHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOs-00AbtG-2Z;
	Mon, 16 Oct 2023 21:45:22 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOW-00AbZA-18;
	Mon, 16 Oct 2023 21:45:02 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57de6e502fcso2970836eaf.3;
        Mon, 16 Oct 2023 14:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492697; x=1698097497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSTNCx96ijN7xDd+L1blp4PP7h+p+AqB5mCYZJB4VZ8=;
        b=pme14agSL4wod3bf4yaAoEDv0Cxb+PleKHNoSA6pQIEwRL3BDkEfmYuqyoLoVLfuR/
         4KErzF/Otrmp2rzBOSkOEqOaoy+LT3pJMmzag12c5hH3PDmcodGE8gmdJXkWIeJ+ZQZX
         1ffJKG6zl9rIBNZKDigg5aXJOIfBY55x9KXU/ugrWpnRfjywChV3TExTjN4ZGkaQR8ih
         UV4T+AclyBzGinWRv1LITMDlK1Rlhe/IF0xJfOYtt9Pzq7p8btmLPr1lK4sJcEImoKIN
         Gaz47fCEQfsWaAeeJfCAGJf1lX5EsOxyYEkCM375YurENWdNoWf3BbrRXYOwXFMEBQ15
         cE1Q==
X-Gm-Message-State: AOJu0YznCluL1bNR5SHS3+ypASfHi6HKVA9DZxD0KIFgbB/WIuxVgsvK
	ZyAjLfAIVcFLCmIDTDXmGqm1VB9NWA==
X-Google-Smtp-Source: AGHT+IEVE6nFcat2AUCk/HtDxiQnH8SCWVk1YkotfqbKD8WxuVGs5L+W66rn7BVzGf/8xA7s3Ce/Cw==
X-Received: by 2002:a4a:d757:0:b0:57b:6a40:8a9e with SMTP id h23-20020a4ad757000000b0057b6a408a9emr284863oot.7.1697492697094;
        Mon, 16 Oct 2023 14:44:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r3-20020a4ab503000000b0057ae5a8e9bcsm16111ooo.28.2023.10.16.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:56 -0700 (PDT)
Received: (nullmailer pid 3823212 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:21 -0500
Subject: [PATCH net-next 2/8] dt-bindings: net: renesas: Drop ethernet-phy
 node schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-2-a525a090b444@kernel.org>
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
X-CRM114-CacheID: sfid-20231016_144500_475750_0ADC4F6E 
X-CRM114-Status: GOOD (  12.16  )
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

What's connected on the MDIO bus is outside the scope of the binding for
ethernet controller's MDIO bus unless it's a fixed internal device, so
drop the node name and reference to ethernet-phy.yaml.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/renesas,ether.yaml    | 3 +--
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
index 06b38c9bc6ec..29355ab98569 100644
--- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
@@ -81,9 +81,8 @@ properties:
       active-high
 
 patternProperties:
-  "^ethernet-phy@[0-9a-f]$":
+  "@[0-9a-f]$":
     type: object
-    $ref: ethernet-phy.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 3f41294f5997..5d074f27d462 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -109,9 +109,8 @@ properties:
     enum: [0, 2000]
 
 patternProperties:
-  "^ethernet-phy@[0-9a-f]$":
+  "@[0-9a-f]$":
     type: object
-    $ref: ethernet-phy.yaml#
 
 required:
   - compatible

-- 
2.42.0


