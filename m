Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F980C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A05q6KoR0JEWg+AapjwLG9ZBzCyQlsIDEalElRAtOMg=; b=PH0shS8boRvmChvADL7NXnVg/4
	/Gv5XI4pLgpc0Ewlv/mjNvFFU5EEgfjNwvHjV+nYbabLGq4ZNg23txP6DydoC78mtQveoKpkoACXj
	7gDle4+xsnGNmyTEmyR82Eba2mCVkVYBKKsZDCZQCcgLcpCG6ylIHTPS71AePLflLzYSASkLdSxPm
	43rwLOj21B7Xe0QRe9ottuRJ70HO9S4kfAt23gJ6Lef8WTsdiOWHJoNwvl2VPdT1Bt7O+lY/BqpRK
	TyKVxJC6lJLH/I+HFUo7VceBmgvObTIf9qWN+lFRj6RTjtvhc1A9HwTDyG1sUTAbt36UYBZa+bl0p
	KRKuYUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFHA-000000096aq-0iLC;
	Mon, 18 Mar 2024 15:51:48 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFGg-000000096Jk-3hm3;
	Mon, 18 Mar 2024 15:51:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32915E0005;
	Mon, 18 Mar 2024 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710777075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A05q6KoR0JEWg+AapjwLG9ZBzCyQlsIDEalElRAtOMg=;
	b=L5UflZSpH2pvPOZJq67tgjFsh9FmimSSKG1CIj7BkPVn21owzSnc2FCv1Z8TXrEjr/COf8
	0uJVcTuS33VzvGeLFN5Y/XcLYfniCTmzArj5bhddNit2+9A67ea1/6PUZkM2PjfNt4bSIp
	gGAvUAuJtQaviRuMz5g6AlLTzU7rKdCtuTIqQHiGWdfqU3cyGUe4YpgG7UhCFDNJXV3WWo
	mTc9Zt0BhBXUR0vUveKS1+oTBzjeRHXVKOtVu2r+2ZQ+BGfMtE7ldow4JAVLJdcje4hfbj
	ro9naMUU213HFXZdugz0B+Ej0dYWyoTFn04VRizljW+pYZWxFze224bvvcYUVQ==
Message-ID: <4c1c4420-b539-4e29-972d-cb3838fff066@arinc9.com>
Date: Mon, 18 Mar 2024 18:50:53 +0300
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
 <7d1ad037-d8ac-4b9a-b6d2-ab683e52a898@arinc9.com>
 <23f4c9b1-5c6b-4f3c-9290-41d195650368@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <23f4c9b1-5c6b-4f3c-9290-41d195650368@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_085119_863580_0A48704B 
X-CRM114-Status: GOOD (  13.76  )
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

On 18.03.2024 18:38, Florian Fainelli wrote:
> On 3/18/24 08:26, Arınç ÜNAL wrote:
>> On 18.03.2024 16:02, Florian Fainelli wrote:
>>>>> Can we call it a pseudo PHY to use a similar terminology as what is done through drivers/net/dsa/{bcm_sf2,b53}*?
>>>>>
>>>>> This is not a real PHY as in it has no actual transceiver/digital signal processing logic, this is a piece of logic that snoops for MDIO transactions at that specific address and lets you access the switch's internal register as if it was a MDIO device.
>>>>
>>>> I can get behind calling the switch a psuedo-PHY in the context of MDIO.
>>>> However, as described on "22.2.4.5.5 PHYAD (PHY Address)" of "22.2.4.5
>>>> Management frame structure" of the active standard IEEE Std 802.3™‐2022,
>>>> the field is called "PHY Address". The patch log doesn't give an identifier
>>>> as to what a switch is in the context of MDIO. Only that it listens on a
>>>> certain PHY address which the term complies with IEEE Std 802.3™‐2022.
>>>>
>>>> So I don't see an improvement to be made on the patch log. Feel free to
>>>> elaborate further.
>>>
>>> I would just s/PHY/MDIO bus address/ since that is simply more generic, but if it is not written as-is in the spec, then I won't fight it much more than I already did.
>>
>> I'm not sure what you're referring to by spec. Are you asking how specific
>> the name of the PHYAD field is described on the standard?
> 
> Spec = IEEE Std 802.3-2022 standard, aka the document you are quoting.

Ok. The field is referred to as "PHY Address" (capital A) in a sentence on
the standard. I interpret that as it defines the term to mention the field
in a sentence which is why I'd like to stick to it on my patch log.

Arınç

