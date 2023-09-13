Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F411CEDEC45
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbMwXGk6o+lbYJAjbVb82tnFj2aYuAgarBbBqqRuBPc=; b=eOjTJnIA/LmNmEZt0Qy+JfLgYH
	P2cGy8JLVTwyoMFgqJVqpa2okrA73l4g8SbXZww3UhgGkrJZF/GNRRoxQewj03AOIwV519wINaE8D
	TGVFgWbQro7r5jAYhwPFd2rTpKxwZo9FSmOAIfdzrXsUPbCAM+EJTaBlIFyOutL3MHWEMj2Mk6VzC
	Ryheo1C3kT656PNwpi4HgKeiewx1znqnOhlo6T6NR2ORs8CucBqfNRk+qhEWBhyWPOxqzvq5MCl24
	FYVJsSn8oXY/JIPYeHF+f4KMNedfycDx0f6DCItgKZNY18euJQjoqoG0nuSlh7GIsivfAQYy4ylGR
	LhMlPZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgO9l-005ks2-0A;
	Wed, 13 Sep 2023 11:35:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgO9g-005kpu-1X;
	Wed, 13 Sep 2023 11:35:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 235F224000E;
	Wed, 13 Sep 2023 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694604930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WbMwXGk6o+lbYJAjbVb82tnFj2aYuAgarBbBqqRuBPc=;
	b=Z2GShICU3ihvCutupOM5tgMDhIm2mE3jZBu65j1kClIXb2kYp4zA/1kLyRZzGnS+y8zwpF
	i86FO0SJS5yz1RmHw7lK4RftC4V8Zq87sTEDaeW6ujIFLUgkEcgSneHohDugmA/6dXn9M7
	l6ri9KtfyFJDfNZa5xmZdwMi4UJUcKqCk4itn8lqSf4uXjh/hLbvGajBUtR+3uqm8KgPyE
	P0CTMnaxoU9OeECX6sFWp7QiheE76FXBve+lU0I1gknHwXcQtOK6Ujz0RJT34oRYMgMcUy
	ootEQlkXZFAYcTtHnxCsV1YuntvZx6uKdcTZYTyUsvrhINyUHJiJQGJmuJjvIw==
Message-ID: <137fd54d-7d2d-4d0b-a50b-cca69875a814@arinc9.com>
Date: Wed, 13 Sep 2023 14:35:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
 <20230913110404.co7earmnbzf6hhoe@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230913110404.co7earmnbzf6hhoe@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_043536_792167_D4C0173C 
X-CRM114-Status: UNSURE (   9.54  )
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

On 13.09.2023 14:04, Vladimir Oltean wrote:
> I don't think they're for switch ports only. Any driver which uses
> phylink_fwnode_phy_connect() or its derivatives gets subject to the same
> bindings. But putting the sub-schema in ethernet-controller.yaml makes
> sense, just maybe not naming it "phylink-switch".

Got it. Should we disallow managed altogether when fixed-link is also
defined, or just with in-band-status value?

Currently:

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 9f6a5ccbcefe..3b5946a4be34 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -284,6 +284,21 @@ allOf:
              controllers that have configurable TX internal delays. If this
              property is present then the MAC applies the TX delay.
  
+$defs:
+  phylink:
+    description: phylink bindings for ethernet controllers
+    allOf:
+      - anyOf:
+          - required: [ fixed-link ]
+          - required: [ phy-handle ]
+          - required: [ managed ]
+
+      - if:
+          required: [ fixed-link ]
+        then:
+          properties:
+            managed: false
+
  additionalProperties: true
  
  ...

Arınç

