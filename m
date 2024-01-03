Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E30C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ryXPDST+dLhNz8lT4+H6q4OrXdQuKzS88l4YRa6xOk=; b=GJtWNQZHN+H7/M
	J3WB2z173iUhQb/tMJPFkBnehsR/K7rLj3hp4GeTsF9wO9H3TvQK+dY3hSycgzX2Kzs742z7J7zQm
	+Pk0DOQpvy1mxeeKQH+cEd2h0G5+ndQskrnQJY06lRn4sFMPDImatoPA7hZVrnMgcGfpwuyLsBbPd
	0vi32zMUXwFSUqfCil54bgfp21ZOgRq1MKmN69MINKJldTPux7GJKUsg0aPErnhpGlmxvfAxxdAfS
	9CxDXSFqYsDrxaXpg78GK9+XTlcztU5k5NWMvIhWFBQOXZMkAcn+e2uShVH6JQ4tjs/ZyQeLmwlMY
	2Vc8kIZDB+NpueLQEqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1i7-00B1r9-29;
	Wed, 03 Jan 2024 13:55:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1i4-00B1p4-0u;
	Wed, 03 Jan 2024 13:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704290101;
	bh=B6eYnU3Nqp4N3yMzp3xM9ijrgxdpkgZDHDam8dtPe+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OATbLWaHpjeFnCjaGtRjarh2HelTBqmI3ULVZ8+rcWWlYZYbiy86WKvz0lXpjcmaG
	 A49hljaqe/4g8XiLX6WqdhpBV56b11Y/VjQqvK6aLRc182ZIQSHmfAaIXUQl5by4UJ
	 rnEU2CyjA8yyjsXMlfWAN5zNxmo49kk3TFX0iIl474q7aRJHm3aRYLYW15Uut2i4FR
	 Epex2aOxuMth4nuKWwrxa6SmbewEv0PEyb6Ptsslvyu5cPPxqXbWFM3atSvVPrx8A6
	 p3oHTnWfs1FLKPA1S1agGgpIms7KVucAdAFQKkGz6rGEfKj0z0fleUVzI+lCv0TCNr
	 x4xZgPlEHxYOQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6C11437813CB;
	Wed,  3 Jan 2024 13:55:00 +0000 (UTC)
Message-ID: <9f616344-fc2c-4129-9138-73fabaf1dcfe@collabora.com>
Date: Wed, 3 Jan 2024 14:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width
 properties
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116130952.5099-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116130952.5099-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_055504_463391_11488243 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/11/23 14:09, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes SPI setup and resolves following validation errors:
> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: spi_nand@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
>          from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: spi_nand@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
>          from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> 
> Fixes: 885e153ed7c1 ("arm64: dts: mt7986: add spi related device nodes")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



