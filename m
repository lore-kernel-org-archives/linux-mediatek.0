Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A676CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gEGU67h2aLgP+jVHENE55AMROY3oIX9Sz/12+e/BNPI=; b=GLmziCFrLrFm8k
	El+UVfRSchgZ4o0h1q4Eu6VNaLYZD5WDqP2NfFBhVqOAXOhm/JNEjSSAyKwe41gu4avnj5/FRczk+
	/09poa+GF9vtsh8U9F8MeT9j4wJcdBH4xq0VTO0CI/6soYpQjV3j4rIpn5qzjeikKZXwWiW1arXQx
	8u88kzpWyf0qwJ0oOh15fqzzbmcHoSc+GN8VYEdaKUW+YNFJzBRkYlnWDdnXdRhJieRBzy98b/GGS
	xKghu1QxNGxEOCU3y7Kxz5ELDRp1xnriABVVJRv2tE3QCko+H3NuZab6JBfvs6w3QrCE25USkMVQx
	o8usbXNrrM07GYw4Fa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOH-00AbQ9-0j;
	Mon, 16 Oct 2023 21:44:45 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOD-00AbOI-2X;
	Mon, 16 Oct 2023 21:44:43 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6c7b3adbeb6so3595177a34.0;
        Mon, 16 Oct 2023 14:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492679; x=1698097479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEGU67h2aLgP+jVHENE55AMROY3oIX9Sz/12+e/BNPI=;
        b=kDgfnPuiyqtiA9jR1A3Rd+5kE9ruH2ZGM2pwIqO/7/sx2rxpE7I0e9Rq+jg4pmxyAP
         /hW0lr+K78Ix6wGy0Dnhvv4/BArjBQVueszXOWQf6FkGVLISoAT7Jw8iE0fal7vzP0gH
         Koewx/5SeOJJm119M+4T4tVcN14cHddaORn58P/PG7YjbIRB7NxjCY8IW8ZoPM2lpXnp
         2UPC3KhJD92AYkVsl2SfcV76PSDNBA6yHqZb9pzxNgW9P5CQi1Iswmiu98SG4evGWbOI
         i5GE56NCSyX537qj7Fb0VFJnb7PU4PXD6fkiF2q5YjMl8wHeCnicubOIBWsSlig88lPS
         eLcQ==
X-Gm-Message-State: AOJu0Yy2ZAnaOIxKhriYyiMugcjxMtqPgeqm6Jft61pFP0Jo5HCpDkuN
	e7N2hjYVwumnlzo3jBdSL6bMRPlYiA==
X-Google-Smtp-Source: AGHT+IHuNmP8V6sstTsEu3VVHzkFP0xhM7V0ZTHQhU/5l3uo4mYCmbaKF/vdgAVoy0+B7a5WdoyAzQ==
X-Received: by 2002:a05:6830:3499:b0:6b9:a6ef:2709 with SMTP id c25-20020a056830349900b006b9a6ef2709mr740772otu.8.1697492678863;
        Mon, 16 Oct 2023 14:44:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a9d4b87000000b006c21f11dcecsm28451otf.49.2023.10.16.14.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:38 -0700 (PDT)
Received: (nullmailer pid 3823207 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH net-next 0/8] dt-bindings: net: Child node schema cleanups
Date: Mon, 16 Oct 2023 16:44:19 -0500
Message-Id: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOuLWUC/x2M0QpAQBAAf0X7bMvdSfgVeThnsaWluyMl/+54n
 JqZGwJ5pgBtdoOnkwNvkkDlGbjFykzIY2LQhTaqUBWOEYUiupWsHHvAwRpt6qF0tqkhVbunia/
 /2MFnCl0R+ud5AX4J6O5rAAAA
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
X-CRM114-CacheID: sfid-20231016_144441_822555_FB2174B3 
X-CRM114-Status: GOOD (  10.79  )
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

This is a series of clean-ups related to ensuring that child node 
schemas are constrained to not allow undefined properties. Typically, 
that means just adding additionalProperties or unevaluatedProperties as 
appropriate. The DSA/switch schemas turned out to be a bit more 
involved, so there's some more fixes and a bit of restructuring in them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (8):
      dt-bindings: net: Add missing (unevaluated|additional)Properties on child node schemas
      dt-bindings: net: renesas: Drop ethernet-phy node schema
      dt-bindings: net: dsa/switch: Make 'ethernet-port' node addresses hex
      dt-bindings: net: ethernet-switch: Add missing 'ethernet-ports' level
      dt-bindings: net: ethernet-switch: Rename $defs "base" to 'ethernet-ports'
      dt-bindings: net: mscc,vsc7514-switch: Clean-up example indentation
      dt-bindings: net: mscc,vsc7514-switch: Simplify DSA and switch references
      dt-bindings: net: dsa: Drop 'ethernet-ports' node properties

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |  2 +
 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  2 +-
 .../devicetree/bindings/net/dsa/brcm,sf2.yaml      |  1 +
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 11 +-----
 .../bindings/net/dsa/mediatek,mt7530.yaml          |  8 ++--
 .../bindings/net/dsa/microchip,lan937x.yaml        |  3 +-
 .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |  4 +-
 .../devicetree/bindings/net/dsa/qca8k.yaml         |  1 +
 .../devicetree/bindings/net/dsa/realtek.yaml       |  2 +
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml       | 10 +----
 .../devicetree/bindings/net/engleder,tsnep.yaml    |  1 +
 .../devicetree/bindings/net/ethernet-switch.yaml   | 14 ++++---
 .../bindings/net/mscc,vsc7514-switch.yaml          | 46 +++++++++-------------
 .../devicetree/bindings/net/nxp,tja11xx.yaml       |  1 +
 .../devicetree/bindings/net/renesas,ether.yaml     |  3 +-
 .../devicetree/bindings/net/renesas,etheravb.yaml  |  3 +-
 .../devicetree/bindings/net/ti,cpsw-switch.yaml    |  2 +-
 17 files changed, 51 insertions(+), 63 deletions(-)
---
base-commit: 4d0515b235dec789578d135a5db586b25c5870cb
change-id: 20231016-dt-net-cleanups-ba3238b4ca98

Best regards,
-- 
Rob Herring <robh@kernel.org>


