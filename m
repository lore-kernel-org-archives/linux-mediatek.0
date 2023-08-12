Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEAAC04A6A
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0tFZ9iZJY1cW3i69oGk18vJfZc2Ya3VW3GueM9Vdfw=; b=RoP0xUlc58pFV6dsxZgs5jVqeb
	DYTN/IVVncDFfYpslDx7S8FImBkL+oMJzIyAOBd44AkXDVU7wLK0mNSxIeuczaq1MDllfC85zmSn+
	sG7I7WzVVAU4Z4eyX/sCzl6Yn6yolvlDWKIQSu3av/WMSRQ7hZsGAO9xF8mkPPPZ0/YVhphDZWSKd
	SNIwX5y/6twPqlE/NS/dOGTziMnny4ug7kteri5wW+YBdSqhe7s6w9bCeBxY2tUEStKN/RkJrpEPh
	gwiND3FuPMvZn9BA2f/N88xIbJI0BuANvlrged+Uxx2PDUjh9n4aQcsSv4q94h3cfpfEf8EgtnnKl
	ITNNlF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUrX8-00DiNj-15;
	Sat, 12 Aug 2023 16:32:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUrX4-00DiMH-1w;
	Sat, 12 Aug 2023 16:32:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A187520002;
	Sat, 12 Aug 2023 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691857924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0tFZ9iZJY1cW3i69oGk18vJfZc2Ya3VW3GueM9Vdfw=;
	b=XRVBlDJf3+BDJtYBUIKHXrhqWtZNwQdvgBRWcdWOHBlmuBhhs8pME+7zkv7qlGGpNz4I+y
	MhJwwY+TQq10v5fM/u3gOUAtPNvT9q44nhq7ngJDucd3+0LJqXanXaYS3oY83y6kaScpEl
	Z9CDYUFlY9MUrhYfBld4zV/rxoa2igZM4zsH6ikXH1q0gMKjZRM49oSjzHdtKXmV4k6DoN
	rdB7CydIxjiK8OgrWlTzKuOF2XuUaUy5mKzlrhu9yDoCHmIEUEwzshDMReMVImsqimMUT6
	H4XwRy4naTrMvLcX+ldb0PmWDeF7RmcN3ka6lThJ9uWEJhI9+YeAeMtNJpikeA==
Message-ID: <fc4344b7-232f-48db-9258-db6face34494@arinc9.com>
Date: Sat, 12 Aug 2023 19:31:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: net: dsa: realtek: require compatible
 property under mdio node
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-4-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230812091708.34665-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_093206_807375_68EF8F13 
X-CRM114-Status: GOOD (  13.40  )
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

I will drop this patch because only the SMI controlled switches must define
the compatible string. There's no way to make a distinction between the SMI
and MDIO controlled switches on the schema so this would mean requiring the
compatible property for the MDIO controlled switches too which is wrong.

Arınç

On 12.08.2023 12:17, Arınç ÜNAL wrote:
> The compatible property must be defined under the mdio node. Enforce it.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   Documentation/devicetree/bindings/net/dsa/realtek.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> index ea7db0890abc..f600e65fc990 100644
> --- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> @@ -103,6 +103,9 @@ allOf:
>               compatible:
>                 const: realtek,smi-mdio
>   
> +          required:
> +            - compatible
> +
>     - if:
>         required:
>           - reg

