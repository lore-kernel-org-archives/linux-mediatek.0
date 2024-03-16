Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E14C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaudTAjS9OrEf75WKlKVQeii/UQ8YYZCZtk03/a+WxE=; b=EnEly0g81me6mMWXkVyy2VWypI
	kQDJKPhwZj/yrXrLLrLSG7/iV6m6ohT3OZET6Ol7WHhiLU9Be2tgsURDXJWcUz5LK2Y5F6hwHlMJ1
	8QQKF/Lscj2UEAlcoSHUbri01SiWbG3tWjpjVCXyPQta8QmKg+4s3HOXpEC1HnkyCIqEeojdbvVfT
	cnlfUzMTzBSVF+VQfznSQLPuQ0TdjDjSx5u2e/3UKduGn2Atjv0d3tcJvMpvsP0ob9jnmFLkOU0YC
	gZQ4vmiU4Q+8ZwjmUbQvPUhQNFJtFMu02mrS4mbbwr2hFmbBfQH30M0sXjgFN/tSBUpnngRE7RfpJ
	ePf5xhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlOi8-00000002dwJ-2Ve9;
	Sat, 16 Mar 2024 07:44:08 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlOi3-00000002dvV-2U3i;
	Sat, 16 Mar 2024 07:44:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C10871BF205;
	Sat, 16 Mar 2024 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710575039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaudTAjS9OrEf75WKlKVQeii/UQ8YYZCZtk03/a+WxE=;
	b=dltSEBizU1EpLVCl+E4/7gIDVn4aC38LqlKKoOfbKy4KSCUbSZvOiLfWaS6Upo8L8LPUv5
	A+n49OslfLhrEaS8wYrWEpPq88iV5rfvEVFFmB7XgXghHlJYlxfk3MpoXjCbieBiJGqOwM
	Sb6zS/xAcjc2hETJmsU4ulGGCBhaLMCdl47QUJtAmtD5Ee/uWS9fpxfmPZZHzb20YVLgY1
	VYR1Lrh+kXPWvDKL9R0evcy9z2eMdCRnXqBnx8aMx4uiLgcFwDNPdyNvuAcYq/NA39dwnA
	7sBoFpoLaSiGwSRhrtZvqTJNeWPb8lZeFhQsIa2reWZPocEDimQnAte2EzFJvA==
Message-ID: <62d128f1-11ac-4669-90ff-e9cdd0ec5bd9@arinc9.com>
Date: Sat, 16 Mar 2024 10:43:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
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
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <94e3d09a-e6a4-4808-bc29-3f494b65e170@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_004404_064121_8CC484FC 
X-CRM114-Status: GOOD (  14.54  )
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

On 15.03.2024 20:26, Florian Fainelli wrote:
> On 3/14/24 05:20, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7531 switch listens on PHY address 0x1f on an MDIO bus. I've got two
>> findings that support this. There's no bootstrapping option to change the
>> PHY address of the switch. The Linux driver hardcodes 0x1f as the PHY
>> address of the switch. So the reg property on the device tree is currently
>> ignored by the Linux driver.
>>
>> Therefore, describe the correct PHY address on boards that have this
>> switch.
> 
> Can we call it a pseudo PHY to use a similar terminology as what is done through drivers/net/dsa/{bcm_sf2,b53}*?
> 
> This is not a real PHY as in it has no actual transceiver/digital signal processing logic, this is a piece of logic that snoops for MDIO transactions at that specific address and lets you access the switch's internal register as if it was a MDIO device.

I can get behind calling the switch a psuedo-PHY in the context of MDIO.
However, as described on "22.2.4.5.5 PHYAD (PHY Address)" of "22.2.4.5
Management frame structure" of the active standard IEEE Std 802.3™‐2022,
the field is called "PHY Address". The patch log doesn't give an identifier
as to what a switch is in the context of MDIO. Only that it listens on a
certain PHY address which the term complies with IEEE Std 802.3™‐2022.

So I don't see an improvement to be made on the patch log. Feel free to
elaborate further.

Arınç

