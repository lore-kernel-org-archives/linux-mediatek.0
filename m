Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CF9C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA/mhGtuQSVYvw1K+jOirty2IcUYr8JhFXf+bpcm5Ms=; b=FjEjhUFqyuRGt7oFZTvFuYD7ik
	ZYWTOU5ET9OzNPy/2rTlw8wbDANC+9fVQBfF8ggFY7/WUahA310D4g+XihBqxh8Ne0oisSEymp9Kj
	XLIlp3f4xnRHjkn721Sh5ZM7tDhtEytsrRbTzXMIQZP4bD61rtEFdKQrfG0I1fNCCQUN8XbBoxpOx
	/fcvqPm2PnRzGDFoiKt7fBu8czpjU8q2WF1lY7740K91k02q//C4VT2APe1uVi81vYpNPEJBLaWtS
	c9J3be0ZF4+IHbPxQ1bmmwYosv9Sw30sy4KaDgNFhBSKNgUsKvUVbNzMDbfLLLkQqX362emfcT0FN
	Ix+lIUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQCH-00F4S2-1d;
	Mon, 31 Jul 2023 10:32:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQCD-00F4Mc-2I;
	Mon, 31 Jul 2023 10:32:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BA296606EF9;
	Mon, 31 Jul 2023 11:32:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690799530;
	bh=36IlG+PKEmvnh9c4GLpbGVNrtebOjrSS95FN1qpJh8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oFWbPiZrLQwzGhlFA32x9XCnDdUhjzSgIaMBorYZWwxTIuM4TlMqNDCsMfQqt+4dZ
	 B3SDZUiLIVggGVzC4+tKI5jbbXr7RaRhzlLemdOL/lijsYZyH7iNbDHCbIZLuvrL84
	 /Jgt2lWvTqrukpaQcdnU/i7lPed8FHNRBHsg9drh7EbUSbXH78mcfzK6vwI7YKdfgQ
	 dVpDib8k62q8opjbgYLN3GhB14/L7iKHO1RITP9cOpVnsiuRJJiqq/uOFp/u0Ihyup
	 sXCXGD33UJjsxbrNJn1VdL7dSWgEypks/jwf9g7Qkp1xzDuVJbEsInQFcnEWkcAYIm
	 DXseFgDYiSFnw==
Message-ID: <b0daeb57-a2e0-54f9-a0c4-f4b71e253982@collabora.com>
Date: Mon, 31 Jul 2023 12:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mips: dts: ralink: reorder MT7621 clocks in Ethernet
 block
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230729110449.1357-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230729110449.1357-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_033213_874495_2C5E2D32 
X-CRM114-Status: UNSURE (   9.29  )
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

Il 29/07/23 13:04, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Use order as specified in the binding (first "ethif" then "fe").
> 
> This fixes:
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: clock-names:0: 'ethif' was expected
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: clock-names:1: 'fe' was expected
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> 
> Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



