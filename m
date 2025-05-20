Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A7EC3DA6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1atJoeJZpQi4iXcinOZPKw7W7XsZAF/nspMP+bzqfBE=; b=cVUx8y5lgsYV/o
	9oACZCl+5ShPtACMXvthT9vVGjRCb5cB2yg9XPqrNF7dsf0o2IOrJVlF+860Zxo9pH1JpmAuaUoh4
	mHTKvC71fpfUtqsNy3pzHptqdNw/ANND45pkuio6jJStyInBpfju+qD1Et9hUdo8wolOj+caQcTL1
	1UUpN5t6hnQCZJ4kk+vEecxHoHSyHWjVJ6B9O6kCM+iWvE3S9tH7QvShbIgtKd4FRvPRixE6ixaXG
	PLnSTvUMmJlhbsC2LfByRoOdrzZ5rtlx+/EzFa6/pusZ2l0I+eD0HukLPlTi78KloFL3eWZ3nhIT6
	lTEbMFm6WUIQayw5y+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQU2-0000000DeNU-1OrU;
	Tue, 20 May 2025 17:10:30 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQRq-0000000Dduu-0Ybd;
	Tue, 20 May 2025 17:08:15 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id B507E60201;
	Tue, 20 May 2025 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747760889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1atJoeJZpQi4iXcinOZPKw7W7XsZAF/nspMP+bzqfBE=;
	b=tn1Bihvj0KwV8hHaE37t3Vohm7jwgCgsfyOBKhhM64BV6mMF/uSfwvpDZOzV9Zd927FjDp
	ib0UEXhYcEnzEi8tYnH92766++nlm16whVN09VOVY30MPcDVElsWjeFk9P0mifh80ZunPC
	wrjFBJfjm9W2bBtdd4KkbouGffuy3kc=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id BEBF83601DF;
	Tue, 20 May 2025 17:08:08 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:08:08 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 06/14] arm64: dts: mediatek: mt7988: add cci node
In-Reply-To: <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-8-linux@fw-web.de>
 <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
Message-ID: <6c0dd946bdebd8461307a3e08e60a27f@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 1e75dd63-5eea-4a06-acca-51b6c01efd9c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_100814_475960_0ABC39FC 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Ar=C4=B1n=C3=A7_?= =?UTF-8?Q?=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2025-05-20 13:27, schrieb AngeloGioacchino Del Regno:
> Il 16/05/25 20:01, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add cci devicetree node for cpu frequency scaling.
>> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>> @@ -12,6 +12,35 @@ / {
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   +	cci: cci {
>> +		compatible = "mediatek,mt8183-cci";
> 
> While you can keep the mediatek,mt8183-cci fallback, this needs its own 
> compatible
> as "mediatek,mt7988-cci", therefore, I had to drop this patch from the 
> ones that I
> picked.
> 
> Please add the new compatible both here and in the binding.

Hi,

should i add the binding with 2 const (like the bpi-r4-2g5 compatible) 
or first as enum
to allow easier addition of further SoC bindings with same fallback?

currently i changed binding like this (2nd variant):

properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - mediatek,mt8183-cci
               - mediatek,mt8186-cci
       - items:
           - enum:
               - mediatek,mt7988-cci
           - const: mediatek,mt8183-cci

but noticed that these boards are missing the required proc-supply:

   DTC [C] arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: cci: 'proc-supply' is a 
required property
	from schema $id: 
http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   DTC [C] arch/arm64/boot/dts/mediatek/mt8186-evb.dtb
arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: cci: 'proc-supply' is a 
required property
	from schema $id: 
http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#

the others are clean so far. But because i do not have these boards i 
cannot fix this without
anyone telling me the proc-supply for them.

In mt7988a.dtsi i can put both compatible on 1 line as there are only 75 
chars, or should i
add linebreak here for better readability?

> Cheers,
> Angelo

regards Frank

