Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F0CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jTB9zIiEc1w3dV0yd0t5E2LOHf4j7ptaKP+lxDYNiM=; b=CIFoo5J7d30tTpXO7kfxNMcHlN
	duy1wPtjrecEAAmtpx5YU+OWFQpso+q3/UtHP8ixWgfMrnDolQDigjWU6K/CuXDsTswJrF3sfZO4C
	+ocUALf9mcVEvg7qzBKnFYLSVvXe0CakW9Om7Ix1ePNwHrO7S8IeUixGUhVlMt6EYryaXdzG7F87v
	w21yNQiH2p+ws9v3ir92bRy6TdRVBb5a5IpUUW6rIm3DI5yCEVsngHOZk3OguwaM1EAaPqNDqLN7C
	PWxhL66TidufsvwF2dvFOHfgkCV7dYnlokGWTNxXo+nIpBnHS/9IZh1wce4s2RUSY0csFL2Ky8vqv
	CGwQsy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsde8-00BQjR-0T;
	Tue, 17 Oct 2023 06:33:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsde3-00BQhR-2Z;
	Tue, 17 Oct 2023 06:33:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 799091C000B;
	Tue, 17 Oct 2023 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1697524409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jTB9zIiEc1w3dV0yd0t5E2LOHf4j7ptaKP+lxDYNiM=;
	b=Qd/0lHbhNuK7fblTuiGrURVXvxKS2T/mZ4P9pNOgwRehd0XPS6j8GTBXtCmSkwHFTRH5uh
	TFSBaOBs34KcGlgQh0jquChihEJCQxmPXWD5xkpt4Kbm8LwK3w17203+13Pu0fj/SeDIie
	wBaCqEaA/fZmWjPrhFjw7Xw/kH43bs6J21FNtCAN2xOz57VRYcDz/zkLCB7LhsQb5IPzU4
	Rqa7TZQwak69zWYsoLvzFk9IPmDb8/Nymi0DLYx3sHgua0d2j/8TspJLbW42TRSxyYbNTx
	q5dRuCeSRJYF16Khso1kzUwxTiBANNJVzaBYkleusWnGEcDtivf6gUM8mB7tqg==
Message-ID: <7b9813ba-0ab8-4ded-bc86-0f9aae505be1@arinc9.com>
Date: Tue, 17 Oct 2023 09:32:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/8] dt-bindings: net: ethernet-switch: Add
 missing 'ethernet-ports' level
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-4-a525a090b444@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231016-dt-net-cleanups-v1-4-a525a090b444@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_233336_110059_06270F20 
X-CRM114-Status: UNSURE (   8.57  )
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

On 17.10.2023 00:44, Rob Herring wrote:
> The '$defs/ethernet-ports' schema is referenced by schemas defining a
> child node 'ethernet-ports', but this schema misses the
> 'ethernet-ports' node. It would work if referring schemas made a
> reference like this:
> 
> properties:
>    ethernet-ports:
>      $ref: ethernet-switch.yaml#/$defs/ethernet-ports
> 
> However, that would be different from how dsa.yaml works. For
> consistency, align the schema definition with dsa.yaml and add the
> missing level.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

