Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB15CC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5AbgyVonlLMB35g+E/KeAJdiy5cyi8OYzUmtkvQfc8=; b=oNTGNpGZlzm4NfgGWUy29DKW0o
	obTkCTCqGMrApNYOegSXE0Btzo2nv++mGVJDjknSTAm2LECvc0/JPTdw59uApoyExGS81qWuuA6PW
	2KaHH5G7pDeK6uR0VmIKYiKjFeo/pCVZaoaOUhSy9Tio6z7OLeRh2nVsr40ZeZi5+4eU1lw0awVwF
	3ccFIEbNPdW3959a58WA81PYEu+rkFsvK6rqBQ0aB2hTzp4deoyX/qJ9cNF36LaELNbAS9I6hZ7wT
	pK6pm2eknAJctIfhhfyPP9cICDcbdSlfJS4HXyy3FwkVTirRm7tnxNV/7dqKghTo55gM1EOW5Lc59
	79SPXoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmEtQ-000000091yy-1c1X;
	Mon, 18 Mar 2024 15:27:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmEtL-000000091x6-2mvZ;
	Mon, 18 Mar 2024 15:27:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ACA2FF80A;
	Mon, 18 Mar 2024 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710775628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5AbgyVonlLMB35g+E/KeAJdiy5cyi8OYzUmtkvQfc8=;
	b=MyINwp7ETbUp2gIk0pEzRSJRoX64jUgNICaW3pa+XutPVCEFxABm6gSZ/TQJqDfM/CG8Cf
	zdVog4IN2JGgAJmGpOmSe5l2fx+ZAoht1m+cWWvbL3hhqnXJvmwpvRsiO3pyvi2+avoDcj
	dy17X07nyLTps5p/d4a0TDfI9ADDzABCLTOnoLw81ErsHSFZ2LwzOEBCJmH1y7prFjXaYh
	+2IuGNSYLC/TeE+d3AjXtQwwHxQIvNN9RDhAMVG6jB/lrzT72uIDCb44daRMJ7+c1giMh/
	1HkPWK4nU0esHb1AsXi6OybJaAj/RDHceZub/tc2fUGxFnCiNVYRuJF/8PGxbw==
Message-ID: <7d1ad037-d8ac-4b9a-b6d2-ab683e52a898@arinc9.com>
Date: Mon, 18 Mar 2024 18:26:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
 <94e3d09a-e6a4-4808-bc29-3f494b65e170@gmail.com>
 <62d128f1-11ac-4669-90ff-e9cdd0ec5bd9@arinc9.com>
 <71dd200a-0306-4baa-abab-6e6906aeef2a@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <71dd200a-0306-4baa-abab-6e6906aeef2a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_082711_857136_D3EF4C8B 
X-CRM114-Status: GOOD (  13.79  )
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

On 18.03.2024 16:02, Florian Fainelli wrote:
>>> Can we call it a pseudo PHY to use a similar terminology as what is done through drivers/net/dsa/{bcm_sf2,b53}*?
>>>
>>> This is not a real PHY as in it has no actual transceiver/digital signal processing logic, this is a piece of logic that snoops for MDIO transactions at that specific address and lets you access the switch's internal register as if it was a MDIO device.
>>
>> I can get behind calling the switch a psuedo-PHY in the context of MDIO.
>> However, as described on "22.2.4.5.5 PHYAD (PHY Address)" of "22.2.4.5
>> Management frame structure" of the active standard IEEE Std 802.3™‐2022,
>> the field is called "PHY Address". The patch log doesn't give an identifier
>> as to what a switch is in the context of MDIO. Only that it listens on a
>> certain PHY address which the term complies with IEEE Std 802.3™‐2022.
>>
>> So I don't see an improvement to be made on the patch log. Feel free to
>> elaborate further.
> 
> I would just s/PHY/MDIO bus address/ since that is simply more generic, but if it is not written as-is in the spec, then I won't fight it much more than I already did.

I'm not sure what you're referring to by spec. Are you asking how specific
the name of the PHYAD field is described on the standard?

Arınç

