Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F655C001DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOPjuFWRIoL4Z0Eeol5gO6QE7SM7OBiqVr5rmWDNiY0=; b=Jt8YjbYmkvqm+iW5gHLak4FX4/
	HlcPpYZ621WzVTll9VNvgyXzhvQgO7rb2uMeLwa6fvnV/1bDthbAum36reXENgPc3q2/80rd0EF/6
	BBtvhwvcdbkE9PdmhbNTXU/4MP863BnLaW56F13SQJEp/G3clb5F8gy3cXMVDZcZR7lqnCzU9xlpi
	+JIt1M76w+OHyALFuGN+rS0Ak0UTiWBfHtrMtHmlj4VgqkdcpQYsNv1L6QUvH4y5kigiLC5/EUXEr
	Hie/0A8CY0rAnYkNwANfRp/WLU1tb3bFs+1RUt1K1B5ie5AmNREBjaYJJli6ek/lXOTr/Em+dlfcZ
	nfwzvIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkSl-007gR3-1F;
	Sat, 29 Jul 2023 13:58:31 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkSg-007gFK-1C;
	Sat, 29 Jul 2023 13:58:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A241C0004;
	Sat, 29 Jul 2023 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1690639101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOPjuFWRIoL4Z0Eeol5gO6QE7SM7OBiqVr5rmWDNiY0=;
	b=EBG41HMYCfHzsxX3Lu9wjhkOhuazVRfwvQjx8aikqyaWwoErHMXsViXnbGoqg8Nond5/Ie
	HFcvgQ+1rSLKe6Noru8SdP36Q08DwtfLx+vnxlUmQwTyyJPL/qs3ONncHX5t9vasJE0DoX
	/eUthf9xVwmkfO/rLXQZWdtFLykvy0nRUlIhEylCGqp+qNxw+t3FQG17qIEomftqzei86U
	nf9JFAW3gXQsm8cxVOQEkEImwkkNkMtC/LEaxEvx4UslsC1bvpwcAcgGqreWQFtlGkpm8B
	phERC66B0NTICUCuh6LsJeHI82jprLe45uKr1PAdK/4+AvNSTuhPiGZt3sxqiQ==
Message-ID: <cef11e4e-d96e-8cc8-045c-adcf006bdcf0@arinc9.com>
Date: Sat, 29 Jul 2023 16:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MediaTek Frame Engine Ethernet: does it need any resets?
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Network Development <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>
References: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_065826_574397_66BB2F17 
X-CRM114-Status: GOOD (  12.17  )
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

On 29.07.2023 14:45, Rafał Miłecki wrote:
> Hi,
> 
> I'm trying to understand MediaTek's Ethernet controller resets.
> 
> I noticed there is sth fishy when checking dts files. See following
> errors:
> 
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
> ethernet@1e100000: resets: [[2, 6], [2, 23]] is too short
>          From schema: 
> Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
> ethernet@1e100000: reset-names:1: 'gmac' was expected
>          From schema: 
> Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
> ethernet@1e100000: reset-names: ['fe', 'eth'] is too short
>          From schema: 
> Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: 
> ethernet@1e100000: Unevaluated properties are not allowed 
> ('reset-names', 'resets' were unexpected)
>          From schema: 
> Documentation/devicetree/bindings/net/mediatek,net.yaml

Sigh, looks like this patch was applied regardless of my points here. 
Now we're here picking up the pieces.

https://lore.kernel.org/netdev/b6c7462d-99fc-a8e1-1cc2-d0a1efc7c34d@arinc9.com/

> 
> 
> 1. Binding mediatek,net.yaml
> It says that when present, there must be 3 resets: fe, gmac, ppe
> 
> 2. mt7621.dtsi
> It specifies 2 resets: fe, eth
> 
> 3. mt7622.dtsi
> It doesn't specify any resets
> 
> 4. mt7629.dtsi
> It doesn't specify any resets
> 
> 5. drivers/net/ethernet/mediatek/
> I don't see any reset_control_* code at all
> 
> 
> Can someone help me what's the actual case with resets? Are they needed?
> Are they used?

I'm adding Sergio to CC as they've been the one working on this on 
mt7621.dtsi.

There's relevant information here.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=64b2d6ffff862c0e7278198b4229e42e1abb3bb1

Arınç

