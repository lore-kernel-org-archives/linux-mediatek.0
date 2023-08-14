Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0161EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbVPpkyEOJUgGmxtmstEv2GtjtTazm0fOZVgp5UmpA8=; b=LntVDGXalkZ4sKQzn2svJ6wFcV
	ngzRufV01TByGpGtolpuT08gHstSM/QimkQRD2vV0RjJzpqp8TB9A35+kWAkFdzHRxB2zcA3Kjdrd
	ctPZwM/M8+E3Pj4EB0BgSvQ3iszA3b/zoRMjz2X35CDuSY5m+BbHsGBxgH6QiNcM4IWkWMXJ50X/e
	MEkksXXUHZD4BYnTVItzS7MR7PSjukhUmrPYwUtfYZJ+OAjEGZE3CGUBETBa4Zw2moXeIZYFTKFQO
	yKL0CZmlmQj9OndH7agkGzwpp9iIU0s26bM18ACgGfPVuBHO1ovhe4bQ53pmU208q4gI7DCSp1b4M
	F6TWt8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUT8-00Gg6S-0q;
	Mon, 14 Aug 2023 10:06:38 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUT4-00Gg5u-2A;
	Mon, 14 Aug 2023 10:06:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BB671BF203;
	Mon, 14 Aug 2023 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1692007591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbVPpkyEOJUgGmxtmstEv2GtjtTazm0fOZVgp5UmpA8=;
	b=N87HHv7egjNhT/uSaS+jgewIRjChDo0kX4/yyCZJRburX7A5u4+66LllAEhFYIBQuRF1IX
	9LLT6I520brghXYfDy2vCyu8dH+pU+kbTbEu6C/IyiXJ1K4WNAJl8xKYIWZUh0/eZylTke
	XYTBUeSEK+NqBRR2f2wjg16SSvI1grr9YE+88NgeTJuexjPDf/+V1rNKo8P12cYjxJaN+x
	8yjTvXaaR8ueAtbHGu/EwuYMSP2engoCgkh3zbYESPzcLuiZ6n0GZk4GgrT0gONwlJJ6ou
	JCWF9r3GRYW6QY+kQ45ZGT9qEJPHU8EhvQwNkf5mpmethiP5AkZMtu4ez0O2Kw==
Message-ID: <af044838-36ef-4ed3-af0a-a58181b6345a@arinc9.com>
Date: Mon, 14 Aug 2023 13:06:19 +0300
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
References: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <891c0b67-abe1-416c-aa94-675f7f3d8044@arinc9.com>
 <20230813190227.6k2qyxfewbkmatn6@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230813190227.6k2qyxfewbkmatn6@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_030634_866375_9374379F 
X-CRM114-Status: UNSURE (   8.52  )
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

On 13.08.2023 22:02, Vladimir Oltean wrote:
> On Sun, Aug 13, 2023 at 05:58:57PM +0300, Arınç ÜNAL wrote:
>> On top of this, I'd argue to document the internal MDIO bus on the
>> ethernet-switch.yaml schema instead.
> 
> Why?

Because a generic switch can have an internal MDIO bus, it's not specific
to a DSA controlled switch.

Arınç

