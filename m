Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B4BEDEC6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkIQnIuFCF1TTp1ea3vLPJG6FNuTS8tRKjMxldrO4oM=; b=n38EJOoor3p0yHUPUS9bVBru1d
	cog0pnSLQe5vtwiHM5Chk62jHzjoemGZtocTwuZEKdsfzjHotFF7g6FX0VTS7Nqy1vWBEnqWQNL75
	2QrwSXGA74ZL1eHa113kQcK6bFt9J1bxRon4hpjyf4DsJBVYFdAVDMJR/nuxNO5LE6ZZGxsJ413oS
	8u/OdlHckjW9w0LbYA6wxMpcgOYyX/W/lsE0taplJX6IrLfSOyxJGLOtZiDtJnVE8/9oW3GTo9hPH
	8ykwjyOQw1SpUPzcZwSjJ7kq0IIuB/EPCZF+f9TY/6I8greLjGzVc9D68oz2g5MDNeYxBvizxW52s
	2qfjuXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQzF-0067wl-2E;
	Wed, 13 Sep 2023 14:37:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQzB-0067tw-2e;
	Wed, 13 Sep 2023 14:36:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C56931C0005;
	Wed, 13 Sep 2023 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694615809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kkIQnIuFCF1TTp1ea3vLPJG6FNuTS8tRKjMxldrO4oM=;
	b=HEBFCtkjbRZFJkev8Pf8mhxM3RpoVAvD4QVoBNYxzrOaDscDxTFNA+yN7T81EUckVol9u4
	xjgKo9Q2xVQt3oM3BBz7rNoFGOOjvyYNOl0F5adqeTjK0UACKAcGc4926K4ZdnBlqjJ08o
	TpIrTeJB8xnY7NWS0l094yS+bhkU6fqnQUiGeuRrM2KJxHJwFpeCvR9WyU4wa4Wwh1B6hQ
	2Qre22XS5evB8RsPzIkTLVjNiZHZfV7EkTDVZUkl8/RjO128yfKq/8wwffdLy05kzQ6GgG
	m4eAKhrIq4COyT9WCMl2GYyyhWow3rwrabnUMW24Rcu4ES+LLBYao4WeKApkJQ==
Message-ID: <58b87aea-c7f5-4e7d-9736-74a2ed997306@arinc9.com>
Date: Wed, 13 Sep 2023 17:36:36 +0300
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
References: <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
 <20230913110404.co7earmnbzf6hhoe@skbuf>
 <137fd54d-7d2d-4d0b-a50b-cca69875a814@arinc9.com>
 <20230913130049.ivvl4vzjcfedsddr@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230913130049.ivvl4vzjcfedsddr@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_073658_019803_8D556D4C 
X-CRM114-Status: GOOD (  10.63  )
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

On 13.09.2023 16:00, Vladimir Oltean wrote:
> On Wed, Sep 13, 2023 at 02:35:11PM +0300, Arınç ÜNAL wrote:
>> On 13.09.2023 14:04, Vladimir Oltean wrote:
>>> I don't think they're for switch ports only. Any driver which uses
>>> phylink_fwnode_phy_connect() or its derivatives gets subject to the same
>>> bindings. But putting the sub-schema in ethernet-controller.yaml makes
>>> sense, just maybe not naming it "phylink-switch".
>>
>> Got it. Should we disallow managed altogether when fixed-link is also
>> defined, or just with in-band-status value?
> 
> Just with the "in-band-status" value - just like phylink_parse_mode()
> implies. If not possible, just leave that condition out.

I can rewrite the property to allow values other than in-band-status.

       - if:
           required: [ fixed-link ]
         then:
           properties:
             managed:
               const: auto

Arınç

