Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63995C001DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJHI+2B39D3Or8mTHomyEAuJmjF+7v9ZD1s100wtrNs=; b=BwvJoQEFWQ/m6DwmlxkpRxDU6Z
	sE4AjzXak/DmbdHyNBHlK/cokjmwkPnfsgniSYb4xqpwQ107JfVMS9y6ExEzbQD/pToCVh3gvkYDV
	hNW92Dj389i3eMt4hoW5HXD2d2Vfov+nRyINR7k40F+ePcp+IDAL2Cl75F8u0Ogp4RMjB2IiSk5UB
	UfUDLRbM5FBtorcnTna8HGiXcxRuTTVNDhOjdI8Ok1e9TdcuiWxzUd9lpbyhbkPhazgMJUNgWx/P+
	xhXNTLNTLprjT8ztphyZrhwVGS+hnfLP81r1ruNK/1ULmaZ1m3C3M6BtX5zcA+6WvnTF2pJon8sDH
	xtO5ryJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkdE-007jSq-1R;
	Sat, 29 Jul 2023 14:09:20 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkdB-007jSE-0e;
	Sat, 29 Jul 2023 14:09:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5672A1C0004;
	Sat, 29 Jul 2023 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1690639754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJHI+2B39D3Or8mTHomyEAuJmjF+7v9ZD1s100wtrNs=;
	b=mu1xBkyaTSueDQVaSjy1rYEeqE37mKfdczlOLICOFcLo0tQesrxldCAQqqbIMb2pmY9i6E
	zOeQVJv6/3nXuHRuTiQWnr66Ru2+EBL4gQVJURj0OkIem35WOQYi24/SGCRahCFsJvGcP6
	Q2iFTFRN0OIRgb7Um0Wa2SoSyV9kuAS02KdtCGpCk/s1sao3+8RLibve2Z2cy98EIiR+Ez
	juFoKYeR96euKoVIYDHyoaa8JM9z+NsTSFICki24p+8Lv+JhjbL850hPSVSNPMXYy6/v+u
	NHqNaxIRUg8w9JFBtWfld+gjyZMoSjBSXv8GJwXnoEvgI3TKTbhlCOxk9vOxkA==
Message-ID: <96bdb44d-3c59-b6e7-7baa-0ab80efeb720@arinc9.com>
Date: Sat, 29 Jul 2023 17:08:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: dts: ralink: reorder MT7621 clocks in Ethernet
 block
Content-Language: en-US
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230729110449.1357-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_070917_388364_1463C2B4 
X-CRM114-Status: UNSURE (   8.36  )
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

On 29.07.2023 14:04, Rafał Miłecki wrote:
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

I'm not sure if I should agree with this patch. The relevant parts of 
the schema for mediatek,mt7621-eth were added way later than the 
existing bindings on mt7621.dtsi. Why don't we address this on the 
schema along with a bunch of other issues the patch for 
mediatek,mt7621-eth brought?

Arınç

