Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2FCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgkZY4yEAeEqDfcsSpYD9I+A+ikpbLIHeBQl2vVrEO0=; b=gDFOHipoQ+QaE3iPq4MeW9QJ5S
	0HKl9N70cV2M9BSU9TbnijHQSDjaVTVe4VDmPDtQu+UAAupaaGppkonGioj9tGPmvHZ5wUj8RP0Hl
	DXXV183J3OldIRlksjlA1DJNVUcFvedU6cELgWC6gEALs4wTz2pUkbz8XoJTdkhqheOaX+NX9SsGp
	4bYIv1elOaygysyc9gUC/A0U/AtpnQlj6vPVgf7Uxd+TSSBCkgP0U+XEA1GBoi4cMGq5dZdNdhgVR
	dWWq09/eYwXug1lnNRrg+76BR/ttsTE2q3TTj1WASHrZzD6rn9JAvGJIkiq0ScemD3iINNcH/8W5/
	JF8+kyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOm-00AboX-1I;
	Mon, 16 Oct 2023 21:45:16 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOT-00AbY8-2G;
	Mon, 16 Oct 2023 21:44:58 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e9d0fc55beso1840264fac.3;
        Mon, 16 Oct 2023 14:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492694; x=1698097494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgkZY4yEAeEqDfcsSpYD9I+A+ikpbLIHeBQl2vVrEO0=;
        b=kEbDgk1G3l3hkoxj0qlRD9+b7JtyO6HzqsA2DBhLNCD2Z4okD/qQc3ayphmgCM5x8o
         HiDIOV32WrqYda0zo7l99s95yTIA9h+fu/3+brgGnyoqMTusrIxX9V1ENkcNi5W1BfdS
         cKju8uAPr0mCORmBM9JLh8/HAnjQwi7/6ezbQDE1+r+VG9Scl/eT3SDdbY2TqtZTFX1X
         pqh9RtPl6rONrxAQ6EGdnWxpFcN2jj2QWYISE85f9eH22TR+o6gZ/o9mRhDPcecqaVMm
         Vt7K5rGuTA542DQIAJngx4w6TJVnEZqoT2/cl1SdrWQC/m5qt5+B2n941/KkK0Qkm6b3
         T+Ow==
X-Gm-Message-State: AOJu0YyZI7Q/iUlJp4EebVTpbTFuKrCh8HPJAPhWaPLXqqfPeOisGUQN
	8UBB73M1imlyf3o6lwACxRYxkto3Cg==
X-Google-Smtp-Source: AGHT+IER0+zM9rQTeSBTpDXhq27aL8B0l2V/HFAOMXgvaN9iR4T6Jv7HeoKsOLVk8pksacBkXQt5/g==
X-Received: by 2002:a05:6870:858c:b0:1d5:aed5:6579 with SMTP id f12-20020a056870858c00b001d5aed56579mr328754oal.4.1697492694494;
        Mon, 16 Oct 2023 14:44:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r5-20020a05687032c500b001e5dd8a29c6sm8595oac.29.2023.10.16.14.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:53 -0700 (PDT)
Received: (nullmailer pid 3823224 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:27 -0500
Subject: [PATCH net-next 8/8] dt-bindings: net: dsa: Drop 'ethernet-ports'
 node properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-8-a525a090b444@kernel.org>
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
X-CRM114-CacheID: sfid-20231016_144457_738634_D54645CE 
X-CRM114-Status: UNSURE (   9.45  )
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

Constraints on 'ethernet-ports' node properties are already defined by the
reference to ethernet-switch.yaml, so they can be dropped from the DSA
schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index e6010821f86f..6107189d276a 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -40,15 +40,6 @@ $defs:
 
     patternProperties:
       "^(ethernet-)?ports$":
-        type: object
-        additionalProperties: false
-
-        properties:
-          '#address-cells':
-            const: 1
-          '#size-cells':
-            const: 0
-
         patternProperties:
           "^(ethernet-)?port@[0-9a-f]+$":
             description: Ethernet switch ports

-- 
2.42.0


