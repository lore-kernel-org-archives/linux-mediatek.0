Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E55BCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmfkMrLhqQX7VpvIedVUrmMesFIoJFx2r4z/RkhPLxM=; b=a5HW5X+p50A45mUZ+dBL9tpgyf
	vYpsHyR/XN0+FKcdpRDlA6Ko5O2ktIvqYn16kzphc/kyK7r2XTsoeKnwlpiYgP/MMIJ0iYA4CoINj
	J8uP9AjFqIsODpuWTwB566cjhQbUP/5Kf8hSIj9QwQ1JenX5DCiSy9MmR/gzJ/fOs9Stb+8SpJkxI
	vGp7u5BfCQWw7CUhgVTo9HTylX6xQ5DSlUs+vJLsPDfsRiot+2HgMpoBEKWxTnu+Xp5t25KW+Y+OZ
	BHKr8O2I9c7Ldr+v1byACej/QwUjg/3zE2b8xqn9qMWPC5S0UWB30AZ3+YjAWBFoiDwhLpwSNcoZW
	WwpMVF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOU-00AbZC-1j;
	Mon, 16 Oct 2023 21:44:58 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOJ-00AbQ5-25;
	Mon, 16 Oct 2023 21:44:48 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b2b1b25547so2199524b6e.3;
        Mon, 16 Oct 2023 14:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492684; x=1698097484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmfkMrLhqQX7VpvIedVUrmMesFIoJFx2r4z/RkhPLxM=;
        b=vjrqS3AZKBTSoOQcIJhC4zr0lADdGW7nTjJlmbXZTOiAM03VclHCiiqtsHO2L+3Ibs
         Xt3vtZuCdBXxV/hL05mUlPh5Qsx6X2ZKx84PTlyD/f/9N6BdBOTdMN1RQEC/Yh57UcrW
         Uw3wkUJOoquH/bIstwR+ePT3UjI+HkX5wjxSTiOmbG6HyEnWi2kljgG0mLoAgqgTs0wg
         svTTKcZQvuniSPDfyrJtZz09qxJKJK16rCRMXqa0XqQcMdQcGRap5MYXYzzxJm3QgCe9
         QSIDAeUC2IfjeTTWf+8C+XWrVwEFXD8UKMCg24wdPdDFgLusrMggbsDa7COepshOzmCd
         KdbA==
X-Gm-Message-State: AOJu0YwwqUU+Q6h02YOGitpkO6ykhPt2vySZ4mYz4oRCMbJmxqMQ44Fj
	f9pOWwlUwnmHEvGN5eB+fzNaISzRKw==
X-Google-Smtp-Source: AGHT+IEfQAxm2ySnC9Gqk/TcrPYQDumHS+zWd/KV4/wqiJrieKXvQch4seXQxakefCL/Mkb1Co/iqw==
X-Received: by 2002:a05:6808:18a2:b0:3a7:4b9a:43c2 with SMTP id bi34-20020a05680818a200b003a74b9a43c2mr700359oib.13.1697492684081;
        Mon, 16 Oct 2023 14:44:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bi5-20020a056808188500b003ac9e775706sm32192oib.1.2023.10.16.14.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:43 -0700 (PDT)
Received: (nullmailer pid 3823216 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:23 -0500
Subject: [PATCH net-next 4/8] dt-bindings: net: ethernet-switch: Add
 missing 'ethernet-ports' level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-4-a525a090b444@kernel.org>
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
X-CRM114-CacheID: sfid-20231016_144447_687657_845257E0 
X-CRM114-Status: GOOD (  11.44  )
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

The '$defs/ethernet-ports' schema is referenced by schemas defining a
child node 'ethernet-ports', but this schema misses the
'ethernet-ports' node. It would work if referring schemas made a
reference like this:

properties:
  ethernet-ports:
    $ref: ethernet-switch.yaml#/$defs/ethernet-ports

However, that would be different from how dsa.yaml works. For
consistency, align the schema definition with dsa.yaml and add the
missing level.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/ethernet-switch.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
index dcbffe19d71a..688938c2e261 100644
--- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
@@ -58,9 +58,11 @@ $defs:
     $ref: '#'
 
     patternProperties:
-      "^(ethernet-)?port@[0-9a-f]+$":
-        description: Ethernet switch ports
-        $ref: ethernet-switch-port.yaml#
-        unevaluatedProperties: false
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9a-f]+$":
+            description: Ethernet switch ports
+            $ref: ethernet-switch-port.yaml#
+            unevaluatedProperties: false
 
 ...

-- 
2.42.0


