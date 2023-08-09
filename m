Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118CFC001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY7idmXtzOR/PC5YeEKZEVA/A054NNzndr9Zg5TyDl4=; b=nyPJtYHHIAxwSZ5FORGH22ZBCM
	SDyfTpm/SEkURb5VIjCLko90AtJ+RxvPeEQ3P0Axvm2COZ0xxJSBzzpaxqMWiRa98oBEOICtidKbs
	dV3SHVd25yKMltlaQcdeSfuCQpZPacRpUECNJdoJMtiP6rUKLGJI7Dvea+FcCAQ+BU/THTC6KrQ/B
	uo3C1bGbLk8u7PWwzD+hxZLHYOnVKc4pj4wfn08fSvbmD1QV8WLeSgv3U10IHWHrXBz26MSMLJ6vU
	jTxcCuPxwOUPfdQ+ntB5L1Bi92W5vY0LVYBfC8IaMPmHgYcQGzPMA221nPYAK/YBZtiSW++BwW64w
	x8PLTnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTf6Q-004QXz-1u;
	Wed, 09 Aug 2023 09:03:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTf6M-004QWx-12;
	Wed, 09 Aug 2023 09:03:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A1D360004;
	Wed,  9 Aug 2023 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691571809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TY7idmXtzOR/PC5YeEKZEVA/A054NNzndr9Zg5TyDl4=;
	b=ge+WpLQZNVsCKJKDx/vwzWayO2FvINhQEq8GhHxjzdo/DfKr/2hRqOPfwtXMG8OMcE2Tg1
	AuX7PyccTx+wm59x51mOX+H4WcElmKLObWyA00wdHHwvgRPhgPgBMYXerA3hiY8mXKze12
	X36t7wJRAW8IiHBXp+3dXk0ICC64z2ip93xRDwAipHSE6vmMKhdtg5NqUGuHlZ+HrFiQdJ
	BUX8OiUlC/1mUmXxDmuGGp6bTyAHV8x2FK8LT7dG8DmHpv4pEAvYc+SaD2s3qV0og9Djp0
	RMU95gASBhcLH12b/T/WKziGHsTog8GaBVkmRIpbnqoLyDVBLUqmYOti9Hn9YQ==
Message-ID: <44fde617-1159-4961-84c4-372fe265fbd8@arinc9.com>
Date: Wed, 9 Aug 2023 12:03:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH RESEND net-next 2/2] dt-bindings: net: dsa:
 mediatek,mt7530: document MDIO-bus
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6eb1b7b8dbc3a4b14becad15f0707d4f624ee18b.1691246461.git.daniel@makrotopia.org>
 <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org>
 <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com>
 <20230808121707.chona7hakapp6whe@skbuf>
Content-Language: en-US
In-Reply-To: <20230808121707.chona7hakapp6whe@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_020334_648113_7A08835E 
X-CRM114-Status: GOOD (  14.31  )
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

On 8.08.2023 15:17, Vladimir Oltean wrote:
> On Sat, Aug 05, 2023 at 11:15:15PM +0300, Arınç ÜNAL wrote:
>> I don't see a reason to resubmit this without addressing the requested
>> change.
>>
>>>> Wouldn't we just skip the whole issue by documenting the need for defining all PHYs
>>>> used on the switch when defining the MDIO bus?
>>>
>>> Good idea, please do that.
>>
>> https://lore.kernel.org/netdev/0f501bb6-18a0-1713-b08c-6ad244c022ec@arinc9.com/
>>
>> Arınç
> 
> Arınç, where do you see that comment being added? AFAIU, it is a
> characteristic of the generic __of_mdiobus_register() code to set
> mdio->phy_mask = ~0, and nothing specific to the mt7530.

What I believe is specific to DSA is, 1:1 mapping of the port reg to the
PHY reg on the mdio bus is disabled if the mdio bus is defined. Therefore,
I believe a notice like below fits mediatek,mt7530.yaml.

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index e532c6b795f4..c59d58252cd5 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -128,6 +128,15 @@ properties:
        See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
        details for the regulator setup on these boards.
  
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
+      For every port defined under the "^(ethernet-)?ports$" node, a PHY must be
+      defined under here and a phy-handle property must be defined under the
+      port node to point to the PHY node.
+
    mediatek,mcm:
      type: boolean
      description:

Arınç

