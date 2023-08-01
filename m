Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D805FEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 06:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3VvrVTmS3ewdRk3DK8RHjaOEKGb5fZ7apaK+oODe/I=; b=1XlguhyhcYqoBr1BH9PLyVslg0
	mVdU5fT3Gc6SwB0oF0CiG/dAoffmTgv1dP2MwJ3x2iDkGehtcmLHxo5v/G18aNung4BeJoMQg2QE9
	I21RufFJvY1LGfSW9F26zwwvFpq66hEM6+0Oyy6XSV0854gaSfelvXDkRqVOwSYL+yMQN/QueZOwN
	3myo4mUa9V53zXqMF2czDb7J+Mm2/jWgRzMTJrBbqETq+39vD83dpxsvWDNqj4F9tN0/38NgwtmzM
	ZDKUoEfBqR1N9PwqcFNniDRHmbaBW1EojQ7Mnuq3+2mKYCoeoS1B3prZ9Sf3k4NpfAP9SUk09x4RT
	6QHpm41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQj66-000U2p-2q;
	Tue, 01 Aug 2023 06:43:10 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQj63-000U1V-1h;
	Tue, 01 Aug 2023 06:43:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EA981BF206;
	Tue,  1 Aug 2023 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1690872181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3VvrVTmS3ewdRk3DK8RHjaOEKGb5fZ7apaK+oODe/I=;
	b=cL3g/ZWzj9cEh8UwFFtxipC92h6O4N8ufQP+0KOvB+BShgr6DIg43HYaqOqktLbPaE5INr
	qkgSuCUF7u+UeSpaRsdNzEB+kihPeYZQUO1ncSOCWpM/BJf+fo+7s7otcdlh9QENEx5kEP
	feEkJ0qb3xv2bqK32vqyNBPTYBQHXdU+bjVIe8hIYbcTUqQ0Ylwphb/9lHfJaPXuVR4TN4
	V1cZDtNRXECwB88xN/RbjSXXhKVu5J3Vo+Wj7SGZWANQ9XLXryHsOeU1pXFY6cFwgPKUI6
	5TQjZiTZUPC/sZlfxpJ6yq3YMqflR/pQvwAlS3fXzf6kcMih0vgipaJlek4Pdg==
Message-ID: <0b605849-0976-f58b-d449-56031b1d0282@arinc9.com>
Date: Tue, 1 Aug 2023 09:42:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: dts: ralink: reorder MT7621 clocks in Ethernet
 block
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230729110449.1357-1-zajec5@gmail.com>
 <96bdb44d-3c59-b6e7-7baa-0ab80efeb720@arinc9.com>
In-Reply-To: <96bdb44d-3c59-b6e7-7baa-0ab80efeb720@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_234307_742690_9CB65A94 
X-CRM114-Status: GOOD (  12.57  )
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

I haven't received anything arguing with this so my answer is still no.

Also, this patch changes the lines introduced with b2f471a26721 
("staging: mt7621-dts: make use of new 'mt7621-clk'").

Arınç

On 29.07.2023 17:08, Arınç ÜNAL wrote:
> On 29.07.2023 14:04, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Use order as specified in the binding (first "ethif" then "fe").
>>
>> This fixes:
>> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
>> ethernet@1e100000: clock-names:0: 'ethif' was expected
>>          From schema: 
>> Documentation/devicetree/bindings/net/mediatek,net.yaml
>> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
>> ethernet@1e100000: clock-names:1: 'fe' was expected
>>          From schema: 
>> Documentation/devicetree/bindings/net/mediatek,net.yaml
>>
>> Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> I'm not sure if I should agree with this patch. The relevant parts of 
> the schema for mediatek,mt7621-eth were added way later than the 
> existing bindings on mt7621.dtsi. Why don't we address this on the 
> schema along with a bunch of other issues the patch for 
> mediatek,mt7621-eth brought?
> 
> Arınç

